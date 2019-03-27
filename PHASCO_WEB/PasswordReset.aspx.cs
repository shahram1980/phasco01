using DataAccessLayer;
using PHASCO_WEB.Template;
using System;
using System.Data;
using System.Web.Mail;
using System.Web.UI.WebControls;
using BusinessAccessLayer;

namespace PHASCO_WEB
{
    public partial class PasswordReset : System.Web.UI.Page
    {
        User da_User = new User();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            Random randNum = new Random((int)DateTime.Now.Ticks);
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;

            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }
            return new string(chars);
        }
        protected void Button_Send_Pass_Command(object sender, CommandEventArgs e)
        {
            int? id = 0;
            string pass = CreateRandomPassword(5);
            //DS_MainPhasco.UsersDataTable ds_Login = new DS_MainPhasco.UsersDataTable();
            //PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da_Login = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();
            //ds_Login = da_Login.Users_Tra("Forg_Email", null, null, pass, null, null, null, null, null, null,TextBox_Email_Forgot.Text.ToString(), null, null, null, null, null, null, null, ref id);
            dt = da_User.GetUsers_Tra_DT("Forg_Email", 0, "", pass, "", "", "", 0, DateTime.Now, "", TextBox_Email_Forgot.Text.ToString(), "", "", "", 0, 0, 0, 0);
            if (dt.Rows.Count <= 0)
            {
                (this.Page.Master as Master_Phasco).PageMessageType = Master_Phasco.QLPageMessageType.Error;
                (this.Page.Master as Master_Phasco).AddCustomMessage("این آدرس ایمیل یافت نشد", "");
            }
            else
            {
                //try
                //{
                    string Body_ = "<table border='0' width='100%' id='table1' style='border-collapse: collapse'><tr><td>Here are your required user name and password :</td></tr>";
                    Body_ = Body_ + "<tr><td>User name : " + dt.Rows[0]["Uid"].ToString() + "</td></tr>";
                    Body_ = Body_ + "<tr><td>Password : " + pass + "</td></tr>";
                    Body_ = Body_ + "<tr><td>&nbsp;<p>Best regards.<br>PHASCO technical manager</p><p><a href='http://www.phasco.com'>www.phasco.com</a></td></tr></table>";


				PMail.SendMail(dt.Rows[0]["Email"].ToString(), "Your Username and Password in PHASCO.", Body_);

					//string smtpServer = "185.211.56.52";
     //               string userName = "info@phasco.com";
     //               string password = "1qaz!QAZ";
     //               int cdoBasic = 1;
     //               int cdoSendUsingPort = 21;
     //               MailMessage msg = new MailMessage();
     //               if (userName.Length > 0)
     //               {
     //                   msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", smtpServer);
     //                   msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);
     //                   msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", cdoSendUsingPort);
     //                   msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", cdoBasic);
     //                   msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", userName);
     //                   msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", password);
     //               }
     //               msg.To = TextBox_Email_Forgot.Text.ToString();
     //               msg.From = "info@phasco.com";
     //               msg.Subject = "Your Username and Password in PHASCO.";
     //               msg.BodyFormat = MailFormat.Html;
     //               msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
     //               msg.Body = Body_;
     //               SmtpMail.SmtpServer = smtpServer;
     //               SmtpMail.Send(msg);

                    (this.Page.Master as Master_Phasco).PageMessageType = Master_Phasco.QLPageMessageType.Ok;
                    (this.Page.Master as Master_Phasco).AddCustomMessage("مشخصات کاربری شما با موفقیت ایمیل شد", "");
                //}
                //catch (Exception) { }
            }

        }
        protected void Button_Send_Pass_Click(object sender, EventArgs e)
        {

        }

    }
}