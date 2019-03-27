using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Data;

namespace PHASCO_Shopping
{
    public partial class HC1 : System.Web.UI.Page
    {
        TBL_Help da = new TBL_Help();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 0;
            if (!IsPostBack)
            {
                try
                {
                    if (Request.QueryString["id"] != null)
                        id = int.Parse(Request.QueryString["id"].ToString());
                    DataTable dt = da.TBL_Help_Tra(id, "select");
                    Label_Help.Text = dt.Rows[0][Resources.Resource.Help_BodyFeild.ToString()].ToString();
                }
                catch (Exception)
                { }
            }
        }
    }
}