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
using BiztBiz.Component;
using System.Globalization;

using Membership_Manage;
using DataAccessLayer.BIZ;


namespace BiztBiz.Template
{
    public partial class Office : BaseMasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Is_Valid())
            {
                Response.Redirect("Default.aspx");
            }
            SetUser();
            if (!IsPostBack)
            {
                //css.Href = "../css/mainfa.css";
                //if (Page.Culture.ToString() == "English (United States)")
                //    css.Href = "../css/main.css";
                //if (Page.Culture.ToString() == "Persian (Iran)")
                //    css.Href = "../css/mainfa.css";
                //if (Page.Culture.ToString() == "Chinese (People's Republic of China)")
                //    css.Href = "../css/mainch.css";
                Page.Title = ":: " + UserOnline.Given_Name() + " " + UserOnline.Family_Name() + "  Welcome to your IranProBiz Office";
            }
            Set_New_Inq();
        }


        void Set_New_Inq()
        {
            TBL_inquire da = new TBL_inquire();
            int id = UserOnline.id();
            string count = da.TBL_inquire_Tra(UserOnline.id(), "inq_Count").Rows[0][0].ToString();

            if (count != "0")
            {
                //Label_inquiry.Text = "<b>  (" + count + ")</b>";
                //Label_inquiry.Visible = true;
            }
            //else Label_inquiry.Visible = false;
        }
    }
}
