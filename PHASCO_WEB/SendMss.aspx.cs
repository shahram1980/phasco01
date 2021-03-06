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
using Membership_Manage;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB
{
    public partial class SendMss : System.Web.UI.Page
    {
        #region dataset
        User da_User = new User();
        DataTable dt = new DataTable();

        Tbl_Message da_mss = new Tbl_Message();
        #endregion
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid()) Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                Label_Sender_Name.Text = UserOnline.name();
                try
                {
                    if (Request.QueryString["id"].ToString() != "")
                    {
                        dt = da_User.GetUsers_Tra_DT("select_Item", Convert.ToInt32(Request.QueryString["id"].ToString()));
                        if (dt.Rows.Count > 0)
                        {
                            TextBox_ReciverUId.Text = dt.Rows[0]["Uid"].ToString();
                            TextBox_Recivername.Text = dt.Rows[0]["Name"] + " " + dt.Rows[0]["Famil"];
                        }
                    }
                }
                catch (Exception) { }
            };
        }

        protected void LinkButton_CheckId_Click(object sender, EventArgs e)
        {
            if (TextBox_ReciverUId.Text == "") { Label_Alarm.Text = "نام کاربری را وارد کنید"; return; }

            string reciversUid = TextBox_ReciverUId.Text;

            string[] words = reciversUid.Split(',');
            foreach (string uid in words)
            {
                //Console.WriteLine(uid);
                dt = da_User.GetUsers_Tra_DT("ref_Uid", uid);// TextBox_ReciverUId.Text);
                if (dt.Rows.Count <= 0)
                {
                    Label_Alarm.Text = "چنین کاربری موجود نمی باشد";
                    TextBox_Recivername.Text = "";
                    //return;
                }
                else
                {
                    Label_Alarm.Text = "";
                    TextBox_Recivername.Text = TextBox_Recivername.Text + "," + dt.Rows[0]["Name"] + " " + dt.Rows[0]["Famil"];
                }
            }
            if (TextBox_ReciverUId.Text == UserOnline.Uid())
            { TextBox_Recivername.Text = ""; Label_Alarm.Text = "برای خود می خواهید پیام ارسال کنید !!!"; return; }
            if (TextBox_ReciverUId.Text == "admin")
            { TextBox_Recivername.Text = "مدیریت سایت فاسکو"; return; }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            int modeMssg = 2;
            if (TextBox_ReciverUId.Text == "") { LBL_Alarm.Text = "نام کاربری را وارد کنید"; return; }
            if (TextBox_ReciverUId.Text == UserOnline.Uid()) { LBL_Alarm.Text = "برای خود می خواهید پیام ارسال کنید !!!"; return; }
            if (TextBox_ReciverUId.Text == "admin") { HiddenField_Id.Value = "0"; modeMssg = 1; }
            else
            {
                dt = da_User.GetUsers_Tra_DT("ref_Uid", TextBox_ReciverUId.Text);
                if (dt.Rows.Count <= 0) { Label_Alarm.Text = "چنین کاربری موجود نمی باشد"; return; }
                Label_Alarm.Text = "";
                HiddenField_Id.Value = dt.Rows[0]["Id"].ToString();
            }
            try
            {
                string filename = "none";
                if (FileUpload_Attach.HasFile)
                {
                    Random rand = new Random();
                    filename = rand.Next().ToString().PadLeft(4) + "per" + DateTime.Now.Ticks.ToString().Substring(10).ToString().PadLeft(4) + MyFileUploader.IsExtension(FileUpload_Attach);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Attach, "\\Pup\\MssAttach", filename, "*", "*", "*", this.Server);
                }
                int outbox = 0;
                if (CheckBox_Outbox.Checked) outbox = 1;

                da_mss.Message_Tra("send", 0, Convert.ToInt32(HiddenField_Id.Value.ToString()), UserOnline.id(), modeMssg, TextBox_Title.Text, FCKeditor1.Value, 0, filename, outbox);
                Label_Alarm.Text = "پيام با موفقيت ارسال شد.";
                #region Insert Notification
                // Insert Notification
                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                NotificationUsers.AddNewNotification(int.Parse(HiddenField_Id.Value), 0, 0, "http://www.phasco.com/UserMssg.aspx", 2, 11, 23, "");
                #endregion
            }
            catch (Exception)
            { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
    }
}
