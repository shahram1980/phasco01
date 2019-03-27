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

namespace PHASCO_Shopping.bizpanel
{
    public partial class Help : System.Web.UI.Page
    {
        TBL_Help da = new TBL_Help();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (adminUser.UserValid() == true)
            //{
            //    DataTable dt = new DataTable();
            //    int adminid = Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"]));
            //    dt = adminUser.check_Page(6, adminid, this.Title, 0, null);
            //    if (dt.Rows.Count < 0)
            //        Response.Redirect("AccessDenied.aspx");
            //}
            //else
            //    Response.Redirect("AccessDenied.aspx");

            if (!IsPostBack)
                if (Request.QueryString["status"] != null)
                {
                    if (Request.QueryString["status"].ToString() == "new")
                        MultiView1.ActiveViewIndex = 1;
                    if (Request.QueryString["status"].ToString() == "List")
                        bind_grd();
                    if (Request.QueryString["status"].ToString() == "Edit")
                        Set_deteils();
                }


        }
        void Set_deteils()
        {
            int id = 0;
            if (Request.QueryString["id"] != null)
                id = int.Parse(Request.QueryString["id"].ToString());
            DataTable dt = da.TBL_Help_Tra(id, "select");

            TextBox_title.Text = dt.Rows[0]["Title"].ToString();
            TextBox_Body_en.Text = dt.Rows[0]["Body_en"].ToString();
            TextBox_Body_fa.Text = dt.Rows[0]["Body_fa"].ToString();
            TextBox_Body_ch.Text = dt.Rows[0]["Body_fa"].ToString();
            MultiView1.ActiveViewIndex = 1;
        }
        void bind_grd()
        {
            DataTable dt = da.TBL_Help_Tra(0, "select_all");
            int dd = dt.Rows.Count;
            GridView_List.DataSource = dt;
            GridView_List.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            int id = 0;
            if (Request.QueryString["id"] != null)
                id = int.Parse(Request.QueryString["id"].ToString());
            da.TBL_Help_Tra(id, "insert", TextBox_title.Text, TextBox_Body_en.Text, TextBox_Body_fa.Text, TextBox_Body_ch.Text);
            Response.Redirect("Help.aspx");

        }
    }
}
