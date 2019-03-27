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
using System.Threading;
using System.Globalization;
using PHASCO_WEB.DAL;

namespace phasco_webproject.ExternalHome
{
    public partial class External_News : System.Web.UI.Page
    {
        //protected override void InitializeCulture()
        //{
        //    try
        //    {
        //        if (Request.QueryString["mLang"] != null)
        //        {
        //            string lang = Convert.ToString(Request.QueryString["mLang"]);
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
        //            HttpCookie cookie = new HttpCookie("elang");
        //            cookie.Value = lang;
        //            Response.Cookies.Add(cookie);
        //            Page.Culture = lang;
        //            Page.UICulture = lang;
        //            Response.Redirect("Default.aspx");
        //        }
        //        else
        //        {
        //            HttpCookie cookie_get = Request.Cookies["elang"];
        //            string Lang_SEt = cookie_get.Value.ToString();
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
        //            Page.Culture = Lang_SEt;
        //            Page.UICulture = Lang_SEt;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        Page.Culture = "fa-ir";
        //        Page.UICulture = "fa-ir";
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            Bind_News();
        }
        void Bind_News()
        { 
            int? id_=0;
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter();
            DS_MainPhasco.NewsDataTable dt = new DS_MainPhasco.NewsDataTable();
            dt = da.News_Insert_Edit(0, null, null, "Select_5", null, Page.Culture.ToString(), null, null, null, ref id_);
            Repeater_News.DataSource = dt;
            Repeater_News.DataBind();
        }
    }
}
