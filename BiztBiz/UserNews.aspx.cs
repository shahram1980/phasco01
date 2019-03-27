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
    public partial class UserNews : BasePage
    {

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


        int _NewsID;
        public int NewsID
        {
            get
            {
                return _NewsID;
            }
            set
            {
                _NewsID = value;
            }
        }


        Tbl_Products da = new Tbl_Products();
        TBL_User_Biz da_User = new TBL_User_Biz();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_User_News da_User_News = new TBL_User_News();
        TBL_Company_Profile da_Company_Profile = new TBL_Company_Profile();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Request.QueryString["UserID"]))
                UserID = Utility.ConverToNullableInt(Request.QueryString["UserID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["NewsID"]))
                NewsID = Utility.ConverToNullableInt(Request.QueryString["NewsID"]);


            if (!IsPostBack)
            {
                set_News();
            }
        }

        protected void BindRequestUserDetails(int id)
        {
            DataTable dtUser = da_User.TBL_User_Tra("selectById", id);
            if (dtUser.Rows.Count > 0)
            {
                lblRequestUserFullName.Text = dtUser.Rows[0]["FullName"].ToString();
                lblRequestTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                lblRequestEmail.Text = dtUser.Rows[0]["Uid"].ToString();

                DataTable dtState = da_State.TBL_State_Tra(Utility.ConverToNullableInt(dtUser.Rows[0]["Business_Location"]), "select_byID");
                if (dtState.Rows.Count > 0)
                {
                    lblRequestCity.Text = dtState.Rows[0]["StateName"].ToString();
                }

                DataTable dtCompany = da_Company_Profile.TBL_Company_Profile_Tra("select_item", id);
                if (dtCompany.Rows.Count > 0)
                {
                    lnkRequestProfile.Text = dtCompany.Rows[0]["Company_Name"].ToString();
                    lnkRequestProfile.NavigateUrl = "~/Home.aspx?CompanyID=" + dtCompany.Rows[0]["id"].ToString() + "&Level=2&SearchSection=3";
                    lblCompanyAdress.Text = dtCompany.Rows[0]["Company_Address"].ToString();
                    lblCompanySite.Text = dtCompany.Rows[0]["Company_Website"].ToString();
                    BindCompanyBranch(Utility.ConverToNullableInt(dtCompany.Rows[0]["id"]));
                    lblCompanyTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                    lblCompanyEmail.Text = dtUser.Rows[0]["Uid"].ToString();
                }
            }
        }

        void Bind_Product(int uid)
        {
            DataTable dt = da.Tbl_Products_Tra("select_byuid", uid, 0);
            repProduct.DataSource = dt;
            repProduct.DataBind();
        }

        public string GetProductImage(string image, string imagepath)
        {
            if (Utility.ConverToNullableInt(image) == 1)
                return "~/MyBiztBiz/Pupload/sm_" + imagepath;
            else
                return "~/MyBiztBiz/Pupload/None/NONE.jpg";
        }

        void set_News()
        {
            if (Users.UserValid())
            {
                tdCompanyInfo.Visible = true;
                tdNotCompanyInfo.Visible = false;
                tdUserInfo.Visible = true;
                tdNotUserInfo.Visible = false;
                BindRequestUserDetails(UserID);
            }
            else
            {
                tdNotCompanyInfo.Visible = true;
                tdCompanyInfo.Visible = false;
                tdNotUserInfo.Visible = true;
                tdUserInfo.Visible = false;
                DataTable dtCompany = da_Company_Profile.TBL_Company_Profile_Tra("select_item", UserID);
                if (dtCompany.Rows.Count > 0)
                {
                    lnkRequestProfile.Text = dtCompany.Rows[0]["Company_Name"].ToString();
                    lnkRequestProfile.NavigateUrl = "~/Home.aspx?CompanyID=" + dtCompany.Rows[0]["id"].ToString() + "&Level=2&SearchSection=3";
                    lblCompanyAdress.Text = dtCompany.Rows[0]["Company_Address"].ToString();
                    lblCompanySite.Text = dtCompany.Rows[0]["Company_Website"].ToString();
                    BindCompanyBranch(Utility.ConverToNullableInt(dtCompany.Rows[0]["id"]));
                }
            }

            Bind_Product(UserID);
            BindCompanyNews(UserID);
            TBL_User_News da = new TBL_User_News();
            DataTable dt = da.TBL_User_News_Tra(NewsID);
            if (dt.Rows.Count > 0)
            {
                Label_NewsTitle.Text = dt.Rows[0]["Title"].ToString();
                ltrNewsDescDesc.Text = dt.Rows[0]["news"].ToString();

            }
            //Label_Datesend.Text = dt.Rows[0]["datesend"].ToString();
            //if (Page.Culture == "Persian (Iran)")
            //{
            //    DateTime dtm = new DateTime();
            //    dtm = Convert.ToDateTime(dt.Rows[0]["datesend"].ToString());
            //    Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            //    Label_Datesend.Text = sunDate.Weekday.ToString() + " ساعت :  " + dtm.Hour.ToString() + ":" + dtm.Minute.ToString(); ;
            //}

        }

        protected void BindCompanyBranch(int companyID)
        {
            DataTable dtCompanyBranch = da_Company_Profile.TBL_Company_Branch_Tra(companyID);
            repCompanyBranch.DataSource = dtCompanyBranch;
            repCompanyBranch.DataBind();
        }

        protected void BindCompanyNews(int uid)
        {
            DataTable dtUserNews = da_User_News.TBL_User_News_Tra("select_Uid", uid);
            repCompanyNews.DataSource = dtUserNews;
            repCompanyNews.DataBind();
        }

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

    }
}
