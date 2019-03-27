using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DataAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscLastNews : BaseUserControl
    {
        TBL_News da_News = new TBL_News();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
        }

        public string GetTopNews()
        {
            DataTable dtNews = da_News.News_Insert_Edit("Select_top5");
            string news = string.Empty;
            for (int i = 0; i < dtNews.Rows.Count; i++)
            {
                news += " theSummaries[" + i + "] = \"" + dtNews.Rows[i]["Title"].ToString() + "\"; theSiteLinks[" + i + "] =\"/News/?id=" + dtNews.Rows[i]["Id"].ToString() + "\";";
            }
            return news;
        }
    }
}