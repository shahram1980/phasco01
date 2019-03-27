using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PHASCO_WEB.UI
{
    public partial class header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string HOSTNAME_ = HttpContext.Current.Request.ServerVariables["HTTP_HOST"].ToString().ToLower();
            if (HOSTNAME_== "phasco.com" ||HOSTNAME_== "www.phasco.com" ) Response.Redirect("http://www.phasco.com");

        }
    }
}