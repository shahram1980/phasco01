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
using PHASCO_WEB.DAL;

namespace phasco_webproject.UI.Attach
{
    public partial class Gallery : System.Web.UI.UserControl
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.product_Images_galleryTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.product_Images_galleryTableAdapter();
        DS_MainPhasco.product_Images_galleryDataTable dt = new DS_MainPhasco.product_Images_galleryDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id_ = Convert.ToInt32(Request.QueryString["id"]);
            Bind_Gallery(Id_);
        }
        protected void Bind_Gallery(int id)
        {
            dt = da.Product_Images_Gallery(id, "Select", "", "");
            DataList_Gallary.DataSource = dt;
            DataList_Gallary.DataBind();
        }
    }
}