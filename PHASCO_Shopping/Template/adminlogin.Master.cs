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
    public partial class adminlogin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 

                if (Page.Culture.ToString() == "English (United States)")
                    css.Href = "../css/main.css";
                if (Page.Culture.ToString() == "Persian (Iran)")
                    css.Href = "../css/mainfa.css";



            }
        }
    }
}
