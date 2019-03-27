using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.DAL.MenuPageTableAdapters;

namespace PHASCO_WEB.UI.Page
{
    public partial class ManuPath : System.Web.UI.UserControl
    {
        #region dataset
        MenuTableAdapter da_Menu = new MenuTableAdapter();
        BiztBiz.DAL.MenuPage.MenuDataTable ds_Menu = new BiztBiz.DAL.MenuPage.MenuDataTable();
        #endregion

        private void bind_Path()
        {
            try
            {
                int num = Convert.ToInt32(Request.QueryString["id"].ToString());
                ds_Menu = da_Menu.Menu_Path(new int?(num));
                if (ds_Menu.Rows.Count > 0)
                {
                    Repeater_path.DataSource = ds_Menu;
                    Repeater_path.DataBind();
                }
            }
            catch (Exception) { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { bind_Path(); }
        }
    }
}