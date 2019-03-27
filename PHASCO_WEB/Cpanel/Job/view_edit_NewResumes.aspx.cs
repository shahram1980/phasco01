using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer;

namespace Rahbina.Administrator
{
    public partial class view_edit_NewResumes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Getresumes();

            }
        }

        protected void Getresumes()
        {
            if (Request["id"] == null)
            {
                //Don't worry ! I just showing some greasy information about waiting resumes :

                TBL_Job_Resume Enabled_Resume_Summary = new TBL_Job_Resume();
                DataTable dt;
                int enabled = 0;
                dt = Enabled_Resume_Summary.TBL_Job_Resume_SP("waiting_Resumes_admin", enabled);
                GridView_waiting_resumes.DataSource = dt;
                GridView_waiting_resumes.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
            else if (Request["id"] != null)
            {

                int ResumeID = int.Parse(Request["id"].ToString());

                TBL_Job_Resume ResumeDetails = new TBL_Job_Resume();
                DataTable dt = ResumeDetails.TBL_Job_Resume_SP_2("Enabled_resumes_Details", ResumeID, 0);
                Label_Subject2.Text = dt.Rows[0]["ResumeSubject"].ToString();
                Label_nationalNumber2.Text = dt.Rows[0]["NationalNum"].ToString();
                Label_service2.Text = dt.Rows[0]["serviceStatus"].ToString();
                Label_phone2.Text = dt.Rows[0]["Phone"].ToString();
                Label_mobile2.Text = dt.Rows[0]["mobile"].ToString();
                Label_job_status2.Text = dt.Rows[0]["JobStatus"].ToString();
                Label_EduStatus2.Text = dt.Rows[0]["EducationStatus"].ToString();
                Label_ExpireTime2.Text = dt.Rows[0]["ExpirationTime"].ToString() + "  " + "روز";
                Label_category2.Text = get_category_name(dt.Rows[0]["CategoryID"]);
                Label_Subcategory2.Text = get_category_name(dt.Rows[0]["CategoryID_Sub"]);
                Label_CoOperate_Condition2.Text = dt.Rows[0]["CoOperate_Condition"].ToString();
                Label_Requested_Wage2.Text = dt.Rows[0]["Requested_Wage"].ToString() + "  " + "تومان";
                Label_pro_abilities2.Text = dt.Rows[0]["pro_abilities"].ToString();
                Label_Explantion2.Text = dt.Rows[0]["Explantion"].ToString();
                MultiView1.ActiveViewIndex = 1;
                //
                //getting additional information of Resume
                getCareers(ResumeID);
                getLanguages(ResumeID);
                getEdu(ResumeID);
            }

        }

        public string GetfarsiDate(object date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        public string get_category_name(object id)
        {
            TBL_Job_Category getName = new TBL_Job_Category();
            DataTable dt = getName.Select_categories("Get_category_name", int.Parse(id.ToString()));
            return dt.Rows[0]["CategoryName"].ToString();
        }

        public void getCareers(int ResumID)
        {
            TBL_Job_Special_careers Select_Resume_career = new TBL_Job_Special_careers();
            DataTable dt = Select_Resume_career.Special_careers_SP("Select_Resume_career", ResumID, 0);
            GridView_career.DataSource = dt;
            GridView_career.DataBind();
        }
        public void getLanguages(int ResumID)
        {
            TBL_Job_Languages Select_all_lang = new TBL_Job_Languages();
            DataTable dt = Select_all_lang.TBL_Job_Languages_SP("Select_all_lang", ResumID, 0);
            GridView_languages.DataSource = dt;
            GridView_languages.DataBind();
        }
        public void getEdu(int ResumID)
        {
            TBL_Job_Educations Select_All_Education = new TBL_Job_Educations();
            DataTable dt = Select_All_Education.TBL_Job_Educations_SP("Select_All_Education", ResumID, 0);
            GridView_edu.DataSource = dt;
            GridView_edu.DataBind();
        }

        protected void LinkButton_confirm_Click(object sender, EventArgs e)
        {


            TBL_Job_Resume confirm_resume = new TBL_Job_Resume();
            int enabled = 1;
            int id = int.Parse(Request["id"].ToString());
            confirm_resume.TBL_Job_Resume_SP_confirm("confirm_resume", enabled, id);
            Response.Redirect("view_edit_NewResumes.aspx");
        }

        protected void LinkButton_confirm2_Click(object sender, EventArgs e)
        {
            string Enabled_cause = TextBox_confirm.Text.Trim();
            int id = int.Parse(Request["id"].ToString());
            TBL_Job_Resume confirm_resume = new TBL_Job_Resume();          
            confirm_resume.TBL_Job_Resume_SP_confirm("NotConfirm_explanation", Enabled_cause, id);
            Response.Redirect("view_edit_NewResumes.aspx");
        }
    }
}
