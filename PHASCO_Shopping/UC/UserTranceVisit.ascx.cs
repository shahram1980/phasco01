using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using Membership_Manage;

namespace PHASCO_Shopping.UC
{
    public partial class UserTranceVisit : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (UserOnline.User_Online_Valid())
                {
                    TBL_Trace_User da = new TBL_Trace_User();
                    int Pid = int.Parse(Request.QueryString["pid"].ToString());
                    da.TBL_Trace_User_SP(0, "insert", UserOnline.id(), Pid);
                }
        }
    }
}