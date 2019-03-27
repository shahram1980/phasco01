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
using System.Globalization;
using System.Threading;
using phasco_webproject.BaseClass;
using Membership_Manage;

namespace phasco_webproject
{
    public partial class addtocard : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string lang = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = lang;
                    Response.Cookies.Add(cookie);
                    Page.Culture = lang;
                    Page.UICulture = lang;
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id_ = 0;
            try
            {
                Id_ = Convert.ToInt32(Request.QueryString["pid"]);
                int User_Id = UserOnline.id();
                Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", 1, User_Id);
                Set_Back_Url();
            }
            catch (Exception)
            {
                Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", 1, 1);
                Set_Back_Url();
            }
        }
        protected void Set_Back_Url()
        {
            string urlBack = "";
            if (Request.QueryString["nId"] != null)
                if (Request.QueryString["nId"] != "")
                    if (Request.QueryString["nId"] == "fin") urlBack = "Default.aspx";
                    else urlBack = "ProductList.aspx?id=" + Convert.ToString(Request.QueryString["nId"]);
                else if (Request.QueryString["rid"] != null) urlBack = "ProductDetail.aspx?id=" + Convert.ToString(Request.QueryString["rid"]);
            Response.Redirect(urlBack);
        }
    }
}
