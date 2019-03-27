using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using PHASCO_WEB.BLL.Eshop;

namespace PHASCO_WEB.UI
{
    public partial class Home_Subject : System.Web.UI.UserControl
    {
        SubJectS_Tbl da = new SubJectS_Tbl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Bind_Ged(); }
        }

        void Bind_Ged()
        {

            DataTable dt = da.Subject_Brand_List();
            DataList_Subject.DataSource = dt;
            DataList_Subject.DataBind();
        }

    }
}