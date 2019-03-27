using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;
using PHASCO_Shopping.BLL;
using System.Globalization;

namespace PHASCO_Shopping.News
{
    public partial class Default1 : System.Web.UI.Page
    {
        TBL_News da_news = new TBL_News();
        DataTable dt;
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
            if (!IsPostBack) Set_News();
        }

        void Set_News()
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
            dt = da_news.News_Insert_Edit(id, "SeLect_Item", "", "", "", "", "", 0, 0);

            Label_Title.Text = dt.Rows[0]["Title"].ToString();
            Label_News.Text = dt.Rows[0]["news"].ToString();

            if (dt.Rows[0]["news"].ToString() != "none.jpg") Image_News.ImageUrl = "~\\News\\images\\" + dt.Rows[0]["image"].ToString();
        }
    }
}