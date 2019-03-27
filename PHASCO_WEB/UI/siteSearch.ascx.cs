using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace PHASCO_WEB.UI
{
    public partial class siteSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void _btnSearch_Click(Object sender, EventArgs e)
        {
            //if (!IsValid)
            //    return;

            Response.Redirect(
                String.Format(
                    "gs.aspx?q={0}&cx={1}&cof={2}",
                    HttpUtility.UrlEncode(SanitizeUserInput(q.Text.Trim())),
                    HttpUtility.UrlEncode(cx.Value),
                    HttpUtility.UrlEncode(cof.Value)
                    ),
                false
                );

            Context.ApplicationInstance.CompleteRequest();
        }

        private String SanitizeUserInput(String text)
        {
            if (String.IsNullOrEmpty(text))
                return String.Empty;

            String rxPattern = "<(?>\"[^\"]*\"|'[^']*'|[^'\">])*>";
            Regex rx = new Regex(rxPattern);
            String output = rx.Replace(text, String.Empty);

            return output;
        }
    }
}