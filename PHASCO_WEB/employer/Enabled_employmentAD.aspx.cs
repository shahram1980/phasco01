using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using phasco_webproject.BaseClass;
using PHASCO_WEB.DAL;
using System.Globalization;
using System.Threading;
using System.Web.UI.HtmlControls;
using Membership_Manage;
using DataAccessLayer;
using BusinessAccessLayer;

namespace Rahbina.Job
{
    public partial class Enabled_employmentAD : System.Web.UI.Page
    {
        Tbl_state da_s = new Tbl_state();
        DataTable dt;
        #region set_Page_lang_Meta
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "وب سایت علوم آزمایشگاهی پزشکی phasco.com -بخش شرکت ها";
            string keys = "پزشک,آزمایشگاه,فاسکو";

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
            if (!Page.IsPostBack)
            {
                getEmploymentAD();
                Get_categories();
            }
            //redirecting anonymous users
            if (!UserOnline.User_Online_Valid())
            { Response.Redirect("~/Default.aspx"); }
        }
        protected void Get_categories()
        {
            DropDownList_job_title.DataSource = getCategories.get_category();
            DropDownList_job_title.DataBind();
        }
        public void getEmploymentAD()
        {
            if (Request["id"] == null)
            {
                //I am going to retrive some details about employing advertisment 
                int userID = UserOnline.id();
                int status = 1;
                TBL_Job_employment employingAD_summary = new TBL_Job_employment();
                DataTable dt;
                dt = employingAD_summary.TBL_Job_employment_SP("employingAD_summary", userID, status);
                GridView_enabled_ad.DataSource = dt;
                GridView_enabled_ad.DataBind();
                MultiView1.ActiveViewIndex = 0;

            }
            else if (Request["id"] != null)
            {
                int id = int.Parse(Request["id"].ToString());
                TBL_Job_employment employingAD_Details = new TBL_Job_employment();
                DataTable dt;
                dt = employingAD_Details.TBL_Job_employment_SP("select_employingAD_details", id);

                DropDownList_job_title.SelectedValue = dt.Rows[0]["jobTitle"].ToString();
                TextBox_coname.Text = dt.Rows[0]["Company_name"].ToString();
                DropDownList_specialty.DataSource = getCategories.get_subCategory(int.Parse(dt.Rows[0]["jobTitle"].ToString()));
                DropDownList_specialty.DataBind();
                DropDownList_specialty.SelectedValue = dt.Rows[0]["Required_specialty"].ToString();
                HiddenField_date.Value = dt.Rows[0]["insertionDate"].ToString();
                DateTime tempDate = DateTime.Parse(dt.Rows[0]["TimeOutDate"].ToString());
                TextBox_call_timeOut.Text = tempDate.ToString("d");
                TextBox_address.Text = dt.Rows[0]["_address"].ToString();
                TextBox_experience.Text = dt.Rows[0]["job_experience"].ToString();
                TextBox_phone.Text = dt.Rows[0]["phone"].ToString();
                TextBox_explenation.Text = dt.Rows[0]["explenation"].ToString();
                DropDownList_state.SelectedValue = dt.Rows[0]["_state"].ToString();
                //retriving related cities :
                set_state();

                DropDownList_city.SelectedValue = dt.Rows[0]["city"].ToString();
                DropDownList_education_step.Text = dt.Rows[0]["Edu_step"].ToString();
                DropDownList_gender.Text = dt.Rows[0]["gender"].ToString();
                DropDownList_marriage.Text = dt.Rows[0]["IsMarriage"].ToString();
                DropDownList_service.Text = dt.Rows[0]["serviceStatus"].ToString();
                DropDownList_age.Text = dt.Rows[0]["age"].ToString();
                MultiView1.ActiveViewIndex = 1;
            }
        }
        public string GetfarsiDate(object eng_date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(eng_date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        protected void GridView_waiting_ad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_enabled_ad.PageIndex = e.NewPageIndex;
            GridView_enabled_ad.DataSource = gridBind();
            GridView_enabled_ad.DataBind();
        }
        public DataTable gridBind()
        {
            int userID = UserOnline.id();
            int status = 1;
            TBL_Job_employment employingAD_summary = new TBL_Job_employment();
            DataTable dt;
            dt = employingAD_summary.TBL_Job_employment_SP("employingAD_summary", userID, status);
            return dt;
        }
        protected void Button_update_employment_ad_Click(object sender, EventArgs e)
        {
            int JobTitle = int.Parse(DropDownList_job_title.SelectedValue);
            string Company_name = TextBox_coname.Text;
            int Required_specialty = int.Parse(DropDownList_specialty.SelectedValue);

            DateTime insertionDate = DateTime.Parse(HiddenField_date.Value);
            DateTime TimeOutDate = DateTime.Parse(TextBox_call_timeOut.Text);
            string _address = TextBox_address.Text;
            string _state = DropDownList_state.SelectedValue;
            string city = DropDownList_city.SelectedValue;
            string Edu_step = DropDownList_education_step.Text;

            int job_experience = 0;
            try { job_experience = int.Parse(TextBox_experience.Text); }
            catch { }

            string gender = DropDownList_gender.Text;
            string IsMarriage = DropDownList_marriage.Text;
            string serviceStatus = DropDownList_service.Text;
            string age = DropDownList_age.Text;
            string phone = TextBox_phone.Text;
            string explenation = TextBox_explenation.Text;
            int userID = UserOnline.id();
            int _statuse = 1;
            //retriving the relaited ID
            int id = int.Parse(Request["id"].ToString());
            TBL_Job_employment insert_employment_advertise = new TBL_Job_employment();
            insert_employment_advertise.TBL_Job_employment_SP("update_employment", id, JobTitle, Company_name, Required_specialty, insertionDate, TimeOutDate,
                                               _address, _state, city, Edu_step, job_experience, gender, IsMarriage, serviceStatus, age, phone, explenation, userID,
                                               _statuse);
            MultiView1.ActiveViewIndex = 2;
        }
        protected void DropDownList_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            set_state();
        }
        void set_state()
        {
            int state = int.Parse(DropDownList_state.SelectedValue.ToString());
            dt = da_s.T_state_Tra("select", 0, "", state, "");
            string Cultur = Page.Culture.ToString();
            if (Cultur == "Persian (Iran)")
            { DropDownList_city.DataTextField = "Satate"; }
            else if (Cultur == "English (United States)")
            { DropDownList_city.DataTextField = "StateEN"; }

            DropDownList_city.DataValueField = "ID";
            DropDownList_city.DataSource = dt;
            DropDownList_city.DataBind();
            if (dt.Rows.Count != 0) DropDownList_city.Enabled = true;
            else DropDownList_city.Enabled = false;
            DropDownList_city.DataSource = dt;
            DropDownList_city.DataBind();
        }
        protected void DropDownList_job_title_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoryID = int.Parse(DropDownList_job_title.SelectedValue);
            DropDownList_specialty.DataSource = getCategories.get_subCategory(categoryID);
            DropDownList_specialty.DataBind();
        }
        public string get_category_name(object id)
        {
            TBL_Job_Category getName = new TBL_Job_Category();
            DataTable dt = getName.Select_categories("Get_category_name", int.Parse(id.ToString()));
            return dt.Rows[0]["CategoryName"].ToString();

        }
    }
}
