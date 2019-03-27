using System.Web;
using System.Net.Mail;
namespace BusinessAccessLayer
{
    public class PMail
    {
		string Port_ = "185.211.56.52";

        public static bool Wall_Mail(string Emailaddress, string Uidsender, string url, string comment)
        {

			try
			{
				string Body_ = "<div style='font-family:Tahoma;font-size:12px;text-align:right;direction:rtl'><p>کاربر " + Uidsender + " رو&#1740; د&#1740;وار شما مطلب&#1740; &nbsp;نوشته است:</p>";
				Body_ = Body_ + "<br/>'" + comment + "'<p><a href='" + url + "'>" + url + "</a><br>&nbsp;</p><p><a href='http://www.phasco.com'>سا&#1740;ت جامع علوم آزمايشگاه&#1740; فاسکو</a></p></div>";
				SmtpClient client = new SmtpClient();

				string userName = "info@phasco.com";
				MailMessage msg = new MailMessage(userName, Emailaddress, "Phasco Wall " + Uidsender, Body_);
				msg.IsBodyHtml = true;
				msg.BodyEncoding = System.Text.Encoding.UTF8;

				msg.Body = Body_;
				msg.SubjectEncoding = System.Text.Encoding.UTF8;

				client.UseDefaultCredentials = false;
				client.Host = "185.211.56.52";
				client.Port = 21;
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.EnableSsl = false;
				client.Credentials = new System.Net.NetworkCredential("info@phasco.com", "1qaz!QAZ");
				client.Send(msg);
			}
			catch
			{
			}
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
			try
			{
				//char[] delimiterChars = { '-' };
				//string title = words[2];
				char[] delimiterChars = { '?' };
				string[] words = URL.Split(delimiterChars);

				string title = words[1].Replace("-", " ");
				string Body_ = "<div style='font-family:Tahoma;font-size:12px;text-align:right;direction:rtl'>یکی از دوستانتان شما را به دیدن این صفحه دعوت کرده<p>";
				Body_ = Body_ + "<a href='" + URL + "'>" + title + "</a><br>&nbsp;</p>";
				Body_ = Body_ + "<p><a href='http://www.phasco.com'>&#1587;&#1575;&#1740;&#1578; &#1580;&#1575;&#1605;&#1593; &#1593;&#1604;&#1608;&#1605; &#1570;&#1586;&#1605;&#1575;&#1610;&#1588;&#1711;&#1575;&#1607;&#1740; &#1601;&#1575;&#1587;&#1705;&#1608;</a></p></div>";
				string userName = "info@phasco.com";


				MailMessage msg = new MailMessage(userName, Emailaddress, "Phasco  " + title, Body_);
				msg.IsBodyHtml = true;
				msg.BodyEncoding = System.Text.Encoding.UTF8;

				msg.Body = Body_;
				msg.SubjectEncoding = System.Text.Encoding.UTF8;
				SmtpClient client = new SmtpClient();

				client.UseDefaultCredentials = false;
				client.Host = "185.211.56.52";
				client.Port = 21;
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.EnableSsl = false;
				client.Credentials = new System.Net.NetworkCredential("info@phasco.com", "1qaz!QAZ");
				client.Send(msg);
			}

			catch
			{
			}
			return true;
        }

        public static bool SendMail(string mail, string Subject, string Body)
        {
			//try
			//{
			string userName = "info@phasco.com";
				MailMessage msg = new MailMessage(userName, mail, Subject, Body);
				msg.IsBodyHtml = true;
				msg.BodyEncoding = System.Text.Encoding.UTF8;
				SmtpClient client = new SmtpClient();

				msg.SubjectEncoding = System.Text.Encoding.UTF8;

				//client.Port = 21;
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.UseDefaultCredentials = false;
				client.Host = "mail.phasco.com";
				client.Port = 587;
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.EnableSsl = true;
				client.Credentials = new System.Net.NetworkCredential("phasco@admin", "n%D8Aq?");
			client.EnableSsl = false;
				client.Send(msg);
			//}
			//catch
			//{
			//}

			return true;
		}

        public static bool SendMailNotification(string mail, string Subject, string url, string title, string NotiTypeMessage)
        {

			try
			{
				string userName = "info@phasco.com";
				string Body_ = "<p style='direction: rtl;	font-family: Tahoma;'>" + NotiTypeMessage + "</p>";
				Body_ = Body_ + "<p style='direction: rtl;	font-family: Tahoma;'>برای مشاهده بر روی لینک زیر کلیک نمائید :</p><br/>";
				Body_ = Body_ + "<p style='direction: rtl;	font-family: Tahoma;'>" + title + "</br>" + url;
				Body_ = Body_ + "</p><hr/>";
				Body_ = Body_ + "<p style='direction: rtl;	font-family: Tahoma;background:silver;padding:10px;'>سایت جامع علوم آزمایشگاهی و پزشکی فاسکو</p>";

				MailMessage msg = new MailMessage(userName, mail, "Phasco  " + title, Body_);
				msg.IsBodyHtml = true;
				msg.BodyEncoding = System.Text.Encoding.UTF8;

				msg.SubjectEncoding = System.Text.Encoding.UTF8;
				SmtpClient client = new SmtpClient();

				client.UseDefaultCredentials = false;
				client.Host = "185.211.56.52";
				client.Port = 587;
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.EnableSsl = false;
				client.Credentials = new System.Net.NetworkCredential("info@phasco.com", "1qaz!QAZ");
				client.Send(msg);
			}
			catch
			{
			}
			return true;
        }


        // bazar *********************************************888
        public static void Send_Mail(string Subject, string email, string body)
        {
			try
			{
				string userName = "info@phasco.com";
				MailMessage msg = new MailMessage(userName, email, "Phasco  " + Subject, body);
				msg.IsBodyHtml = true;
				msg.BodyEncoding = System.Text.Encoding.UTF8;

				msg.SubjectEncoding = System.Text.Encoding.UTF8;
				SmtpClient client = new SmtpClient();

				client.Port = 21;
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.UseDefaultCredentials = false;
				client.Host = "185.211.56.52";
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.EnableSsl = false;
				client.Credentials = new System.Net.NetworkCredential("info@phasco.com", "1qaz!QAZ");
				client.Send(msg);
			}
			catch
			{
			}

		}


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
