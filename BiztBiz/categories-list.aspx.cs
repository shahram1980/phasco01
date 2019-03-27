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
using BiztBiz.Component;
using BiztBiz.BLL;
using System.Threading;
using System.Globalization;

namespace BiztBiz
{
    public partial class categories_list : BasePage
    {
        TBL_Categories DaCat = new TBL_Categories();
      
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
            Set_Url();

        }

        protected void ListViewBind()
        {
            try
            {
                int id = int.Parse(Request.QueryString["qid"].ToString());

                Tbl_Products da = new Tbl_Products();
                DataTable dt = da.Tbl_Products_Tra(0, "Select_cat", 0, id, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", DateTime.Now, DateTime.Now, 0, "");

                //if(dt.Rows.Count >=0)
                //{
                //Panel_Cat.Visible=false;
                //}

                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            catch (Exception)
            { }

        }

        void Set_Url()
        {
            DataTable dt;
            int id = int.Parse(Request.QueryString["qid"].ToString());
            dt = DaCat.TBL_Categories_Tra(id, "select_Path3");
            Label_Nav.Text = "<a href='Default.aspx' >" + Resources.Resource.Home + "</a> > " + dt.Rows[0][Resources.Resource.F_Subject] + " > <a href='Categories.aspx?sid=" +dt.Rows[0]["id"].ToString() + "' >" + dt.Rows[0][Resources.Resource.F_Subject2] + "</a> > " + dt.Rows[0][Resources.Resource.F_Subject3];
        }
    }
}
