using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer.BIZ;

namespace BiztBiz.bizpanel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) Set_admin_SignOut(); }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            TBL_AdminUsers admin = new TBL_AdminUsers();
            if (admin.CheckLogin(txt_username.Text, txt_pass.Text) == true)
            {
                TBL_User_Biz dauser = new TBL_User_Biz();
                DataTable dt;
                dt = dauser.Check_login(6, txt_username.Text, txt_pass.Text);
                Set_admin_Online(dt);
                Response.Redirect("main.aspx");
            }
            else
                Response.Redirect("AccessDenied.aspx");
        }

        public static void Set_admin_Online(DataTable dt_)
        {
            HttpCookie ObjCookie2 = new HttpCookie("Admin_Login");
            ObjCookie2.Values["Admin_OnlineValid"] = "True1";
            ObjCookie2.Values["Admin_Id"] = dt_.Rows[0]["id"].ToString();
            ObjCookie2.Values["Admin_Username"] = dt_.Rows[0]["Username"].ToString();
            ObjCookie2.Values["Admin_Status"] = dt_.Rows[0]["Status"].ToString();

            
            ObjCookie2.Expires = DateTime.Now.AddDays(3);
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
        }

        public static void Set_admin_SignOut()
        {
            if (HttpContext.Current.Request.Cookies["Admin_Login"] != null)
            {
                HttpCookie UserLogin = new HttpCookie("Admin_Login");
                UserLogin.Expires = DateTime.Now.AddDays(-1d);
                HttpContext.Current.Response.Cookies.Add(UserLogin);
            }
        }
    }
}
