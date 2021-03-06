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
using System.Data.SqlClient;

namespace PHASCO_WEB
{
    public partial class AllTopUser : System.Web.UI.Page
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "سایت تخصصی علوم آزمایشگاهی مقالات اطلس ها وبلاگ ها پرسش و پاسخ علمی اخبار لیست کامل آزمایشگاه ها شرکت های تجهیزات و پزشکی با جوایز ارزشمند .";
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
            if (!IsPostBack) bind_Top_User();
        }
        void bind_Top_User()
        {
            Session["User_PageinNumber"] = 0; Bind_User_List(0, 20, "");
        }
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
                    //TargetDropDown.Items.Add(new ListItem((i + 1).ToString(), i.ToString()));

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
            { }// TargetDropDown.Items.Add(new ListItem("Just this Page", "-1"));
        }
        protected void Linkbutton_Panging_Command(object sender, CommandEventArgs e)
        {
            ViewState["drpPagingIndex"] = e.CommandArgument;
            Session["User_PageinNumber"] = Convert.ToString(int.Parse(e.CommandArgument.ToString()) * 20);
            Bind_User_List(int.Parse(e.CommandArgument.ToString()), 20, "");
        }
        protected void Bind_User_List(int gvPageIndex, int gvPageSize, string text_)
        {
            string Mode = "alluser";
            if (Request.QueryString["upu"] != null)
            {
                if (Request.QueryString["upu"].ToString() == "true")
                {
                    Mode = "UserUplevel";
                    LbL_Title.Text = "اعضاء هیئت علمی سایت فاسکو";
                    LbL_Title.Visible = true;
                }
            }

            else
            {
                LbL_Title.Text = "لیست کامل برترین های فاسکو";
                LbL_Title.Visible = true;

            }

            //else LbL_Title.Visible = false;
            SqlConnection strConnection = null;
            SqlDataReader DR;
            strConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("User_Top_Paging", strConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@PageIndex", SqlDbType.Int)); cmd.Parameters["@PageIndex"].Value = gvPageIndex;
            cmd.Parameters.Add(new SqlParameter("@PageSize", SqlDbType.Int)); cmd.Parameters["@PageSize"].Value = gvPageSize;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)); cmd.Parameters["@id"].Value = 0;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar)); cmd.Parameters["@mode"].Value = Mode;
            cmd.Parameters.Add(new SqlParameter("@Text", SqlDbType.NVarChar)); cmd.Parameters["@Text"].Value = text_;
            //try
            //{
            strConnection.Open();
            DR = cmd.ExecuteReader();

            DR.Read();
            // drpPaging.Items.Clear();
            Fill_Paging_List(Convert.ToInt32(DR[0]), gvPageSize);
            //if ((IsPostBack) && (ViewState["drpPagingIndex"] != null))
            //{ drpPaging.SelectedIndex = Convert.ToInt32(ViewState["drpPagingIndex"].ToString()); }
            DR.NextResult();
            int count = DR.FieldCount;
            DataList_User.DataSource = DR;
            DataList_User.DataBind();
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
        }
    }
}
