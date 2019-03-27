using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_WEB.DAL;
using System.Data;
using phasco_webproject.BaseClass;
using System.Threading;
using System.Globalization;
using System.Web.UI.HtmlControls;
using Membership_Manage;
using DataAccessLayer;

namespace Rahbina.Job
{
    public partial class DisabledResumes : System.Web.UI.Page
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
                Getresumes();
                Get_categories();
            }
            //redirecting anonymous users
            if (!UserOnline.User_Online_Valid())
            {
                Response.Redirect("~/Default.aspx");
            }
        }
        protected void Getresumes()
        {
            if (Request["id"] == null)
            {
                //Don't worry ! I just showing some greasy information about Diabled resumes :
                int UserID =  UserOnline.id();
                TBL_Job_Resume Enabled_Resume_Summary = new TBL_Job_Resume();
                DataTable dt;
                dt = Enabled_Resume_Summary.TBL_Job_Resume_SP("Disabled_resumes_summary", UserID, 2);
                GridView_Enabeled_resumes.DataSource = dt;
                GridView_Enabeled_resumes.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
            else if (Request["id"] != null)
            {

                int id = int.Parse(Request["id"].ToString());
                int categoryID = int.Parse(Request["CategoryID"].ToString());
                MultiView1.ActiveViewIndex = 1;
                TBL_Job_Resume Enabled_Resume_Summary = new TBL_Job_Resume();
                DataTable dt;
                dt = Enabled_Resume_Summary.TBL_Job_Resume_SP_2("Enabled_resumes_Details", id, categoryID);
                TextBox_Subject.Text = dt.Rows[0]["ResumeSubject"].ToString();
                TextBox_nationalNumber.Text = dt.Rows[0]["NationalNum"].ToString();
                DropDownList_servis.SelectedItem.Text = dt.Rows[0]["serviceStatus"].ToString();
                TextBox_phone.Text = dt.Rows[0]["phone"].ToString();
                TextBox_mobile.Text = dt.Rows[0]["mobile"].ToString();
                DropDownList_JobStatus.Text = dt.Rows[0]["JobStatus"].ToString();
                DropDownList_EducationStatus.Text = dt.Rows[0]["EducationStatus"].ToString();
                DropDownList_ExpireTime.Text = dt.Rows[0]["ExpirationTime"].ToString();
                DropDownList_category.Text = Get_CategoryName(int.Parse(dt.Rows[0]["CategoryID"].ToString()));
                DropDownList_category.SelectedValue = dt.Rows[0]["CategoryID"].ToString();

                //here i am trying to get all subcategories of this category:
                Get_SubCategoris(categoryID);
                // and now is the time of specifying subCategory of this user:
                DropDownList_Subcategory.Text = Get_CategoryName(int.Parse(dt.Rows[0]["CategoryID_Sub"].ToString()));
                DropDownList_Subcategory.SelectedValue = dt.Rows[0]["CategoryID_Sub"].ToString();

                //
                DropDownList_CoOperate_Condition.Text = dt.Rows[0]["CoOperate_Condition"].ToString();
                TextBox_Requested_Wage.Text = dt.Rows[0]["Requested_Wage"].ToString();
                TextBox_pro_abilities.Text = dt.Rows[0]["pro_abilities"].ToString();

                TextBox_Explantion.Text = dt.Rows[0]["Explantion"].ToString();

                //
               HyperLink_Disabled_to_complete.NavigateUrl = "~/job/Complete_resume.aspx?ResumeID=" + id + "&status=insert&from=DisabledResumes";



            }
        }
        protected void Get_categories()
        {
            TBL_Job_Category categories = new TBL_Job_Category();
            DataTable dt = new DataTable();
            dt = categories.Select_categories("Select_categories");
            DropDownList_category.DataSource = dt;
            DropDownList_category.DataBind();
        }
        protected void Get_SubCategoris(int categoryID)
        {
            TBL_Job_Category SubCategories = new TBL_Job_Category();
            DataTable dt;
            dt = SubCategories.Select_categories("Select_subcategories", categoryID);
            Label1.Text = dt.Rows.Count.ToString();
            DropDownList_Subcategory.DataSource = dt;

            DropDownList_Subcategory.DataBind();
        }
        public string Get_CategoryName(int CategoryID)
        {
            TBL_Job_Category Category_name = new TBL_Job_Category();
            DataTable dt;
            dt = Category_name.Select_categories("Get_category_name", CategoryID);
            return dt.Rows[0]["CategoryName"].ToString();

        }

        public string GetfarsiDate(object date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        public string Set_URL(object id, object CategoryID)
        {
            return "~/Job/DisabledResumes.aspx?id=" + id.ToString() + "&CategoryID=" + CategoryID.ToString();
        }

        protected void Button_update_resume_Click(object sender, EventArgs e)
        {
            //getting update date and calculating expiration date :
            DateTime insertDate = DateTime.Now;
            int expirationTime = int.Parse(DropDownList_ExpireTime.SelectedItem.Text);//The time interval between update and expiration
            DateTime ExpirationDate = insertDate.AddDays(expirationTime);
            //getting the id of urrent user
            int UserID =  UserOnline.id();

            //getting Resume information:
            int id = int.Parse(Request["id"].ToString());
            string ResumeSubject = TextBox_Subject.Text.Trim();
            string NationalNum = TextBox_nationalNumber.Text;
            string serviceStatus = DropDownList_servis.SelectedItem.Text;
            string Phone = TextBox_phone.Text;
            string mobile = TextBox_mobile.Text;
            string JobStatus = DropDownList_JobStatus.SelectedItem.Text;
            string EducationStatus = DropDownList_EducationStatus.SelectedItem.Text;
            int CategoryID = int.Parse(DropDownList_category.SelectedValue);
            int CategoryID_Sub = int.Parse(DropDownList_Subcategory.SelectedValue);
            string CoOperate_Condition = DropDownList_CoOperate_Condition.SelectedItem.Text;
            string Requested_Wage = TextBox_Requested_Wage.Text.Trim();
            string pro_abilities = TextBox_pro_abilities.Text;
            string Explantion = TextBox_Explantion.Text.Trim();


            //updating entered information to TBL_Job_Resume table which belongs to rahbina SQL database

            TBL_Job_Resume update_resume = new TBL_Job_Resume();
            DataTable dt;

            dt = update_resume.TBL_Job_Resume_SP("Update_Disabled_Resume", ResumeSubject, NationalNum, serviceStatus, Phone, mobile, JobStatus, EducationStatus, expirationTime, insertDate, ExpirationDate, UserID, CategoryID, CategoryID_Sub, Explantion, 2, id, CoOperate_Condition, pro_abilities, Requested_Wage);
            MultiView1.ActiveViewIndex = 2;
        }

        protected void DropDownList_category_SelectedIndexChanged(object sender, EventArgs e)
        {

            int categoryID = int.Parse(DropDownList_category.SelectedValue);
            TBL_Job_Category SubCategories = new TBL_Job_Category();
            DataTable dt;
            dt = SubCategories.Select_categories("Select_subcategories", categoryID);
            Label1.Text = dt.Rows.Count.ToString();
            DropDownList_Subcategory.DataSource = dt;

            DropDownList_Subcategory.DataBind();
        }
    }
}
