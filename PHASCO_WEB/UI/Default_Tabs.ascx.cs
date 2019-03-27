using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer;

namespace PHASCO_WEB.UI
{
    public partial class Default_Tabs : System.Web.UI.UserControl
    {
        #region dataset
        User_Blog User_Blog_class = new User_Blog();
        User User_class = new User();
        Article_Main ArticleClass = new Article_Main();
        Tbl_TodayText da = new Tbl_TodayText();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Bind_News(); Top_Reg_User(); Top_Blog_User(); GetArticles(); Set_Today_Text(); }
        }
        void Set_Today_Text()
        {
            DataTable dt = da.Tbl_TodayText_Tra("select", "", "", 0);
            if (dt.Rows.Count > 0)
            {
                Label_TODay.Text = dt.Rows[0]["text"].ToString();
                if (dt.Rows[0]["view_Url"].ToString() == "1") { HyperLink_URL.Visible = true; HyperLink_URL.NavigateUrl = dt.Rows[0]["Url"].ToString(); }
                else HyperLink_URL.Visible = false; ;
            }

        }
        void Bind_News()
        {
            int? id_ = 0;
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter();
            PHASCO_WEB.DAL.DS_MainPhasco.NewsDataTable dt = new DAL.DS_MainPhasco.NewsDataTable();
            try
            {
                dt = da.News_Insert_Edit(0, null, null, "Select_5", null, Page.Culture.ToString(), null, null, null, 0,0,0,"","", ref id_);
                Repeater_News.DataSource = dt;
                Repeater_News.DataBind();
            }
            catch (Exception)
            { }

        }


        void Top_Reg_User()
        {
            try
            {
                DataList_User.DataSource = User_class.GetUsers_Tra_DT("select_top_reg", 0, "", "", "", "", "", 0, DateTime.Now, "", "", "", "", "", 0, 0, 0, 0);
                DataList_User.DataBind();
            }
            catch (Exception)
            { }

        }

        void Top_Blog_User()
        {
            try
            {
                Repeater_Blog.DataSource = User_Blog_class.GetUsers_Blog_Tra_DT("Select_Top_10", 0, "", 0, "", 0, "");
                Repeater_Blog.DataBind();
            }
            catch (Exception)
            {


            }

        }

        private void GetArticles()
        {
            try
            {
                RPT_Last.DataSource = ArticleClass.GetHomeArticles("Last_SubJect", 0, "");
                RPT_Last.DataBind();

                RPT_Best.DataSource = ArticleClass.GetHomeArticles("Top_SubJect", 0, "");
                RPT_Best.DataBind();
            }
            catch (Exception)
            {

            }



        }
        public string Set_User(int uid)
        {
            User da = new User();
            System.Data.DataTable dt;

            dt = da.GetUsers_Tra_DT("select_Item", uid);
            if (dt.Rows.Count > 0) { return "<a class='pull-right' title='" + dt.Rows[0]["Name"].ToString() + " " + dt.Rows[0]["Famil"].ToString() + "' href='UserProfile.aspx?id=" + dt.Rows[0]["Id"].ToString() + "'>" + dt.Rows[0]["UID"].ToString() + "</a>"; }

            return "مدیر سایت";
        }

    }
}