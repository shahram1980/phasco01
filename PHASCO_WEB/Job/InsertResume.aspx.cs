using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using phasco_webproject.BaseClass;
using System.Globalization;
using System.Threading;
using System.Web.UI.HtmlControls;
using Membership_Manage;
using DataAccessLayer;

namespace Rahbina.Job
{
    public partial class InsertResume : System.Web.UI.Page
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
                MultiView1.ActiveViewIndex = 0;
             
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
            DropDownList_category.DataSource = dt;
            DropDownList_category.DataBind();
        }

        protected void DropDownList_category_SelectedIndexChanged(object sender, EventArgs e)
        {

            int categoryID = int.Parse(DropDownList_category.SelectedValue);
            TBL_Job_Category SubCategories = new TBL_Job_Category();
            DataTable dt;
            dt = SubCategories.Select_categories("Select_subcategories", categoryID);
  
            DropDownList_Subcategory.DataSource = dt;

            DropDownList_Subcategory.DataBind();



        }

        protected void DropDownList_category_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button_insert_resume_Click(object sender, EventArgs e)
        {
            //getting insertion date and calculating expiration date :
            DateTime insertDate = DateTime.Now;
            int expirationTime = int.Parse(DropDownList_ExpireTime.SelectedItem.Text);//The time interval between insertion and expiration
            DateTime ExpirationDate = insertDate.AddDays(expirationTime);

            //getting the id of urrent user
            int UserID = UserOnline.id();

            //getting Resume information:
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
            string pro_abilities = TextBox_pro_abilities.Text.Trim();
            string Requested_Wage = TextBox_Requested_Wage.Text.Trim();
            string Explantion = TextBox_Explantion.Text.Trim();
            int Enabaled = 0;



            //inserting entered information to TBL_Job_Resume table which belongs to rahbina SQL database

            TBL_Job_Resume insert_resume = new TBL_Job_Resume();
            DataTable dt;
       
            dt = insert_resume.TBL_Job_Resume_SP("Insert_Resume", ResumeSubject, NationalNum, serviceStatus, Phone, mobile, JobStatus, EducationStatus,
                expirationTime, insertDate, ExpirationDate, UserID, CategoryID, CategoryID_Sub, Explantion, Enabaled, 0, CoOperate_Condition, pro_abilities, Requested_Wage);
            //
            int id = int.Parse(dt.Rows[0]["id"].ToString());

            Page.Title = id.ToString();
            Response.Redirect("~/job/Complete_resume.aspx?ResumeID=" + id + "&status=insert&from=insertResume");


        }
     

      

    }
}