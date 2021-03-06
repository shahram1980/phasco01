using System;
using System.Data;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DataAccessLayer;
using BusinessAccessLayer;

namespace phasco_webproject
{
    public partial class Article : System.Web.UI.Page
    {
        Article_Main ArticleClass = new Article_Main();
        User da_User = new User();
        DataTable dt = new DataTable();
        public string categoryId;
        public string category;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["articleid"] != null)
                        setArticleList();
                    else if (Request.QueryString["Detailsid"] != null)
                        SetDetailsVeiw(Convert.ToInt32(Request.QueryString["Detailsid"].ToString()));
                    else if (Request.QueryString["slideid"] != null)
                        Bind_Atlas_List(int.Parse(Request.QueryString["slideid"].ToString()), 0, 20);//  Bind_Slide(int.Parse(Request.QueryString["slideid"].ToString()));
                    else
                    {
                        GetNewAndPublicArticles();
                        //  Bind_Atlas_List(); 
                        Bind_Top10_User(); Bind_RNd();
                    }// Bind_New_Slides(); }
                }
            }
            catch { }
        }
        private void GetNewAndPublicArticles()
        {
            try
            {
                RPT_Last.DataSource = ArticleClass.GetHomeArticles("Last_SubJect", 0, "");
                RPT_Last.DataBind();

                RPT_Best.DataSource = ArticleClass.GetHomeArticles("Top_SubJect", 0, "");
                RPT_Best.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
            catch { }
        }
        private void setArticleList()
        {
            //try
            //{
            Bind_Article_List(0, 50, "SelectSubId", Convert.ToInt32(Request.QueryString["articleid"]), "");

            var title = Request.QueryString["t"];
            category = title;

            //RPT_Article.DataSource = ArticleClass.GetArticleList("Level1_Text", Convert.ToInt32(Request.QueryString["articleid"]));
            //RPT_Article.DataBind();
            //MultiView1.ActiveViewIndex = 1;
            //}
            //catch
            //{
            //    MultiView1.ActiveViewIndex = 3;
            //}
        }
        protected void drpPaging_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["drpPagingIndex"] = drpPaging.SelectedIndex;
            Bind_Article_List(drpPaging.SelectedIndex, 5, "SelectSubId", Convert.ToInt32(Request.QueryString["articleid"]), "");
        }
        protected void Bind_Article_List(int gvPageIndex, int gvPageSize, string Mode, int id, string text_)
        {
            SqlConnection strConnection = null;
            SqlDataReader DR;
            strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["phasco_webproject.Properties.Settings.Article_phascoConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand("ARTICLE_Paging", strConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@PageIndex", SqlDbType.Int)); cmd.Parameters["@PageIndex"].Value = gvPageIndex;
            cmd.Parameters.Add(new SqlParameter("@PageSize", SqlDbType.Int)); cmd.Parameters["@PageSize"].Value = gvPageSize;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)); cmd.Parameters["@id"].Value = id;

            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar)); cmd.Parameters["@mode"].Value = Mode;
            cmd.Parameters.Add(new SqlParameter("@Text", SqlDbType.NVarChar)); cmd.Parameters["@Text"].Value = text_;

            //try
            //{
            strConnection.Open();
            DR = cmd.ExecuteReader();

            DR.Read();
            drpPaging.Items.Clear();
            Fill_Paging_List(Convert.ToInt32(DR[0]), gvPageSize, drpPaging);
            if ((IsPostBack) && (ViewState["drpPagingIndex"] != null))
            { drpPaging.SelectedIndex = Convert.ToInt32(ViewState["drpPagingIndex"].ToString()); }
            DR.NextResult();
            RPT_Article.DataSource = DR;
            RPT_Article.DataBind();
            //}
            //catch (Exception)            { }
            //finally
            //{
            cmd.Dispose();
            strConnection.Close();
            //}
            //    RPT_Article.DataSource = ds_Art;
            //    RPT_Article.DataBind();
            //}
            MultiView1.ActiveViewIndex = 1;

        }
        protected void Fill_Paging_List(int NumRecords, int PageSize, DropDownList TargetDropDown)
        {
            DataSet ds = new DataSet();
            DataTable dt = ds.Tables.Add("paging_Table");
            dt.Columns.Add("Item", Type.GetType("System.String"));
            dt.Columns.Add("value", Type.GetType("System.String"));




            if ((NumRecords > 0) && (PageSize > 0) && (NumRecords >= PageSize))
            {
                double intTotalPages = NumRecords / PageSize;
                for (int i = 0; i < intTotalPages; i++)
                {
                    TargetDropDown.Items.Add(new ListItem((i + 1).ToString(), i.ToString()));

                    DataRow dr = dt.NewRow();
                    dr[0] = (i + 1).ToString();
                    dr[1] = i.ToString();
                    dt.Rows.Add(dr);
                }
                Repeater_Article_List.DataSource = ds;
                Repeater_Article_List.DataMember = "paging_Table";
                Repeater_Article_List.DataBind();
            }
            else
                TargetDropDown.Items.Add(new ListItem("Just this Page", "-1"));
        }
        protected void SetDetailsVeiw(int Id)
        {
            //ArticleClass.GetHomeArticles("Click_Text", Id, "");

            DataTable dt;
            dt = ArticleClass.GetHomeArticles("Select_Text_Id", Id, "");
            if (dt.Rows.Count > 0)
            {
                MultiView1.ActiveViewIndex = 2;
                SubJect.Text = dt.Rows[0]["SubJect"].ToString();
                Writer.Text = dt.Rows[0]["Writer"].ToString();
                Translator.Text = dt.Rows[0]["Translator"].ToString();
                keyWork.Text = dt.Rows[0]["keyWork"].ToString();
                ShortText.Text = dt.Rows[0]["ShortText"].ToString();
                category = dt.Rows[0]["categoryTitle"].ToString();
                categoryId = dt.Rows[0]["SubId"].ToString();
                Ref.Text = dt.Rows[0]["Ref"].ToString();
                Text.Text = PHASCOUtility.cleanHtmlText(dt.Rows[0]["Text"].ToString());


                Label_FAV.Text = "<a title=\"اضافه کردن به علاقه مندی ها\" href=\"javascript:bookmarksite('" + dt.Rows[0]["SubJect"].ToString() + "', '" + Request.Url.ToString() + "')\"><i class='fa fa-star'></i></a>";
                //#region Dataset
                //PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da_User = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();
                //DS_MainPhasco.UsersDataTable dt_User = new DS_MainPhasco.UsersDataTable();
                //#endregion

                dt = da_User.GetUsers_Tra_DT("select_Item", int.Parse(dt.Rows[0]["UID_ID"].ToString()));
                if (dt.Rows.Count > 0)
                    LBL_UserSender.Text = dt.Rows[0]["Name"] + " " + dt.Rows[0]["Famil"] + "[" + dt.Rows[0]["Uid"] + "]";
                else LBL_UserSender.Text = "مدیر سایت";
            }
            else
            {
                MultiView1.ActiveViewIndex = 3;
            }
        }
        protected void SetDetails(object sender, CommandEventArgs e)
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            SetDetailsVeiw(Id);

        }
        protected void ImageButton_BackToList_Click(object sender, ImageClickEventArgs e)
        { Response.Redirect("Article.aspx"); }
        #region Bind_Rnd_Article
        void Bind_RNd()
        {
            DataTable dts = ArticleClass.GetHomeArticles("RNd_SubJect", 0, "");
            int ro = dts.Rows.Count;
            RTP_RND.DataSource = dts;
            RTP_RND.DataBind();
        }
        #endregion
        #region Atlas_List_Bind
        //void Bind_Atlas_List()
        //{
        //    DataList_Slides.DataSource = ArticleClass.AtlasTra("Select_All", 0, "", 0);
        //    DataList_Slides.DataBind();
        //}

        //void Bind_Slide(int id)
        //{
        //    DataList_Slid.DataSource = ArticleClass.Atlas_Edit("Select_Sub", id, id, null, 0, null);
        //    DataList_Slid.DataBind();
        //    MultiView1.ActiveViewIndex = 4;
        //}

        protected void Fill_Paging_List(int NumRecords, int PageSize)
        {
            DataSet ds = new DataSet();
            DataTable dt = ds.Tables.Add("paging_Table");
            dt.Columns.Add("Item", Type.GetType("System.String"));
            dt.Columns.Add("value", Type.GetType("System.String"));
            if ((NumRecords > 0) && (PageSize > 0) && (NumRecords >= PageSize))
            {
                double intTotalPages = NumRecords / PageSize;
                for (int i = 0; i < intTotalPages; i++)
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = (i + 1).ToString();
                    dr[1] = i.ToString();
                    dt.Rows.Add(dr);
                }
                Repeater_Slide_Paging.DataSource = ds;
                Repeater_Slide_Paging.DataMember = "paging_Table";
                Repeater_Slide_Paging.DataBind();
            }
            else
            { }
        }
        protected void Linkbutton_Panging_Slide_Command(object sender, CommandEventArgs e)
        {
            ViewState["drpPagingIndex"] = e.CommandArgument;
            Bind_Atlas_List(int.Parse(Request.QueryString["slideid"].ToString()), int.Parse(e.CommandArgument.ToString()), 20);
        }
        protected void Bind_Atlas_List(int id, int PageIndex, int PageSize)
        {
            SqlConnection strConnection = null;
            SqlDataReader DR;
            strConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PHASCO_WEB.Properties.Settings.Article_phascoConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[Atlas_Top_Paging]", strConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@PageIndex", SqlDbType.Int)); cmd.Parameters["@PageIndex"].Value = PageIndex;
            cmd.Parameters.Add(new SqlParameter("@PageSize", SqlDbType.Int)); cmd.Parameters["@PageSize"].Value = 20;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)); cmd.Parameters["@id"].Value = id;

            strConnection.Open();
            DR = cmd.ExecuteReader();

            DR.Read();
            Fill_Paging_List(Convert.ToInt32(DR[0]), PageSize);
            DR.NextResult();
            DataList_Slid.DataSource = DR;
            DataList_Slid.DataBind();
            cmd.Dispose();
            strConnection.Close();
            MultiView1.ActiveViewIndex = 4;
        }





        #endregion
        #region Bind_New_Slide
        //void Bind_New_Slides()
        //{
        //    Repeater_New_Slides.DataSource = ArticleClass.AtlasTra("Select_topN", 0, "", 0);
        //    Repeater_New_Slides.DataBind();
        //}
        #endregion
        #region Bind_Top_10_User
        void Bind_Top10_User()
        {
            DataList_TopUser.DataSource = da_User.GetUsers_Tra_DT("UserArtCount");
            DataList_TopUser.DataBind();
        }
        #endregion
        protected void LinkButton_Back_Click(object sender, EventArgs e)
        {
            GetNewAndPublicArticles();// Bind_Atlas_List();
        }
        protected void Linkbutton_Panging_Command(object sender, CommandEventArgs e)
        {
            ViewState["drpPagingIndex"] = e.CommandArgument;
            Bind_Article_List(int.Parse(e.CommandArgument.ToString()), 50, "SelectSubId", Convert.ToInt32(Request.QueryString["articleid"]), "");
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
