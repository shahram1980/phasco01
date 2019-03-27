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
using System.Threading;
using System.Globalization;
using BiztBiz.DAL.MenuPageTableAdapters;
using BiztBiz.DAL;
using BiztBiz;

namespace PerisanCMS
{
    public partial class Page : BasePage
    {
        #region datset
        Menu_TextTableAdapter da_Text = new Menu_TextTableAdapter();
        MenuPage.Menu_TextDataTable ds_Text = new MenuPage.Menu_TextDataTable();
        #endregion

  

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Page_Set(); }
        }

        private void Page_Set()
        {
            try
            {
                int num = Convert.ToInt32(Request.QueryString["id"].ToString());
                ds_Text = da_Text.Menu_text_Tra("select", new int?(num), "");
                if (Request.QueryString["b"] != null)
                {
                    Label_Text.Text = ds_Text[0].Text.Replace(Session["serach_Text_Item"].ToString(), "<font color='#FF3300'><u>" + Session["serach_Text_Item"].ToString() + "</u></font>");
                    goback.Visible = true;
                }
                else
                {
                    Label_Text.Text = ds_Text[0].Text.ToString();
                    goback.Visible = false;
                }
                LBL_Title.Text = ds_Text[0]["Title"].ToString();
            }
            catch (Exception)
            {
            }
        }

    }
}
