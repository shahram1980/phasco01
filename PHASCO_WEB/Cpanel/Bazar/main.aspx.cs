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
    public partial class main : System.Web.UI.Page
    {
        TBL_AdminUsers adminUser = new TBL_AdminUsers();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (adminUser.UserValid() == true)
            //{
            //    DataTable dt = new DataTable();
            //    dt = adminUser.check_Page(6, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), this.Title, 0, null);
            //    if (dt.Rows.Count == 0)
            //        Response.Redirect("AccessDenied.aspx");
               
            //}
            //else
            //    Response.Redirect("AccessDenied.aspx");

        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Set_admin_SignOut();
            Response.Redirect("~/bizpanel/", true);
        }

        public static void Set_admin_SignOut()
        {
            HttpCookie ObjCookie2 = new HttpCookie("Admin_Login");
            ObjCookie2.Values["Admin_OnlineValid"] = "falase0";
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
            ObjCookie2.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
        }
    }
}
