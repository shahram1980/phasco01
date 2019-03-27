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
using PHASCO_WEB.DAL.BIZ.MenuPageTableAdapters;

namespace PerisanCMS.UI
{
    public partial class MenuGallery : System.Web.UI.UserControl
    {
        #region dataset
        Menu_Images_galleryTableAdapter da_menu_gallery = new Menu_Images_galleryTableAdapter();
       PHASCO_WEB.DAL.BIZ.MenuPage.Menu_Images_galleryDataTable ds_menu_gallery = new PHASCO_WEB.DAL.BIZ.MenuPage.Menu_Images_galleryDataTable();
        #endregion
        protected void Bind_Gallery()
        {
            try
            {
                int num = Convert.ToInt32(Request.QueryString["id"].ToString());
                ds_menu_gallery = da_menu_gallery.menu_gallery_Tra(new int?(num), "Select", "", "");
                DataList_Gallary.DataSource = ds_menu_gallery;
                DataList_Gallary.DataBind();
            }
            catch (Exception) { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Bind_Gallery(); }
        }

    }
}