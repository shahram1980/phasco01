using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DataAccessLayer;

namespace phasco_webproject
{
    public partial class External_Article : System.Web.UI.Page
    {
        Article_Main ArticleClass = new Article_Main();

        protected void Page_Load(object sender, EventArgs e)
        {
            try { if (!IsPostBack)                    GetArticles(); }
            catch { }
        }

        private void GetArticles()
        {
            try
            {
                RPT_Last.DataSource = ArticleClass.GetHomeArticles("Last_SubJect", 0, "");
                RPT_Last.DataBind();
            }
            catch { }
       
        }
    }
}
