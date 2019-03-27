using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using phasco_webproject;
using DataAccessLayer;
using System.Web.UI.HtmlControls;
using DataAccessLayer.Atlas;
using DataAccessLayer.Users;

namespace PHASCO_WEB
{
    public partial class atlas : System.Web.UI.Page
    {
        Article_Main ArticleClass = new Article_Main();
        T_Atlas_Comment da_Comment = new T_Atlas_Comment();

        public string category;
        public string categoryId;
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "مجموعه كاملي از اطلس ها و اسلايدهاي تخصصي رشته هاي مختلف علوم آزمايشگاهي اعم از انگل شناسي، باكتري شناسي، پاتولوژي، قارچ شناسي، هماتولوژي، ويروس شناسي با توضيحات جامع به زبان انگليسي و فارسي";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["slideid"] != null)
            {
                Bind_Atlas_List(int.Parse(Request.QueryString["slideid"].ToString()), 0, 20);

                category = Request.QueryString["t"];
                categoryId = Request.QueryString["slideid"];
                set_Title();
            }
            else { Bind_Atlas_Rand(); Bind_atlasComment(); }

        }
        void Bind_atlasComment()
        {
            RPT_Comment.DataSource = da_Comment.T_Atlas_Comment_SP(8, 0, 0, 0, "");
            RPT_Comment.DataBind();
        }


        #region Atlas_List_Bind
        void set_Title()
        {
            DataTable dt = ArticleClass.AtlasTra("Select_Item", int.Parse(Request.QueryString["slideid"].ToString()), "", 0);
            Label_Current_Title.Text = dt.Rows[0]["title"].ToString();
        }

        void Bind_Atlas_Rand()
        {
            DataList_Rand.DataSource = ArticleClass.Atlas_Edit("Select_RAND", 0, 0, "", 0, "");
            DataList_Rand.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        // Select_RAND
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
            cmd.Parameters.Add(new SqlParameter("@PageSize", SqlDbType.Int)); cmd.Parameters["@PageSize"].Value = 21;
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
            MultiView1.ActiveViewIndex = 1;
        }
        public string SetUserImageView(int sender_Id)
        {
            DataTable dt;
            TBL_User da = new TBL_User();
            dt = da.Users_Tra("select_Item", sender_Id);
            try
            {
                int Image_ = int.Parse(dt.Rows[0]["Image"].ToString());
                int sex_ = int.Parse(dt.Rows[0]["Sex"].ToString());

                if (Image_ == 1) return "<a href='UserProfile.aspx?id=" + sender_Id + "'>" + "<img src='http://phasco.com/phascoupfile/Userphoto/" + sender_Id.ToString() + ".jpg" + "' /></a>";

                if (sex_ == 0) return "<a href='UserProfile.aspx?id=" + sender_Id + "'>" + "<img  src='http://phasco.com/phascoupfile/Userphoto/Nopic_male.jpg' /></a>";
                else if (sex_ == 1) return "<img src='phascoupfile/Userphoto/Nopic_female.jpg' />";
                return "<img src='http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg' />";

            }
            catch (Exception)
            {
                return "<img src='http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg' />";
            }
        }




        #endregion
    }
}