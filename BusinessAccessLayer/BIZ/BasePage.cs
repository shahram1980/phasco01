using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Globalization;
using System.Web.UI.WebControls;
using BusinessAccessLayer;

namespace BusinessAccessLayer.BIZ
{
    public class BasePage : System.Web.UI.Page
    {

        private string staticSiteFolder;
        public string StaticSiteFolder
        {
            get { staticSiteFolder = ResolveUrl("~") + "Bazar/images"; return staticSiteFolder; }
        }

        private string variantSiteFolder;
        public string VariantSiteFolder
        {
            get { variantSiteFolder = ResolveUrl("~") + "Bazar/images" + MultiLanguage.GetCurrentDirection().ToString() + "/"; return variantSiteFolder; }
        }

        private string imgSiteFolder;
        public string ImgSiteFolder
        {
            get
            {
                imgSiteFolder = ResolveUrl("~") + "Bazar/images/site/";
                return imgSiteFolder;
            }
        }

        private string siteFolder;
        public string SiteFolder
        {
            get
            {
                siteFolder = ResolveUrl("~/Bazar");
                return siteFolder;
            }
        }


        protected override void InitializeCulture()
        {
            MultiLanguage.SetdefaultThemeANDCulture(this);
            //try
            //{
            //    if (Request.QueryString["mLang"] != null)
            //    {
            //        string name = Convert.ToString(Request.QueryString["mLang"]);
            //        Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
            //        HttpCookie cookie = new HttpCookie("elang");
            //        cookie.Value = name;
            //        Response.Cookies.Add(cookie);
            //        this.Page.Culture = name;
            //        this.Page.UICulture = name;
            //        Response.Redirect("Default.aspx");
            //    }
            //    else
            //    {
            //        HttpCookie cookie2 = Request.Cookies["elang"];
            //        string str2 = cookie2.Value.ToString();
            //        Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
            //        this.Page.Culture = str2;
            //        this.Page.UICulture = str2;
            //    }
            //}
            //catch (Exception)
            //{
            //    this.Page.Culture = "fa-IR";
            //    this.Page.UICulture = "fa-IR";
            //}
        }
    }

    public class BaseMasterPage : System.Web.UI.MasterPage
    {
   
        private string staticSiteFolder;
        public string StaticSiteFolder
        {
            get { staticSiteFolder = ResolveUrl("~") + "Bazar/images"; return staticSiteFolder; }
        }

        private string variantSiteFolder;
        public string VariantSiteFolder
        {
            get
            {
                variantSiteFolder = ResolveUrl("~") + "Bazar/images" +
                MultiLanguage.GetCurrentDirection().ToString() + "/"; return variantSiteFolder;
            }
        }

        private string imgSiteFolder;
        public string ImgSiteFolder
        {
            get
            {
                imgSiteFolder = ResolveUrl("~") + "Bazar/images/site/";
                return imgSiteFolder;
            }
        }

        private string siteFolder;
        public string SiteFolder
        {
            get
            {
                siteFolder = ResolveUrl("~/");
                return siteFolder;
            }
        }

        private string pageSiteFolder;
        public string PageSiteFolder
        {
            get
            {
                pageSiteFolder = ResolveUrl("~"); return pageSiteFolder;
            }
        }

        public void SetUser()
        {
            //if (Request.Cookies["Login"] != null)
            //{
            //    TimeSpan diffResult = DateTime.Now - Request.Cookies["Login"].Expires;
            //    if (diffResult.Minutes < 20)
            //    {
            //        HttpCookie UserLogin = new HttpCookie("Login");
            //        UserLogin.Expires = DateTime.Now.AddMinutes(30);
            //        Response.Cookies.Add(UserLogin);
            //    }
            //}
        }
    }

    public class BaseUserControl : System.Web.UI.UserControl
    {
        private string staticSiteFolder;
        public string StaticSiteFolder
        {
            get { staticSiteFolder = ResolveUrl("~") + "Bazar/images"; return staticSiteFolder; }
        }

        private string variantSiteFolder;
        public string VariantSiteFolder
        {
            get { variantSiteFolder = ResolveUrl("~") + "Bazar/images" + MultiLanguage.GetCurrentDirection().ToString() + "/"; return variantSiteFolder; }
        }

        private string pageSiteFolder;
        public string PageSiteFolder
        {
            get
            {
                pageSiteFolder = ResolveUrl("~"); return pageSiteFolder;
            }
        }

        private string imgSiteFolder;
        public string ImgSiteFolder
        {
            get
            {
                imgSiteFolder = ResolveUrl("~") + "Bazar/images/site/";
                return imgSiteFolder;
            }
        }

        private string siteFolder;
        public string SiteFolder
        {
            get
            {
                siteFolder = ResolveUrl("~/Bazar");
                return siteFolder;
            }
        }

        private string myRahbinaSiteFolder;
        public string MyRahbinaSiteFolder
        {
            get
            {
                myRahbinaSiteFolder = ResolveUrl("~") + "BiztBiz";
                return myRahbinaSiteFolder;
            }
        }
    }
}