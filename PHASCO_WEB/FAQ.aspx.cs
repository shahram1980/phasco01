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
using phasco_webproject.BaseClass;
using System.Globalization;
using Membership_Manage;
using PHASCO_WEB.BaseClass;
using DataAccessLayer.Users;
using DataAccessLayer;


namespace PHASCO_WEB
{
    public partial class FAQ : System.Web.UI.Page
    {
        Users_Wall da_w = new Users_Wall();
        FAQ_Tbl da_fq = new FAQ_Tbl();
        public string FaqTitle { get; set; }
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "سایت تخصصی علوم آزمایشگاهی مقالات اطلس ها وبلاگ ها پرسش و پاسخ علمی اخبار لیست کامل آزمایشگاه ها شرکت های تجهیزات و پزشکی با جوایز ارزشمند .";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

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
            alarmGrd.Visible = false;
        }
        private void bind_Grd()
        {
            DataTable dt = da_fq.FAQ_Tra("select_question", int.Parse(Request.QueryString["subid"].ToString()), 0, "", "", 0, 0, 0, "");
            GridView_Qu.DataSource = dt;
            GridView_Qu.DataBind();
            MultiView1.ActiveViewIndex = 0;

        }
        private void bind_Grd_Search()
        {
            DataTable dt = da_fq.FAQ_Tra("select_question_find", int.Parse(Request.QueryString["subid"].ToString()), 0, Request.QueryString["text"].ToString(), Request.QueryString["text"].ToString(), 0, 0, 0, "");
            if (dt.Rows.Count <= 0)
            {
                Label_alarm_Grd.Visible = true;
                alarmGrd.Visible = true;
                Label_alarm_Grd.Text = " متناسب با کلمه " + Request.QueryString["text"].ToString() + " هیچ موردی یافت نشد";
            }

            else
            {
                Label_alarm_Grd.Visible = false;
                alarmGrd.Visible = false;
            }
            GridView_Qu.DataSource = dt;
            GridView_Qu.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }
        //protected void Button_Search_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("faq.aspx?mode=find&text=" + TextBox_search.Text.ToString() + "&subid=" + Request.QueryString["subid"].ToString());
        //}
        protected void Button_sendAue_Click(object sender, EventArgs e)
        {
            if (TextBox_Title.Text == "") { Label_Ques_Alarm.Text = "عنوان وارد نشده"; }
            else if (TextBox_Body.Text == "") { Label_Ques_Alarm.Text = "متن پرسش وارد نشده"; }
            else
            {
                string IdReciver = da_fq.FAQ_Tra("insert_resUid", int.Parse(Request.QueryString["id"].ToString()), 0, TextBox_Title.Text, TextBox_Body.Text, 1, UserOnline.id(), 0, "").Rows[0]["id"].ToString();

                Label_Ques_Alarm.Text = "پاسخ شما با موفقیت ثبت گردید";
                TextBox_Body.Text = TextBox_Title.Text = "";

                string subid_ = Request.QueryString["subid"].ToString();
                string idreq_ = Request.QueryString["id"].ToString();

                try
                {
                    #region Insert Notification
                    // Insert Notification
                    //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                    NotificationUsers.AddNewNotification(int.Parse(IdReciver), 0, 0, "http://www.phasco.com/faq.aspx?subid=" + subid_ + "&mode=quview&id=" + idreq_, 2, 5, 5, "");
                    #endregion
                }
                catch (Exception) { }
                Response.Redirect("faq.aspx?subid=" + Request.QueryString["subid"].ToString() + "&mode=quview&id=" + Request.QueryString["id"].ToString());
            }
        }
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    Page.Culture = name;
                    Page.UICulture = name;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    Page.Culture = str2;
                    Page.UICulture = str2;
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

