using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscTopPanelMenu : System.Web.UI.UserControl
    {
        TBL_User_Biz da_User = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                set_properies();
        }

        void set_properies()
        {

            lblFullName.Text = UserOnline.Given_Name() + " " + UserOnline.Family_Name();

            int userID = UserOnline.id();
            DataTable dtUsers = da_User.TBL_User_Tra("selectById", userID);
            if (dtUsers.Rows.Count > 0)
            {
                lblRegisterDate.Text = QLink.Helpers.DateHelper.GregorianToJalaali(dtUsers.Rows[0]["DateIns"].ToString(), 3);
            }
        }
    }
}