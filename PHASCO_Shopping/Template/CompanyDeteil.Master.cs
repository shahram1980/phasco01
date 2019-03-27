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
using PHASCO_Shopping.BLL;
using PHASCO_Shopping.Component;
namespace PHASCO_Shopping.Template
{
    public partial class CompanyDeteil : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                css.Href = SetPageCSS.Stylepage(Page.Culture.ToString());
                Set_Url(); Bind_News(); Set_Page();
            }
        }
        void Set_Page()
        {
            if (Request.QueryString["pid"] != null)
            {
                try
                {
                    Tbl_Products da = new Tbl_Products();
                    DataTable dt;
                    int id = int.Parse(Request.QueryString["pid"].ToString());
                    dt = da.Tbl_Products_Tra(id, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString());
                    key_.Content = dt.Rows[0]["Produc_Name"].ToString() + "," + dt.Rows[0]["Product_Keywords"].ToString();
                    desc.Content = dt.Rows[0]["Description"].ToString();
                    Page.Title = "PHASCO B2B - " + dt.Rows[0]["Produc_Name"].ToString();
                    Label_Bookmark.Text = "<a href=\"javascript:bookmarksite('" + "PHASCO B2B - " + dt.Rows[0]["Produc_Name"].ToString() + "', '" + Request.Url.ToString() + "')\">" + Resources.Resource.Bookmark + "</a>";
                }
                catch (Exception)
                { }
            }
            else Label_Bookmark.Text = "<a href=\"javascript:bookmarksite('" + "Phasco B2B - ', '" + Request.Url.ToString() + "')\">" + Resources.Resource.Bookmark + "</a>";
        }
        void Set_Url()
        {
            try
            {
                string Uid = Request.QueryString["uid"].ToString();
                //Tbl_Products da = new Tbl_Products();
                //DataTable dt = da.Tbl_Products_Tra(id, "Select_uid_p", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");
                products.HRef = "../C-p/Products.aspx?uid=" + Uid;// dt.Rows[0][0].ToString();
                Home.HRef = "../C-p/Home.aspx?uid=" + Uid;// dt.Rows[0][0].ToString();
                // Why_Us.HRef = "../C-p/Whyus.aspx?uid=" + Uid;// dt.Rows[0][0].ToString();
                About_Us.HRef = "../C-p/About.aspx?uid=" + Uid;//dt.Rows[0][0].ToString();
                Fac.HRef = "../C-p/Factory.aspx?uid=" + Uid;// dt.Rows[0][0].ToString();
                Con.HRef = "../C-p/Contact.aspx?uid=" + Uid;

            }
            catch (Exception) { }
        }
        void Bind_News()
        {
            TBL_User_News da_News = new TBL_User_News();
            int id = int.Parse(Request.QueryString["uid"].ToString());
            DataTable dt = da_News.TBL_User_News_Tra("select_Uidtop10", id);
            Repeater_LastNews.DataSource = dt;
            Repeater_LastNews.DataBind();
        }
        protected void Button_Email_Click(object sender, EventArgs e)
        {
            try
            {
                string hr="<a href='" + Request.Url.ToString() + "'>" + Request.Url.ToString() + "</a>";
                SendMail(TextBox_email.Text, "BIZ PHASCO.", hr);
                TextBox_email.Text = "";
                Label_AlrmEmail.Text = Resources.Resource.inquiry_send_Mss;
            }
            catch (Exception) { Label_AlrmEmail.Text = "!"; }
        }
        public static void SendMail(string mail, string Subject, string Body)
        {
            string smtpServer = "mail.phasco.ir";
            string userName = "technical@phasco.ir";
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
            msg.From = "PHASCO.";
            msg.Subject = Subject;
            msg.BodyFormat = MailFormat.Html;
            msg.BodyEncoding = System.Text.UTF8Encoding.UTF8;
            msg.Body = Body;
            SmtpMail.SmtpServer = smtpServer;
            SmtpMail.Send(msg);
        }


    }
}
