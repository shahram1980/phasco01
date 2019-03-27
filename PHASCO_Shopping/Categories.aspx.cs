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
namespace PHASCO_Shopping
{
    public partial class Categories : System.Web.UI.Page
    {
        TBL_Categories DaCat = new TBL_Categories();
        //TBL_AdminUsers adminUser = new TBL_AdminUsers();
        DataTable dt;
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
            if (!IsPostBack) Bind_Grd();
        }
        void Bind_Grd()
        {
            int id = int.Parse(Request.QueryString["sid"].ToString());
            dt = DaCat.TBL_Categories_Tra(0, "select", id, "", "", "", 0);
            DataList_Cat.DataSource = dt;
            DataList_Cat.DataBind();
            Set_Url();
            Bind_SubCat();
        }

        void Set_Url()
        {

            int id = int.Parse(Request.QueryString["sid"].ToString());
            dt = DaCat.TBL_Categories_Tra(id, "select_Path");
            Label_Nav.Text = "<a href='Default.aspx' >" + Resources.Resource.Home + "</a> > " + dt.Rows[0][Resources.Resource.F_Subject2] + " > " + dt.Rows[0][Resources.Resource.F_Subject];
            Current_Cat.Text = dt.Rows[0][Resources.Resource.F_Subject2].ToString();
        }

        void Bind_SubCat()
        {
            int id = int.Parse(Request.QueryString["sid"].ToString());
            dt = DaCat.TBL_Categories_Tra(id, "select_up", 0, "", "", "", 0);
            DataList_UpCat.DataSource = dt;
            DataList_UpCat.DataBind();
            Set_Url();
        }
    }
}