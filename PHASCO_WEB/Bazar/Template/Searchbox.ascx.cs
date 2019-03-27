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

namespace BiztBiz.Template
{
    public partial class Searchbox : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (TXT_Find.Value != "")
                if (TXT_Find.Value.Length < 200)
                    Response.Redirect("~\\S_p.aspx?w=" + TXT_Find.Value);
        }
    }
}