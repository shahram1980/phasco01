using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Membership_Manage;

namespace PHASCO_WEB.UI
{
    public partial class NewsFlash : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid())
            { label_News_Flash.Visible = ImgNews.Visible = false; return; }
            label_News_Flash.Visible = ImgNews.Visible = true;
            int? id_ = 0;
            try
            {
                PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter();
                PHASCO_WEB.DAL.DS_MainPhasco.NewsDataTable dt = new DAL.DS_MainPhasco.NewsDataTable();
                label_News_Flash.Text = da.News_Insert_Edit(0, null, null, "Select_topflash", null, "", null, null, null, 0, 0, 0, "", "", ref id_)[0].Title.ToString();
            }
            catch (Exception)
            {
            }

        }
    }
}