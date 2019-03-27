using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Threading;
using System.Globalization;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;
namespace BiztBiz.C_p
{
    public partial class Home : BasePage
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

        int _CompanyID;
        public int CompanyID
        {
            get
            {
                return _CompanyID;
            }
            set
            {
                _CompanyID = value;
            }
        }

        int _StatusID;
        public int StatusID
        {
            get
            {
                return _StatusID;
            }
            set
            {
                _StatusID = value;
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


        Tbl_Products da = new Tbl_Products();
        TBL_User_Biz da_User = new TBL_User_Biz();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_User_News da_User_News = new TBL_User_News();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CompanyID"]))
                CompanyID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CompanyID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = PHASCOUtility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Level"]))
                Level = PHASCOUtility.ConverToNullableInt(Request.QueryString["Level"]);


            if (!IsPostBack)
            {
                //BindMap();
                Set_Company_Card();
            }
        }

        void Set_Company_Card()
        {
            try
            {
                TBL_Company_Profile da_co = new TBL_Company_Profile();
                DataTable dt = da_co.TBL_Company_Profile_Tra(CompanyID, "select_itemByID", 0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");
                if (dt.Rows.Count > 0)
                {
                    Label_Company_Name.Text = dt.Rows[0]["Company_Name"].ToString();

                    Label_Company_Introduction.Text = dt.Rows[0]["Company_Introduction"].ToString();
                    Label_Total_Staff.Text = dt.Rows[0]["Total_Staff"].ToString();
                    Label_year_Established.Text = dt.Rows[0]["year_Established"].ToString();

                    //Image_Star.ImageUrl = "~/images/Star/" + dt.Rows[0]["Company_Level"].ToString() + ".jpg";

                    if (dt.Rows[0]["image"].ToString() == "none.jpg")
                        image_Logo.ImageUrl = "~/MyBiztBiz/Coupload/None/NONE.jpg";
                    else
                        image_Logo.ImageUrl = "~/MyBiztBiz/Coupload/sm_" + dt.Rows[0]["image"].ToString();
                    // MultiView1.ActiveViewIndex = 0;

                    BindRequestUserDetails(PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Uid"]));
                    BindCompanyNews(PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Uid"]));
                    Bind_Product(PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Uid"]));
                }
            }
            catch (Exception)
            {
                //MultiView1.ActiveViewIndex = 1;
            }
        }

        //protected void BindMap()
        //{
        //    if (Level == 0)
        //    {
        //        imglblSub2Cat.Visible = false;
        //        imglblSubCat.Visible = false;
        //        lnkSub2Cat.Visible = false;
        //        lnkSubCat.Visible = false;
        //        DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "select1ByCategoryID");
        //        if (dtCategory.Rows.Count > 0)
        //        {
        //            lnkMainCat.Text = dtCategory.Rows[0]["Subject_ir"].ToString();
        //            lnkMainCat.PostBackUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["id"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["id"].ToString();
        //        }
        //    }

        //    else if (Level == 1)
        //    {
        //        imglblSub2Cat.Visible = false;
        //        imglblSubCat.Visible = true;
        //        lnkSub2Cat.Visible = false;
        //        lnkSubCat.Visible = true;
        //        DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL2ByCategoryID");
        //        if (dtCategory.Rows.Count > 0)
        //        {
        //            lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
        //            lnkMainCat.PostBackUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

        //            lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
        //            lnkMainCat.PostBackUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();
        //        }
        //    }
        //    else if (Level == 2)
        //    {
        //        imglblSub2Cat.Visible = true;
        //        imglblSubCat.Visible = true;
        //        lnkSub2Cat.Visible = true;
        //        lnkSubCat.Visible = true;

        //        DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL3ByCategoryID");
        //        if (dtCategory.Rows.Count > 0)
        //        {
        //            lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
        //            lnkMainCat.PostBackUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

        //            lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
        //            lnkSubCat.PostBackUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();

        //            lnkSub2Cat.Text = dtCategory.Rows[0]["Sub2Name"].ToString();
        //            lnkSub2Cat.PostBackUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&SearchSection=" + SearchSection + "&Level=2&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "/" + dtCategory.Rows[0]["Sub2ID"].ToString();
        //        }
        //    }
        //    else
        //    {
        //        imglblSub2Cat.Visible = false;
        //        imglblSubCat.Visible = false;
        //        lnkSub2Cat.Visible = false;
        //        lnkSubCat.Visible = false;
        //    }
        //}

        protected void BindRequestUserDetails(int id)
        {

            
            DataTable dtUser = da_User.TBL_User_Tra("selectById", id);
            if (dtUser.Rows.Count > 0)
            {
                lblRequestUserFullName.Text = dtUser.Rows[0]["FullName"].ToString();
                lblRequestTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                lblRequestEmail.Text = dtUser.Rows[0]["Uid"].ToString();

                DataTable dtState = da_State.T_state_Tra( "select_byID",PHASCOUtility.ConverToNullableInt(dtUser.Rows[0]["Business_Location"]));
                if (dtState.Rows.Count > 0)
                {
                    lblRequestCity.Text = dtState.Rows[0]["Satate"].ToString();
                }
            }
        }

        void Bind_Product(int uid)
        {
            DataTable dt = da.Tbl_Products_Tra("select_byuid", uid, 0);
            repProduct.DataSource = dt;
            repProduct.DataBind();
        }

        protected void BindCompanyNews(int uid)
        {
            DataTable dtUserNews = da_User_News.TBL_User_News_Tra("select_Uid", uid);
            repCompanyNews.DataSource = dtUserNews;
            repCompanyNews.DataBind();
        }
    }
}
