using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Mail;
using QLink.Helpers;

namespace BusinessAccessLayer
{
    public static class Mailer
    {
        public static void Send_Mail(string Subject, string email, string body)
        {

            string smtpServer = "mail.phasco.com";
            string userName = "technical@phasco.com";
            string password = "11004455";
            int cdoBasic = 1;
            int cdoSendUsingPort = 2;
            MailMessage msg = new MailMessage();
            if (userName.Length > 0)
            {
                msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", smtpServer);
                msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);
                msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", cdoSendUsingPort);
                msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", cdoBasic);
                msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", userName);
                msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", password);
            }
            msg.To = email;
            msg.From = "technical@phasco.com";
            msg.Subject = "PHASCO . "+Subject;
            msg.BodyFormat = MailFormat.Html;
            msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
            msg.Body = body;
            SmtpMail.SmtpServer = smtpServer;
            SmtpMail.Send(msg);

        }

        //public static void SendRegisterEmail(string email)
        //{
        //    string subject = "Confirm Email For Compalte Register In perisanweb.com";

        //    string body = "کاربر گرامی :  <br/>";
        //    body += "ثبت نام اولیه شما در سایت ایران پرو بیز با موفقیت انجام شد . برای تایید ثبت نام و تکمیل ثبت نام خود بر روی لینک زیر کلیک کنید. <br/><br/>";
        //    body += "<a href='http://biz.perisanweb.com/RegisterComplate.aspx?" + EncryptionHelper.Encrypt("ActiveCode", true) + "=" + EncryptionHelper.Encrypt(email, true) + "'>لینک تایید ثبت نام</a>";
        //    body += " <br/> <br/>";
        //    body += "اگر لینک بالا قابل نمایش یا کلیک نمی باشد لینک زیر را کپی کرده و در مرورگر خود کپی کنید .";
        //    body += " <br/> <br/>";
        //    body += "\"http://biz.perisanweb.com/RegisterComplate.aspx?" + EncryptionHelper.Encrypt("ActiveCode", true) + "=" + EncryptionHelper.Encrypt(email, true) + "\"";
        //    body += " <br/> <br/>";
        //    body += "با تشکر از شما <br/>";
        //    body += "مدیریت سایت ایران پرو بیز <br/>";
        //    Send_Mail(subject, email, body);
        //}

        //public static void SendConfirmEmail(string email)
        //{
        //    string subject = "Register Complate In perisanweb.com";

        //    string body = "کاربر گرامی :  <br/>";
        //    body += "ثبت نام شما در سایت ایران پرو بیز با موفقیت انجام شد . <br/><br/>";
        //    body += "برای استفاده از امکانات سایت شما می توانید با نام کاربری(ایمیل) و رمز عبور خود وارد سایت شوید. <br/><br/>";
        //    body += " <br/> <br/>";
        //    body += "با تشکر از شما <br/>";
        //    body += "مدیریت سایت ایران پرو بیز <br/>";
        //    Send_Mail(subject, email, body);
        //}

        public static void SendInviteEmail(string email)
        {
            string subject = "شما دعوت شده اید";
            string body = "<div style='font-family:Tahoma;direction:rtl'>دوست عزیز وقت به خیر. <br/>";
            body += "شما از طریق یکی از دوستان تان به بازدید از سایت  بازار   ";
            body += "تجهیزات و ملزومات آزمایشگاهی فاسکو دعوت شده اید.  <br/>";
            body += " با انگیزه تر و موفق تر باشید <br/>";
            body += "<a href='http://www.phasco.com/bazar'> http://www.phasco.com/bazar</a> <br/>";
            body += " <br/> <br/>";
            body += "مدیریت سایت تجهیزات و ملزومات فاسکو <br/></div>";
            Send_Mail(subject, email, body);
        }

        public static void SendInviteEmailForAllPhascoWebsite(string email)
        {
            string subject = "شما دعوت شده اید";
            string body = "<div style='font-family:Tahoma;direction:rtl'>دوست عزیز وقت به خیر. <br/>";
            body += "شما از طریق یکی از دوستان تان به بازدید از لینک زیر در سایت جامع علوم آزمایشگاهی و پزشکی فاسکو دعوت شده اید   ";
            body += " با انگیزه تر و موفق تر باشید <br/>";
            body += "<a href='" + HttpContext.Current.Request.Url.AbsoluteUri + "'>" + HttpContext.Current.Request.Url.AbsoluteUri + " <br/>";
            body += " <br/> <br/>";
            body += "مدیریت سایت فاسکو <br/></div>";
            Send_Mail(subject, email, body);
        }
    }
}
