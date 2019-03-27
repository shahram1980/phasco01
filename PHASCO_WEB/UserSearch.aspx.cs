using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using phasco_webproject.BaseClass;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using Membership_Manage;
using DataAccessLayer;

namespace Rahbina.Users
{
    public partial class UserSearch : System.Web.UI.Page
    {
        TBL_Search_Users search = new TBL_Search_Users();
        TBL_User_Friends friends = new TBL_User_Friends();
        DataTable dt = new DataTable();
        int pageindex = 25;
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

            lbl_msg_wrapper.Visible = false;



        }
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                if (Request.QueryString["UidNma91okp"] != null)// && Request.QueryString["SdkieBop9"] != null)
                {
                    Session["UidNma91okp"] = Request.QueryString["UidNma91okp"].ToString();
                    Session["SdkieBop9"] = "";// Request.QueryString["SdkieBop9"].ToString();

                    txt_name.Text = Session["UidNma91okp"].ToString();
                    //  drp_gender.SelectedValue = Session["SdkieBop9"].ToString();
                    Bind_Grd();
                }
            }

            if (UserOnline.User_Online_Valid() == true)
            {
                if (Request.QueryString["userid"] != null)
                {
                    int Current_User_Id = UserOnline.id();
                    dt = friends.Insert_del_update(1, Current_User_Id, "0", 0, int.Parse(Request.QueryString["userid"].ToString()), null);
                    if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() == "0")
                    { lbl_msg.Text = "این کاربر قبلا به لیست شما اضافه شده است"; }
                    else lbl_msg.Text = "کاربر انتخابی به لیست شما اضافه شد";
                    lbl_msg_wrapper.Visible = true;
                }
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (txt_name.Text != "") Response.Redirect("UserSearch.aspx?UidNma91okp=" + txt_name.Text);// + "&SdkieBop9=" + drp_gender.SelectedValue.ToString());
        }

        protected void Bind_Grd()
        {
            Bind_User_List(0, pageindex, Session["UidNma91okp"].ToString());
            //try { Bind_User_List(0, pageindex, Session["UidNma91okp"].ToString() ); }
            //catch (Exception) { }
        }


        protected void Bind_User_List(int gvPageIndex, int gvPageSize, string Name)
        {
            SqlConnection strConnection = null;
            SqlDataReader DR;
            strConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[SP_Search_User]", strConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@PageIndex", SqlDbType.Int)); cmd.Parameters["@PageIndex"].Value = gvPageIndex;
            cmd.Parameters.Add(new SqlParameter("@PageSize", SqlDbType.Int)); cmd.Parameters["@PageSize"].Value = gvPageSize;
            cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar)); cmd.Parameters["@Name"].Value = Name;
            cmd.Parameters.Add(new SqlParameter("@Gender", SqlDbType.Int)); cmd.Parameters["@Gender"].Value = 0;

            strConnection.Open();
            DR = cmd.ExecuteReader();

            DR.Read();
            Fill_Paging_List(Convert.ToInt32(DR[0]), gvPageSize);
            DR.NextResult();
            // Lbl_Count.Text = DR[0].ToString();
            DataList_User.DataSource = DR;
            DataList_User.DataBind();


            cmd.Dispose();
            strConnection.Close();
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
                    DataRow dr = dt.NewRow();
                    dr[0] = (i + 1).ToString();
                    dr[1] = i.ToString();
                    dt.Rows.Add(dr);
                }
                Repeater_Article_List.DataSource = ds;
                Repeater_Article_List.DataMember = "paging_Table";
                Repeater_Article_List.DataBind();
            }
            else { }
        }
        protected void Linkbutton_Panging_Command(object sender, CommandEventArgs e)
        {
            ViewState["drpPagingIndex"] = e.CommandArgument;
            string name = Session["UidNma91okp"].ToString();
            int sex = int.Parse(Session["SdkieBop9"].ToString());
            int page = int.Parse(e.CommandArgument.ToString());
            Bind_User_List(page, pageindex, name);
        }
    }
}
