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
using System.Threading;
using System.Globalization;
using PHASCO_Shopping.BLL;

namespace BiztBiz
{
    public partial class Login : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    this.Page.Culture = name;
                    this.Page.UICulture = name;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    this.Page.Culture = str2;
                    this.Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["s"] != null)
                {
                    if (Request.QueryString["s"].ToString() == "forget")
                    { Panel_Fotget.Visible = true; }
                    else
                        Panel_Fotget.Visible = false;
                }else
                Panel_Fotget.Visible = false;
            }
            
        }

        protected void ImageButton_Login_Click(object sender, ImageClickEventArgs e)
        {
            if (Users.CheckLogin(TextBox_Uid.Text, TextBox_Pass.Text))
            { Response.Redirect("\\MyBiztBiz"); }
            else
                Response.Write("no");
        }

        protected void ImageButton_FORGET_Click(object sender, ImageClickEventArgs e)
        {
            TBL_User dauser = new TBL_User();
            DataTable dt;
            dt = dauser.TBL_User_Tra("selectFORGET", TextBox_FotgetUId.Text, "");
            if (dt.Rows.Count > 0)
            {


            }
            else { Lbl_Forget_Pass.Text = "چنین نام کاربری موجو نیست"; }

        }
    }
}
