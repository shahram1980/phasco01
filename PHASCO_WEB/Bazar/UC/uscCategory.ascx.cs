using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscCategory : BaseUserControl
    {
        int _PageView;
        public int PageView
        {
            get
            {
                return _PageView;
            }
            set
            {
                _PageView = value;
            }
        }

        int _CategoryID;
        public int CategoryID
        {
            get
            {
                return _CategoryID;
            }
            set
            {
                _CategoryID = value;
            }
        }

        int _Level;
        public int Level
        {
            get
            {
                return _Level;
            }
            set
            {
                _Level = value;
            }
        }

        string _ValuePath;
        public string ValuePath
        {
            get
            {
                return _ValuePath;
            }
            set
            {
                _ValuePath = value;
            }
        }

        TBL_Categories da_Categories = new TBL_Categories();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Level"]))
                Level = PHASCOUtility.ConverToNullableInt(Request.QueryString["Level"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ValuePath"]))
                ValuePath = PHASCOUtility.ConverToNullableString(Request.QueryString["ValuePath"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            BindCategoryList();
            switch (Level)
            {
                case 0:
                    break;
                case 1:
                    break;
                case 2:
                    break;
            }
        }

        protected void BindCategoryList()
        {
            trvCategoryList.ShowLines = true;

            DataTable dtMainCategory = new DataTable();
            DataTable dtSubMainCategory = new DataTable();
            DataTable dtSubCategory = new DataTable();
            DataSet dtsCategory = new DataSet();

            dtMainCategory = da_Categories.TBL_Categories_Tra("select_L1_fa");
            dtSubMainCategory = da_Categories.TBL_Categories_Tra("select_L2_All");
            dtSubCategory = da_Categories.TBL_Categories_Tra("select_L3_All");

            dtsCategory.Tables.Add(dtMainCategory);
            dtsCategory.Tables.Add(dtSubMainCategory);
            dtsCategory.Tables.Add(dtSubCategory);

            dtsCategory.Relations.Add("ParentCategory", dtMainCategory.Columns["id"], dtSubMainCategory.Columns["subid"]);
            dtsCategory.Relations.Add("SubParentCategory", dtSubMainCategory.Columns["id"], dtSubCategory.Columns["subid"]);

            if (dtsCategory.Tables[0].Rows.Count > 0)
            {
                trvCategoryList.Nodes.Clear();

                foreach (DataRow masterRow in dtsCategory.Tables[0].Rows)
                {
                    TreeNode masterNode = new TreeNode((string)masterRow["Subject_ir"], Convert.ToString(masterRow["id"]));
                    trvCategoryList.Nodes.Add(masterNode);
                    foreach (DataRow childRow in masterRow.GetChildRows("ParentCategory"))
                    {
                        TreeNode childNode = new TreeNode((string)childRow["Subject_ir"], Convert.ToString(childRow["id"]));
                        masterNode.ChildNodes.Add(childNode);
                        foreach (DataRow subchildRow in childRow.GetChildRows("SubParentCategory"))
                        {
                            TreeNode subchildNode = new TreeNode((string)subchildRow["Subject_ir"], Convert.ToString(subchildRow["id"]));
                            childNode.ChildNodes.Add(subchildNode);
                        }
                    }
                }

                trvCategoryList.CollapseAll();
                if (!string.IsNullOrEmpty(ValuePath))
                {
                    string[] values = ValuePath.Split(new char[] { '/' });
                    TreeNode trNodeChield = trvCategoryList.FindNode(values[0]);
                    trNodeChield.Expand();
                    if (values.Length > 1)
                    {
                        foreach (TreeNode node in trNodeChield.ChildNodes)
                        {
                            if (node.Value == values[1])
                                node.Expand();
                        }
                    }
                }
            }

        }

        protected void trvCategoryList_SelectedNodeChanged(object sender, EventArgs e)
        {
            int SearchSection = 0;
            string valuePath = (sender as TreeView).SelectedNode.ValuePath;
            string nodeValue = (sender as TreeView).SelectedNode.Value;
            string level = (sender as TreeView).SelectedNode.Depth.ToString();
            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (string.IsNullOrEmpty(Request.QueryString["SearchSection"]) && !string.IsNullOrEmpty(Request.Cookies["SearchSection"].ToString()))
                SearchSection = PHASCOUtility.ConverToNullableInt(Request.Cookies["SearchSection"].Value);


            Response.Redirect("~/Category.aspx?CategoryID=" + nodeValue + "&Level=" + level + "&ValuePath=" + valuePath + "&SearchSection=" + SearchSection, true);
        }
    }
}