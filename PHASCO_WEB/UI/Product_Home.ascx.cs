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
    public partial class Product_Home : System.Web.UI.UserControl
    {
        Product_Tbl da = new Product_Tbl();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Bind_Grd();
        }
        void Bind_Grd()
        {
            dt = da.Product_Top10_List();
            DataList_Products.DataSource = dt;
            DataList_Products.DataBind();
        }
    }
}