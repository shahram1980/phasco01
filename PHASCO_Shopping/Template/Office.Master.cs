using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Membership_Manage;
using PHASCO_Shopping.Component;
using PHASCO_Shopping.BLL;

namespace PHASCO_Shopping.Template
{
    public partial class Office1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid()) { Response.Redirect("~\\Default.aspx"); }
            if (!IsPostBack)
            {
                css.Href = SetPageCSS.Stylepage(Page.Culture.ToString());
                Page.Title = ":: " + UserOnline.name() + "  Welcome to your PHASCO B2B Office";
                Set_New_Inq();
            }
        }


        void Set_New_Inq()
        {
            TBL_inquire da = new TBL_inquire();
            int id = UserOnline.id();
            string count = da.TBL_inquire_Tra(UserOnline.id(), "inq_Count").Rows[0][0].ToString();
            if (count != "0")
            {
                Label_inquiry.Text = "<b>  (" + count + ")</b>";
                Label_inquiry.Visible = true;
            }
            else Label_inquiry.Visible = false;
        }
    }
}