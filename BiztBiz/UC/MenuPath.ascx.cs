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
 
using BiztBiz.DAL.MenuPageTableAdapters;
using BiztBiz.DAL;

namespace PerisanCMS.UI
{
    public partial class MenuPath : System.Web.UI.UserControl
    {
        #region dataset
        MenuTableAdapter da_Menu = new MenuTableAdapter();
        MenuPage.MenuDataTable ds_Menu = new MenuPage.MenuDataTable();
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