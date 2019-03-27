using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PHASCO_WEB.BaseClass;
using DataAccessLayer;
using BusinessAccessLayer;

namespace Rahbina.Administrator.Job
{
    public partial class insertNewspaperAD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Farsi_calendar.Get_farsi_calendar();

            if (Request["Ad_ID"] == null)
            {

                MultiView1.ActiveViewIndex = 0;
            }
            else if (Request["Ad_ID"] != null)
            {
                MultiView1.ActiveViewIndex = 1;
                if (Request["from"] != null)
                {
                    if (Request["from"] == "viewing")
                    {
                        HyperLink_returnFrom_SubAd.Visible = true;
                        HyperLink_returnFrom_SubAd.NavigateUrl = "View_delete_newsPaperADs.aspx";
                    }

                }
            }
            ProccessRequest();

        }
        protected void ProccessRequest()
        {
            //get_All_Jobs
            if (Request["Ad_ID"] != null)
            {
                int Ad_ID = int.Parse(Request["Ad_ID"].ToString());
                TBL_Job_NewsPaper_SubAD select_SubAd_Of_AD = new TBL_Job_NewsPaper_SubAD();
                DataTable dt = select_SubAd_Of_AD.TBL_Job_NewsPaper_SubAD_SP("select_SubAd_Of_AD", Ad_ID, 0);
                //
                GridView_Jobs.DataSource = dt;
                GridView_Jobs.DataBind();
            }
            if (Request["status"] != null)
            {
                if (Request["status"] == "delete")
                {
                    int id = int.Parse(Request["id"].ToString());
                    TBL_Job_NewsPaper_SubAD delete_SubAd = new TBL_Job_NewsPaper_SubAD();
                    delete_SubAd.TBL_Job_NewsPaper_SubAD_SP("delete_SubAd", 0, id);
                    string Ad_ID = Request["Ad_ID"].ToString();
                    HyperLink_return.NavigateUrl = "insertNewspaperAD.aspx?Ad_ID=" + Ad_ID;
                    Label_report.Text = "اطلاعات شغل مورد نظر حذف شد";
                    MultiView1.ActiveViewIndex = 2;
                }
                if (Request["status"] == "Edit")
                {
                    if (!Page.IsPostBack)
                    {
                        int id = int.Parse(Request["id"].ToString());
                        string Ad_ID = Request["Ad_ID"].ToString();
                        HyperLink_return_from_edit.NavigateUrl = "insertNewspaperAD.aspx?Ad_ID=" + Ad_ID;
                        MultiView1.ActiveViewIndex = 3;
                        //
                        //filling related edit form 
                        TBL_Job_NewsPaper_SubAD select_A_SubAd = new TBL_Job_NewsPaper_SubAD();
                        DataTable dt = select_A_SubAd.TBL_Job_NewsPaper_SubAD_SP("select_A_SubAd", 0, id);
                        //
                        TextBox_JobTitleE.Text = dt.Rows[0]["JobTitle"].ToString();
                        TextBox_EduFieldE.Text = dt.Rows[0]["EduField"].ToString();
                        TextBox_EduTendencyE.Text = dt.Rows[0]["EduTendency"].ToString();
                        TextBox_EduDegreeE.Text = dt.Rows[0]["EduDegree"].ToString();
                    }
                }


            }

        }
        public string Set_Url_SubAd(object id)
        {
            int Ad_ID = int.Parse(Request["Ad_ID"].ToString());
            return "<a href=../job/insertNewspaperAD.aspx?status=delete&id=" + id.ToString() + "&Ad_ID=" + Ad_ID + " onclick='return deleteConfirm()' >حذف<a/>" + " | " + "<a href=../job/insertNewspaperAD.aspx?status=Edit&id=" + id.ToString() + "&Ad_ID=" + Ad_ID + " >ويرايش<a/>";
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox_TimeOutCall.Text = Calendar1.SelectedDate.ToString("d");
        }

        protected void Button_insert_AD_Click(object sender, EventArgs e)
        {
            if (FileUpload_img.HasFile)
            {
                string AdTopic = TextBox_AdTopic.Text.Trim();
                DateTime TimeOutCall = Calendar1.SelectedDate;// Persia.Calendar.ConvertToGregorian(Calendar1.SelectedDate.Year, Calendar1.SelectedDate.Month, Calendar1.SelectedDate.Day);
                string explenation = TextBox_explenation.Text.Trim();
                string newsPaperNmae = TextBox_newsPaperNmae.Text.Trim();
                DateTime newsPaperDate = Calendar_newsPaperDate.SelectedDate;// Persia.Calendar.ConvertToGregorian(Calendar_newsPaperDate.SelectedDate.Year, Calendar_newsPaperDate.SelectedDate.Month, Calendar_newsPaperDate.SelectedDate.Day);
                int number = int.Parse(TextBox_number.Text);

                DateTime InsertionDate = DateTime.Now;
                //
                //inserting new newspaperAD
                TBL_Job_NewsPaper_AD insert_AD = new TBL_Job_NewsPaper_AD();
                DataTable dt = insert_AD.TBL_Job_NewsPaper_AD_SP("insert_AD", 0, AdTopic, TimeOutCall, explenation, newsPaperNmae, newsPaperDate, number, 0, FileUpload_img.FileName,InsertionDate);
                string id = dt.Rows[0]["id"].ToString();
                string filePath = "~/job/newsPaperAd_images/" + id + FileUpload_img.FileName;
                FileUpload_img.SaveAs(MapPath(filePath));

                // update file name :
                TBL_Job_NewsPaper_AD Update_fileName = new TBL_Job_NewsPaper_AD();
                Update_fileName.TBL_Job_NewsPaper_AD_SP("Update_fileName", int.Parse(id), id + FileUpload_img.FileName);
                //
                //redirecting page to insert additional details :
                Response.Redirect("insertNewspaperAD.aspx?Ad_ID=" + id);

            }
        }

        protected void Calendar_newsPaperDate_SelectionChanged(object sender, EventArgs e)
        {
            
            TextBox_newsPaperDate.Text = Calendar_newsPaperDate.SelectedDate.ToString("d");
        }

        protected void Button_insert_SubAd_Click(object sender, EventArgs e)
        {
            int Ad_ID = int.Parse(Request["Ad_ID"].ToString());
            string JobTitle = TextBox_JobTitle.Text.Trim();
            string EduField = TextBox_EduField.Text.Trim();
            string EduTendency = TextBox_EduTendency.Text;
            string EduDegree = TextBox_EduDegree.Text.Trim();
            //
            TBL_Job_NewsPaper_SubAD insert_SubAd = new TBL_Job_NewsPaper_SubAD();
            insert_SubAd.TBL_Job_NewsPaper_SubAD_SP("insert_SubAd", JobTitle, EduField, EduTendency, EduDegree, Ad_ID, 0);


            Response.Redirect("insertNewspaperAD.aspx?Ad_ID=" + Ad_ID);
        }

        protected void Button_Edit_job_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request["id"].ToString());

            string JobTitle = TextBox_JobTitleE.Text.Trim();
            string EduField = TextBox_EduFieldE.Text.Trim();
            string EduTendency = TextBox_EduTendencyE.Text.Trim();
            string EduDegree = TextBox_EduDegreeE.Text.Trim();
            TBL_Job_NewsPaper_SubAD Edit_A_SubAd = new TBL_Job_NewsPaper_SubAD();
            Edit_A_SubAd.TBL_Job_NewsPaper_SubAD_SP("Edit_A_SubAd", JobTitle, EduField, EduTendency, EduDegree, 0, id);
            //
            int Ad_ID = int.Parse(Request["Ad_ID"].ToString());
            HyperLink_return.NavigateUrl = "insertNewspaperAD.aspx?Ad_ID=" + Ad_ID;
            Label_report.Text = "تغييرات شما با موفقيت اعمال شد";
            MultiView1.ActiveViewIndex = 2;
        }
    }
}

