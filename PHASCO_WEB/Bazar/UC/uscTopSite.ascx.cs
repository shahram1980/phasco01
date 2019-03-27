using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Membership_Manage;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscTopSite : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.IO.Path.GetFileName(Request.Path) == "RegisterComplate.aspx")
                return;
            //if (UserOnline.User_Online_Valid())
            //{
            //    pnlLogin.Visible = false;
            //    userPanel.Visible = true;
            //    userregister.Visible = false;
            //    lblUserInfo.Text = UserOnline.Given_Name() + " " + UserOnline.Family_Name() + " عزیز خوش آمدید ";
            //}
            //else
            //{
            //   pnlLogin.Visible = true;
            //    userPanel.Visible = false;
            //    userregister.Visible = true; 
            //}
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            UserOnline.Set_User_Logout();
            //Users.Set_User_SignOut();
            Response.Redirect("~/Default.aspx", true);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //if (UserOnline.CheckLogin2(txtUserName.Text.ToString(), txtPassword.Text.ToString()))
            //{
            //    Response.Write(">:T" );
            //}
            //else Response.Write(">:f");

            //if (Users.CheckLogin(txtUserName.Text, txtPassword.Text, false))
            //{
            //    Response.Redirect("\\MyBiztBiz");
            //}
            //else
            //{
            //    ClientScriptManager script = Page.ClientScript;
            //    //txtName.Text = "Welcome to AspAlliance!!!";
            //    if (!script.IsStartupScriptRegistered(this.GetType(), "Alert"))
            //    {
            //        script.RegisterStartupScript(this.GetType(), "Alert",
            //        "<script type=text/javascript>alert('نام کاربری یا رمز عبور اشتباه می باشد')</script>");
            //        txtUserName.Text = string.Empty;
            //        txtPassword.Text = string.Empty;
            //    }
            //    Response.Redirect("Login.aspx?Status=InvalidUserPass", true);
            //}
        }
    }
}