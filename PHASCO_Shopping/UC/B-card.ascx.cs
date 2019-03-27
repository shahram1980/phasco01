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

namespace PHASCO_Shopping.UC
{
    public partial class B_card : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Set_Company_Card();
        }
        protected void Set_Company_Card()
        {
            try
            {
                //int uid = int.Parse(Request.QueryString["uid"].ToString());
                //TBL_Company_Profile da_co = new TBL_Company_Profile();
                //DataTable dt = da_co.TBL_Company_Profile_Tra(0, "select_item", uid, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "");
                //Label_Company_Name.Text = dt.Rows[0]["Company_Name"].ToString();
                //Label_Website.Text = dt.Rows[0]["Company_Website"].ToString();
                //Label_Zip_Postal_Code.Text = dt.Rows[0]["Zip"].ToString();
                //Label_CompanyCompany_Address_Name.Text = dt.Rows[0]["Company_Address"].ToString();
            }
            catch (Exception) { }
        }
    }
}