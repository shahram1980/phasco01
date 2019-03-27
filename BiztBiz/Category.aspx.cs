using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BiztBiz.Component;
using DataAccessLayer.BIZ;


namespace BiztBiz
{
    public partial class Category : BasePage
    {
        #region Properties
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

        int _SearchSection;
        public int SearchSection
        {
            get
            {
                return _SearchSection;
            }
            set
            {
                _SearchSection = value;
            }
        }


        Tbl_Products da_Products = new Tbl_Products();
        TBL_Request da_Request = new TBL_Request();
        TBL_Company_Profile da_Company = new TBL_Company_Profile();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_User_Biz da_User = new TBL_User_Biz();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = Utility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = Utility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Level"]))
                Level = Utility.ConverToNullableInt(Request.QueryString["Level"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ValuePath"]))
                ValuePath = Utility.ConverToNullableString(Request.QueryString["ValuePath"]);

            Initialize();
        }

        protected void Initialize()
        {
            int pagesize = 0;
            pagesize = Utility.ConverToNullableInt(ddlItemCount.SelectedValue);
            pagerProduct.PageSize = pagesize;
            pagerRequest.PageSize = pagesize;

            if (string.IsNullOrEmpty(Request.QueryString["SearchSection"]) && !string.IsNullOrEmpty(Request.Cookies["SearchSection"].ToString()))
                SearchSection = Utility.ConverToNullableInt(Request.Cookies["SearchSection"].Value);


            tblProduct.Visible = false;
            tblRequest.Visible = false;
            tblCompany.Visible = false;

            switch (SearchSection)
            {
                case 1:
                    tblProduct.Visible = true;
                    lnkSearchSection.NavigateUrl = "Category.aspx?CategoryID=0&SearchSection=1&Level=-1&ValuePath=0";
                    lnkSearchSection.Text = "محصولات";
                    BindProductList();
                    lblCategory.Text = "محصولات";
                    break;
                case 2:
                    tblRequest.Visible = true;
                    lnkSearchSection.NavigateUrl = "Category.aspx?CategoryID=0&SearchSection=2&Level=-1&ValuePath=0";
                    lnkSearchSection.Text = "درخواست ها";
                    BindRequestList();
                    lblCategory.Text = "درخواست ها";
                    break;
                case 3:
                    tblCompany.Visible = true;
                    lnkSearchSection.NavigateUrl = "Category.aspx?CategoryID=0&SearchSection=3&Level=-1&ValuePath=0";
                    lnkSearchSection.Text = "شرکت ها";
                    BindCompanyList(pagesize);
                    lblCategory.Text = "شرکت ها";
                    break;
                //default:
                //    tblProduct.Visible = true;
                //    tblRequest.Visible = true;
                //    tblCompany.Visible = true;
                //    BindProductList();
                //    BindRequestList();
                //    BindCompanyList(pagesize);
                //    break;
            }

            if (Level == -1)
            {
                BindCategorySubList();
                imglblMainCat.Visible = false;
                imglblSub2Cat.Visible = false;
                imglblSubCat.Visible = false;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = false;
            }

            else if (Level == 0)
            {
                BindCategorySubList();
                imglblMainCat.Visible = true;
                imglblSub2Cat.Visible = false;
                imglblSubCat.Visible = false;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = false;
                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "select1ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["Subject_ir"].ToString();
                    lnkMainCat.NavigateUrl = "Category.aspx?CategoryID=" + dtCategory.Rows[0]["id"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["id"].ToString();

                    lblCategory.Text = dtCategory.Rows[0]["Subject_ir"].ToString();
                }
            }

            else if (Level == 1)
            {
                BindCategorySubList();
                imglblMainCat.Visible = true;
                imglblSub2Cat.Visible = false;
                imglblSubCat.Visible = true;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = true;
                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL2ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                    lnkMainCat.NavigateUrl = "Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();

                    lblCategory.Text = dtCategory.Rows[0]["SubName"].ToString();
                }
            }
            else if (Level == 2)
            {
                BindCategorySubList();
                imglblMainCat.Visible = true;
                imglblSub2Cat.Visible = true;
                imglblSubCat.Visible = true;
                lnkSub2Cat.Visible = true;
                lnkSubCat.Visible = true;

                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL3ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                    lnkMainCat.NavigateUrl = "Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();

                    lnkSub2Cat.Text = dtCategory.Rows[0]["Sub2Name"].ToString();
                    lnkSub2Cat.NavigateUrl = "Category.aspx?CategoryID=" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&SearchSection=" + SearchSection + "&Level=2&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "/" + dtCategory.Rows[0]["Sub2ID"].ToString();

                    lblCategory.Text = dtCategory.Rows[0]["Sub2Name"].ToString();
                }
            }
            else
            {
                imglblSub2Cat.Visible = false;
                imglblSubCat.Visible = false;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = false;
            }
        }

