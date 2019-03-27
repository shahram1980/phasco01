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
using phasco.BaseClass;
using System.Data.SqlClient;
using PHASCO_WEB.DAL;
using DataAccessLayer;

namespace phasco_webproject.UI
{
    public partial class Article : System.Web.UI.UserControl
    {
        Article_Main ArticleClass = new Article_Main();
        User da_User = new User();
        DataTable dt = new DataTable();

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
                        Bind_Slide(int.Parse(Request.QueryString["slideid"].ToString()));
                    else
                    { GetNewAndPublicArticles(); Bind_RNd(); Bind_Atlas_List(); Bind_Top10_User(); Bind_New_Slides(); }
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
            Bind_Article_List(0, 5, "SelectSubId", Convert.ToInt32(Request.QueryString["articleid"]), "");
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
            strConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Phasco_ArticleConString_RAD"].ConnectionString);

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
            ArticleClass.Update_Click("Click_Text", Id, "");

            DataTable dt;
            dt = ArticleClass.GetArticleList("Select_Text_Id", Id, "");
            if (dt.Rows.Count > 0)
            {
                MultiView1.ActiveViewIndex = 2;
                SubJect.Text = dt.Rows[0]["SubJect"].ToString();
                Writer.Text = dt.Rows[0]["Writer"].ToString();
                Translator.Text = dt.Rows[0]["Translator"].ToString();
                keyWork.Text = dt.Rows[0]["keyWork"].ToString();
                ShortText.Text = dt.Rows[0]["ShortText"].ToString();
                Ref.Text = dt.Rows[0]["Ref"].ToString();
                Text.Text = dt.Rows[0]["Text"].ToString();
                dt = da_User.GetUsers_Tra_DT("select_Item", int.Parse(dt.Rows[0]["UID_ID"].ToString()));
                if (dt.Rows.Count > 0)
                    LBL_UserSender.Text = dt.Rows[0]["Name"] + " " + dt.Rows[0]["Famil"] + "[" + dt.Rows[0]["Uid"] + "]";
                else LBL_UserSender.Text = "مدیر سایت";
            }
            else { MultiView1.ActiveViewIndex = 3; }
        }
        protected void SetDetails(object sender, CommandEventArgs e)
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            SetDetailsVeiw(Id);
        }
        protected void Lb_Back_Click(object sender, EventArgs e)
        { Response.Redirect("default.aspx?page=Article"); }
        #region Bind_Rnd_Article
        void Bind_RNd()
        {
            RTP_RND.DataSource = ArticleClass.GetHomeArticles("RNd_SubJect", 0, "");
            RTP_RND.DataBind();
        }
        #endregion
        #region Atlas_List_Bind
        void Bind_Atlas_List()
        {
            GRD_Slide.DataSource = ArticleClass.AtlasTra("Select_All", 0, "", 0);
            GRD_Slide.DataBind();
        }

        void Bind_Slide(int id)
        {

            //dt = da.Atlas_Tra(, id, id, null, null, null, ref id_);
            DataList_Slid.DataSource = ArticleClass.Atlas_Edit("Select_Sub", id, id, null, 0, null);
            DataList_Slid.DataBind();
            MultiView1.ActiveViewIndex = 4;
        }
        #endregion
        #region Bind_New_Slide
        void Bind_New_Slides()
        {
            Repeater_New_Slides.DataSource = ArticleClass.AtlasTra("Select_topN", 0, "", 0);
            Repeater_New_Slides.DataBind();
        }
        #endregion
        #region Bind_Top_10_User
        void Bind_Top10_User()
        {
            GridView_Top_User.DataSource = da_User.GetUsers_Tra_DT("UserArtCount"); ;
            GridView_Top_User.DataBind();
        }
        #endregion
        protected void LinkButton_Back_Click(object sender, EventArgs e)
        { GetNewAndPublicArticles(); Bind_RNd(); Bind_Atlas_List(); }
        protected void Linkbutton_Panging_Command(object sender, CommandEventArgs e)
        {
            ViewState["drpPagingIndex"] = e.CommandArgument;
            Bind_Article_List(int.Parse(e.CommandArgument.ToString()), 5, "SelectSubId", Convert.ToInt32(Request.QueryString["articleid"]), "");
        }

    }
}