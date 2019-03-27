using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.DAL.MenuPageTableAdapters;

namespace PHASCO_WEB.UI.Page
{
    public partial class MenuGallery : System.Web.UI.UserControl
    {
        #region dataset
        Menu_Images_galleryTableAdapter da_menu_gallery = new Menu_Images_galleryTableAdapter();
        BiztBiz.DAL.MenuPage.Menu_Images_galleryDataTable ds_menu_gallery = new BiztBiz.DAL.MenuPage.Menu_Images_galleryDataTable();
        #endregion
        protected void Bind_Gallery()
        {
            try
            {
                int num = Convert.ToInt32(Request.QueryString["id"].ToString());
                ds_menu_gallery = da_menu_gallery.menu_gallery_Tra(new int?(num), "Select", "", "");
                if (ds_menu_gallery.Rows.Count > 0) Panel1.Visible = true;
                else Panel1.Visible = false;
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