using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using PHASCO_WEB.DAL;
using phasco_webproject;
namespace PHASCO_WEB
{
    public partial class altlas : System.Web.UI.Page
    {
        Article_Main ArticleClass = new Article_Main();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["slideid"] != null)
            {
                Bind_Atlas_List(int.Parse(Request.QueryString["slideid"].ToString()), 0, 20);
                set_Title();
            }
            else Bind_Atlas_Rand();
            Bind_Atlas_List();


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
        void Bind_Atlas_List()
        {
            DataList_Slides.DataSource = ArticleClass.AtlasTra("Select_All", 0, "", 0);
            DataList_Slides.DataBind();
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
            MultiView1.ActiveViewIndex = 1;
        }





        #endregion
    }
}
