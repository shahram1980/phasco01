using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using System.Web.Services;
using System.Collections;
using DataAccessLayer.BIZ;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscHomeCategory : BaseUserControl
    {
        TBL_Categories da_Categories = new TBL_Categories();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            BindCategoryList();
        }

        protected void BindCategoryList()
        {
            try
            {
                DataTable dtMainCategory = new DataTable();
                DataTable dtSubMainCategory = new DataTable();
                //DataTable dtSubCategory = new DataTable();
                DataSet dtsCategory = new DataSet();

                dtMainCategory = da_Categories.TBL_Categories_Tra("select_L1_fa");
                dtSubMainCategory = da_Categories.TBL_Categories_Tra("select_L2_All");
                //dtSubCategory = da_Categories.TBL_Categories_Tra("select_L3_All");

                dtsCategory.Tables.Add(dtMainCategory);
                dtsCategory.Tables.Add(dtSubMainCategory);
                //dtsCategory.Tables.Add(dtSubCategory);

                dtsCategory.Relations.Add("ParentCategory", dtMainCategory.Columns["id"], dtSubMainCategory.Columns["subid"]);
                //dtsCategory.Relations.Add("SubParentCategory", dtSubMainCategory.Columns["id"], dtSubCategory.Columns["subid"]);
                string categories = string.Empty;
                int i = 0;
                if (dtsCategory.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow masterRow in dtsCategory.Tables[0].Rows)
                    {
                        //TreeNode masterNode = new TreeNode((string)masterRow["Subject_ir"], Convert.ToString(masterRow["id"]));
                        //trvCategoryList.Nodes.Add(masterNode);
                        categories += "<div class='h-tab-div col-md-4 col-xs-12 text-right pull-right'><ul class='h-tab-con-p1'>";
                        categories += "<li><a  class=\"h-tab-con-p1-t\" href=\"Category.aspx?CategoryID=" + masterRow["id"].ToString() + "&Level=0&ValuePath=" + masterRow["id"].ToString()
                            + "\"> <span>"
                            + masterRow["Subject_ir"].ToString() + "</span></a></li>";
                        i = 0;
                        foreach (DataRow childRow in masterRow.GetChildRows("ParentCategory"))
                        {
                            if (i < 5)
                            {
                                categories += "<li><a class=\"h-tab-con-p1-item\" href=\"Category.aspx?CategoryID=" + childRow["id"].ToString() + "&Level=1&ValuePath=" + masterRow["id"].ToString() + "/" + childRow["id"].ToString()
                                + "\"> <span>"
                                + childRow["Subject_ir"].ToString() + "</span></a></li>";
                            }
                            i++;
                            //TreeNode childNode = new TreeNode((string)childRow["Subject_ir"], Convert.ToString(childRow["id"]));
                            //masterNode.ChildNodes.Add(childNode);
                        }
                        categories += "</ul><a class=\"h-tab-con-p1-more read-more\" class=\"categoryList catlnk" + masterRow["id"].ToString() + "\" rel=\"" + masterRow["id"].ToString() + "\" href=\"Category.aspx?CategoryID=" + masterRow["id"].ToString() + "&Level=0&ValuePath=" + masterRow["id"].ToString()
                            + "\"> <span>بیشتر »  </span></a>";
                        categories += "</div>";
                    }
                    ltrCategoryList.Text = categories;
                }
            }
            catch { }
        }
    }
}