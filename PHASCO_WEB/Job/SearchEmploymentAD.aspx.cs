using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Globalization;
using System.Threading;
using System.Web.UI.HtmlControls;
using DataAccessLayer;

namespace Rahbina.Job
{
    public partial class SearchEmploymentAD : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                Get_categories();
                proccessrequest();
            }
      
        }
        public void proccessrequest()
        {
            if (Request["id"] == null)
            {
                if (Request["from"].ToString() == "search")
                    MultiView1.ActiveViewIndex = 0;

                if (Request["from"].ToString() == "home")
                {
                    MultiView1.ActiveViewIndex = 2;
                    //getting recent ADs
                    TBL_Job_employment Newest_Employment = new TBL_Job_employment();
                    DataTable dt_emp = Newest_Employment.TBL_Job_employment_SP("Newest_Ads");

                    GridView_recent_ADs.DataSource = dt_emp;
                    GridView_recent_ADs.DataBind();
                  
                    HyperLink_return2Main.NavigateUrl = "~/job/home.aspx";
                }
            }
            else if (Request["id"] != null)
            {
                MultiView1.ActiveViewIndex = 1;
                //
                //filling fields
                int id = int.Parse(Request["id"].ToString());
                TBL_Job_employment select_employingAD_details = new TBL_Job_employment();
                DataTable dt = select_employingAD_details.TBL_Job_employment_SP("select_employingAD_details", id);

                Label_jobtitle2.Text = dt.Rows[0]["JobTitle"].ToString();
                Label_required_specialty2.Text = dt.Rows[0]["Required_specialty"].ToString();
                Label_coname2.Text = dt.Rows[0]["Company_name"].ToString();

                Label_call_timeOut2.Text = Mss_Date(dt.Rows[0]["TimeOutDate"]);
                Label_insertDate2.Text = Mss_Date(dt.Rows[0]["insertionDate"]);

                Label_address2.Text = dt.Rows[0]["_address"].ToString();
                Label_state2.Text = evaluateState(dt.Rows[0]["_state"]);
                Label_city2.Text = evaluateState(dt.Rows[0]["city"]);
                Label_education2.Text = dt.Rows[0]["Edu_step"].ToString();

                Label_experience2.Text = dt.Rows[0]["job_experience"].ToString()+"  "+"سال ";
                Label_gender2.Text = dt.Rows[0]["gender"].ToString();
                Label_marriage2.Text = dt.Rows[0]["IsMarriage"].ToString();

                Label_service2.Text = dt.Rows[0]["serviceStatus"].ToString();
                Label_age2.Text = dt.Rows[0]["age"].ToString();
                Label_phone2.Text = dt.Rows[0]["phone"].ToString();
                Label_explenation2.Text = dt.Rows[0]["explenation"].ToString();

                //
                if (Request["from"].ToString() == "home")
                {
                    HyperLink_return.NavigateUrl = "~/Job/SearchEmploymentAD.aspx?from=home";
                }
                else if (Request["from"].ToString() == "search")
                {
                    HyperLink_return.NavigateUrl = "~/job/SearchEmploymentAD.aspx?from=search";
                }
               
         
               
            }
        }
        public string GetfarsiDate(object eng_date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(eng_date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        protected void Get_categories()
        {
            TBL_Job_Category categories = new TBL_Job_Category();
            DataTable dt = new DataTable();
            dt = categories.Select_categories("Select_categories");
            DropDownList_job_title.DataSource = dt;
            DropDownList_job_title.DataBind();
        }
        protected void DropDownList_job_title_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList_specialty.Enabled = true;
            int categoryID = int.Parse(DropDownList_job_title.SelectedValue);
            TBL_Job_Category SubCategories = new TBL_Job_Category();
            DataTable dt;
            dt = SubCategories.Select_categories("Select_subcategories", categoryID);

            DropDownList_specialty.DataSource = dt;

            DropDownList_specialty.DataBind();
            //

            

        }

        protected void Button_search_Click(object sender, EventArgs e)
        {
            int job_title = int.Parse(DropDownList_job_title.SelectedValue);
            int specialty = int.Parse(DropDownList_specialty.SelectedValue);
            string education = DropDownList_education_step.SelectedItem.Text.Trim();
            string gender = DropDownList_gender.SelectedItem.Text.Trim();
            string marrige = DropDownList_marriage.SelectedItem.Text.Trim();
            string service = DropDownList_service.SelectedItem.Text.Trim();
            string state = DropDownList_state.SelectedItem.Text.Trim();

            //
            StringBuilder condition = new StringBuilder();
            condition.Append("_statuse=1 and JobTitle =" + job_title + " and Required_specialty =" + specialty );
            if (education != "مهم نيست")
            {
                condition.Append("and Edu_step like '%" + education + "%'");
            }
            if (gender != "مهم نيست")
            {
                condition.Append("and gender like '%" + gender + "%'");
            }
            if (marrige != "مهم نيست")
            {
                condition.Append("and IsMarriage like '%" + marrige + "%'");
            }
            if (service != "مهم نيست")
            {
                condition.Append("and serviceStatus like '%" + service + "%'");
            }
            if (state != "--انتخاب كنيد--")
            {
                condition.Append("and _state like '%" + state + "%'");
            }
            //
            TBL_Job_employment Search_employmentAD = new TBL_Job_employment();
            DataTable dt = Search_employmentAD.TBL_Job_employment_SP("Search_employmentAD", condition.ToString());
            //
            //binding data
            GridView_search_result.DataSource = dt;
            GridView_search_result.DataBind();
            if (dt.Rows.Count == 0)
            {
                Label_search_report.Text = "جستجوي شما نتيجه اي در بر نداشت";

            }
            else
            {
                HiddenField_codition.Value = condition.ToString();
                Label_search_report.Text = " [ " + dt.Rows.Count.ToString() + " ]" + "مورد يافت شد  ";
            }


        }
        public string Search_res_summary(object jobTitle, object specialty)
        {
            return jobTitle.ToString() + "/" + specialty.ToString();

        }
       
 
        public string Mss_Date(object date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date.ToString());
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

        protected void GridView_search_result_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView_search_result.PageIndex = e.NewPageIndex;
            GridView_search_result.DataSource = gridBind();
            GridView_search_result.DataBind();
        }

        public DataTable gridBind()
        {

            TBL_Job_employment Search_employmentAD = new TBL_Job_employment();
            DataTable dt = Search_employmentAD.TBL_Job_employment_SP("Search_employmentAD", HiddenField_codition.Value);
      
            return dt;

        }
    }
}