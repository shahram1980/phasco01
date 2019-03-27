using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;
using PHASCO_Shopping.BLL;
using System.Data;
using Membership_Manage;

namespace PHASCO_Shopping.MyPHASCO_Shopping
{
 
    public partial class Contact : System.Web.UI.Page
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

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            da.TBL_Contact_SP(1, 0, UserOnline.id(), TextBox_teloffice1.Text, TextBox_teloffice2.Text, TextBox_teloffice3.Text, TextBox_teloffice4.Text, TextBox_teloffice5.Text
                , TextBox_faxoffice1.Text, TextBox_faxoffice2.Text, TextBox_faxoffice3.Text, TextBox_Email_Support.Text, TextBox_Email_Sales.Text, TextBox_Email_Manager.Text, TextBox_Address1.Text
                , TextBox_Address2.Text, TextBox_website.Text, TextBox_zipcode.Text, TextBox_Description.Text);
                
        }

        void Set_Page()
        {

            dt = da.TBL_Contact_SP(2, 0, UserOnline.id());
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


        public int UseOnlive { get; set; }
    }
}