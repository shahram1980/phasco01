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
using DataAccessLayer.BIZ;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.C_p
{
    public partial class About : BasePage
    {
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Set_Company_Card();
        }
        void Set_Company_Card()
        {
            try
            {
            int uid = int.Parse(Request.QueryString["uid"].ToString());
            TBL_Company_Profile da_co = new TBL_Company_Profile();
            DataTable dt = da_co.TBL_Company_Profile_Tra(0, "select_item", uid, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");

            Label_year_Established.Text = dt.Rows[0]["year_Established"].ToString();
            Label_registered_capital.Text = dt.Rows[0]["registered_capital"].ToString();
            Label_annual_sales.Text = dt.Rows[0]["annual_sales"].ToString();
            Label_Total_Staff.Text = dt.Rows[0]["Total_Staff"].ToString();
            Label_Main_Products_or_Services.Text = dt.Rows[0]["Services"].ToString();
            Label_Main_Markets.Text = dt.Rows[0]["Main_Markets"].ToString();
            MultiView1.ActiveViewIndex = 0;
            }
            catch (Exception)
            {
                MultiView1.ActiveViewIndex = 1;
            }
        }
    }


}
