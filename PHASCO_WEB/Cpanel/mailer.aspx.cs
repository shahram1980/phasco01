using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Mail;
using DataAccessLayer;
namespace PHASCO_WEB.Cpanel
{
    public partial class mailer : System.Web.UI.Page
    {
        User da = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = da.GetUsers_Tra_DT("select_count");
                Label_Count.Text = dt.Rows[0][0].ToString();
                FCKeditor_Body.Value = "<table border='1' width='100%' id='table1' style='border-collapse: collapse' bordercolor='#800000' dir='rtl'><tr><td bgcolor='#800000'><font face='Tahoma' color='#FFFFFF'>سایت جامع علوم آزمایشگاهی و پزشکی فاسکو</font></td></tr><tr><td><p>&nbsp;</td></tr><tr><td><p align='left'><a href='http://www.phasco.com'>Phasco.com</a></td></tr></table>";
            }
        }

        protected void Mail(string mail)
        {
            try
            {
                string Body_ = FCKeditor_Body.Value;
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
                msg.To = mail;
                msg.From = "technical@phasco.com";
                msg.Subject = TextBox_Title.Text;
                msg.BodyFormat = MailFormat.Html;
                msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
                msg.Body = Body_;
                SmtpMail.SmtpServer = smtpServer;
                SmtpMail.Send(msg);
                TextBox_Report.Text = TextBox_Report.Text + mail + " is sent . /n";
            }
            catch (Exception)
            { TextBox_Report.Text = TextBox_Report.Text + mail + " is Not sent ./n"; }
        }

        protected void Button_Send_Click1(object sender, EventArgs e)
        {
            DataTable dt = da.GetUsers_Tra_DT("select_cost", int.Parse(TextBox_Count.Text.ToString()));
            int RowPosition = 0;
            while (RowPosition != dt.Rows.Count)
            {
                //Response.Write(" ::  " + dt.Rows[RowPosition]["Email"].ToString() + " is sent<br/>");
                Mail(dt.Rows[RowPosition]["Email"].ToString());//"shahram1980@yahoo.com");
                RowPosition += 1;
            }
        }
    }
}
