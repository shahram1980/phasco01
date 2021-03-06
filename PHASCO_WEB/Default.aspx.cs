using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Linq;

////////////////////////////////////
using System.Threading;
using System.Globalization;
using DataAccessLayer.Main;
using DataAccessLayer.Video;
using DataAccessLayer;
using System.Collections.Generic;
using PHASCO_WEB.DAL;
///////////////////////////////////
namespace phasco_webproject
{
    public partial class _Default : System.Web.UI.Page
    {
        DataAccessLayer.Tbl_TodayText da = new DataAccessLayer.Tbl_TodayText();
        DataAccessLayer.TBL_Lab_QC da_QC = new DataAccessLayer.TBL_Lab_QC();
        DataAccessLayer.Main.TBL_TAGs dat_tags = new DataAccessLayer.Main.TBL_TAGs();
        public DataTable dt = new DataTable();
        public string keyword_ = "";
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
                    // Langu.SelectedValue = lang;
                    // ((DropDownList)Master.FindControl("Lang")).SelectedValue = lang;
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                    // Langu.SelectedValue = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";
            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Set_Datatable();
            string desc = "سایت علوم آزمایشگاهی مقالات اطلس وبلاگ پرسش پاسخ علمی اخبار آزمایشگاه شرکت تجهیزات بازار آزمون جوایز";
            string keys = keyword_;// "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

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
        protected void Page_Load(object sender, EventArgs e)
        {
            Membership_Manage.NotificationUsers.Main();
            if (!IsPostBack) { Bind_tag(); BindLastVideo(); }
        }

        void BindLastVideo()
        {
            DataAccessLayer.Video.tblVideo da_Video = new DataAccessLayer.Video.tblVideo();
            //DataList_Video.DataSource = da_Video.tblVideo_SP(9);
            //DataList_Video.DataBind();
        }
        //private void Bind_QC()
        //{
        //    //DataList_QC.DataSource = da_QC.TBL_Lab_QC_SP("selectall", 0, "", "");
        //    //DataList_QC.DataBind();
        //}
        protected void Set_Datatable()
        {
            try
            {
                dt = dat_tags.TBL_TAGs_SP(7, 0, "", "");
                for (int i = 0; i < 10; i++) { keyword_ += dt.Rows[i]["tag"].ToString() + ","; }
            }
            catch (Exception)
            { }

        }
        private void Bind_tag()
        {
            //rpt_Keyword.DataSource = dt;
            //rpt_Keyword.DataBind();

        }
        
    }
}
