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
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;

namespace PerisanCMS
{
    public partial class gs : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            try
            {
                if (base.Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(base.Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    base.Response.Cookies.Add(cookie);
                    Page.Culture = name;
                    Page.UICulture = name;
                }
                else
                {
                    HttpCookie cookie2 = base.Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    Page.Culture = str2;
                    Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";
            }
        }
        #region Instance Methods -- Event Handlers

        /// <summary>
        /// When not a PostBack, if there is a query string parameter named "q" that is not empty, 
        /// put its contents in the "q" textbox so that the user can see what they last searched for.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        ///        
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "سایت تخصصی علوم آزمایشگاهی مقالات اطلس ها وبلاگ ها پرسش و پاسخ علمی اخبار لیست کامل آزمایشگاه ها شرکت های تجهیزات و پزشکی با جوایز ارزشمند .";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

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
        protected void Page_Load(Object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String query = Request.QueryString["q"];
                if (!String.IsNullOrEmpty(query))
                {
                    q.Text = SanitizeUserInput(HttpUtility.UrlDecode(query.Trim()));
                }
            }
        }

        /// <summary>
        /// Using the Google form field values, redirect to this page with those values in the URL's
        /// query string.  Google's JavaScript will pick up these parameters, perform the search, and
        /// display the results on your page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnSearch_Click(Object sender, EventArgs e)
        {
            if (!IsValid)
                return;

            Response.Redirect(
                String.Format(
                    "gs.aspx?q={0}&cx={1}&cof={2}",
                    HttpUtility.UrlEncode(SanitizeUserInput(q.Text.Trim())),
                    HttpUtility.UrlEncode(cx.Value),
                    HttpUtility.UrlEncode(cof.Value)
                    ),
                false
                );

            Context.ApplicationInstance.CompleteRequest();
        }

        /// <summary>
        /// Strip tags from user input.
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        private String SanitizeUserInput(String text)
        {
            if (String.IsNullOrEmpty(text))
                return String.Empty;

            String rxPattern = "<(?>\"[^\"]*\"|'[^']*'|[^'\">])*>";
            Regex rx = new Regex(rxPattern);
            String output = rx.Replace(text, String.Empty);

            return output;
        }

        #endregion
    }
}
