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

namespace PHASCO_Shopping.Template
{
    public partial class admin : System.Web.UI.MasterPage
    {
        //    protected override void Render(System.Web.UI.HtmlTextWriter writer)
        //    {

        //    }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //try
                //{
                //    if (HttpContext.Current.Request.Cookies["Admin_Login"]["Admin_OnlineValid"].ToString() != "True1")
                //    { Response.Redirect("default.aspx"); }
                //}
                //catch (Exception)
                //{ Response.Redirect("default.aspx"); }


                if (Page.Culture.ToString() == "English (United States)")
                    css.Href = "../css/main.css";
                if (Page.Culture.ToString() == "Persian (Iran)")
                    css.Href = "../css/mainfa.css";



            }
        }
    }
}
