using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Membership_Manage;

namespace PHASCO_Shopping
{
    public partial class logout1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserOnline.Set_User_Logout();
            Response.Redirect("Default.aspx");
        }
    }
}