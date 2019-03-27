using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Membership_Manage;
using System.Data;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class Jobs : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid())
            {
                HyperLink_enabled.Enabled = HyperLink_insert.Enabled = HyperLink_expired.Enabled = HyperLink_waiting.Enabled
                    = HyperLink_CompanyInfo.Enabled = HyperLink_employment.Enabled = HyperLink_Waiting_employmentAD.Enabled =
                    HyperLink_Enabled_employmentAD.Enabled = HyperLink_Disabled_EmploymentAD.Enabled = false;
                Lbl_Not_Login.Text = "&nbsp;&#1576;&#1575;&#1586;&#1583;&#1740;&#1583; &#1705;&#1606;&#1606;&#1583;&#1607; &#1605;&#1581;&#1578;&#1585;&#1605; &#1576;&#1607; &#1583;&#1604;&#1740;&#1604; &#1575;&#1740;&#1606;&#1705;&#1607; &#1588;&#1605;&#1575; &#1583;&#1585; &#1587;&#1575;&#1740;&#1578; &#1604;&#1575;&#1711;&#1740;&#1606; &#1606;&#1705;&#1585;&#1583;&#1607; &#1575;&#1740;&#1583; &#1578;&#1606;&#1607;&#1575; &#1602;&#1575;&#1583;&#1585; &#1576;&#1607; &#1580;&#1587;&#1578;&#1580;&#1608; &#1607;&#1587;&#1578;&#1740;&#1583; .<br>&nbsp;. &#1583;&#1585; &#1589;&#1608;&#1585;&#1578;&#1740; &#1705;&#1607; &#1605;&#1740; &#1582;&#1608;&#1575;&#1607;&#1740;&#1583; &#1575;&#1586; &#1575;&#1605;&#1705;&#1575;&#1606;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604; &#1575;&#1740;&#1606; &#1576;&#1582;&#1588; &#1575;&#1587;&#1601;&#1575;&#1583;&#1607; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583; &#1604;&#1591;&#1601;&#1575; &#1583;&#1585; &#1587;&#1575;&#1740;&#1578; &#1604;&#1575;&#1711;&#1740;&#1606; &#1606;&#1605;&#1575;&#1740;&#1583;.<a href='/Register.aspx'> &#1575;&#1711;&#1585; &#1579;&#1576;&#1578; &#1606;&#1575;&#1605; &#1606;&#1705;&#1585;&#1583;&#1607; &#1575;&#1740;&#1583; &#1575;&#1586; &#1575;&#1740;&#1606;&#1580;&#1575; &#1605;&#1740; &#1578;&#1608;&#1575;&#1606;&#1740;&#1583; &#1579;&#1576;&#1578; &#1606;&#1575;&#1605; &#1705;&#1606;&#1740;&#1583;</a>";
                Wrap_Not_Login.Visible = true;

            }
            else
            {
                HyperLink_enabled.Enabled = HyperLink_insert.Enabled = HyperLink_expired.Enabled = HyperLink_waiting.Enabled
                       = HyperLink_CompanyInfo.Enabled = HyperLink_employment.Enabled = HyperLink_Waiting_employmentAD.Enabled =
                       HyperLink_Enabled_employmentAD.Enabled = HyperLink_Disabled_EmploymentAD.Enabled = true;

                Wrap_Not_Login.Visible = false;
            }

            if (!IsPostBack) { Bind_NewJob(); Bind_employmen(); }
        }


        protected void Bind_NewJob()
        {
            TBL_Job_Resume Newest_resumes = new TBL_Job_Resume();
            RTP_NewestResume.DataSource = Newest_resumes.TBL_Job_Resume_SP("Newest_resumes"); ;
            RTP_NewestResume.DataBind();
        }

        protected void Bind_employmen()
        {
            TBL_Job_employment Newest_resumes = new TBL_Job_employment();
            Repeater_employmen.DataSource = Newest_resumes.TBL_Job_employment_SP("Newest_Ads"); ;
            Repeater_employmen.DataBind();
        }


        public string get_category_name(object id)
        {
            if (int.Parse(id.ToString()) == 0) return "";
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

        public string Images(int Image, int id, int sex)
        {

            if (Image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + id.ToString() + ".jpg";

            if (sex == 0) return "http://phasco.com/phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg";
            return "http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg";

        }

    }
}