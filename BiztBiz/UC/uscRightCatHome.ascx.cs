using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DataAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscRightCatHome : BaseUserControl
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

                dtsCategory.Tables.Add(dtMainCategory);
                dtsCategory.Tables.Add(dtSubMainCategory);

                dtsCategory.Relations.Add("ParentCategory", dtMainCategory.Columns["id"], dtSubMainCategory.Columns["subid"]);

                string categories = string.Empty;
                if (dtsCategory.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow masterRow in dtsCategory.Tables[0].Rows)
                    {
                        categories += "<li>";
                        categories += "<a href=\"Category.aspx?CategoryID=" + masterRow["id"].ToString() + "&Level=0&ValuePath=" + masterRow["id"].ToString()
                            + "\">"
                            + masterRow["Subject_ir"].ToString() + "</a><ul>";

                        foreach (DataRow childRow in masterRow.GetChildRows("ParentCategory"))
                        {
                            categories += "<li><a href=\"Category.aspx?CategoryID=" + childRow["id"].ToString() + "&Level=1&ValuePath=" + masterRow["id"].ToString() + "/" + childRow["id"].ToString()
                            + "\">"
                            + childRow["Subject_ir"].ToString() + "</a></li>";
                        }

                        categories += "<li class=\"home-menu-last\"></li></ul></li>";
                    }
                    ltrCategoryList.Text = categories;
                }
            }
            catch
            {
            }

        }
    }
}