using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.Threading;
using System.Web.UI.HtmlControls;
using DataAccessLayer;

namespace Rahbina.Job
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        #region set_Page_lang_Meta
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "وب سایت علوم آزمایشگاهی پزشکی phasco.com -بخش شرکت ها";
            string keys = "پزشک,آزمایشگاه,فاسکو";

            //if (Request.QueryString["lid"] != null)
            //{
            //    Set_dataset_View(int.Parse(Request.QueryString["lid"].ToString()));


            //    keys = keys + Set_Rnd_Word(dt_.Rows[0]["Name"].ToString() + " " + dt_.Rows[0]["Address"].ToString() + " " + dt_.Rows[0]["Manager"].ToString() + " " + dt_.Rows[0]["Foods"].ToString());
            //    desc = desc + dt_.Rows[0]["Foods"].ToString();
            //}

            //if (Request.QueryString["alpha"] != null)
            //{
            //    Set_dataset_alpha();
            //    int count = 25;
            //    if (dst_alpha.Rows.Count < 25) count = dst_alpha.Rows.Count;
            //    for (int i = 0; i < count; i++)
            //    { keys = keys + "," + dst_alpha.Rows[0]["Name"].ToString(); }
            //}

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);


        }
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
                    Response.Redirect("Default.aspx");
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
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            getjobs();
        }
        protected void getjobs()
        {
            TBL_Job_NewsPaper_SubAD get_jos = new TBL_Job_NewsPaper_SubAD();
           DataTable dt= get_jos.TBL_Job_NewsPaper_SubAD_SP("All_Jobs");

           dtlist_newspaperAds.DataSource = dt;
           dtlist_newspaperAds.DataBind();
        }
    }
}
