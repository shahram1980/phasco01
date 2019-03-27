using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer.BIZ;
using System.Data;

namespace PHASCO_WEB.Cpanel.Bazar
{
    public partial class InviteEMails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TBL_InviteEmails da = new TBL_InviteEmails();
                DataTable dt = new DataTable();
                dt=da.TBL_InviteEmails_Tra("", "select_All");
                int sddd = dt.Rows.Count;
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }
    }
}