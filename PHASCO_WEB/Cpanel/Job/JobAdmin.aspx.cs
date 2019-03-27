using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using DataAccessLayer;

namespace Rahbina.Job
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //first step : getting today's date :
            DateTime today = DateTime.Now;
            //second step: detecting expired resumes
            TBL_Job_Resume detect_expired_resume = new TBL_Job_Resume();
            detect_expired_resume.TBL_Job_Resume_SP("detect_expired", today);
            //tirth step : detecting expired employment advertisment
            TBL_Job_employment detect_expired_employment = new TBL_Job_employment();
            detect_expired_employment.TBL_Job_employment_SP("detect_expired", today);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime todayMinusOneMonth = DateTime.Now.AddMonths(-1);

            //deleting expired resumes after waiting one month

            TBL_Job_Resume delete_expired_resumes = new TBL_Job_Resume();
            DataTable dt = delete_expired_resumes.TBL_Job_Resume_SP("delete_expired_resumes", todayMinusOneMonth);



            //deleting expired employment after waiting one month

            TBL_Job_employment delete_expired_employment = new TBL_Job_employment();
            delete_expired_employment.TBL_Job_employment_SP("delete_expired_employment", todayMinusOneMonth);

        }

        protected void Button_delete_NewsPaperAds_Click(object sender, EventArgs e)
        {
           //Here i want to delete newspaper Ads after one week from inserting them.
           //  So i need to know today's date and delete Ads base on following formula 
           //  if (( todays date - 7 ) >= insertion date ) -->  delete the Ads
            
            DateTime todayMinusOneWeek = DateTime.Now.AddDays(-7);
            TBL_Job_NewsPaper_AD Delete_Expired_Ads = new TBL_Job_NewsPaper_AD();
            DataTable dt = Delete_Expired_Ads.TBL_Job_NewsPaper_AD_SP("Delete_Expired_Ads", todayMinusOneWeek);

            //deleting related files
            for (int i = 0; i < dt.Rows.Count;i++ )
            {
                string filePath = "~/job/newsPaperAd_images/" + dt.Rows[i]["_FileName"].ToString();
                File.Delete(MapPath(filePath));
            }
        }
    }
}
