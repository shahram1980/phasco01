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

namespace PHASCO_WEB
{
    public partial class Userpoint : System.Web.UI.Page
    {
        #region dataset
        DAL.DS_MainPhascoTableAdapters.Point_ManageTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Point_ManageTableAdapter();
        DAL.DS_MainPhasco.Point_ManageDataTable dt = new PHASCO_WEB.DAL.DS_MainPhasco.Point_ManageDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindData();
        }

        private void BindData()
        {
            dt = da.select_All();
            DataGrid2.DataSource = dt;
            DataGrid2.DataBind();
        }
    }
}
