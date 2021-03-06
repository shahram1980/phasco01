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
using phasco.BaseClass;
using phasco_webproject.BaseClass;
using PHASCO_WEB.DAL;

namespace phasco_webproject.UI
{
    public partial class SendMss : UnSecureForm
    {
        #region SetPage
        public override string FormTitle
        { get { return "ارسال پيام"; } }

        public override MasterPageColection MasterPageName
        { get { return MasterPageColection.Phasco01; } }
        #endregion

        #region dataset
        DS_MainPhasco.UsersDataTable dt_User = new DS_MainPhasco.UsersDataTable();
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da_User = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Tbl_MessageTableAdapter da_mss = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Tbl_MessageTableAdapter();
        DS_MainPhasco.UsersDataTable dt_mss = new DS_MainPhasco.UsersDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User_Online_Valid()) Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                Label_Sender_Name.Text = UserOnline.name();
                try
                {
                    if (Request.QueryString["id"].ToString() != "")
                    {
                        dt_User = da_User.Select_Id(Convert.ToInt32(Request.QueryString["id"].ToString()));
                        if (dt_User.Rows.Count > 0)
                        {
                            TextBox_ReciverUId.Text = dt_User[0].Uid;
                            TextBox_Recivername.Text = dt_User[0].Name + " " + dt_User[0].Famil;
                        }
                    }
                }
                catch (Exception) { }
            };
        }

        protected void LinkButton_CheckId_Click(object sender, EventArgs e)
        {
            if (TextBox_ReciverUId.Text == "") { Label_Alarm.Text = "نام کاربری را وارد کنید"; return; }
            if (TextBox_ReciverUId.Text == UserOnline.Uid()) { TextBox_Recivername.Text = ""; Label_Alarm.Text = "برای خود می خواهید پیام ارسال کنید !!!"; return; }
            dt_User = da_User.select_uid(TextBox_ReciverUId.Text);
            if (dt_User.Rows.Count <= 0) { Label_Alarm.Text = "چنین کاربری موجود نمی باشد"; TextBox_Recivername.Text = ""; return; }
            Label_Alarm.Text = "";

            TextBox_Recivername.Text = dt_User[0].Name + " " + dt_User[0].Famil;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox_ReciverUId.Text == "") { ShowMessage("نام کاربری را وارد کنید", phasco_webproject.BaseClass.Enum.MessageType.Error); Label_Alarm.Text = "نام کاربری را وارد کنید"; return; }
            if (TextBox_ReciverUId.Text == UserOnline.Uid()) { ShowMessage("برای خود می خواهید پیام ارسال کنید !!!", phasco_webproject.BaseClass.Enum.MessageType.Error); Label_Alarm.Text = "برای خود می خواهید پیام ارسال کنید !!!"; return; }
            dt_User = da_User.select_uid(TextBox_ReciverUId.Text);
            if (dt_User.Rows.Count <= 0) { ShowMessage("چنین کاربری موجود نمی باشد", phasco_webproject.BaseClass.Enum.MessageType.Error); Label_Alarm.Text = "چنین کاربری موجود نمی باشد"; return; }
            Label_Alarm.Text = "";
            HiddenField_Id.Value = dt_User[0].Id.ToString();
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
                da_mss.Message_Tra(null, "send", Convert.ToInt32(HiddenField_Id.Value.ToString()), UserOnline.id(),
                                   2, TextBox_Title.Text, RadEditor1.Html, 0, filename, outbox);
                ShowMessage("پيام با موفقيت ارسال شد.", phasco_webproject.BaseClass.Enum.MessageType.FinalAction);
            }
            catch (Exception)
            { ShowMessage("بروز خطا هنگام اجرا", phasco_webproject.BaseClass.Enum.MessageType.Error); }

        }
    }
}