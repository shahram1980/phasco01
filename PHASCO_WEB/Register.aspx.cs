using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Globalization;
using BusinessAccessLayer;
using DataAccessLayer;
using System.Linq;

namespace PHASCO_WEB
{
    public partial class Register : System.Web.UI.Page
    {
        User da_User = new User();
        #region dataset
        //UsersTableAdapter da_User1 = new UsersTableAdapter();
        PHASCO_WEB.DAL.DS_MainPhasco.UsersDataTable dt_User = new PHASCO_WEB.DAL.DS_MainPhasco.UsersDataTable();
        DataTable dt = new DataTable();
        #endregion
        //private static readonly Object locker = new Object();
        protected void Page_Init(object sender, EventArgs e)
        {
         


        }
        protected void Button_insert_Click(object sender, EventArgs e)
        {
            int? getid = 0;
            int year = Convert.ToInt32(cmbYear.SelectedValue);
            int month = Convert.ToInt32(cmbMonth.SelectedValue);
            int day = Convert.ToInt32(cmbDay.SelectedValue);
            PersianCalendar calendar = new PersianCalendar();

            //if (TextBox_Code.Text.ToUpper() != FormShield1.Value.ToString().ToUpper())
            //{ lbl_Alarm.Text = "کد امنیتی اشتباه است"; return; }
            //if (!CheckBox_Agree.Checked)
            //{
            //    lbl_Alarm.Text = Resource.Agree_NotChecked_text.ToString();
            //}
            //else
            //{

            if (TextBox_uid.Text.Length < 4)
            {
                lbl_Alarm.Text = "نام کاربر می بایست از 4 کاراکتر بیشتر باشد";
                lbl_Alarm_Wrapper.Visible = true;
                return;
            }

            if (year < 0 || month < 0 || day < 0)
            {
                lbl_Alarm_Wrapper.Visible = true;

                lbl_Alarm.Text = "تاریخ تولد را انتخاب نمایید";
                return;
            }

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
            //dt_User = da_User.Users_Tra("insert", 0, ,, , ,, , new DateTime?(time), , ,, , , 0, , 0, 5, ref getid);

            dt = da_User.GetUsers_Tra_DT("insert", 0, TextBox_uid.Text, TextBox_Pass.Text, TextBox_Name.Text, TextBox_Famil.Text, TextBox_Father.Text, sex, time, TextBox_Website.Text,
TextBox_Email.Text, TextBox_Tel.Text, TextBox_Address.Text, /*TextBox_Description.Text*/ "", 0, introid, 0, 5);



            if (dt_User.Any(c => c.Email == TextBox_Email.Text))
            {
                lbl_Alarm.Text = "این پست الکترونیک در سایت فاسکو موجود میباشد . لطفا پست الکترونیک را امتحان نمائید";
                lbl_Alarm_Wrapper.Visible = true;
                return;
            }

            if(dt_User.Any(c => c.Uid == TextBox_uid.Text))
            {
                lbl_Alarm.Text = "این نام کاربری در سایت فاسکو موجود میباشد . لطفا نام کاربری دیگری را امتحان نمائید";
                lbl_Alarm_Wrapper.Visible = true;
                return;
            }

          var newUser =   dt_User.AddUsersRow(TextBox_uid.Text, TextBox_Pass.Text, TextBox_Name.Text, TextBox_Famil.Text, TextBox_Father.Text, sex, time, TextBox_Website.Text,
TextBox_Email.Text, TextBox_Tel.Text, TextBox_Address.Text, /*TextBox_Description.Text*/ "", 0, introid, DateTime.Now, DateTime.Now , 0, 0 , 0 , 0 , 0 , 5);

            dt_User.AcceptChanges();
            if(newUser["id"] != null)
            {
                string id = newUser["id"]?.ToString();
                string body = "<div align='center'>";
                body = body + "<table border='0' width='95%' dir='rtl' style='border-collapse: collapse'>";
                body = body + "<tr><td><span lang='fa'>کاربر گرامی جهت فعال سازی نام کاربری خود برروی لینک زیر کلیک نمائید.<br>&nbsp;</span></td></tr><tr>";
                body = body + "<td dir='ltr' align='center'>";
                body = body + "<a href='http://phasco.com/UserActive.aspx?Usecid=" + Secu(id) + "&modeactive=" + Secu("newuserregisterd") + "'>";
                body = body + "http://phasco.com/UserActive.aspx?Usecid=" + Secu(id) + "&amp;modeactive=" + Secu("newuserregisterd") + "</a></td></tr><tr><td><span lang='fa'>باتشکر</span></td></tr></table></div>";
                PMail.SendMail(TextBox_Email.Text, "Welcome to phasco website.", body);

                MultiView1.ActiveViewIndex = 1;
            }
           
          
           

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                SetYear();
                Set_Agreement();
                MultiView1.ActiveViewIndex = 0;
                lbl_Alarm_Wrapper.Visible = false;
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
            cmbYear.Items.Add(new ListItem { Text = "سال", Value = "-1" });

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
        //public static void SendMail(string mail, string Subject, string Body)
        //{
        //    string smtpServer = "mail.phasco.com";
        //    string userName = "technical@phasco.com";
        //    string password = "11004455";
        //    int cdoBasic = 1;
        //    int cdoSendUsingPort = 2;
        //    MailMessage msg = new MailMessage();
        //    if (userName.Length > 0)
        //    {
        //        msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", smtpServer);
        //        msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);
        //        msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", cdoSendUsingPort);
        //        msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", cdoBasic);
        //        msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", userName);
        //        msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", password);
        //    }
        //    msg.To = mail;
        //    msg.From = "technical@phasco.com";
        //    msg.Subject = Subject;
        //    msg.BodyFormat = MailFormat.Html;
        //    msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
        //    msg.Body = Body;
        //    SmtpMail.SmtpServer = smtpServer;
        //    SmtpMail.Send(msg);
        //}

        protected void LinkButton_IntoCheck_Click(object sender, EventArgs e)
        {
            check_Intro_Id();

        }

        void check_Intro_Id()
        {
            DataTable dt_user = da_User.GetUsers_Tra_DT("select_Uid_Intro", TextBox_IntriId.Text);
            if (dt_user.Rows.Count > 0)
            {
                Label_Intro_Alarm.Text = "کاربر معرف شما " + dt_user.Rows[0]["name"].ToString() + " می باشد.";
                HiddenField_Intro.Value = dt_user.Rows[0]["Id"].ToString();
            }
            else
            { Label_Intro_Alarm.Text = "چنین کاربری موجود نیست"; }
        }

        //public static String GenerateKey(Object sourceObject)
        //{
        //    String hashString = "";
        //    if (sourceObject == null)
        //    { throw new ArgumentNullException("Null as parameter is not allowed"); }
        //    else
        //    {
        //        try
        //        { hashString = ComputeHash(ObjectToByteArray(sourceObject)); return hashString; }
        //        catch (AmbiguousMatchException ame)
        //        { throw new ApplicationException("Could not definitly decide if object is serializable. Message:" + ame.Message); }
        //    }
        //}

        //private static string ComputeHash(byte[] objectAsBytes)
        //{
        //    MD5 md5 = new MD5CryptoServiceProvider();
        //    try
        //    {
        //        byte[] result = md5.ComputeHash(objectAsBytes);
        //        StringBuilder sb = new StringBuilder();
        //        for (int i = 0; i < result.Length; i++)
        //        { sb.Append(result[i].ToString("X2")); }
        //        return sb.ToString();
        //    }
        //    catch (ArgumentNullException ane) { Console.WriteLine("Hash has not been generated."); return null; }
        //}

        //private static byte[] ObjectToByteArray(Object objectToSerialize)
        //{
        //    MemoryStream fs = new MemoryStream();
        //    BinaryFormatter formatter = new BinaryFormatter();
        //    try
        //    {
        //        lock (locker)
        //        { formatter.Serialize(fs, objectToSerialize); }
        //        return fs.ToArray();
        //    }
        //    catch (SerializationException se) { Console.WriteLine("Error occured during serialization. Message: " + se.Message); return null; }
        //    finally { fs.Close(); }
        //}
    }
}
