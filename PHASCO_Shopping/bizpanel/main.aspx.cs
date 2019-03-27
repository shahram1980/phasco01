using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PHASCO_Shopping.BLL;

namespace PHASCO_Shopping.bizpanel
{
    public partial class main : System.Web.UI.Page
    {
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
    }
}
