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
using PHASCO_Shopping.Component;
using Membership_Manage;

namespace PHASCO_Shopping.Template
{
    public partial class listmaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!UserOnline.User_Online_Valid()) { Response.Redirect("Default.aspx"); }
                css.Href = SetPageCSS.Stylepage(Page.Culture.ToString());
            }
        }
    }
}
