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
using DataAccessLayer.BIZ;
using BiztBiz;
using BusinessAccessLayer;
using DataAccessLayer;
namespace PHASCO_WEB.Template.UI
{
    public partial class TopMenuBazar : System.Web.UI.UserControl
    {
        Tbl_Message mss = new Tbl_Message();
        Users_Action_Log da_Log = new Users_Action_Log();
        TBL_inquire da_Inquiry = new TBL_inquire();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Set_Online(); Inser_Action_Log(); SetLinkAndInq(); }


        }
        protected void SetLinkAndInq()
        {
            DataTable dtInquiry = da_Inquiry.TBL_inquire_Tra(UserOnline.id(), "SelectCountinquire");
            if (dtInquiry.Rows.Count > 0)
            {

                if (PHASCOUtility.ConverToNullableInt(dtInquiry.Rows[0]["Productinquire"].ToString()) > 0)
                {
                    lnkProductInquiry.Visible = true;
                    lnkProductInquiry.Text = dtInquiry.Rows[0]["Productinquire"].ToString() + " درخواست جدید! ";
                }
                else lnkProductInquiry.Visible = false;
                if (PHASCOUtility.ConverToNullableInt(dtInquiry.Rows[0]["Requestinquire"].ToString()) > 0)
                {
                    lnkRequestInquiry.Visible = true;
                    lnkRequestInquiry.Text = dtInquiry.Rows[0]["Requestinquire"].ToString() + " پاسخ جدید! ";
                }
                else lnkRequestInquiry.Visible = false;

                if (PHASCOUtility.ConverToNullableInt(dtInquiry.Rows[0]["Messageinquire"].ToString()) > 0)
                {
                    lnkMessageInquiry.Visible = true;
                    lnkMessageInquiry.Text = dtInquiry.Rows[0]["Messageinquire"].ToString() + " پاسخ جدید! ";
                }
                else lnkMessageInquiry.Visible = false;
              
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
                UserLogout.Visible = false;
                Label_Name.Text = UserOnline.name();
                Label_phasny.Text = UserOnline.Credit();
                DataTable dt = mss.Message_Tra("select_count", 0, UserOnline.id(), 0, 0, "", "", 0, "", 0);
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(DateTime.Now);
            }
            else
            {
                UserOnline_Panle.Visible = false;
                UserLogout.Visible = true;
                UserOnline_Panle.Visible = false;   
            }
        }


        protected void LinkButton_Logof_Click(object sender, EventArgs e)
        {
            UserOnline.Set_Logout();
            Response.Redirect("default.aspx");
        }
    }
}