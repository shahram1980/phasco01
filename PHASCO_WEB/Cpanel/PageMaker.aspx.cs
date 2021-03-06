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

namespace phasco.Cpanel
{
    public partial class PageMaker : System.Web.UI.Page
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Eshop_PagesTableAdapter da_eshop = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Eshop_PagesTableAdapter();
        DS_MainPhasco.Eshop_PagesDataTable dt_eshop = new DS_MainPhasco.Eshop_PagesDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton_New_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_Edit_Click(object sender, EventArgs e)
        {
            Bind_Grd_Page();
            MultiView1.ActiveViewIndex = 1;
        }
        void Bind_Grd_Page()
        {
            dt_eshop = da_eshop.Eshop_Pages_Tra(0, "selectAll", "", "", "", 0);
            GridView1.DataSource = dt_eshop;
            GridView1.DataBind();
        }
        protected void LinkButton_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            dt_eshop = da_eshop.Eshop_Pages_Tra(id, "selectItemid", "", "", "", 0);
            TXT_Title_Page.Text = dt_eshop[0].Title.ToString();
            RadEditor1.Html = dt_eshop[0].Body.ToString();
            DropDownList_Lang.SelectedValue = dt_eshop[0].lang;
            DropDownList_Page.SelectedValue = dt_eshop[0].mode.ToString();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            da_eshop.Eshop_Pages_Tra(id, "delete", "", "", "", 0);
            Bind_Grd_Page();
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            da_eshop.Eshop_Pages_Tra(0, "insert", TXT_Title_Page.Text, RadEditor1.Html, DropDownList_Lang.SelectedValue, Convert.ToInt32(DropDownList_Page.SelectedValue));
            Lbl_Alarm.Text = "صفحه با موفقيت درج گردید";
        }
    }
}
