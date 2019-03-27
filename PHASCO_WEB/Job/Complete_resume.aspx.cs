using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using phasco_webproject.BaseClass;
using System.Threading;
using System.Globalization;
using System.Web.UI.HtmlControls;
using Membership_Manage;
using DataAccessLayer;

namespace Rahbina.Job
{
    public partial class Complete_resume : System.Web.UI.Page
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
                set_date();
                MultiView1.ActiveViewIndex = 0;
            }
            if (!UserOnline.User_Online_Valid())
            {
                Response.Redirect("~/Default.aspx");
            }
            proccess_request();
            
        }
        protected void Page_preRender(object sender, EventArgs e)
        {
            get_All_career();
            get_All_Educations();
            get_All_Languages();
        }

        private void set_date()
        {
            //setting day
            List<string> days = new List<string>();

            for (int i = 1; i < 32; i++)
                days.Add(i.ToString());
            //setting start day
            DropDownList_day.DataSource = days;
            DropDownList_day.DataBind();
            //setting finish day 
            DropDownList_day_finish.DataSource = days;
            DropDownList_day_finish.DataBind();

            //setting start day for edit career
            DropDownList_day_E.DataSource = days;
            DropDownList_day_E.DataBind();
            //setting finish day  for edit career
            DropDownList_day_finish_E.DataSource = days;
            DropDownList_day_finish_E.DataBind();

            //setting edu start day
            DropDownList_day_edu.DataSource = days;
            DropDownList_day_edu.DataBind();
            //setting edu finish day 
            DropDownList_day_edu_finish.DataSource = days;
            DropDownList_day_edu_finish.DataBind();

            //setting edu start day for edit
            DropDownList_day_edu_E.DataSource = days;
            DropDownList_day_edu_E.DataBind();
            //setting edu finish day  day for edit
            DropDownList_day_edu_finish_E.DataSource = days;
            DropDownList_day_edu_finish_E.DataBind();


            //setting month/////////////////////////
            List<string> month = new List<string>();

            for (int i = 1; i < 13; i++)
                month.Add(i.ToString());
            //setting start month for edit career
            DropDownList_month_E.DataSource = month;
            DropDownList_month_E.DataBind();
            //setting finish month for edit career
            DropDownList_month_finish_E.DataSource = month;
            DropDownList_month_finish_E.DataBind();

            //setting start month 
            DropDownList_month.DataSource = month;
            DropDownList_month.DataBind();
            //setting finish month 
            DropDownList_month_finish.DataSource = month;
            DropDownList_month_finish.DataBind();

            //setting edu start month
            DropDownList_month_edu.DataSource = month;
            DropDownList_month_edu.DataBind();
            //setting edu finish month 
            DropDownList_month_edu_finish.DataSource = month;
            DropDownList_month_edu_finish.DataBind();

            //setting edu start month for edit
            DropDownList_month_edu_E.DataSource = month;
            DropDownList_month_edu_E.DataBind();
            //setting edu finish month for edit
            DropDownList_month_edu_finish_E.DataSource = month;
            DropDownList_month_edu_finish_E.DataBind();

            //seting year/////////////////////////////
            List<string> years = new List<string>();

            //int year = PersianDate.Now.Year;
            int year = DateTime.Now.Year;
            for (int i = year; i > 1308; i--)
                years.Add(i.ToString());

            //setting start years
            DropDownList_year.DataSource = years;
            DropDownList_year.DataBind();

            //setting finish years
            DropDownList_year_finish.DataSource = years;
            DropDownList_year_finish.DataBind();

            //setting start years for edit career
            DropDownList_year_E.DataSource = years;
            DropDownList_year_E.DataBind();

            //setting finish years for edit career
            DropDownList_year_finish_E.DataSource = years;
            DropDownList_year_finish_E.DataBind();

            //setting edu start years
            DropDownList_year_edu.DataSource = years;
            DropDownList_year_edu.DataBind();
            //setting edu finish years
            DropDownList_year_edu_finish.DataSource = years;
            DropDownList_year_edu_finish.DataBind();

            //setting edu start years for edit
            DropDownList_year_edu_E.DataSource = years;
            DropDownList_year_edu_E.DataBind();
            //setting edu finish years for edit
            DropDownList_year_edu_finish_E.DataSource = years;
            DropDownList_year_edu_finish_E.DataBind();


        }
        // now i want to show all creers of this user in a grid view
        public void get_All_career()
        {
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            TBL_Job_Special_careers select_careers = new TBL_Job_Special_careers();
            DataTable dt = select_careers.Special_careers_SP("Select_Resume_career", resumeID, 0);
            GridView_career.DataSource = dt;
            GridView_career.DataBind();
        }
        //here i am trying to show all foreign languages related this resume (just newly added)
        public void get_All_Languages()
        {
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            TBL_Job_Languages select_all_lang = new TBL_Job_Languages();
            DataTable dt = select_all_lang.TBL_Job_Languages_SP("Select_all_lang", resumeID, 0);
            GridView_languages.DataSource = dt;
            GridView_languages.DataBind();
        }
        // and here i am trying to show all educational fields  related this resume (just newly added)
        public void get_All_Educations()
        {
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            TBL_Job_Educations Select_all_edu = new TBL_Job_Educations();
            DataTable dt = Select_all_edu.TBL_Job_Educations_SP("Select_All_Education", resumeID, 0);
            GridView_edu.DataSource = dt;
            GridView_edu.DataBind();

        }
        // setting required url for delete
        public string set_URL_creer(object id)
        {
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            if (Request["from"] == "insertResume")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteCareer&from=insertResume&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=EditCareer&from=insertResume&ResumeID=" + resumeID + " >ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "EnabledResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteCareer&from=EnabledResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=EditCareer&from=EnabledResumes&ResumeID=" + resumeID + " >ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "WaitingResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteCareer&from=WaitingResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=EditCareer&from=WaitingResumes&ResumeID=" + resumeID + " >ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "DisabledResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteCareer&from=DisabledResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=EditCareer&from=DisabledResumes&ResumeID=" + resumeID + " >ويرايش<a/>";
            }
            else return "";
        }
        public string set_URL_lang(object id)
        {
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            if (Request["from"] == "insertResume")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deletelang&from=insertResume&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editlang&from=insertResume&ResumeID=" + resumeID + ">ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "EnabledResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deletelang&from=EnabledResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editlang&from=EnabledResumes&ResumeID=" + resumeID + ">ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "WaitingResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deletelang&from=WaitingResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editlang&from=WaitingResumes&ResumeID=" + resumeID + ">ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "DisabledResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deletelang&from=DisabledResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editlang&from=DisabledResumes&ResumeID=" + resumeID + ">ويرايش<a/>";
            }


            else return "";
        }
        public string set_URL_edu(object id)
        {
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            if (Request["from"] == "insertResume")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteedu&from=insertResume&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editedu&from=insertResume&ResumeID=" + resumeID + " >ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "EnabledResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteedu&from=EnabledResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editedu&from=EnabledResumes&ResumeID=" + resumeID + " >ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "WaitingResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteedu&from=WaitingResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editedu&from=WaitingResumes&ResumeID=" + resumeID + " >ويرايش<a/>";
            }
            else if (Request["from"].ToString() == "DisabledResumes")
            {
                return "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=deleteedu&from=DisabledResumes&ResumeID=" + resumeID + " onclick='return deleteConfirm()'>حذف<a/> | " + "<a href=Complete_resume.aspx?id=" + id.ToString() + "&status=Editedu&from=DisabledResumes&ResumeID=" + resumeID + " >ويرايش<a/>";
            }

            else return "";
        }

        protected void Button_insert_career_Click(object sender, EventArgs e)
        {
            //retriving the id of resume and insert it's related careers 
            if (Request["status"] == "insert")
            {
                int ResumeID = int.Parse(Request["ResumeID"].ToString());
                string career_name = TextBox_career_name.Text.Trim();
                int career_duration = int.Parse(TextBox_career_duration.Text);
                DateTime start = DateTime.Parse(DropDownList_month.SelectedItem.Text + "/" + DropDownList_day.SelectedItem.Text + "/" + DropDownList_year.SelectedItem.Text);
                DateTime Finish = DateTime.Parse(DropDownList_month_finish.SelectedItem.Text + "/" + DropDownList_day_finish.SelectedItem.Text + "/" + DropDownList_year_finish.SelectedItem.Text);
                string Institute_name = TextBox_institute_name.Text;
                TBL_Job_Special_careers insert_career = new TBL_Job_Special_careers();
                insert_career.Special_careers_SP("Insert_career", career_name, career_duration, start, Finish, Institute_name, ResumeID);
                //
                //it is time to empty input blocks
                TextBox_career_name.Text = string.Empty;
                TextBox_career_duration.Text = string.Empty;
                TextBox_institute_name.Text = string.Empty;
            }
        }
        public void proccess_request()
        {
            if (Request["status"] != null)
            {
                int resumeID = int.Parse(Request["ResumeID"].ToString());

                switch (Request["status"].ToString())
                {
                    case "deleteCareer":
                        {
                            int id = int.Parse(Request["id"].ToString());
                            TBL_Job_Special_careers delete_career = new TBL_Job_Special_careers();
                            delete_career.Special_careers_SP("Delete_career", 0, id);
                            if (Request["from"].ToString() == "insertResume")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
                            }
                            else if (Request["from"].ToString() == "EnabledResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
                            }
                            else if (Request["from"].ToString() == "WaitingResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
                            }
                            else if (Request["from"].ToString() == "DisabledResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
                            }


                            MultiView1.ActiveViewIndex = 1;
                        }
                        break;

                    case "deletelang":
                        {
                            int id = int.Parse(Request["id"].ToString());
                            TBL_Job_Languages delete_language = new TBL_Job_Languages();
                            delete_language.TBL_Job_Languages_SP("delete_language", 0, id);
                            if (Request["from"].ToString() == "insertResume")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
                            }
                            else if (Request["from"].ToString() == "EnabledResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
                            }
                            else if (Request["from"].ToString() == "WaitingResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
                            }
                            else if (Request["from"].ToString() == "DisabledResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
                            }

                            MultiView1.ActiveViewIndex = 1;
                        }
                        break;
                    case "deleteedu":
                        {
                            int id = int.Parse(Request["id"].ToString());
                            TBL_Job_Educations delete_edu = new TBL_Job_Educations();
                            delete_edu.TBL_Job_Educations_SP("delete_Education", 0, id);
                            if (Request["from"].ToString() == "insertResume")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
                            }
                            else if (Request["from"].ToString() == "EnabledResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
                            }
                            else if (Request["from"].ToString() == "WaitingResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
                            }
                            else if (Request["from"].ToString() == "DisabledResumes")
                            {
                                HyperLink_return.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
                            }
                            MultiView1.ActiveViewIndex = 1;
                        }
                        break;
                    case "EditCareer":
                        {
                            int id = int.Parse(Request["id"].ToString());
                            TBL_Job_Special_careers select_a_career = new TBL_Job_Special_careers();
                            DataTable dt;
                            dt = select_a_career.Special_careers_SP("select_a_career", 0, id);
                            if (!Page.IsPostBack)
                            {
                                TextBox_career_name_E.Text = dt.Rows[0]["career_name"].ToString();
                                TextBox_career_duration_E.Text = dt.Rows[0]["career_duration"].ToString();
                                DateTime start = DateTime.Parse(dt.Rows[0]["startTime"].ToString());
                                DropDownList_day_E.Text = start.Day.ToString();
                                DropDownList_month_E.Text = start.Month.ToString();
                                DropDownList_year_E.Text = start.Year.ToString();
                                DateTime finish = DateTime.Parse(dt.Rows[0]["FinishTime"].ToString());
                                DropDownList_day_finish_E.Text = finish.Day.ToString();
                                DropDownList_month_finish_E.Text = finish.Month.ToString();
                                DropDownList_year_finish_E.Text = finish.Year.ToString();


                                TextBox_institute_name_E.Text = dt.Rows[0]["Institute_name"].ToString();
                            }
                            MultiView1.ActiveViewIndex = 2;

                            if (Request["from"].ToString() == "insertResume")
                            {
                                HyperLink_returnFrom_edit_career.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
                            }
                            else if (Request["from"].ToString() == "EnabledResumes")
                            {
                                HyperLink_returnFrom_edit_career.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
                            }
                            else if (Request["from"].ToString() == "WaitingResumes")
                            {
                                HyperLink_returnFrom_edit_career.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
                            }
                            else if (Request["from"].ToString() == "DisabledResumes")
                            {
                                HyperLink_returnFrom_edit_career.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
                            }

                        }
                        break;
                    case "Editlang":
                        {

                            int id = int.Parse(Request["id"].ToString());
                            TBL_Job_Languages select_a_lang = new TBL_Job_Languages();
                            DataTable dt;
                            dt = select_a_lang.TBL_Job_Languages_SP("Select_a_language", 0, id);
                            if (!Page.IsPostBack)
                            {
                                DropDownList_Language_E.Text = dt.Rows[0]["Language_name"].ToString();
                                DropDownList_RandW_Skill_E.Text = dt.Rows[0]["Read_Write_skill"].ToString();
                                DropDownList_SpeakSkill_E.Text = dt.Rows[0]["Speaking_skill"].ToString();
                            }
                            MultiView1.ActiveViewIndex = 3;
                            if (Request["from"].ToString() == "insertResume")
                            {
                                HyperLink_return_from_editLang.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
                            }
                            else if (Request["from"].ToString() == "EnabledResumes")
                            {
                                HyperLink_return_from_editLang.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
                            }
                            else if (Request["from"].ToString() == "WaitingResumes")
                            {
                                HyperLink_return_from_editLang.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
                            }
                            else if (Request["from"].ToString() == "DisabledResumes")
                            {
                                HyperLink_return_from_editLang.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
                            }


                        }
                        break;
                    case "Editedu":
                        {
                            int id = int.Parse(Request["id"].ToString());
                            TBL_Job_Educations select_edu = new TBL_Job_Educations();
                            DataTable dt = new DataTable();
                            dt = select_edu.TBL_Job_Educations_SP("select_a_edu", 0, id);
                            if (!Page.IsPostBack)
                            {
                                TextBox_field_E.Text = dt.Rows[0]["Field"].ToString();
                                DropDownList_Last_doc_E.Text = dt.Rows[0]["Last_document"].ToString();
                                TextBox_country_E.Text = dt.Rows[0]["country"].ToString();
                                TextBox_city_E.Text = dt.Rows[0]["City"].ToString();
                                TextBox_university_E.Text = dt.Rows[0]["University"].ToString();
                                TextBox_average_E.Text = dt.Rows[0]["average"].ToString();
                                //
                                DateTime start = DateTime.Parse(dt.Rows[0]["startDate"].ToString());
                                DropDownList_day_edu_E.Text = start.Day.ToString();
                                DropDownList_month_edu_E.Text = start.Month.ToString();
                                DropDownList_year_edu_E.Text = start.Year.ToString();
                                DateTime finish = DateTime.Parse(dt.Rows[0]["FinishDate"].ToString());
                                DropDownList_day_edu_finish_E.Text = finish.Day.ToString();
                                DropDownList_month_edu_finish_E.Text = finish.Month.ToString();
                                DropDownList_year_edu_finish_E.Text = finish.Year.ToString();
                            }
                            MultiView1.ActiveViewIndex = 4;
                            if (Request["from"].ToString() == "insertResume")
                            {
                                HyperLink_return_from_editEdu.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
                            }
                            else if (Request["from"].ToString() == "EnabledResumes")
                            {
                                HyperLink_return_from_editEdu.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
                            }
                            else if (Request["from"].ToString() == "WaitingResumes")
                            {
                                HyperLink_return_from_editEdu.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
                            }
                            else if (Request["from"].ToString() == "DisabledResumes")
                            {
                                HyperLink_return_from_editEdu.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
                            }
                        }
                        break;
                }



            }
        }

        protected void GridView_career_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void Button_insert_language_Click(object sender, EventArgs e)
        {
            //retriving the id of resume and insert it's related languages 
            if (Request["status"] == "insert")
            {
                int ResumeID = int.Parse(Request["ResumeID"].ToString());
                string Language_name = DropDownList_Language.SelectedItem.Text;
                string Read_Write_skill = DropDownList_RandW_Skill.SelectedItem.Text;
                string Speaking_skill = DropDownList_SpeakSkill.SelectedItem.Text;
                //
                TBL_Job_Languages insert_lang = new TBL_Job_Languages();
                DataTable dt;
                dt = insert_lang.TBL_Job_Languages_SP("Insert_lanquage", Language_name, Read_Write_skill, Speaking_skill, ResumeID);
                //
                DropDownList_Language.SelectedIndex = 0;
                DropDownList_RandW_Skill.SelectedIndex = 0;
                DropDownList_SpeakSkill.SelectedIndex = 0;
            }


        }

        protected void Button_insert_education_Click(object sender, EventArgs e)
        {
            //retriving the id of resume and insert it's related languages  
            if (Request["status"] == "insert")
            {
                int ResumeID = int.Parse(Request["ResumeID"].ToString());
                string Field = TextBox_field.Text;
                string Last_document = DropDownList_Last_doc.SelectedItem.Text;
                string country = TextBox_country.Text;
                string City = TextBox_city.Text;
                string University = TextBox_university.Text;
                double average = double.Parse(TextBox_average.Text);
                DateTime start = DateTime.Parse(DropDownList_month_edu.SelectedItem.Text + "/" + DropDownList_day_edu.SelectedItem.Text + "/" + DropDownList_year_edu.SelectedItem.Text);
                DateTime Finish = DateTime.Parse(DropDownList_month_edu_finish.SelectedItem.Text + "/" + DropDownList_day_edu_finish.SelectedItem.Text + "/" + DropDownList_year_edu_finish.Text);
                //
                TBL_Job_Educations insert_edu = new TBL_Job_Educations();
                insert_edu.TBL_Job_Educations_SP("Insert_education", Field, Last_document, country, City, University, average, start, Finish, ResumeID, 0);
                //
                TextBox_field.Text = string.Empty;
                DropDownList_Last_doc.SelectedIndex = 0;
                TextBox_country.Text = string.Empty;
                TextBox_city.Text = string.Empty;
                TextBox_university.Text = string.Empty;
                TextBox_average.Text = string.Empty;


            }
        }

        protected void Button_update_career_Click(object sender, EventArgs e)
        {
            if (Request["status"].ToString() == "EditCareer")
            {

                int id = int.Parse(Request["id"].ToString());
                string career_name = TextBox_career_name_E.Text.Trim();
                int career_duration = int.Parse(TextBox_career_duration_E.Text);
                DateTime start = DateTime.Parse(DropDownList_month_E.SelectedItem.Text + "/" + DropDownList_day_E.SelectedItem.Text + "/" + DropDownList_year_E.SelectedItem.Text);
                DateTime Finish = DateTime.Parse(DropDownList_month_finish_E.SelectedItem.Text + "/" + DropDownList_day_finish_E.SelectedItem.Text + "/" + DropDownList_year_finish_E.SelectedItem.Text);
                string Institute_name = TextBox_institute_name_E.Text;
                TBL_Job_Special_careers update_career = new TBL_Job_Special_careers();
                update_career.Special_careers_SP("Update_Career", career_name, career_duration, start, Finish, Institute_name, 0, id);
                //return to main page
                MultiView1.ActiveViewIndex = 5;
                int resumeID = int.Parse(Request["ResumeID"].ToString());
                if (Request["from"].ToString() == "insertResume")
                {
                    HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
                }
                else if (Request["from"].ToString() == "EnabledResumes")
                {
                    HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
                }
                else if (Request["from"].ToString() == "WaitingResumes")
                {
                    HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
                }
                else if (Request["from"].ToString() == "DisabledResumes")
                {
                    HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
                }


            }

        }

        protected void Button_update_lang_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request["id"].ToString());
            string Language_name = DropDownList_Language_E.SelectedItem.Text;
            string Read_Write_skill = DropDownList_RandW_Skill_E.SelectedItem.Text;
            string Speaking_skill = DropDownList_SpeakSkill_E.SelectedItem.Text;
            TBL_Job_Languages update_lang = new TBL_Job_Languages();
            update_lang.TBL_Job_Languages_SP("update_language", Language_name, Read_Write_skill, Speaking_skill, 0, id);
            //return to main page
            MultiView1.ActiveViewIndex = 5;
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            if (Request["from"].ToString() == "insertResume")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
            }
            else if (Request["from"].ToString() == "EnabledResumes")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
            }
            else if (Request["from"].ToString() == "WaitingResumes")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
            }
            else if (Request["from"].ToString() == "DisabledResumes")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
            }


        }

        protected void Button_update_edu_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request["id"].ToString());
            string Field = TextBox_field_E.Text;
            string Last_document = DropDownList_Last_doc_E.SelectedItem.Text;
            string country = TextBox_country_E.Text;
            string City = TextBox_city_E.Text;
            string University = TextBox_university_E.Text;
            double average = double.Parse(TextBox_average_E.Text);
            DateTime start = DateTime.Parse(DropDownList_month_edu_E.SelectedItem.Text + "/" + DropDownList_day_edu_E.SelectedItem.Text + "/" + DropDownList_year_edu_E.SelectedItem.Text);
            DateTime Finish = DateTime.Parse(DropDownList_month_edu_finish_E.SelectedItem.Text + "/" + DropDownList_day_edu_finish_E.SelectedItem.Text + "/" + DropDownList_year_edu_finish_E.Text);

            TBL_Job_Educations updtae_edu = new TBL_Job_Educations();
            updtae_edu.TBL_Job_Educations_SP("update_edu", Field, Last_document, country, City, University, average, start, Finish, 0, id);
            //return to main page
            MultiView1.ActiveViewIndex = 5;
            int resumeID = int.Parse(Request["ResumeID"].ToString());
            if (Request["from"].ToString() == "insertResume")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=insertResume";
            }
            else if (Request["from"].ToString() == "EnabledResumes")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=EnabledResumes";
            }
            else if (Request["from"].ToString() == "WaitingResumes")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=WaitingResumes";
            }
            else if (Request["from"].ToString() == "DisabledResumes")
            {
                HyperLink_returnFrom_edit.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + resumeID + "&status=insert&from=DisabledResumes";
            }
        }
        public string GetfarsiDate(object date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }


    }
}

 


  