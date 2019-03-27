using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PHASCO_Shopping.Template
{
    public partial class MAin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Page.Culture.ToString() == "English (United States)")
                    css.Href = "../css/main.css";
                if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
                    css.Href = "../css/mainfa.css";
                if (Page.Culture.ToString() == "Chinese (People's Republic of China)")
                    css.Href = "../css/mainch.css";

            }
        }
    }
}