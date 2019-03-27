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

namespace BiztBiz.Template
{
    public partial class listmaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                css.Href = "../css/mainfa.css";
                //if (Page.Culture.ToString() == "English (United States)")
                //    css.Href = "../css/main.css";
                //if (Page.Culture.ToString() == "Persian (Iran)")
                //    css.Href = "../css/mainfa.css";
                //if (Page.Culture.ToString() == "Chinese (People's Republic of China)")
                //    css.Href = "../css/mainch.css";
            }
        }
    }
}
