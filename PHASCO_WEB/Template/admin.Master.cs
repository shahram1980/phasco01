using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using DataAccessLayer.Video;

namespace phasco.Template
{
    public partial class admin : System.Web.UI.MasterPage
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
            if (!IsPostBack) SetNewVideo();
            try
            {
                if (Session["Valid_admin"].ToString() != "true" || Session["uid"].ToString() == "")
                { Response.Redirect(@"~\Cpanel\Default.aspx"); }
            }
            catch (Exception)
            { Response.Redirect(@"~\Cpanel\Default.aspx"); }

        }

        void SetNewVideo()
        {
            tblVideo da_Video = new tblVideo();
            int count_ = int.Parse(da_Video.tblVideo_SP(21).Rows[0]["Count_"].ToString());
            if (count_ > 0)
                lbl_VideoNew.Text = @"(<a href='Video/VideoListEdit.aspx?Status=New'>" + count_.ToString() + "</a>)";
        }
    }
}
