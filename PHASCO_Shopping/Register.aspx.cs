using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Web.Mail;
using System.Data;
using DataAccessLayer.Users;
using System.Threading;
using Membership_Manage;

namespace PHASCO_Shopping
{
    public partial class Register : System.Web.UI.Page
    {
        TBL_User da_User = new TBL_User();
        DataTable dt = new DataTable();
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
                    this.Page.Culture = name;
                    this.Page.UICulture = name;
                    Response.Redirect(Request.UrlReferrer.ToString());
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    this.Page.Culture = str2;
                    this.Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
            }
        }
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
        protected void Button_insert_Click(object sender, EventArgs e)
        {
            int? getid = 0;
            int year = Convert.ToInt32(cmbYear.SelectedValue);
            int month = Convert.ToInt32(cmbMonth.SelectedValue);
            int day = Convert.ToInt32(cmbDay.SelectedValue);
            PersianCalendar calendar = new PersianCalendar();

            if (TextBox_Code.Text.ToUpper() != FormShield1.Value.ToString().ToUpper())
            { lbl_Alarm.Text = Resources.Resource.Incorrect_code; return; }

            DateTime time;
            try { time = calendar.ToDateTime(year, month, day, 0, 0, 0, 0); }
            catch { return; }

            int introid = 0;

            try
            {
                if (HiddenField_Intro.Value != "")
                    if (HiddenField_Intro.Value == "0")
                        check_Intro_Id();
                { introid = Convert.ToInt32(HiddenField_Intro.Value); }
            }
            catch (Exception) { introid = 0; }

            int sex = 0;
            if (RadioButtonList_sex.SelectedValue == "1") { sex = 1; }


            dt = da_User.Users_Tra("insert2", 0, TextBox_uid.Text, TextBox_Pass.Text, TextBox_Name.Text, TextBox_Famil.Text, TextBox_Father.Text, sex, DateTime.Now, TextBox_Website.Text
                , TextBox_Email.Text, TextBox_Tel.Text, TextBox_Address.Text, TextBox_Description.Text, 0, introid, 0, 0);


            int id_ = int.Parse(dt.Rows[0][0].ToString());
            switch (id_)
            {
                case 1:
                    { lbl_Alarm.Text = Resources.Resource.another_email; return; break; }
                case 2:
                    { lbl_Alarm.Text = Resources.Resource.another_uid; return; break; }
            }

            if (id_ > 3)
            {
                string body = "<div align='center'>";
                body = body + "<table border='0' width='95%' dir='rtl' style='border-collapse: collapse'>";
                body = body + "<tr><td><span lang='fa'>کاربر گرامی جهت فعال سازی نام کاربری خود برروی لینک زیر کلیک نمائید.<br>&nbsp;</span></td></tr><tr>";
                body = body + "<td dir='ltr' align='center'>";
                body = body + "<a href='http://phasco.ir/UserActive.aspx?Usecid=" + Secu(getid.ToString()) + "&modeactive=" + Secu("newuserregisterd") + "'>";
                body = body + "http://phasco.ir/UserActive.aspx?Usecid=" + Secu(dt.Rows[0][0].ToString()) + "&amp;modeactive=" + Secu("newuserregisterd") + "</a></td></tr><tr><td><span lang='fa'>باتشکر</span></td></tr></table></div>";

                SendMail(TextBox_Email.Text, "Welcome to phasco website.", body);
                MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                if (UserOnline.User_Online_Valid())
                { Response.Redirect("Default.aspx"); }
                SetYear();
                Set_Agreement();
                MultiView1.ActiveViewIndex = 0;
            }
        }

        private void Set_Agreement()
        {
            //try
            //{
            //    AgreeTableAdapter adapter = new AgreeTableAdapter();
            //    Main.AgreeDataTable table = new Main.AgreeDataTable();
            //    table = adapter.Agree_Tra("select_lang", Page.Culture.ToString(), "");
            //    Agreement_Id.Text = table[0].agree.ToString();
            //}
            //catch (Exception)
            //{
            //    Agreement_Id.Text = "";
            //}
        }
        private void SetYear()
        {
            PersianCalendar calendar = new PersianCalendar();
            int num = calendar.GetYear(DateTime.Now) - 0x12;
            for (int i = num - 0x55; i <= num; i++)
            {
                cmbYear.Items.Add(i.ToString());
            }
        }
        private string Secu(string str)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(str);
            string encodedString = Convert.ToBase64String(bytes);
            return encodedString;
        }
        public static void SendMail(string mail, string Subject, string Body)
        {
            //string smtpServer = "mail.phasco.com";
            //string userName = "technical@phasco.com";
            //string password = "11004455";
            //int cdoBasic = 1;
            //int cdoSendUsingPort = 2;
            //MailMessage msg = new MailMessage();
            //if (userName.Length > 0)
            //{
            //    msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", smtpServer);
            //    msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);
            //    msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", cdoSendUsingPort);
            //    msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", cdoBasic);
            //    msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", userName);
            //    msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", password);
            //}
            //msg.To = mail;
            //msg.From = "PHASCO .";
            //msg.Subject = Subject;
            //msg.BodyFormat = MailFormat.Html;
            //msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
            //msg.Body = Body;
            //SmtpMail.SmtpServer = smtpServer;
            //SmtpMail.Send(msg);
        }

        protected void LinkButton_IntoCheck_Click(object sender, EventArgs e)
        {
            check_Intro_Id();
        }

        void check_Intro_Id()
        {
            dt = da_User.Users_Tra("select_Uid_Intro", TextBox_IntriId.Text);

            if (dt.Rows.Count > 0)
            {
                Label_Intro_Alarm.Text = Resources.Resource.UR_introduction + dt.Rows[0]["name"].ToString();
                HiddenField_Intro.Value = dt.Rows[0]["Id"].ToString();
            }
            else
            { Label_Intro_Alarm.Text = Resources.Resource.No_such_user; }
        }

    }
}