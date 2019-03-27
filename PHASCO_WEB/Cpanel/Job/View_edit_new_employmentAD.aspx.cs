using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer;

namespace Rahbina.Administrator.Job
{
    public partial class View_edit_new_employmentAD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getEmploymentAD();

            }
        }
        public void getEmploymentAD()
        {
            if (Request["id"] == null)
            {
                //I am going to retrive some details about employing advertisment 
                int userID = 12345;
                int status = 0;
                TBL_Job_employment employingAD_summary = new TBL_Job_employment();
                DataTable dt;
                dt = employingAD_summary.TBL_Job_employment_SP("employingAD_statuse", userID, status);
                GridView_waiting_ad.DataSource = dt;
                GridView_waiting_ad.DataBind();
                MultiView1.ActiveViewIndex = 0;

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

                Label_experience2.Text = dt.Rows[0]["job_experience"].ToString() + "  " + "سال ";
                Label_gender2.Text = dt.Rows[0]["gender"].ToString();
                Label_marriage2.Text = dt.Rows[0]["IsMarriage"].ToString();

                Label_service2.Text = dt.Rows[0]["serviceStatus"].ToString();
                Label_age2.Text = dt.Rows[0]["age"].ToString();
                Label_phone2.Text = dt.Rows[0]["phone"].ToString();
                Label_explenation2.Text = dt.Rows[0]["explenation"].ToString();


            }
        }
        public string GetfarsiDate(object eng_date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(eng_date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        public string get_category_name(object id)
        {
            TBL_Job_Category getName = new TBL_Job_Category();
            DataTable dt = getName.Select_categories("Get_category_name", int.Parse(id.ToString()));
            return dt.Rows[0]["CategoryName"].ToString();
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

        protected void LinkButton_confirm_Click(object sender, EventArgs e)
        {

            TBL_Job_employment confirm_employment = new TBL_Job_employment();
            int enabled = 1;
            int id = int.Parse(Request["id"].ToString());
            confirm_employment.TBL_Job_employment_SP_confirm("confirm_employment", id, enabled);
            Response.Redirect("View_edit_new_employmentAD.aspx");
        }

        protected void LinkButton_confirm2_Click(object sender, EventArgs e)
        {
            string Enabled_cause = TextBox_confirm.Text.Trim();
            int id = int.Parse(Request["id"].ToString());
            TBL_Job_employment confirm_employment = new TBL_Job_employment();


            confirm_employment.TBL_Job_employment_SP_confirm("NotConfirm_explanation", id, Enabled_cause);
            Response.Redirect("View_edit_new_employmentAD.aspx");


        }
    }
}
