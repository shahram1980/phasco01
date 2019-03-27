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
namespace PHASCO_WEB.BaseClass
{
    public class PMail
    {

        public static bool Wall_Mail(string Emailaddress, string Uidsender, string url, string comment)
        {
            string Body_ = "<div style='font-family:Tahoma;font-size:12px;text-align:right;direction:rtl'><p>کاربر " + Uidsender + " رو&#1740; د&#1740;وار شما مطلب&#1740; &nbsp;نوشته است:</p>";
            Body_ = Body_ + "<br/>'" + comment + "'<p><a href='" + url + "'>" + url + "</a><br>&nbsp;</p><p><a href='http://www.phasco.com'>سا&#1740;ت جامع علوم آزمايشگاه&#1740; فاسکو</a></p></div>";

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
            msg.To = Emailaddress;
            msg.From = "technical@phasco.com";
            msg.Subject = "Phasco Wall " + Uidsender;
            msg.BodyFormat = MailFormat.Html;
            msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
            msg.Body = Body_;
            SmtpMail.SmtpServer = smtpServer;
            SmtpMail.Send(msg);
            return true;
        }

        public static string Wall_Mail1(string Emailaddress, string Uidsender, string url, string comment)
        {
            string Body_ = Emailaddress + "<div style='font-family:Tahoma;font-size:12px;text-align:right;direction:rtl'><p>کاربر " + Uidsender + " رو&#1740; د&#1740;وار شما مطلب&#1740; &nbsp;نوشته است:</p>";
            Body_ = Body_ + "<br/>'" + comment + "'<p><a href='" + url + "'>" + url + "</a><br>&nbsp;</p><p><a href='http://www.phasco.com'>سا&#1740;ت جامع علوم آزمايشگاه&#1740; فاسکو</a></p></div>";
            return Body_;
        }

        public static bool MailUrlToFRN(string Emailaddress, string URL, string Subject)
        {
            char[] delimiterChars = { '-' };
            string[] words = URL.Split(delimiterChars);
            string title = words[2];

            string Body_ = "<div style='font-family:Tahoma;font-size:12px;text-align:right;direction:rtl'>یکی از دوستانتان شما را به دیدن این صفحه دعوت کرده<p>";
            Body_ = Body_ + "<a href='" + URL + "'>" + title + "</a><br>&nbsp;</p>";
            Body_ = Body_ + "<p><a href='http://www.phasco.com'>&#1587;&#1575;&#1740;&#1578; &#1580;&#1575;&#1605;&#1593; &#1593;&#1604;&#1608;&#1605; &#1570;&#1586;&#1605;&#1575;&#1610;&#1588;&#1711;&#1575;&#1607;&#1740; &#1601;&#1575;&#1587;&#1705;&#1608;</a></p></div>";
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
            msg.To = Emailaddress;
            msg.From = "technical@phasco.com";
            msg.Subject = "Phasco  " + title;
            msg.BodyFormat = MailFormat.Html;
            msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
            msg.Body = Body_;
            SmtpMail.SmtpServer = smtpServer;
            SmtpMail.Send(msg);

            return true;
        }
    }
}
