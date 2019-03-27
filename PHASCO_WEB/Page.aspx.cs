using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.DAL.MenuPageTableAdapters;
using System.Threading;
using System.Globalization;

namespace PHASCO_WEB
{
    public partial class Page : System.Web.UI.Page
    {
        #region datset
        Menu_TextTableAdapter da_Text = new Menu_TextTableAdapter();
        BiztBiz.DAL.MenuPage.Menu_TextDataTable ds_Text = new BiztBiz.DAL.MenuPage.Menu_TextDataTable();
        #endregion

        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    Page.Culture = name;
                    Page.UICulture = name;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    Page.Culture = str2;
                    Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-ir";
                Page.UICulture = "fa-ir";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Page_Set(); }
        }

        private void Page_Set()
        {
            try
            {
                int num = Convert.ToInt32(Request.QueryString["id"].ToString());
                ds_Text = da_Text.Menu_text_Tra("select", num, "");
                if (Request.QueryString["b"] != null)
                {
                    Label_Text.Text = ds_Text[0].Text.Replace(Session["serach_Text_Item"].ToString(), "<font color='#FF3300'><u>" + Session["serach_Text_Item"].ToString() + "</u></font>");
                    //goback.Visible = true;
                }
                else
                {
                    Label_Text.Text = ds_Text[0].Text.ToString();
                    //goback.Visible = false;
                }
                LBL_Title.Text = ds_Text[0]["Title"].ToString();
            }
            catch (Exception)
            {
            }
        }
    }
}