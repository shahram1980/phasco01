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
using PHASCO_Shopping.BLL;
using System.Threading;
using System.Globalization;

namespace PHASCO_Shopping.C_p
{
    public partial class News : System.Web.UI.Page
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
                    Response.Redirect("Default.aspx");
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
                this.Page.Culture = "fa-ir";
                this.Page.UICulture = "fa-ir";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) set_News();
        }

        void set_News()
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
            TBL_User_News da = new TBL_User_News();
            DataTable dt = da.TBL_User_News_Tra(id);
            Label_title.Text = dt.Rows[0]["Title"].ToString();
            Label_news.Text = dt.Rows[0]["news"].ToString();


            Label_Datesend.Text =dt.Rows[0]["datesend"].ToString();
            if (Page.Culture == "Persian (Iran)")
            { 
              DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(dt.Rows[0]["datesend"].ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            Label_Datesend.Text = sunDate.Weekday.ToString()+" ساعت :  " + dtm.Hour.ToString() + ":" + dtm.Minute.ToString();;
            }
          
        }

    }
}
