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
using System.Collections.Generic;
using System.Threading;
using phasco_webproject.BaseClass;
using DataAccessLayer;
using BusinessAccessLayer;
using Membership_Manage;
using System.Globalization;

namespace PHASCO_WEB
{
    public partial class Wblog : System.Web.UI.Page
    {
        PHASCO_WEB.DAL.DS_MainPhasco.Users_Blog_CommentDataTable dt_cmm = new PHASCO_WEB.DAL.DS_MainPhasco.Users_Blog_CommentDataTable();
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter da_cmm = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter();

        Users_Blog da_Blog = new Users_Blog();
        public DataTable dt_blg;
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
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "وب سایت علوم آزمایشگاهی پزشکی phasco.com -بخش وب لاگ ها";
            string keys = "پزشک,آزمایشگاه,فاسکو";

            if (Request.QueryString["sing"] != null)
            {
                if (Request.QueryString["sing"].ToString() == "Td09$5ka-297629963803216500")
                {
                    Set_Datatable(3);
                }
            }
            else
            {
                if (Request.QueryString["arc"] != null) { Set_Datatable(2); }
                else Set_Datatable(1);
            }
            try
            {
                keys = keys + Set_Rnd_Word(dt_blg.Rows[0]["Title"].ToString() + " " + dt_blg.Rows[0]["keys"].ToString());
                desc = desc + dt_blg.Rows[0]["Title"].ToString();
            }
            catch (Exception) { }

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);
        }

        public bool HasReturn;
        #region Get Random Word's of Sentence
        protected string Set_Rnd_Word(string str)
        {
            List<string> lstStr = new List<string>();
            List<KeyValuePair<string, int>> Collector = new List<KeyValuePair<string, int>>();
            lstStr.AddRange(str.Split(new string[] { " " }, StringSplitOptions.None));

            foreach (string tempStr in lstStr)
            {
                List<string> result = lstStr.FindAll(delegate (string compareString)
                { return compareString.Equals(tempStr); }
                                 );
                KeyValuePair<string, int> item = new KeyValuePair<string, int>(tempStr, result.Count);
                Collector.Add(item);
            }

            string ret = "";
            int maxloop = 25;
            string key = "";
            if (Collector.Count < maxloop) maxloop = Collector.Count;
            for (int i = 0; i < maxloop; i++)
            {
                Thread.Sleep(20);

                key = Collector[RandomNumber(1, Collector.Count)].Key.ToString();
                if (key != "")
                {
                    ret = ret + "," + key;
                }
            }

            return ret;
        }
        public static int RandomNumber(int min, int max)
        {
            Random random = new Random(unchecked((int)DateTime.Now.Ticks));
            return random.Next(min, max);
        }
        #endregion
        protected void Set_Datatable(int status)
        {
            try
            {
                int id = 0;
                try { id = Convert.ToInt32(Request.QueryString["Bid"].ToString()); }
                catch (Exception) { MultiView1.ActiveViewIndex = 0; return; }
                if (status == 1)
                    dt_blg = da_Blog.Users_Blog_Tra("Select_5", id);
                if (status == 2)
                    dt_blg = da_Blog.Users_Blog_Tra("Select_arc", id, Request.QueryString["arc"].ToString());
                if (status == 3)
                    dt_blg = da_Blog.Users_Blog_Tra("Select_Item", id, "");

            }
            catch (Exception)
            { }
        }
        void bind_Grd()
        {
            if (Request.QueryString["OBid"] == null)
            {
                GridView_Blog.DataSource = dt_blg;
                Panel_LikeDislike.Visible = false;
            }
            else
            {
                int id = 0;
                try { id = Convert.ToInt32(Request.QueryString["OBid"].ToString()); }
                catch (Exception) { MultiView1.ActiveViewIndex = 0; return; }
                DataTable dtt = da_Blog.Users_Blog_Tra("Select_Item", id, 0, "", "", 0, "");
                HiddenField_UID.Value = dtt.Rows[0]["uid"].ToString();
                HiddenField_Title.Value = dtt.Rows[0]["Title"].ToString();

                Page.Title = dtt.Rows[0]["Title"].ToString();
                lbl_like.Text = dtt.Rows[0]["ScoreUP"].ToString();
                lbl_Unlike.Text = dtt.Rows[0]["ScoreDown"].ToString();
                lblUserPoint.Text = dtt.Rows[0]["UserPoint"].ToString();

                Panel_LikeDislike.Visible = true;
                int tt = dtt.Rows.Count;
                GridView_Blog.DataSource = dtt;
                bind_grd_Comment(id);
            }

            GridView_Blog.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        void bind_Grd_arc()
        {
            GridView_Blog.DataSource = dt_blg;
            GridView_Blog.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        void bind_grd_Comment(int blogId)
        {

            dt_cmm = da_cmm.Select_All(blogId);
            GridView_Comment.DataSource = dt_cmm;
            GridView_Comment.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Bid"] != null)
                    HasReturn = false;


                if (Request.QueryString["arc"] != null) { bind_Grd_arc(); }
                else bind_Grd();
            }
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            //try
            //{
            if (UserOnline.User_Online_Valid())
            {
                int id = Convert.ToInt32(Request.QueryString["OBid"].ToString());
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
                bind_grd_Comment(id);
            }
            else { Label_Alarm.Text = Resources.Resource.Login_First; return; }
            //}
            //catch (Exception) { Label_Alarm.Text = Resources.Resource.Login_First; return; }
        }
        public string Set_Title(string date, int id)
        {
            string uid = "";
            string date_ = "";
            User da = new User();
            System.Data.DataTable dt;

            dt = da.GetUsers_Tra_DT("select_Item", id);
            if (dt.Rows.Count > 0) uid = dt.Rows[0]["Uid"].ToString();
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            date_ = sunDate.Weekday.ToString() + "[" + dtm.Hour + ":" + dtm.Minute + "]";

            return "<table border='0' width='80%' dir='rtl' cellpadding='0' style='border-collapse: collapse'><tr><td width='50%' align='right'>" + uid + "</td><td width='50%' align='left'>" + date_ + "</td></tr></table>";
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


       
        #region Like Dislike post
        protected void ImageButton_UnlikeVideo_Click(object sender, EventArgs e)
        {
            int BlogoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["OBid"]);
            string res_ = da_Blog.Users_Blog_Tra_LikeDisike("Insert_UScore", BlogoId, UserOnline.id(), 1).Rows[0][0].ToString();
            if (res_ == "1")
            {
                if (UserOnline.role() == 5)
                {
                    // add heyat elmi point
                    UserOnline.Add_Point(UserOnline.id(), 501, "auto");
                }
                lbl_Unlike.Text = (int.Parse(lbl_Unlike.Text.ToString()) - 1).ToString();
                lblUserPoint.Text = (int.Parse(lblUserPoint.Text.ToString()) - 1).ToString();
            }
        }

        protected void ImageButton_LikeVideo_Click(object sender, EventArgs e)
        {
            int BlogoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["OBid"]);
            string res_ = da_Blog.Users_Blog_Tra_LikeDisike("Insert_UScore", BlogoId, UserOnline.id(), 0).Rows[0][0].ToString();
            if (res_ == "1")
            {
                int uid_reciver = int.Parse(HiddenField_UID.Value);

                if (UserOnline.role() == 5)
                {
                    // add user point
                    UserOnline.Add_Point(uid_reciver, 11, "auto");
                    // add heyat elmi point
                    UserOnline.Add_Point(UserOnline.id(), 501, "auto");

                    HiddenField_Title.Value += "+20";
                }

                lbl_like.Text = (int.Parse(lbl_like.Text.ToString()) + 1).ToString();
                lblUserPoint.Text = (int.Parse(lblUserPoint.Text.ToString()) + 1).ToString();

                #region Insert Notification
                // Insert Notification
                // InsertType :  SendToAllFriend = 1 , SendToSingleFriend=2  ,   FinalAction=3
                //NotificationUsers.AddNewNotification(uid_reciver, 0, 0, "http://www.phasco.com/Wblog.aspx?OBid=" + BlogoId.ToString(),
                //    2, 10, 25, HiddenField_Title.Value);
                #endregion
            }
        }
        #endregion
    }
}