        protected void BindCategoryList()
        {
            DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID);
            repCategoryList.DataSource = dtCategory;
            repCategoryList.DataBind();

            if (dtCategory.Rows.Count > 0)
                pnlCategories.Visible = true;
            else
                pnlCategories.Visible = false;
        }

        protected string SelectCounInCat(string CatName, string groupID)
        {
            string count = string.Empty;
            switch (SearchSection)
            {
                case 1:
                    count = SelectCountProductInCategory(groupID);
                    break;
                case 2:
                    count = SelectCountRequestInCategory(groupID);
                    break;
                case 3:
                    break;
            }

            return CatName + " (" + count + ")";
        }

        protected string SelectCountRequestInCategory(string groupID)
        {
            string countRequest = string.Empty;
            DataTable dtCountRequest = da_Request.TBL_RequestByGroups("selectCount_cat1", Utility.ConverToNullableInt(groupID));
            if (dtCountRequest.Rows.Count > 0)
                countRequest = dtCountRequest.Rows[0][0].ToString();

            return countRequest;
        }

        protected string SelectCountProductInCategory(string groupID)
        {
            string countProduct = string.Empty;
            DataTable dtCountProduct = da_Products.Tbl_ProductsByGroupID("selectCount_cat1", Utility.ConverToNullableInt(groupID));
            if (dtCountProduct.Rows.Count > 0)
                countProduct = dtCountProduct.Rows[0][0].ToString();

            return countProduct;
        }

        protected string SelectCountCompanyInCategory(string groupID)
        {
            string countCompany = string.Empty;
            DataTable dtCountCompany = da_Company.TBL_Company_ProfileByGroupID("selectCount_cat1", groupID);
            if (dtCountCompany.Rows.Count > 0)
                countCompany = dtCountCompany.Rows[0][0].ToString();

            return countCompany;
        }

        protected void BindCategorySubList()
        {
            DataTable dtCategory = new DataTable();
            switch (SearchSection)
            {
                case 1:
                    dtCategory = da_Categories.TBL_Categories_Tra("select_L0_fa_prod", CategoryID);
                    break;

                case 2:
                    dtCategory = da_Categories.TBL_Categories_Tra("select_L0_fa_req", CategoryID);
                    break;

                case 3:
                    dtCategory = da_Categories.TBL_Categories_Tra("select_L0_fa_com", CategoryID);
                    break;
            }

            repCategoryList.DataSource = dtCategory;
            repCategoryList.DataBind();
            if (dtCategory.Rows.Count > 0)
                pnlCategories.Visible = true;
            else
                pnlCategories.Visible = false;
        }

        public void pagerProduct_Command(object sender, CommandEventArgs e)
        {
            int currnetPageIndx = Convert.ToInt32(e.CommandArgument);
            pagerProduct.CurrentIndex = currnetPageIndx;
            BindProductList();
        }

        //protected void btnJobNewsPaperGotoPage_Click(object sender, EventArgs e)
        //{
        //    int pageindex = Utility.ConverToNullableInt(txtJobNewsPaperPage.Text);
        //    pagerJobNewsPaper.CurrentIndex = pageindex;
        //    BindProductList();
        //}

        protected void BindProductList()
        {
            DataTable dtProducts = da_Products.Tbl_ProductsByGroupID("select_cat1_Pagging", CategoryID, pagerProduct.PageSize, pagerProduct.CurrentIndex);
            dtlProduct.DataSource = dtProducts;
            dtlProduct.DataBind();

            if (dtProducts.Rows.Count > 0)
                pagerProduct.ItemCount = Utility.ConverToNullableInt(dtProducts.Rows[0]["ItemCount"]);
            else
                pagerProduct.ItemCount = 0;
        }

        public void pagerRequest_Command(object sender, CommandEventArgs e)
        {
            int currnetPageIndx = Convert.ToInt32(e.CommandArgument);
            pagerRequest.CurrentIndex = currnetPageIndx;
            BindRequestList();
        }

        protected void BindRequestList()
        {
            DataTable dtRequests = da_Request.TBL_RequestByGroups("select_cat1_Pagging", CategoryID, pagerRequest.PageSize, pagerRequest.CurrentIndex);
            dtlRequest.DataSource = dtRequests;
            dtlRequest.DataBind();

            if (dtRequests.Rows.Count > 0)
                pagerRequest.ItemCount = Utility.ConverToNullableInt(dtRequests.Rows[0]["ItemCount"]);
            else
                pagerRequest.ItemCount = 0;
        }

        protected void BindCompanyList(int pagesize)
        {
            DataTable dtCompany = da_Company.TBL_Company_ProfileByGroupID("select_cat1_Pagging", CategoryID, pagesize, 1);
            dtlCompany.DataSource = dtCompany;
            dtlCompany.DataBind();
        }

        public string GetCategoryLink(string id, string level)
        {
            ValuePath = ValuePath == "" ? ValuePath : ValuePath + "/" + id;
            return "Category.aspx?CategoryID=" + id + "&Level=" + level + "&ValuePath=" + ValuePath + "&SearchSection=" + SearchSection.ToString();
        }

        public string GetShamsiDate(string date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date))
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 1);
            return sdate;
        }

        protected void ddlItemCount_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pagesize = Utility.ConverToNullableInt(ddlItemCount.SelectedValue);
            if (pagesize > 0)
            {
                pagerProduct.PageSize = pagesize;
                pagerRequest.PageSize = pagesize;
                BindProductList();
                BindRequestList();
                BindCompanyList(pagesize);
            }
        }

        public string GetUserName(string userID)
        {
            string UserFullName = string.Empty;
            DataTable dtUsers = da_User.TBL_User_Tra("selectFullNameById", Utility.ConverToNullableInt(userID));
            if (dtUsers.Rows.Count > 0)
                UserFullName = dtUsers.Rows[0]["FullName"].ToString();

            return UserFullName;
        }

        public string GetProductImage(string image, string imagepath)
        {
            if (Utility.ConverToNullableInt(image) == 1)
                return "~/MyBiztBiz/Pupload/sm_" + imagepath;
            else
                return "~/MyBiztBiz/Pupload/None/NONE.jpg";
        }

        public string GetCompanyImage(string image)
        {
            if (image != "none.jpg")
                return "~\\MyBiztBiz\\Coupload\\sm_" + image;
            else
                return "~\\MyBiztBiz\\Coupload\\None\\none.jpg";
        }

        public string GetUserRole(string UserRole, int mode)
        {
            if (mode == 1)
            {
                switch (UserRole)
                {
                    case "1":
                        return "";
                        break;
                    case "2":
                        return "<div style='margin: 4px; float: left; margin-left: 30px;'><img alt='' src='\\images\\goldenuser.jpg' /></div>";
                        break;
                    default:
                        return "";
                }
            }


            if (mode == 2)
            {
                switch (UserRole)
                {
                    case "1":
                        return "";
                        break;
                    case "2":
                        return "<div style='margin: 4px; float: left; margin-left: 30px;'><img alt='' src='\\images\\goldenuser_req.jpg' /></div>";
                        break;
                    default:
                        return "";
                }
            }

                        if (mode == 3)
            {
                switch (UserRole)
                {
                    case "1":
                        return "";
                        break;
                    case "2":
                        return "<div style='margin: 4px; float: left; margin-left: 30px;'><img alt='' src='\\images\\goldenuser_com.jpg' /></div>";
                        break;
                    default:
                        return "";
                }
            }

            return "";
        }
    }
}