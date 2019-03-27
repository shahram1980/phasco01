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
using System.Globalization;
using System.Threading;
using DataAccessLayer.BIZ;
using BusinessAccessLayer.BIZ;

namespace BiztBiz
{
    public partial class Categories : BasePage
    {
        TBL_Categories DaCat = new TBL_Categories();
        TBL_AdminUsers adminUser = new TBL_AdminUsers();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Bind_Grd();
        }

        protected void Bind_Grd()
        {
            DataTable dt;
            int id = int.Parse(Request.QueryString["sid"].ToString());
            dt = DaCat.TBL_Categories_Tra(0, "select", id, "", "", "", 0,0);
            DataList_Cat.DataSource = dt;
            DataList_Cat.DataBind();
            Set_Url();
            Bind_SubCat();
        }

        protected void Set_Url()
        {
            DataTable dt;
            int id = int.Parse(Request.QueryString["sid"].ToString());
            dt = DaCat.TBL_Categories_Tra(id, "select_Path");
            Label_Nav.Text = "<a href='Default.aspx' >" + Resources.Resource.Home + "</a> > " + dt.Rows[0][Resources.Resource.F_Subject] + " > " + dt.Rows[0][Resources.Resource.F_Subject2];
            Current_Cat.Text = dt.Rows[0][Resources.Resource.F_Subject2].ToString();
        }

        protected void Bind_SubCat()
        {
            DataTable dt;
            int id = int.Parse(Request.QueryString["sid"].ToString());
            dt = DaCat.TBL_Categories_Tra(id, "select_up", 0, "", "", "", 0,0);
            DataList_UpCat.DataSource = dt;
            DataList_UpCat.DataBind();
            Set_Url();
        }

    }
}
