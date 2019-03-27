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
using Membership_Manage;

namespace BiztBiz.UC
{
    public partial class Top_Link : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Users.UserValid())
            {
                HyperLink_Hoin_Now.Text = Resources.Resource.Sign_out;
                HyperLink_Hoin_Now.NavigateUrl = "~/logout.aspx";
                string ss = UserOnline.Uid();
                HyperLink_Sign_in.Text = Resources.Resource.My.ToString() + " " + UserOnline.Uid();
                HyperLink_Sign_in.NavigateUrl = "~/MyBiztBiz/Default.aspx";
            }
        }
    }
}