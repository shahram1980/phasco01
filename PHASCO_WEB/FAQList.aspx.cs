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
using phasco_webproject.BaseClass;
using Membership_Manage;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class FAQList : System.Web.UI.Page
    {
        FAQ_Tbl da_fq = new FAQ_Tbl();
        DataTable dt;

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


        }
        private void bind_Grd()
        {
            dt = da_fq.FAQ_List_Tra("select_all", 0, "", "");

            DataList_Qu_List.DataSource = dt;
            DataList_Qu_List.DataBind();
        }

        private void Bind_RDQ()
        {
            dt = da_fq.FAQ_List_Tra("select_all", 0, "", "");

            DropDownList_Group.DataSource = dt;
            DropDownList_Group.DataTextField = "title";
            DropDownList_Group.DataValueField = "id";
            DropDownList_Group.DataBind();
            bind_top10Grd();
        }
        private void bind_top10Grd()
        {
            dt = da_fq.FAQ_Tra("select_top_10", 0, 0, "", "", 0, 0, 0, "");
            GridView_Top10Qu.DataSource = dt;
            GridView_Top10Qu.DataBind();
        }

        protected void Button_sendAue_Click(object sender, EventArgs e)
        {
            if (TextBox_Title.Text == "") { Label_Ques_Alarm.Text = "عنوان وارد نشده است"; }
            else if (TextBox_Body.Text == "") { Label_Ques_Alarm.Text = "سوال وارد نشده است"; }
            else
            {
                string id_ = da_fq.FAQ_Tra("insert", int.Parse(DropDownList_Group.SelectedValue.ToString()), int.Parse(DropDownList_Group.SelectedValue.ToString()), TextBox_Title.Text, TextBox_Body.Text, 0, UserOnline.id(), 0, "").Rows[0]["id"].ToString();
                Label_Ques_Alarm.Text = "سوال شما با موفقیت ثبت گردید";
                if (id_ == "0")
                { Label_Ques_Alarm.Text = "لطفاً ابتدا لاگین کنید"; return; }

                #region Insert Notification
                // Insert Notification
                // InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                NotificationUsers.AddNewNotification(0, UserOnline.id(), 0, "http://phasco.com/faq.aspx?subid=" + DropDownList_Group.SelectedValue.ToString() + "&mode=quview&id=" + id_, 1, 2, 2, TextBox_Title.Text);
                #endregion
                TextBox_Body.Text = TextBox_Title.Text = "";

                Response.Redirect("FAQList.aspx");
            }
        }

        //protected override void InitializeCulture()
        //{
        //    try
        //    {
        //        if (Request.QueryString["mLang"] != null)
        //        {
        //            string name = Convert.ToString(Request.QueryString["mLang"]);
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
        //            HttpCookie cookie = new HttpCookie("elang");
        //            cookie.Value = name;
        //            Response.Cookies.Add(cookie);
        //            Page.Culture = name;
        //            Page.UICulture = name;
        //            Response.Redirect("Default.aspx");
        //        }
        //        else
        //        {
        //            HttpCookie cookie2 = Request.Cookies["elang"];
        //            string str2 = cookie2.Value.ToString();
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
        //            Page.Culture = str2;
        //            Page.UICulture = str2;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        Page.Culture = "fa-ir";
        //        Page.UICulture = "fa-ir";
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid())
            {
                Button_sendAue.Visible = false;
                Button_register.Visible = true;
                //Button_sendAue.Text = "لطفا ابتدا لاگین کنید";
                //Button_sendAue.Attributes.Add("onclick", "return openLoginModal();");

            }
            else
            {
                Button_sendAue.Visible = true;
                Button_register.Visible = false;
            }
            if (!IsPostBack)
            {
                bind_Grd();

                Bind_RDQ();
            }
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
            if (dt.Rows.Count > 0) { return "<a href='UserProfile.aspx?id=" + dt.Rows[0]["Id"].ToString() + "'>" + dt.Rows[0]["UID"].ToString() + "</a>"; }

            return "مدیر سایت";
        }
        public string Set_Url(string text, int id, string subid)
        {
            string ur = "<a class='read-more' href='faq.aspx?subid=" + subid + "&mode=quview&id=" + id.ToString() + "'> <i class='fa fa-reply'></i> پاسخ   </a>";

            return ur;
        }
    }
}
