using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;

namespace phasco_webproject.Template
{
    public partial class Phasco03 : System.Web.UI.MasterPage
    {
        //protected override void Render(System.Web.UI.HtmlTextWriter writer)
        //{
        //    HtmlTextWriter swHtmlText = new HtmlTextWriter(new System.IO.StringWriter());
        //    base.Render(swHtmlText);
        //    string strHtml = swHtmlText.InnerWriter.ToString();
        //    strHtml = Regex.Replace(strHtml, "^\\s+<", " <", RegexOptions.Multiline);
        //    strHtml = Regex.Replace(strHtml, ">\\s+<", "> <", RegexOptions.Multiline);
        //    writer.Write(strHtml.Trim());
        //}
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
