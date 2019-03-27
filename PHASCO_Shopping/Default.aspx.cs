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
using System.Globalization;
using System.Threading;
using PHASCO_Shopping.BLL;

namespace PHASCO_Shopping
{
    public partial class _Default : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    this.Page.Culture = name;
                    this.Page.UICulture = name;
                    Response.Redirect(Request.UrlReferrer.ToString());
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    this.Page.Culture = str2;
                    this.Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Bind_News(); Bind_LastUserNews(); }
        }

        void Bind_News()
        {
            TBL_News da = new TBL_News();
            DataTable dt = da.News_Insert_Edit(0, "Select_title_5", "", "", "", Page.Culture.ToString(), "", 0, 0);
            Repeater_Top_News.DataSource = dt;
            Repeater_Top_News.DataBind();
            Bind_Product();
        }

        void Bind_Product()
        {
            Tbl_Products da = new Tbl_Products();
            Repeater_Featured_Product.DataSource = da.Tbl_Products_Tra(0, "Select_top15", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString());
            Repeater_Featured_Product.DataBind();
        }


        void Bind_LastUserNews()
        {
            TBL_User_News da_News = new TBL_User_News();
            Repeater_LastNews.DataSource = da_News.TBL_User_News_Tra("select_top30", 0);
            Repeater_LastNews.DataBind();
        }

 

    }
}
