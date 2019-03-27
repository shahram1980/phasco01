using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Membership_Manage;
using Membership_Manage.BIZ;

namespace BiztBiz.UC
{
    public partial class uscPanelMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lnkProfileView.NavigateUrl = "~/bazar/Home.aspx?CompanyID=" + UserOnline.CompanyID() + "&Level=2&SearchSection=3";
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Users.Set_User_SignOut();
            Response.Redirect("~/bazar/Default.aspx", true);
        }
    }
}