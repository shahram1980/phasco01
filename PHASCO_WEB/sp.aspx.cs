using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;

namespace PHASCO_WEB
{
    public partial class sp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XmlWriter writer = XmlWriter.Create(Server.MapPath("GSiteMap.xml"));

            writer.WriteStartDocument();
            writer.WriteStartElement("urlset", "http://www.sitemaps.org/schemas/sitemap/0.9");

            WriteTag("1", "Daily", "http://localhost:12847/default.aspx", writer);
 

            writer.WriteEndDocument();

            writer.Close();

         //   Response.Redirect("GSiteMap.xml");

        }
        private void WriteTag(string Priority, string freq, string Navigation, XmlWriter MyWriter)
        {
            MyWriter.WriteStartElement("url");

            MyWriter.WriteStartElement("loc");
            MyWriter.WriteValue(Navigation);
            MyWriter.WriteEndElement();

            MyWriter.WriteStartElement("lastmod");
            MyWriter.WriteValue(DateTime.Now.ToShortDateString());
            MyWriter.WriteEndElement();

            MyWriter.WriteStartElement("changefreq");
            MyWriter.WriteValue(freq);
            MyWriter.WriteEndElement();

            MyWriter.WriteStartElement("priority");
            MyWriter.WriteValue(Priority);
            MyWriter.WriteEndElement();

            MyWriter.WriteEndElement();
        }
    }
}