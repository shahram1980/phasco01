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

namespace BiztBiz.C_p
{
    public partial class News : BasePage
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

                DataTable dtState = da_State.T_state_Tra("select_byID",Utility.ConverToNullableInt(dtUser.Rows[0]["Business_Location"]) );
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

        void set_News()
        {
            BindRequestUserDetails(UserID);
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

        protected void BindCompanyNews(int uid)
        {
            DataTable dtUserNews = da_User_News.TBL_User_News_Tra("select_Uid", uid);
            repCompanyNews.DataSource = dtUserNews;
            repCompanyNews.DataBind();
        }

    }
}
