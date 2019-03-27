using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer.Video;
using BiztBiz;
using BusinessAccessLayer;

namespace PHASCO_WEB.Video
{
    public partial class Default : System.Web.UI.Page
    {
        tblVideoCategorie daCategorie = new tblVideoCategorie();
        tblVideo da_Video = new tblVideo();
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "ویدیوها و فیلم های آزمایشگاهی فاسکو";
            if (!IsPostBack) {
                Bind_VedioList();
                Bind_Cat();

                
            }
        }

        void Bind_VedioList()
        {


            if (Request.QueryString["CATID"] != null && Request.QueryString["t"] == null)
            {
                int CATID = int.Parse(Request.QueryString["CATID"].ToString());
                DataList_Video.DataSource = da_Video.tblVideo_SP(11, 0, CATID, 0, "", "", "", "", "", DateTime.Now, 0, 0);
                DataList_Video.DataBind();

                lblCount.Text = da_Video.tblVideo_SP(13, 0, CATID, 0, "", "", "", "", "", DateTime.Now, 0, 0).Rows[0]["videoCount"].ToString();
            }
            else
            {
                Bind_Pager();
                //DataList_Video.DataSource = da_Video.tblVideo_SP(10, 0, 0, 0, "", "", "", "", "", DateTime.Now, 0, 0);
                //DataList_Video.DataBind();
                lblCount.Text = da_Video.tblVideo_SP(12).Rows[0]["videoCount"].ToString();
            }

            if (Request.QueryString["s"] != null && Request.QueryString["t"] == null)
            {
                string status_ = Request.QueryString["s"].ToString();

                switch (status_)
                {
                    case "topvisit":
                        DataList_Video.DataSource = da_Video.tblVideo_SP(15);
                        DataList_Video.DataBind();
                        break;
                    case "MostPopular":
                        DataList_Video.DataSource = da_Video.tblVideo_SP(16);
                        DataList_Video.DataBind();
                        break;

                    default:
                        break;
                }
            }

            if (Request.QueryString["t"] != null)
            {
                txtSearch.Text = Request.QueryString["t"].Replace("+", " ");
                Bind_by_searchItem();
            }

        }
        void Bind_by_searchItem()
        {
            Bind_Pager();
            string textSearch_ = Request.QueryString["t"].ToString();
        }


        void Bind_Pager()
        {
            int PageSize = 10;
            if (Request.QueryString["t"] != null)
            {
                string textSearch_ = Request.QueryString["t"].ToString().Replace(" ", "+");
                int Currentpage = PHASCOUtility.ConverToNullableInt(Request.QueryString["p"]);

                int RecCount = PHASCOUtility.ConverToNullableInt(da_Video.Video_Search_SP(1, textSearch_, 1, 7, 0).Rows[0]["count_"].ToString());
                lblCount.Text = RecCount.ToString();

                float pagecount = RecCount / PageSize;

                int startpage = 0;
                int endpage = 0;

                if (Currentpage == 0 || Currentpage == 1) { Currentpage = 1; startpage = 1; }
                else { startpage = (PageSize * Currentpage) - PageSize; }

                endpage = startpage + PageSize;

                DataTable table = new DataTable();
                table.Columns.Add("Pager");
                for (int i = 1; i < pagecount + 1; i++)
                {
                    table.Rows.Add((i).ToString());
                }
                DataList_Pager.DataSource = table;
                DataList_Pager.DataBind();

                DataList_Video.DataSource = da_Video.Video_Search_SP(2, textSearch_, startpage, endpage, PageSize);
                DataList_Video.DataBind();
            }
            else
            {
                int Currentpage = PHASCOUtility.ConverToNullableInt(Request.QueryString["p"]);

                int RecCount = PHASCOUtility.ConverToNullableInt(da_Video.Video_Paging_SP(1, 1, 7, 0).Rows[0]["count_"].ToString());
                lblCount.Text = RecCount.ToString();

                float pagecount = RecCount / PageSize;

                int startpage = 0;
                int endpage = 0;

                if (Currentpage == 0 || Currentpage == 1) { Currentpage = 1; startpage = 1; }
                else { startpage = (PageSize * Currentpage) - PageSize; }

                endpage = startpage + PageSize;

                DataTable table = new DataTable();
                table.Columns.Add("Pager");
                for (int i = 1; i < pagecount + 1; i++)
                {
                    table.Rows.Add((i).ToString());
                }
                DataList_Pager.DataSource = table;
                DataList_Pager.DataBind();

                DataList_Video.DataSource = da_Video.Video_Paging_SP(2, startpage, endpage, PageSize);
                DataList_Video.DataBind();
                //
            }

        }
        void Bind_Cat()
        {
            Repeater_CAT.DataSource = daCategorie.tblVideoCategorie_SP(2, 0, "");
            Repeater_CAT.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
            {
                string txtsearch = txtSearch.Text.Replace(" ", "+");
                Response.Redirect("?t=" + txtsearch);
            }
        }


        public string KeywordSpliter(string Keyword, object Videoid, object VideoName)
        {
            string s = Keyword.Replace("،", ",");
            string res_ = "";
            string[] words = s.Split(',');
            foreach (string word in words)
            {
                res_ = res_ + "<li><a href='watch.aspx?Vid=" + Videoid.ToString() + "&t=" + word + "' title='" + VideoName.ToString() + "'>" + word + "</a><li>";// Console.WriteLine(word);
            }
            return res_;
        }

        public string createpagingUrl(string Pager)
        {
            string res_ = "";
            int currentpge = 0;
            if (Request.QueryString["p"] != null) currentpge = PHASCOUtility.ConverToNullableInt(Request.QueryString["p"].ToString());

            if (int.Parse(Pager) != currentpge)
            {
                if (Request.QueryString["t"] != null)
                    res_ = "<li><a href='?t=" + Request.QueryString["t"] + "&p=" + Pager + "'>" + Pager + "</a></li>";
                else res_ = "<li><a href='?p=" + Pager + "'>" + Pager + "</a></li>";
            }
            else
            {
                if (Request.QueryString["t"] != null)
                    res_ = "<li><a class='active' href='?t=" + Request.QueryString["t"] + "&p=" + Pager + "'>" + Pager + "</a></li>";
                else res_ = "<li><a class='active' href='?p=" + Pager + "'>" + Pager + "</a></li>";
            }
            return res_;
        }
    }
}