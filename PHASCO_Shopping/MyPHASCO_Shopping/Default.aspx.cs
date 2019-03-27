using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.Component;
using System.Threading;
using System.Globalization;
using PHASCO_Shopping.BLL;
using System.Data;
using Membership_Manage;
namespace PHASCO_Shopping.MyPHASCO_Shopping
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    this.Page.Culture = name;
                    this.Page.UICulture = name;
                    Response.Redirect(Request.UrlReferrer.ToString());
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    this.Page.Culture = str2;
                    this.Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) set_properies();
        }

        void set_properies()
        {
            pagetile.InnerText = "My BiztBiz " + UserOnline.Uid();
            Label_Uid.Text = UserOnline.name();
            DataTable dt;
            try
            {
                int ee = UserOnline.id();
                Tbl_Products da = new Tbl_Products();
                dt = da.Tbl_Products_Tra("product_count", UserOnline.id());
                Label_Product_No.Text = dt.Rows[0]["total"].ToString();
            }
            catch (Exception) { Label_Product_No.Text = "0"; }



            TBL_Certification da_ce = new TBL_Certification();
            dt = da_ce.TBL_Certification_Tra(UserOnline.id(), "cer_Count");
            Label_Manage_Certificate_Info.Text = dt.Rows[0]["total"].ToString();



            TBL_Company_Profile da_com = new TBL_Company_Profile();
            dt = da_com.TBL_Company_Profile_Tra(UserOnline.id(), "company_Count");
            if (dt.Rows.Count > 0) Label_certificate_Company_information.Text = Resources.Resource.Posted;
            else
            {
                Label_certificate_Company_information.Text = Resources.Resource.Unposted;
                Label_certificate_Company_information.ForeColor = System.Drawing.Color.Red;
            }


            TBL_Factory_Profile da_fac = new TBL_Factory_Profile();
            dt = da_fac.TBL_Factory_Profile_Tra(UserOnline.id(), "fac_count");
            if (dt.Rows.Count > 0) Label_Factory_Profile.Text = Resources.Resource.Posted;
            else
            {
                Label_Factory_Profile.Text = Resources.Resource.Unposted;
                Label_Factory_Profile.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}