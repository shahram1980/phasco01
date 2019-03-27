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

namespace PHASCO_Shopping.Component
{
    public class Mailer
    {
        public static bool  Send_Mail(string Subject, string email, string body)
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
            msg.From = "PHASCO .";
            msg.Subject = Subject;
            msg.BodyFormat = MailFormat.Html;
            msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
            msg.Body = body;
            SmtpMail.SmtpServer = smtpServer;
            SmtpMail.Send(msg);

            return true;
        }
    }
}
