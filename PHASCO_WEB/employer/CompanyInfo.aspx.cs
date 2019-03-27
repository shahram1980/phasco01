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

namespace Rahbina.Job
{
    public partial class JobCapacity : System.Web.UI.Page
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
                setDate();
                if (check_profile_exist())
                {
                    MultiView1.ActiveViewIndex = 0;
                    get_profile();

                }
                else if (!check_profile_exist())
                {
                    MultiView1.ActiveViewIndex = 0;
                    Button_update_CoInfo.Visible = false;
                    Button_insert_CoInfo.Visible = true;
                }
            }
            if (!UserOnline.User_Online_Valid()) { Response.Redirect("~/Default.aspx"); }
        }
        public bool check_profile_exist()
        {
            //here i am trying to get userID to findout if this user once registered a profile as an employer
            int userID = UserOnline.id();
            TBL_Job_CompanyInfo User_has_profile = new TBL_Job_CompanyInfo();
            DataTable dt = User_has_profile.TBL_Job_CompanyInfo_SP("User_has_profile", userID);
            if (dt.Rows.Count > 0) return true;
            else return false;
        }
        #region Edit
        protected void Button_update_CoInfo_Click(object sender, EventArgs e)
        {
            string CName = TextBox_coname.Text;
            string coType = DropDownList_coType.SelectedItem.Text;
            int institutionYear = int.Parse(DropDownList_year.SelectedItem.Text);
            string RegisterNO = TextBox_regNo.Text;
            string ActivityScope = TextBox_ActivityScope.Text;
            string High_resp_name = TextBox_High_resp_name.Text;
            string High_resp_Role = TextBox_High_resp_Role.Text;
            string Link_person_name = TextBox_Link_person_name.Text;
            string Link_person_role = TextBox_Link_person_role.Text;
            string _State = DropDownList_state.SelectedValue;
            string City = DropDownList_city.SelectedValue; ;
            string _address = TextBox_address.Text;
            string postalCode = TextBox_postalcode.Text;
            string postalBox = TextBox_postal_box.Text;
            string phone = TextBox_phone.Text;
            string mobile = TextBox_mobile.Text;
            string fax = TextBox_fax.Text;
            string email = TextBox_email.Text;
            string web = "http://" + TextBox_web.Text;
            string duty = TextBox_duty.Text;
            string PublicInfo = TextBox_public_info.Text;
            string vision = TextBox_vision.Text;
            int MenNo = int.Parse(TextBox_men.Text);
            int womenNo = int.Parse(TextBox_women.Text);
            int DrNo = int.Parse(TextBox_Dr.Text);
            int postLicence = int.Parse(TextBox_post_lisans.Text);
            int Licence = int.Parse(TextBox_post_lisans.Text);
            int postDiploma = int.Parse(TextBox_Post_diploma.Text);
            int Diploma = int.Parse(TextBox_diploma.Text);
            int underDiploma = int.Parse(TextBox_under_diploma.Text);
            int stockholderNo = int.Parse(TextBox_stockholders.Text);
            string ownershipType = DropDownList_ownershipType.SelectedItem.Text;
            string usage = TextBox_usage.Text;
            int branchNo = int.Parse(TextBox_branch.Text);
            string unionName = TextBox_union.Text;
            int userID = UserOnline.id();
            //
            TBL_Job_CompanyInfo insert_Co_Info = new TBL_Job_CompanyInfo();
            insert_Co_Info.TBL_Job_CompanyInfo_SP("update_company_Info", 0, CName, coType, institutionYear, RegisterNO, ActivityScope,
                                                 High_resp_name, High_resp_Role, Link_person_name, Link_person_role, _State, City, _address,
                                                 postalCode, postalBox, phone, mobile, fax, email, web, duty, PublicInfo, vision, MenNo, womenNo, DrNo,
                                                 postLicence, Licence, postDiploma, Diploma, underDiploma, stockholderNo,
                                                 ownershipType, usage, branchNo, unionName, userID);

            MultiView1.ActiveViewIndex = 1;
            label_continue.Text = "تغييرات شما با موفقيت اعمال شد";
        }

        public void get_profile()
        {
            int userID = UserOnline.id();
            TBL_Job_CompanyInfo get_profile = new TBL_Job_CompanyInfo();
            DataTable dt = get_profile.TBL_Job_CompanyInfo_SP("get_profile", userID);
            TextBox_coname.Text = dt.Rows[0]["CName"].ToString();
            DropDownList_coType.Text = dt.Rows[0]["CoType"].ToString();
            DropDownList_year.Text = dt.Rows[0]["institutionYear"].ToString();

            TextBox_regNo.Text = dt.Rows[0]["RegisterNO"].ToString();
            TextBox_ActivityScope.Text = dt.Rows[0]["ActivityScope"].ToString();
            TextBox_High_resp_name.Text = dt.Rows[0]["High_resp_name"].ToString();
            TextBox_High_resp_Role.Text = dt.Rows[0]["High_resp_Role"].ToString();
            TextBox_Link_person_name.Text = dt.Rows[0]["Link_person_name"].ToString();
            TextBox_Link_person_role.Text = dt.Rows[0]["Link_person_role"].ToString();
            DropDownList_state.SelectedValue = dt.Rows[0]["_State"].ToString();
            //
            //binding city mity
            set_City();

            DropDownList_city.SelectedValue = dt.Rows[0]["City"].ToString();

            TextBox_address.Text = dt.Rows[0]["_address"].ToString();
            TextBox_postalcode.Text = dt.Rows[0]["postalCode"].ToString();
            TextBox_postal_box.Text = dt.Rows[0]["postalBox"].ToString();
            TextBox_phone.Text = dt.Rows[0]["phone"].ToString();
            TextBox_mobile.Text = dt.Rows[0]["mobile"].ToString();
            TextBox_fax.Text = dt.Rows[0]["fax"].ToString();
            TextBox_email.Text = dt.Rows[0]["email"].ToString();
            TextBox_web.Text = dt.Rows[0]["web"].ToString();
            TextBox_duty.Text = dt.Rows[0]["duty"].ToString();
            TextBox_vision.Text = dt.Rows[0]["vision"].ToString();
            TextBox_public_info.Text = dt.Rows[0]["PublicInfo"].ToString();
            TextBox_men.Text = dt.Rows[0]["MenNo"].ToString();
            TextBox_women.Text = dt.Rows[0]["womenNo"].ToString();
            TextBox_Dr.Text = dt.Rows[0]["DrNo"].ToString();
            TextBox_post_lisans.Text = dt.Rows[0]["postLicence"].ToString();
            TextBox_lisans.Text = dt.Rows[0]["Licence"].ToString();
            TextBox_Post_diploma.Text = dt.Rows[0]["postDiploma"].ToString();
            TextBox_diploma.Text = dt.Rows[0]["Diploma"].ToString();
            TextBox_under_diploma.Text = dt.Rows[0]["underDiploma"].ToString();
            TextBox_stockholders.Text = dt.Rows[0]["stockholderNo"].ToString();
            DropDownList_ownershipType.Text = dt.Rows[0]["ownershipType"].ToString();
            TextBox_usage.Text = dt.Rows[0]["usage"].ToString();
            TextBox_branch.Text = dt.Rows[0]["branchNo"].ToString();
            TextBox_union.Text = dt.Rows[0]["unionName"].ToString();


            Button_update_CoInfo.Visible = true;
            Button_insert_CoInfo.Visible = false;
        }
        #endregion
        public void setDate()
        {
            //seting year/////////////////////////////
            List<string> years = new List<string>();
            //int year = PersianDate.Now.Year;
            int year = DateTime.Now.Year;
            for (int i = year; i > 1308; i--)
                years.Add(i.ToString());

            DropDownList_year.DataSource = years;
            DropDownList_year.DataBind();

        }
        protected void DropDownList_state_SelectedIndexChanged(object sender, EventArgs e)
        { set_City(); }
        void set_City()
        {
            int state = int.Parse(DropDownList_state.SelectedValue.ToString());
            dt = da_s.T_state_Tra("select",0,"",state,"");
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
        protected void Button_insert_CoInfo_Click(object sender, EventArgs e)
        {
            string CName = TextBox_coname.Text;
            string coType = DropDownList_coType.SelectedItem.Text;
            int institutionYear = int.Parse(DropDownList_year.SelectedItem.Text);
            string RegisterNO = TextBox_regNo.Text;
            string ActivityScope = TextBox_ActivityScope.Text;
            string High_resp_name = TextBox_High_resp_name.Text;
            string High_resp_Role = TextBox_High_resp_Role.Text;
            string Link_person_name = TextBox_Link_person_name.Text;
            string Link_person_role = TextBox_Link_person_role.Text;
            string _State = DropDownList_state.SelectedValue;
            string City = DropDownList_city.SelectedValue;
            string _address = TextBox_address.Text;
            string postalCode = TextBox_postalcode.Text;
            string postalBox = TextBox_postal_box.Text;
            string phone = TextBox_phone.Text;
            string mobile = TextBox_mobile.Text;
            string fax = TextBox_fax.Text;
            string email = TextBox_email.Text;
            string web = "http://" + TextBox_web.Text;
            string duty = TextBox_duty.Text;
            string PublicInfo = TextBox_public_info.Text;
            string vision = TextBox_vision.Text;
            int MenNo = int.Parse(TextBox_men.Text);
            int womenNo = int.Parse(TextBox_women.Text);
            int DrNo = int.Parse(TextBox_Dr.Text);
            int postLicence = int.Parse(TextBox_post_lisans.Text);
            int Licence = int.Parse(TextBox_post_lisans.Text);
            int postDiploma = int.Parse(TextBox_Post_diploma.Text);
            int Diploma = int.Parse(TextBox_diploma.Text);
            int underDiploma = int.Parse(TextBox_under_diploma.Text);
            int stockholderNo = int.Parse(TextBox_stockholders.Text);
            string ownershipType = DropDownList_ownershipType.SelectedItem.Text;
            string usage = TextBox_usage.Text;
            int branchNo = int.Parse(TextBox_branch.Text);
            string unionName = TextBox_union.Text;
            int userID = UserOnline.id();
            //
            TBL_Job_CompanyInfo insert_Co_Info = new TBL_Job_CompanyInfo();
            insert_Co_Info.TBL_Job_CompanyInfo_SP("insert_company_Info", 0, CName, coType, institutionYear, RegisterNO, ActivityScope,
                                                 High_resp_name, High_resp_Role, Link_person_name, Link_person_role, _State, City, _address,
                                                 postalCode, postalBox, phone, mobile, fax, email, web, duty, PublicInfo, vision, MenNo, womenNo, DrNo,
                                                 postLicence, Licence, postDiploma, Diploma, underDiploma, stockholderNo,
                                                 ownershipType, usage, branchNo, unionName, userID);
            MultiView1.ActiveViewIndex = 1;
            label_continue.Text = "اطلاعات شما با موفقيت درج شد";
        }
    }
}



