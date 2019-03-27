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
    public partial class ProductGallery : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id_ = Convert.ToInt32(Request.QueryString["Deid"]);
            Bind_Gallery(Id_);
        }
        protected void Bind_Gallery(int id)
        {
            Product_Tbl da = new Product_Tbl();
            DataTable dt=da.Product_gallery_Tra(id,"Select","","");

            DataList_Gallary.DataSource = dt;
            DataList_Gallary.DataBind();
        }
    }
}