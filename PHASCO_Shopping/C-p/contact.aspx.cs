using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Data;
using System.Threading;
using System.Globalization;

namespace PHASCO_Shopping.C_p
{
    public partial class contact : System.Web.UI.Page
    {
        TBL_Contact da = new TBL_Contact();
        DataTable dt = new DataTable();
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
                    Response.Redirect("Default.aspx");
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
            if (!IsPostBack) Set_Page();
        }

        void Set_Page()
        {
            try
            {
                dt = da.TBL_Contact_SP(2, 0, int.Parse(Request.QueryString["uid"].ToString()));
                if (dt.Rows.Count > 0)
                {
                    TextBox_teloffice1.Text = dt.Rows[0]["teloffice1"].ToString();
                    TextBox_teloffice2.Text = dt.Rows[0]["teloffice2"].ToString();
                    TextBox_teloffice3.Text = dt.Rows[0]["teloffice3"].ToString();
                    TextBox_teloffice4.Text = dt.Rows[0]["teloffice4"].ToString();
                    TextBox_teloffice5.Text = dt.Rows[0]["teloffice5"].ToString();

                    TextBox_faxoffice1.Text = dt.Rows[0]["faxoffice1"].ToString();
                    TextBox_faxoffice2.Text = dt.Rows[0]["faxoffice2"].ToString();
                    TextBox_faxoffice3.Text = dt.Rows[0]["faxoffice3"].ToString();
                    TextBox_Email_Support.Text = dt.Rows[0]["Email_Support"].ToString();
                    TextBox_Email_Sales.Text = dt.Rows[0]["Email_Sales"].ToString();
                    TextBox_Email_Manager.Text = dt.Rows[0]["Email_Manager"].ToString();
                    TextBox_Address1.Text = dt.Rows[0]["Address1"].ToString();
                    TextBox_Address2.Text = dt.Rows[0]["Address2"].ToString();
                    TextBox_website.Text = dt.Rows[0]["website"].ToString();
                    TextBox_zipcode.Text = dt.Rows[0]["zipcode"].ToString();
                    TextBox_Description.Text = dt.Rows[0]["Description"].ToString();
                }
            }
            catch (Exception)
            { }
        }

    }
}