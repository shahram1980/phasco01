using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Threading;
using System.Globalization;
using phasco_webproject.BaseClass;
using phasco.BaseClass;
using PHASCO_WEB.DAL;
using Membership_Manage;
using DataAccessLayer;
namespace phasco_webproject
{
    public partial class BlogComment : System.Web.UI.Page
    {
        #region dataset
        User_Blog da_blg = new User_Blog();
        DataTable dt = new DataTable();

        PHASCO_WEB.DAL.DS_MainPhasco.Users_Blog_CommentDataTable dt_cmm = new PHASCO_WEB.DAL.DS_MainPhasco.Users_Blog_CommentDataTable();
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter da_cmm = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter();
        #endregion
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string lang = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = lang;
                    Response.Cookies.Add(cookie);
                    Page.Culture = lang;
                    Page.UICulture = lang;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-ir";
                Page.UICulture = "fa-ir";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    HiddenField_Id.Value = Request.QueryString["id"].ToString();
                    int id = Convert.ToInt32(HiddenField_Id.Value);
                    dt = da_blg.GetUsers_Blog_Tra_DT("Select_Item", id, "", 0, "", 0, "");
                    Label_Title.Text = dt.Rows[0]["Title"].ToString();
                    bind_grd();
                }
            }
            catch (Exception) { }
        }
        void bind_grd()
        {
            int id = Convert.ToInt32(HiddenField_Id.Value);
            dt_cmm = da_cmm.Select_All(id);
            GridView_Comment.DataSource = dt_cmm;
            GridView_Comment.DataBind();
        }

           public string GetUserTitle(int id)
        {
            string uid = "";
            User da = new User();
            System.Data.DataTable dt;

            dt = da.GetUsers_Tra_DT("select_Item", id);
            if (dt.Rows.Count > 0) uid = dt.Rows[0]["Uid"].ToString();
            DateTime dtm = new DateTime();
            return uid;

        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            //try
            //{
                if (UserOnline.User_Online_Valid())
                {
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    da_cmm.Insert_New(id, TextBox_Comment.Text, 1, UserOnline.id());

                    Users_Blog da_Blog = new Users_Blog();
                    DataTable dt = da_Blog.Users_Blog_Tra("Select_OwnerId", id, id, "", "", 0, "");
                    int ReciverId = int.Parse(dt.Rows[0]["id"].ToString());
                    // int ReciverId = int.Parse(dt.Rows[0]["Uid"].ToString());


                   // #region Insert Notification
                    // Insert Notification
                    // InsertType :  SendToAllFriend = 1 , SendToSingleFriend=2  ,   FinalAction=3
                    NotificationUsers.AddNewNotification(ReciverId, ReciverId, 0, "http://phasco.com/Wblog.aspx?OBid=" + id.ToString() + "&swb=t" + Label_Title.Text,
                        3, 4, 20, TextBox_Comment.Text, da_cmm.Select_All_UID(id));
                   // #endregion

                    TextBox_Comment.Text = "";
                    bind_grd();
                }
                else { Label_Alarm.Text = Resources.Resource.Login_First; return; }
            //}
            //catch (Exception) { Label_Alarm.Text = Resources.Resource.Login_First; return; }
        }

        public string Set_Title(string date, int id)
        {
            string uid = "";
            string date_ = "";
            User da = new  User();
            System.Data.DataTable dt;

            dt = da.GetUsers_Tra_DT("select_Item", id);
            if (dt.Rows.Count > 0) uid = dt.Rows[0]["Uid"].ToString();
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            date_ = sunDate.Weekday.ToString() + "[" + dtm.Hour + ":" + dtm.Minute + "]";

            return "<table border='0' width='100%' dir='rtl' cellpadding='0' style='border-collapse: collapse'><tr><td width='50%' align='right'>" + uid + "</td><td width='50%' align='left'>" + date_ + "</td></tr></table>";
        }

        public string persian_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return "<i class='date-wrapper'>" + sunDate.Weekday.ToString() + " </i> <i class='seprator margin-left-5 margin-right-5 pull-right'>| </i><i class='fa fa-clock-o'></i><i class='pull-right'>" + dtm.Hour + ":" + dtm.Minute + "</i>";
        }
    }
}
