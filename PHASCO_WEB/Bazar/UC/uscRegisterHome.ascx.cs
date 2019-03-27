using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Membership_Manage;

namespace BiztBiz.UC
{
    public partial class uscRegisterHome : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserOnline.User_Online_Valid())
            { TblLogin.Visible = Panel_Regifter.Visible = false; }
            else { TblLogin.Visible = Panel_Regifter.Visible = true; }
        }
    }
}