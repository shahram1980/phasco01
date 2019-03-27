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
    public partial class employment : System.Web.UI.Page
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
                MultiView1.ActiveViewIndex = 0;
                Get_categories();
                DateTime temp = DateTime.Now.AddDays(20);
                TextBox_call_timeOut.Text = temp.ToString("d");
            }
            //redirecting anonymous users
            if (!UserOnline.User_Online_Valid())
            {
                Response.Redirect("~/Default.aspx");
            }

        }
        protected void Get_categories()
        {
            TBL_Job_Category categories = new TBL_Job_Category();
            DataTable dt = new DataTable();
            dt = categories.Select_categories("Select_categories");
            DropDownList_job_title.DataSource = dt;
            DropDownList_job_title.DataBind();
        }
        protected void DropDownList_state_SelectedIndexChanged(object sender, EventArgs e)
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
            if (dt.Rows.Count != 0)
                DropDownList_city.Enabled = true;
            else
                DropDownList_city.Enabled = false;


            DropDownList_city.DataSource = dt;
            DropDownList_city.DataBind();
        }

        protected void Button_insert_employment_ad_Click(object sender, EventArgs e)
        {
            int JobTitle = int.Parse(DropDownList_job_title.SelectedValue);
            string Company_name = TextBox_coname.Text;
            int Required_specialty = int.Parse(DropDownList_specialty.SelectedValue);
            DateTime insertionDate = DateTime.Now;
            DateTime TimeOutDate = DateTime.Parse(TextBox_call_timeOut.Text);
            string _address = TextBox_address.Text;
            string _state = DropDownList_state.Text;
            string city = DropDownList_city.SelectedItem.Text;
            string Edu_step = DropDownList_education_step.Text;

            int job_experience = 0;
            try
            { job_experience = int.Parse(TextBox_experience.Text); }
            catch { }
            string gender = DropDownList_gender.Text;
            string IsMarriage = DropDownList_marriage.Text;
            string serviceStatus = DropDownList_service.Text;
            string age = DropDownList_age.Text;
            string phone = TextBox_phone.Text;
            string explenation = TextBox_explenation.Text;
            int userID = UserOnline.id();
            int _statuse = 0;
            TBL_Job_employment insert_employment_advertise = new TBL_Job_employment();
            insert_employment_advertise.TBL_Job_employment_SP("insert_employment", 0, JobTitle, Company_name, Required_specialty, insertionDate, TimeOutDate,
                                               _address, _state, city, Edu_step, job_experience, gender, IsMarriage, serviceStatus, age, phone, explenation, userID,
                                               _statuse);
            MultiView1.ActiveViewIndex = 1;
        }

        protected void DropDownList_job_title_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoryID = int.Parse(DropDownList_job_title.SelectedValue);
            DropDownList_specialty.DataSource = getCategories.get_subCategory(categoryID);
            DropDownList_specialty.DataBind();
        }
    }
}




