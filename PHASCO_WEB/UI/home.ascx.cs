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
using phasco.BaseClass;
using PHASCO_WEB.DAL;
namespace phasco.UI
{
    public partial class home : System.Web.UI.UserControl
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TEuroTableAdapter da_Euro = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TEuroTableAdapter();
        DS_MainPhasco.TEuroDataTable dt_Euro = new DS_MainPhasco.TEuroDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.productTableAdapter da_Pro = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.productTableAdapter();
        DS_MainPhasco.productDataTable dt_Pro = new DS_MainPhasco.productDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter da_news = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter();
        DS_MainPhasco.NewsDataTable dt_news = new DS_MainPhasco.NewsDataTable();
        #endregion
        #region Page_Setiing
        protected void Page_Load(object sender, EventArgs e)
        { Top_Product(); Now_News_List();  }
        #endregion
        protected void Top_Product()
        {
            dt_Pro = da_Pro.Product_Top10_List(Page.Culture.ToString());
            DataList_Products.DataSource = dt_Pro;
            DataList_Products.DataBind();

            try
            {
                if (Page.Culture == "English (United States)")
                {
                    da_Euro.Update_Euro(dt_Euro, 3, 0, 1, null);
                    for (int i = 0; i < DataList_Products.Items.Count; i++)
                    {
                        decimal chane_to_Euro = Convert.ToDecimal(float.Parse((DataList_Products.Items[i].FindControl("lbl_price") as Label).Text) / float.Parse(dt_Euro[0].Euro.ToString()));
                        (DataList_Products.Items[i].FindControl("lbl_price") as Label).Text = chane_to_Euro.ToString("########.##");
                    }
                }
                //Page.Culture == "English (United States)" "Persian (Iran)"
            }
            catch (Exception Ex) { }
        }
        protected void Now_News_List()
        {
            int? getid = 0;
            string lang = "";
            if (Page.Culture.ToString() == "Persian (Iran)") lang = "fa-ir";
            else if (Page.Culture.ToString() == "English (United States)") lang = "en-us";
            dt_news = da_news.News_Insert_Edit(0, "", "", "Select_Archive_Da", "", lang, "", 0, 0, ref getid);
            News.DataSource = dt_news;
            News.DataBind();

        }
    }
}