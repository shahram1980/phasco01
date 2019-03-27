using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;
using System.Data;
using PHASCO_Shopping.BLL;
namespace PHASCO_Shopping
{
    public partial class categories_list : System.Web.UI.Page
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
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
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
                int id = int.Parse(Request.QueryString["qid"].ToString());

                Tbl_Products da = new Tbl_Products();
                DataTable dt = da.Tbl_Products_Tra(0, "Select_cat", 0, id, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");


                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            catch (Exception)
            { }

        }
    }
}