using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Threading;
using DataAccessLayer;

namespace Rahbina.Job
{
    public partial class scratch : System.Web.UI.Page
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

            Newest_adver_resumes();
        }
        public void Newest_adver_resumes()
        {
            //getting recent resumes
            TBL_Job_Resume Newest_resumes = new TBL_Job_Resume();
            DataTable dt_resume = Newest_resumes.TBL_Job_Resume_SP("Newest_resumes");
            GridView_recent_resumes.DataSource = dt_resume;
            GridView_recent_resumes.DataBind();
            
            //getting recent ADs
            TBL_Job_employment Newest_Ads = new TBL_Job_employment();
            DataTable dt_ADs = Newest_Ads.TBL_Job_employment_SP("Newest_Ads", 0);
            GridView_recent_ADs.DataSource = dt_ADs;
            GridView_recent_ADs.DataBind();
        }
        
        public string get_category_name(object id)
        {
            TBL_Job_Category getName = new TBL_Job_Category();
            DataTable dt = getName.Select_categories("Get_category_name", int.Parse(id.ToString()));
            return dt.Rows[0]["CategoryName"].ToString();
        }
        public string GetfarsiDate(object eng_date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(eng_date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        public string evaluateState(object state)
        {
            if (state.ToString() == "--انتخاب كنيد--")
            {
                return "نا مشخص";
            }
            else return state.ToString();
        }
    }
}
