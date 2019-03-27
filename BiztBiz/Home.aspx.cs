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
using BiztBiz.Component;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
namespace BiztBiz
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

        int _UserID;
        public int UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }


        Tbl_Products da = new Tbl_Products();
        TBL_User_Biz da_User = new TBL_User_Biz();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_User_News da_User_News = new TBL_User_News();
        TBL_Coding da_Coding = new TBL_Coding();
        TBL_Company_Profile da_co = new TBL_Company_Profile();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CompanyID"]))
                CompanyID = Utility.ConverToNullableInt(Request.QueryString["CompanyID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = Utility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = Utility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Level"]))
                Level = Utility.ConverToNullableInt(Request.QueryString["Level"]);


            if (!IsPostBack)
            {
                //BindMap();
                Set_Company_Card();
                if (UserRole.CheckUserRole_BycompanyId(CompanyID) == 2) { img_golden.Visible = true; }
                else { img_golden.Visible = false; }
            }
        }

        void Set_Company_Card()
        {
            try
            {
                DataTable dt = da_co.TBL_Company_Profile_Tra(CompanyID, "select_itemByID", 0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");
                if (dt.Rows.Count > 0)
                {
                    Label_Company_Name.Text = dt.Rows[0]["Company_Name"].ToString();

                    Label_Company_Introduction.Text = dt.Rows[0]["Company_Introduction"].ToString();
                    lblCompanyAdress.Text = dt.Rows[0]["Company_Address"].ToString();
                    lblCompanySite.Text = dt.Rows[0]["Company_Website"].ToString();
                    //lblZipCode.Text = dt.Rows[0]["Zip"].ToString();
                    lblServices.Text = dt.Rows[0]["Services"].ToString();

                    string brand = string.Empty;

                    if (!string.IsNullOrEmpty(dt.Rows[0]["BrandTypeOne"].ToString()))
                        brand += "<li> برند " + dt.Rows[0]["BrandTypeOne"].ToString();
                    if (!string.IsNullOrEmpty(dt.Rows[0]["BrandNameOne"].ToString()))
                        brand += " (شرکت " + dt.Rows[0]["BrandTypeOne"].ToString() + ")";
                    brand += "</li>";

                    if (!string.IsNullOrEmpty(dt.Rows[0]["BrandTypeTwo"].ToString()))
                        brand += "<li> برند " + dt.Rows[0]["BrandTypeTwo"].ToString();
                    if (!string.IsNullOrEmpty(dt.Rows[0]["BrandNameTwo"].ToString()))
                        brand += " (شرکت " + dt.Rows[0]["BrandNameTwo"].ToString() + ")";
                    brand += "</li>";

                    if (!string.IsNullOrEmpty(dt.Rows[0]["BrandTypeThree"].ToString()))
                        brand += "<li> برند " + dt.Rows[0]["BrandTypeThree"].ToString();
                    if (!string.IsNullOrEmpty(dt.Rows[0]["BrandNameThree"].ToString()))
                        brand += " (شرکت " + dt.Rows[0]["BrandNameThree"].ToString() + ")";
                    brand += "</li>";

                    lblBrand.Text = brand;

                    string BusinessType = dt.Rows[0]["BusinessType"].ToString();
                    DataTable dtBusinessType = da_Coding.TBL_Coding_Tra(BusinessType, "select_byMultiID");
                    for (int i = 0; i < dtBusinessType.Rows.Count; i++)
                    {
                        if (i != dtBusinessType.Rows.Count - 1)
                            lblBusinessType.Text += dtBusinessType.Rows[i]["CodingName"].ToString() + "، ";
                        else
                            lblBusinessType.Text += dtBusinessType.Rows[i]["CodingName"].ToString();
                    }

                    string UsageType = dt.Rows[0]["UsageType"].ToString();
                    DataTable dtUsageType = da_Coding.TBL_Coding_Tra(UsageType, "select_byMultiID");
                    for (int i = 0; i < dtUsageType.Rows.Count; i++)
                    {
                        if (i != dtUsageType.Rows.Count - 1)
                            lblUsageType.Text += dtUsageType.Rows[i]["CodingName"].ToString() + "، ";
                        else
                            lblUsageType.Text += dtUsageType.Rows[i]["CodingName"].ToString();
                    }


                    //Label_Total_Staff.Text = dt.Rows[0]["Total_Staff"].ToString();
                    //Label_year_Established.Text = dt.Rows[0]["year_Established"].ToString();

                    //Image_Star.ImageUrl = "~/images/Star/" + dt.Rows[0]["Company_Level"].ToString() + ".jpg";

                    if (dt.Rows[0]["image"].ToString() == "none.jpg")
                        image_Logo.ImageUrl = "~/MyBiztBiz/Coupload/None/NONE.jpg";
                    else
                        image_Logo.ImageUrl = "~/MyBiztBiz/Coupload/sm_" + dt.Rows[0]["image"].ToString();
                    // MultiView1.ActiveViewIndex = 0;
                    if (Users.UserValid())
                    {
                        tdCompanyInfo.Visible = true;
                        tdNotCompanyInfo.Visible = false;
                        tdUserInfo.Visible = true;
                        tdNotUserInfo.Visible = false;
                        BindRequestUserDetails(Utility.ConverToNullableInt(dt.Rows[0]["Uid"]));
                        lnkRequestProfile.Text = dt.Rows[0]["Company_Name"].ToString();
                        lnkRequestProfile.NavigateUrl = "~/Home.aspx?CompanyID=" + dt.Rows[0]["id"].ToString() + "&Level=2&SearchSection=3";

                    }
                    else
                    {
                        tdNotCompanyInfo.Visible = true;
                        tdCompanyInfo.Visible = false;
                        tdNotUserInfo.Visible = true;
                        tdUserInfo.Visible = false;
                    }
                    //BindCompanyNews(Utility.ConverToNullableInt(dt.Rows[0]["Uid"]));
                    Bind_Product(Utility.ConverToNullableInt(dt.Rows[0]["Uid"]));
                    BindCompanyBranch(Utility.ConverToNullableInt(dt.Rows[0]["id"]));
                    UserID = Utility.ConverToNullableInt(dt.Rows[0]["id"]);

                    lnkContents.HRef = "~/Contact.aspx?TypeID=3&CompanyID=" + dt.Rows[0]["id"].ToString() + "&ReciverID=" + dt.Rows[0]["Uid"].ToString();
                }
            }
            catch (Exception)
            {
                //MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void BindCompanyBranch(int companyID)
        {
            DataTable dtCompanyBranch = da_co.TBL_Company_Branch_Tra(companyID);
            repCompanyBranch.DataSource = dtCompanyBranch;
            repCompanyBranch.DataBind();
        }

        protected void BindRequestUserDetails(int id)
        {
            DataTable dtUser = da_User.TBL_User_Tra("selectById", id);
            if (dtUser.Rows.Count > 0)
            {
                lblRequestUserFullName.Text = dtUser.Rows[0]["FullName"].ToString();
                lblRequestTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                lblRequestEmail.Text = dtUser.Rows[0]["Uid"].ToString();

                lblCompanyTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                lblCompanyEmail.Text = dtUser.Rows[0]["Uid"].ToString();

                DataTable dtState = da_State.TBL_State_Tra(Utility.ConverToNullableInt(dtUser.Rows[0]["Business_Location"]), "select_byID");
                if (dtState.Rows.Count > 0)
                {
                    lblRequestCity.Text = dtState.Rows[0]["StateName"].ToString();
                }
            }
        }

        void Bind_Product(int uid)
        {
            DataTable dt = da.Tbl_Products_Tra("select_byuid", uid, 0);
            repProduct.DataSource = dt;
            repProduct.DataBind();
        }

        //protected void BindCompanyNews(int uid)
        //{
        //    DataTable dtUserNews = da_User_News.TBL_User_News_Tra("select_Uid", uid);
        //    repCompanyNews.DataSource = dtUserNews;
        //    repCompanyNews.DataBind();
        //}

        public string GetStatus(string status)
        {
            string StatusMode = string.Empty;
            if (!string.IsNullOrEmpty(status))
                if (status == "1")
                    StatusMode = "";
                else if (status == "2")
                    StatusMode = " (خبر داغ) ";

            return StatusMode;
        }

        public string GetProductImage(string image, string imagepath)
        {
            if (Utility.ConverToNullableInt(image) == 1)
                return "~/MyBiztBiz/Pupload/sm_" + imagepath;
            else
                return "~/MyBiztBiz/Pupload/None/NONE.jpg";
        }

        public string GetTopNews()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["CompanyID"]))
                CompanyID = Utility.ConverToNullableInt(Request.QueryString["CompanyID"]);

            string news = string.Empty;

            DataTable dt = da_co.TBL_Company_Profile_Tra(CompanyID, "select_itemByID", 0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");
            if (dt.Rows.Count > 0)
            {
                UserID = Utility.ConverToNullableInt(dt.Rows[0]["Uid"]);
                DataTable dtUserNews = da_User_News.TBL_User_News_Tra("select_Uid", UserID);

                for (int i = 0; i < dtUserNews.Rows.Count; i++)
                {
                    news += " theSummaries[" + i + "] = \"" + dtUserNews.Rows[i]["Title"].ToString() + "\"; theSiteLinks[" + i + "] =\"UserNews.aspx?NewsID=" + dtUserNews.Rows[i]["Id"].ToString() + "&UserID=" + UserID + "\";";
                }
            }
            return news;
        }
    }
}