            if (!IsPostBack)
            {
                Set_Title();
				if (!UserOnline.User_Online_Valid())
				{
					Button_sendAue.Enabled = false; Button_sendAue.Text = "ابتدا وارد سایت شوید";
					Button_register.Visible = true;
					Button_sendAue.Visible = false;
				}
				else
				{
					Button_register.Visible = false;
					Button_sendAue.Visible = true;
				}
                if (Request.QueryString["mode"] == null)
                {
                    bind_Grd();
                    //  Ins_Qu.HRef = "FAQ.aspx?subid=" + Request.QueryString["subid"].ToString() + "&mode=ins";
                }
                else
                {
                    string str2 = Request.QueryString["mode"].ToString();
                    if (str2 != null)
                    {
                        if (!(str2 == "ins"))
                        {
                            if (str2 == "quview")
                            {
                                Set_View_Que();
                                back_List.HRef = "faq.aspx?subid=" + Request.QueryString["subid"].ToString();
                            }
                            else if (str2 == "find") { bind_Grd_Search(); }
                            else if (str2 == "ansqu")
                            {
                                MultiView1.ActiveViewIndex = 1;
                                back_List.HRef = "faq.aspx?subid=" + Request.QueryString["subid"].ToString();
                                Set_Qu_AnswerMode();
                            }
                        }
                        else { MultiView1.ActiveViewIndex = 1; }
                    }
                }
            }
        }
        void Set_Qu_AnswerMode()
        {
            DataTable dt = da_fq.FAQ_Tra("select_item", int.Parse(Request.QueryString["id"].ToString()), 0, "", "", 0, 0, 0, "");
            Label_Qu_AnswerMode.Text = "<h6>" + dt.Rows[0]["title"].ToString() + "</h6> <p> " + dt.Rows[0]["text"].ToString() + "</h6>";
        }
        void Set_Title()
        {
            DataTable dt = da_fq.FAQ_List_Tra("select_Item", int.Parse(Request.QueryString["subid"].ToString()), "", "");
            Label_Title.Text = dt.Rows[0]["title"].ToString();
            Label_Title2.Text = dt.Rows[0]["title"].ToString();
        }
        private void Set_View_Que()
        {
            answer_Qu.HRef = "faq.aspx?subid=" + Request.QueryString["subid"].ToString() + "&mode=ansqu&id=" + Request.QueryString["id"].ToString() + "";
            DataTable dt = da_fq.FAQ_Tra("select_item", int.Parse(Request.QueryString["id"].ToString()), 0, "", "", 0, 0, 0, "");
            Label_Text_title.Text = dt.Rows[0]["title"].ToString();
            Lable_Text.Text = dt.Rows[0]["text"].ToString();
            DataTable dt_ = da_fq.FAQ_Tra("select_answer", int.Parse(Request.QueryString["id"].ToString()), 0, "", "", 0, 0, 0, "");
            GridView_Answer.DataSource = dt_;
            GridView_Answer.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }
        protected void MyRepeater_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            string Comm_ = e.CommandName.ToString();
            string[] arg = new string[2];
            string res_ = "";
            arg = e.CommandArgument.ToString().Split(';');

            int id_ = int.Parse(arg[0]);
            int reciverid = int.Parse(arg[1]);
            if (UserOnline.User_Online_Valid())
            {
                DataTable dt;

                switch (Comm_)
                {
                    case "thankscommand":
                        {
                            dt = da_fq.FAQ_Tra("select_deteils", id_, UserOnline.id(), "", "", 0, 0, 0, "");
                            if (dt.Rows.Count > 0)
                            {

                                string subid_ = Request.QueryString["subid"].ToString();
                                string idreq_ = Request.QueryString["id"].ToString();

                                string wall_Text = "کاربر " + UserOnline.Uid() + " از بابت پاسخ شما به پرسش " + dt.Rows[0]["Title"].ToString() + "  تشکر کرده است - <a href='http://www.phasco.com/faq.aspx?subid=" + subid_ + "&mode=quview&id=" + idreq_ + "'>لینک پرسش</a>";
                                //  da_w.Users_Wall_tra("insert", UserOnline.id(), int.Parse(dt.Rows[0]["sender_Id"].ToString()), 0, wall_Text);
                                //  PMail.Wall_Mail(dt_SendEmail.Rows[i]["Email"].ToString(), dt_SendEmail.Rows[i]["Uid_Sender"].ToString(), Request.Url.ToString(), text.Text);
                                Set_View_Que();

                                #region Insert Notification
                                // Insert Notification
                                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                                NotificationUsers.AddNewNotification(reciverid, 0, 0, "http://www.phasco.com/faq.aspx?subid=" + subid_ + "&mode=quview&id=" + idreq_, 2, 5, 7, "");
                                #endregion
                            }
                        }
                        break;
                    case "minusScore":
                        {
                            res_ = da_fq.FAQ_Tra("FAQ_Score", id_, UserOnline.id(), "", "", 1, 0, 0, "").Rows[0][0].ToString();
                            Set_View_Que();
                            if (res_ == "1")
                            {
                                if (UserOnline.role() == 5)
                                {
                                    // add heyat elmi point
                                    UserOnline.Add_Point(UserOnline.id(), 501, "auto");
                                }
                            }
                        }
                        break;
                    case "addScore":
                        {
                            res_ = da_fq.FAQ_Tra("FAQ_Score", id_, UserOnline.id(), "", "", 0, 0, 0, "").Rows[0][0].ToString();
                            if (res_ == "1")
                            {
                                string subid_ = Request.QueryString["subid"].ToString();
                                string idreq_ = Request.QueryString["id"].ToString();

                                #region Insert Notification
                                // Insert Notification
                                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                                NotificationUsers.AddNewNotification(reciverid, 0, 0, "http://www.phasco.com/faq.aspx?subid=" + subid_ + "&mode=quview&id=" + idreq_, 2, 5, 6, "");
                                #endregion
                                Set_View_Que();

                                if (UserOnline.role() == 5)
                                {
                                    // add user point
                                    UserOnline.Add_Point(reciverid, 11, "auto");
                                    // add heyat elmi point
                                    UserOnline.Add_Point(UserOnline.id(), 501, "auto");
                                }
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
        }

        public string SetUserImageView(int sender_Id)
        {
            DataTable dt;
            TBL_User da = new TBL_User();
            dt = da.Users_Tra("select_Item", sender_Id);
            try
            {
                int Image_ = int.Parse(dt.Rows[0]["Image"].ToString());
                int sex_ = int.Parse(dt.Rows[0]["Sex"].ToString());

                if (Image_ == 1) return "<a href='UserProfile.aspx?id=" + sender_Id + "'>" + "<img src='http://phasco.com/phascoupfile/Userphoto/" + sender_Id.ToString() + ".jpg" + "' /></a>";

                if (sex_ == 0) return "<a href='UserProfile.aspx?id=" + sender_Id + "'>" + "<img  src='http://phasco.com/phascoupfile/Userphoto/Nopic_male.jpg' /></a>";
                else if (sex_ == 1) return "<img src='phascoupfile/Userphoto/Nopic_female.jpg' />";
                return "<img src='http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg' />";

            }
            catch (Exception)
            {
                return "<img src='http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg' />";
            }
        }

        public string SetScoreColor(int Score)
        {
            if (Score > 0) return "#0aa750";
            if (Score == 0) return "#000000";
            if (Score < 0) return "#fb004d";
            return "#000000";
        }

        public string Mss_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        public string Set_User(int uid)
        {
            User da = new User();
            System.Data.DataTable dt;

            dt = da.GetUsers_Tra_DT("select_Item", uid);
            if (dt.Rows.Count > 0) { return "<a title='"+ dt.Rows[0]["Name"].ToString() + " " + dt.Rows[0]["Famil"].ToString()+"' href='UserProfile.aspx?id=" + dt.Rows[0]["Id"].ToString() + "'>" + dt.Rows[0]["UID"].ToString()  + "</a>"; }

            return "مدیر سایت";
        }
        public string Set_Url(string text, int id)
        {
            string ur = "<a class='read-more' href='faq.aspx?subid=" + Request.QueryString["subid"].ToString() + "&mode=quview&id=" + id.ToString() + "'><i class='fa fa-reply'></i> پاسخ </a>";

            return ur;
        }
    }
}
