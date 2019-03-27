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
using phasco_webproject.BaseClass;
using System.Text.RegularExpressions;
using phasco.BaseClass;
using Membership_Manage;
using DAL;
using DataAccessLayer;


namespace PHASCO_WEB.Template.UI
{
    public partial class Top : System.Web.UI.UserControl
    {
        Tbl_Message mss = new Tbl_Message();
        Users_Action_Log da_Log = new Users_Action_Log();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (UserOnline.User_Online_Valid())
            {
                MenuLogin.Visible = A2.Visible = false;
                MenuAccount.Visible = A3.Visible = true;
            }
            else
            {
                MenuLogin.Visible = A2.Visible = true;
                MenuAccount.Visible = A3.Visible = false;
            }

            if (!IsPostBack)
            {

                Set_Online(); Inser_Action_Log();

            }


        }

        protected void Inser_Action_Log()
        {
            if (UserOnline.User_Online_Valid())
            {
                string UrlReferrer_ = "";
                try { UrlReferrer_ = Page.Request.UrlReferrer.ToString(); }
                catch (Exception) { }

                string Url_ = "";
                try { Url_ = HttpContext.Current.Request.Url.AbsoluteUri; }
                catch (Exception) { throw; }
                da_Log.Users_Action_Log_SP(1, 0, UserOnline.id(), UrlReferrer_, Url_);
            }
        }

        protected void Set_Online()
        {
            if (UserOnline.User_Online_Valid())
            {
                UserOnline_Panle.Visible = true;
                Label_Name.Text = UserOnline.name();
                Label_Point.Text = UserOnline.Point();
                Label_phasny.Text = UserOnline.Credit();
                DataTable dt = mss.Message_Tra("select_count", 0, UserOnline.id(), 0, 0, "", "", 0, "", 0);
                if (dt.Rows.Count > 0)
                { HyperLink_MailNumber.Text = "(" + dt.Rows[0][0].ToString() + ")"; HyperLink_MailNumber.Visible = true; }
                else
                    HyperLink_MailNumber.Visible = false;
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(DateTime.Now);
            }
            else
                UserOnline_Panle.Visible = false;
        }


        protected void LinkButton_Logof_Click(object sender, EventArgs e)
        {
            UserOnline.Set_Logout();
            Response.Redirect("default.aspx");
        }


    }
}