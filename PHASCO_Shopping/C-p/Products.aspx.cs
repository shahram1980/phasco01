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
using System.Threading;
using System.Globalization;
using PHASCO_Shopping.BLL;

namespace PHASCO_Shopping.C_p
{
    public partial class Products : System.Web.UI.Page
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

            if (Request.QueryString["paging"] != null)
            {
                int startRowIndex = 0;
                int paging = int.Parse(Request.QueryString["paging"].ToString());
                paging = paging - 1;
                startRowIndex = DataPager1.PageSize * paging;

                DataPager1.SetPageProperties(startRowIndex, DataPager1.PageSize, true);
            }
            ListViewBind();


        }

        protected void ListViewBind()
        {
            try
            {
                int uid = int.Parse(Request.QueryString["uid"].ToString());

                Tbl_Products da = new Tbl_Products();
                DataTable dt = da.Tbl_Products_Tra(0, "Select_other_p", uid, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            catch (Exception)
            { }

        }

 
    }
}
