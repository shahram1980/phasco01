using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer.BIZ;

namespace PHASCO_WEB.Cpanel.Bazar
{
    public partial class SearchLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TBL_SearchHistory da = new TBL_SearchHistory();
                DataList1.DataSource = da.SelectResForAdmin();
                DataList1.DataBind();
            }
        }
    }
}