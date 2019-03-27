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

using System.Threading;
using System.Globalization;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.News
{
    public partial class Default : BasePage
    {
        TBL_News da_news = new TBL_News();
        DataTable dt;
        //protected override void InitializeCulture()
        //{
        //    try
        //    {
        //        if (Request.QueryString["mLang"] != null)
        //        {
        //            string name = Convert.ToString(Request.QueryString["mLang"]);
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
        //            HttpCookie cookie = new HttpCookie("elang");
        //            cookie.Value = name;
        //            Response.Cookies.Add(cookie);
        //            this.Page.Culture = name;
        //            this.Page.UICulture = name;
        //            Response.Redirect(Request.UrlReferrer.ToString());
        //        }
        //        else
        //        {
        //            HttpCookie cookie2 = Request.Cookies["elang"];
        //            string str2 = cookie2.Value.ToString();
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
        //            this.Page.Culture = str2;
        //            this.Page.UICulture = str2;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        this.Page.Culture = "fa-IR";
        //        this.Page.UICulture = "fa-IR";
        //    }
        //}


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Set_News();
        }

        void Set_News()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
            {
                int id = PHASCOUtility.ConverToNullableInt(Request.QueryString["id"]);
                dt = da_news.News_Insert_Edit(id, "SeLect_Item", "", "", "", "", "", 0, 0);
                if (dt.Rows.Count > 0)
                {
                    Label_Title.Text = dt.Rows[0]["Title"].ToString();
                    Label_News.Text = dt.Rows[0]["news"].ToString();


                    DateTime dtm = new DateTime();
                    dtm = Convert.ToDateTime(dt.Rows[0]["Date_Ins"].ToString());
                    Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
                    Label_date.Text = sunDate.Weekday.ToString();


                    if (dt.Rows[0]["news"].ToString() != "none.jpg")
                    {
                        Image_News.ImageUrl = "~\\News\\images\\" + dt.Rows[0]["image"].ToString();
                        Image_News.Visible = true;
                    }
                    else
                        Image_News.Visible = false;
                }
            }
        }
    }
}
