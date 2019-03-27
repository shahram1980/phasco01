using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Threading;
using System.Globalization;
using System.Web.UI.HtmlControls;
using DataAccessLayer;
using DataAccessLayer.Users;

namespace Rahbina.Job
{
    public partial class SearchResumes : System.Web.UI.Page
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
        TBL_User_Profile User_P = new TBL_User_Profile();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { Get_categories(); proccessrequest(); }
        }

        public string Images(int Image, int id, int sex)
        {
            if (Image == 1) return "/phascoupfile/Userphoto/" + id.ToString() + ".jpg";
            if (sex == 0) return "/phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "/phascoupfile/Userphoto/Nopic_female.jpg";
            return "/phascoupfile/Userphoto/Nopic_female.jpg";
        }

        protected void Get_categories()
        {
            TBL_Job_Category categories = new TBL_Job_Category();
            DataTable dt = new DataTable();
            dt = categories.Select_categories("Select_categories");
            DropDownList_job_title.DataSource = dt;
            DropDownList_job_title.DataBind();
        }
        public void proccessrequest()
        {
            if (Request["ResumeID"] == null)
            {
                if (Request["from"].ToString() == "search")
                    MultiView1.ActiveViewIndex = 0;
                else if (Request["from"].ToString() == "home")
                {
                    MultiView1.ActiveViewIndex = 2;
                    //getting recent resumes
                    TBL_Job_Resume Newest_resumes = new TBL_Job_Resume();
                    DataTable dt_resume = Newest_resumes.TBL_Job_Resume_SP("Newest_resumes");
                    RTP_NewestResume.DataSource = dt_resume;
                    RTP_NewestResume.DataBind();
                }
            }
            else if (Request["ResumeID"] != null)
            {
                int ResumeID = int.Parse(Request["ResumeID"].ToString());

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
                int id = int.Parse(dt.Rows[0]["Userid"].ToString());
                //
                //getting additional information of Resume
                getCareers(ResumeID);
                getLanguages(ResumeID);
                getEdu(ResumeID);
                //
                if (Request["from"].ToString() == "home")
                { HyperLink_returnFromDetails.NavigateUrl = "~/employer/SearchResumes.aspx?from==home"; }
                else if (Request["from"].ToString() == "search")
                { HyperLink_returnFromDetails.NavigateUrl = "~/employer/SearchResumes.aspx?from==home"; }

                //--- Set Profile info
                DataTable dtt;
                dtt = User_P.Users_Profile_Tra_DT("Select_Item", id, "", "", "", "", "", "", "", DateTime.Now);
                if (dtt.Rows.Count > 0)
                {
                    Label_Citty.Text = dtt.Rows[0]["City"].ToString();
                    Label_Maghata.Text = dtt.Rows[0]["Maghata"].ToString();
                    Label_Reshte.Text = dtt.Rows[0]["Reshte"].ToString();
                    Label_Point.Text = dtt.Rows[0]["Point"].ToString();
                    Label_Uid.Text = dtt.Rows[0]["Uid"].ToString();
                    Label_Name.Text = dtt.Rows[0]["name"].ToString();

                    DateTime dtm;
                    dtm = Convert.ToDateTime(dtt.Rows[0]["BirthDay"].ToString());
                    Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

                    Label_Birth.Text = sunDate.Weekday.ToString();

                    if (dtt.Rows[0]["Image"].ToString() == "0") Image_User_Photo.ImageUrl = "~//phascoupfile//Userphoto//Nopic.jpg";
                    if (dtt.Rows[0]["Image"].ToString() == "1") Image_User_Photo.ImageUrl = "~//phascoupfile//Userphoto//" + dtt.Rows[0]["id"].ToString() + ".jpg";
                    if (dtt.Rows[0]["Sex"].ToString() == "1") Label_Sex.Text = "زن";
                    if (dtt.Rows[0]["Sex"].ToString() == "0") Label_Sex.Text = "مرد";
                }
                //--- Set Profile info
            }
            //else   if (Request["from"] == "Resume_Details" && Request["ResumeID"] != null)
            //   {
            //       MultiView1.ActiveViewIndex = 2;
            //   }
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
            HiddenField_Category.Value = DropDownList_job_title.Text;
            HiddenField_sub_category.Value = DropDownList_specialty.Text;

        }

        protected void Button_search_Click(object sender, EventArgs e)
        {
            int CategoryID = int.Parse(DropDownList_job_title.SelectedValue);
            int CategoryID_Sub = int.Parse(DropDownList_specialty.SelectedValue);
            string education = DropDownList_EducationStatus.SelectedItem.Text.Trim();
            string service = DropDownList_servis.SelectedItem.Text.Trim();
            string jobStatuse = DropDownList_JobStatus.SelectedItem.Text.Trim();

            //
            //setting search condition
            StringBuilder condition = new StringBuilder();
            condition.Append("Enabaled=1 and CategoryID =" + CategoryID + " and CategoryID_Sub =" + CategoryID_Sub);//

            if (education != "مهم نيست")
            { condition.Append("and EducationStatus like '%" + education + "%'"); }
            if (service != "مهم نيست")
            { condition.Append("and serviceStatus like '%" + service + "%'"); }
            if (jobStatuse != "مهم نيست")
            { condition.Append("and JobStatus like '%" + jobStatuse + "%'"); }


            //
            TBL_Job_Resume search_resumes = new TBL_Job_Resume();
            DataTable dt = search_resumes.TBL_Job_Resume_SP("search_resumes", condition.ToString());
            //bindig result of search to gridview
            GridView_search_result.DataSource = dt;
            GridView_search_result.DataBind();
            MultiView1.ActiveViewIndex = 0;
            if (dt.Rows.Count == 0)
            { Label_search_report.Text = "جستجوي شما نتيجه اي در بر نداشت"; }
            else
            {
                HiddenField_codition.Value = condition.ToString();
                Label_search_report.Text = " [ " + dt.Rows.Count.ToString() + " ]" + "مورد يافت شد  ";
            }
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
            { return "نا مشخص"; }
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

        protected void LinkButton_return_Click(object sender, EventArgs e)
        {

        }

    }
}
