using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewFifa.Admin.VideoManage
{
    public partial class VideoPlayer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
       System.Web.UI.HtmlControls.HtmlGenericControl Span = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            string filename = Request.QueryString["filename"].ToString();
            string photo = "phascoupfile/Video/thumbnail/Small/" + Request.QueryString["img"].ToString();
            Page.Title = Request.QueryString["f"].ToString();
            Span.Attributes.Add("style", "z-index: 80");
            string InnerHtml_ = "<video src=\"/phascoupfile/Video/file/" + filename + "\"  height=\"270\"  id=\"container\" poster=\"" + photo + "\" width=\"480\"> </video>";
            InnerHtml_ = InnerHtml_ + "<script type=\"text/javascript\">jwplayer(\"container\").setup({flashplayer: \"/jwplayer/player.swf\"});</script>";
            Span.InnerHtml = InnerHtml_;

            PlaceHolder1.Controls.Add(Span);
            }
            catch (Exception)
            {

                Response.Write("مشکل در اجرا فایل پیدا نشد");
            }
     
        } 
    }
}