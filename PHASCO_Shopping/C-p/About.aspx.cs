using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using PHASCO_Shopping.BLL;
using System.Threading;
using System.Globalization;

namespace PHASCO_Shopping.C_p
{
    public partial class About : System.Web.UI.Page
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
                this.Page.Culture = "fa-ir";
                this.Page.UICulture = "fa-ir";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Set_Company_Card();
        }
        void Set_Company_Card()
        {
            int uid = int.Parse(Request.QueryString["uid"].ToString());
            TBL_Company_Profile da_co = new TBL_Company_Profile();
            DataTable dt = da_co.TBL_Company_Profile_Tra(0, "select_item", uid, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "");

            if(dt.Rows.Count <= 0)
            { Label_Alarm.Visible = true;
            Panel_Co_Detiels.Visible = false;
                Label_Alarm.Text = Resources.Resource.Not_incoming_Company_Information; 
                return; }
            Label_year_Established.Text = dt.Rows[0]["year_Established"].ToString();
            Label_registered_capital.Text = dt.Rows[0]["registered_capital"].ToString();
            Label_annual_sales.Text = dt.Rows[0]["annual_sales"].ToString();
            Label_Total_Staff.Text = dt.Rows[0]["Total_Staff"].ToString();
            Label_Main_Products_or_Services.Text = dt.Rows[0]["Services"].ToString();
            Label_Main_Markets.Text = dt.Rows[0]["Main_Markets"].ToString();
            Label_Alarm.Visible = false;
            Panel_Co_Detiels.Visible = true;

        }
    }


}
