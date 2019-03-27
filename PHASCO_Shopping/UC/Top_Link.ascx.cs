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

namespace PHASCO_Shopping.UC
{
    public partial class Top_Link : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User_Online_Valid()) Set_Office_Online(); else Set_Office_offline();
            if (UserOnline.User_Online_Valid())
            {
                HyperLink_Hoin_Now.Text = Resources.Resource.Sign_out;
                HyperLink_Hoin_Now.NavigateUrl = "~/logout.aspx";
                string ss = UserOnline.Uid();

                Panel_User_Offline.Visible = false; Panel_User_Online.Visible = true;
                HyperLink_Sign_in.Text = Resources.Resource.My_Office.ToString();
                HyperLink_Sign_in.NavigateUrl = "~/MyPHASCO_Shopping/Default.aspx";
            }
            else
            { Panel_User_Offline.Visible = true; Panel_User_Online.Visible = false; }
        }

        protected void Button_Signin_Click(object sender, EventArgs e)
        {
            if (UserOnline.CheckLogin2(TextBox_Uid.Text.ToString(), TextBox_Pass.Text.ToString()))
            { Response.Redirect(Request.UrlReferrer.ToString()); }
            else { LbL_Alarm.Text = Resources.Resource.Login_Msg_Invalid; }
        }
    }
}