using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using PHASCO_Shopping.BLL;
using System.Data;
using System.Threading;
namespace PHASCO_Shopping
{
    public partial class S_p : System.Web.UI.Page
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
                int paging = int.Parse(Request.QueryString["paging"].ToString());
                paging = paging - 1;
            }
            ListViewBind();
        }

        protected void ListViewBind()
        {
            string Cond = "";
            try
            {

                string words = Request.QueryString["w"].ToString();
                string[] split = words.Split(new Char[] { ' ' });
                foreach (string s in split)
                {
                    if (s.Trim() != "")
                        Cond = Cond + "Produc_Name like N'%" + s + "%' Or Product_Keywords like N'%" + s + "%' or ";
                }

                Tbl_Products da = new Tbl_Products();
                DataTable dt = da.Search_Products("s_product", Cond);
                Repeater_Product.DataSource = dt;
                Repeater_Product.DataBind();
            }
            catch (Exception) { }
        }
    }
}