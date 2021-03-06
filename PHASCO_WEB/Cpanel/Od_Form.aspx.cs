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
using phasco_webproject.BaseClass;
using Membership_Manage;

namespace PHASCO_WEB.Cpanel
{
    public partial class Od_Form : System.Web.UI.Page
    {
        #region Dataset
        DAL.DS_MainPhascoTableAdapters.OD_Err_TblTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.OD_Err_TblTableAdapter();
        DAL.DS_MainPhasco.OD_Err_TblDataTable dt_od = new PHASCO_WEB.DAL.DS_MainPhasco.OD_Err_TblDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.QueryString["id"] != null)
                    set_Detail();
                else
                    Bind_Article_List(0, 50, "", 0);
        }

        protected void Bind_Article_List(int gvPageIndex, int gvPageSize, string Mode, int id)
        {
            SqlConnection strConnection = null;
            SqlDataReader DR;
            strConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.GrandResConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand("Od_Admin_List_Paging", strConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@PageIndex", SqlDbType.Int)); cmd.Parameters["@PageIndex"].Value = gvPageIndex;
            cmd.Parameters.Add(new SqlParameter("@PageSize", SqlDbType.Int)); cmd.Parameters["@PageSize"].Value = gvPageSize;
            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)); cmd.Parameters["@id"].Value = id;

            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar)); cmd.Parameters["@mode"].Value = Mode;



            strConnection.Open();
            DR = cmd.ExecuteReader();

            DR.Read();
            drpPaging.Items.Clear();
            Fill_Paging_List(Convert.ToInt32(DR[0]), gvPageSize, drpPaging);
            if ((IsPostBack) && (ViewState["drpPagingIndex"] != null))
            { drpPaging.SelectedIndex = Convert.ToInt32(ViewState["drpPagingIndex"].ToString()); }
            DR.NextResult();
            RPT_Od.DataSource = DR;
            RPT_Od.DataBind();

            cmd.Dispose();
            strConnection.Close();

            MultiView1.ActiveViewIndex = 0;

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
                RPT_Od.DataSource = ds;
                RPT_Od.DataMember = "paging_Table";
                RPT_Od.DataBind();
            }
            else
                TargetDropDown.Items.Add(new ListItem("Just this Page", "-1"));
        }
        protected void drpPaging_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["drpPagingIndex"] = drpPaging.SelectedIndex;
            Bind_Article_List(drpPaging.SelectedIndex, 5, "", 0);
        }

        void set_Detail()
        {
            dt_od = da.select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (dt_od[0].Mode == 0) Label_Mode.Text = "فرم OD"; HiddenField_Mode.Value = "0";
            if (dt_od[0].Mode == 1) Label_Mode.Text = "رفع اشکال"; HiddenField_Mode.Value = "1";

            TextBox_Az_Name.Text = dt_od[0].Az_Name;
            TextBox_Mas_Test.Text = dt_od[0].Mas_Test;
            TextBox_Mas_Fani.Text = dt_od[0].Mas_Fani;
            TextBox_Dafe_Estefade.Text = dt_od[0].Dafe_Estefade;
            TextBox_Tel.Text = dt_od[0].Tel;
            TextBox_Tarikh.Text = dt_od[0].Tarikh;
            TextBox_Test_mored.Text = dt_od[0].Test_mored;
            TextBox_Mark.Text = dt_od[0].Mark;
            TextBox_Tozih.Text = dt_od[0].Tozih;

            TextBox_Engeza_Tarikh.Text = dt_od[0].Engeza_Tarikh;
            TextBox_Seri_Sakht.Text = dt_od[0].Seri_Sakht;
            TextBox_A1.Text = dt_od[0].A1;
            TextBox_A2.Text = dt_od[0].A2;
            TextBox_A3.Text = dt_od[0].A3;
            TextBox_A4.Text = dt_od[0].A4;
            TextBox_A5.Text = dt_od[0].A5;
            TextBox_A6.Text = dt_od[0].A6;
            TextBox_A7.Text = dt_od[0].A7;
            TextBox_A8.Text = dt_od[0].A8;
            TextBox_A9.Text = dt_od[0].A9;
            TextBox_A10.Text = dt_od[0].A10;
            TextBox_A11.Text = dt_od[0].A11;
            TextBox_A12.Text = dt_od[0].A12;

            TextBox_B1.Text = dt_od[0].B1;
            TextBox_B2.Text = dt_od[0].B2;
            TextBox_B3.Text = dt_od[0].B3;
            TextBox_B4.Text = dt_od[0].B4;
            TextBox_B5.Text = dt_od[0].B5;
            TextBox_B6.Text = dt_od[0].B6;
            TextBox_B7.Text = dt_od[0].B7;
            TextBox_B8.Text = dt_od[0].B8;
            TextBox_B9.Text = dt_od[0].B9;
            TextBox_B10.Text = dt_od[0].B10;
            TextBox_B11.Text = dt_od[0].B11;
            TextBox_B12.Text = dt_od[0].B12;

            TextBox_C1.Text = dt_od[0].C1;
            TextBox_C2.Text = dt_od[0].C2;
            TextBox_C3.Text = dt_od[0].C3;
            TextBox_C4.Text = dt_od[0].C4;
            TextBox_C5.Text = dt_od[0].C5;
            TextBox_C6.Text = dt_od[0].C6;
            TextBox_C7.Text = dt_od[0].C7;
            TextBox_C8.Text = dt_od[0].C8;
            TextBox_C9.Text = dt_od[0].C9;
            TextBox_C10.Text = dt_od[0].C10;
            TextBox_C11.Text = dt_od[0].C11;
            TextBox_C12.Text = dt_od[0].C12;

            TextBox_D1.Text = dt_od[0].D1;
            TextBox_D2.Text = dt_od[0].D2;
            TextBox_D3.Text = dt_od[0].D3;
            TextBox_D4.Text = dt_od[0].D4;
            TextBox_D5.Text = dt_od[0].D5;
            TextBox_D6.Text = dt_od[0].D6;
            TextBox_D7.Text = dt_od[0].D7;
            TextBox_D8.Text = dt_od[0].D8;
            TextBox_D9.Text = dt_od[0].D9;
            TextBox_D10.Text = dt_od[0].D10;
            TextBox_D11.Text = dt_od[0].D11;
            TextBox_D12.Text = dt_od[0].D12;

            TextBox_E1.Text = dt_od[0].E1;
            TextBox_E2.Text = dt_od[0].E2;
            TextBox_E3.Text = dt_od[0].E3;
            TextBox_E4.Text = dt_od[0].E4;
            TextBox_E5.Text = dt_od[0].E5;
            TextBox_E6.Text = dt_od[0].E6;
            TextBox_E7.Text = dt_od[0].E7;
            TextBox_E8.Text = dt_od[0].E8;
            TextBox_E9.Text = dt_od[0].E9;
            TextBox_E10.Text = dt_od[0].E10;
            TextBox_E11.Text = dt_od[0].E11;
            TextBox_E12.Text = dt_od[0].E12;

            TextBox_F1.Text = dt_od[0].F1;
            TextBox_F2.Text = dt_od[0].F2;
            TextBox_F3.Text = dt_od[0].F3;
            TextBox_F4.Text = dt_od[0].F4;
            TextBox_F5.Text = dt_od[0].F5;
            TextBox_F6.Text = dt_od[0].F6;
            TextBox_F7.Text = dt_od[0].F7;
            TextBox_F8.Text = dt_od[0].F8;
            TextBox_F9.Text = dt_od[0].F9;
            TextBox_F10.Text = dt_od[0].F10;
            TextBox_F11.Text = dt_od[0].F11;
            TextBox_F12.Text = dt_od[0].F12;

            TextBox_G1.Text = dt_od[0].G1;
            TextBox_G2.Text = dt_od[0].G2;
            TextBox_G3.Text = dt_od[0].G3;
            TextBox_G4.Text = dt_od[0].G4;
            TextBox_G5.Text = dt_od[0].G5;
            TextBox_G6.Text = dt_od[0].G6;
            TextBox_G7.Text = dt_od[0].G7;
            TextBox_G8.Text = dt_od[0].G8;
            TextBox_G9.Text = dt_od[0].G9;
            TextBox_G10.Text = dt_od[0].G10;
            TextBox_G11.Text = dt_od[0].G11;
            TextBox_G12.Text = dt_od[0].G12;

            TextBox_H1.Text = dt_od[0].H1;
            TextBox_H2.Text = dt_od[0].H2;
            TextBox_H3.Text = dt_od[0].H3;
            TextBox_H4.Text = dt_od[0].H4;
            TextBox_H5.Text = dt_od[0].H5;
            TextBox_H6.Text = dt_od[0].H6;
            TextBox_H7.Text = dt_od[0].H7;
            TextBox_H8.Text = dt_od[0].H8;
            TextBox_H9.Text = dt_od[0].H9;
            TextBox_H10.Text = dt_od[0].H10;
            TextBox_H11.Text = dt_od[0].H11;
            TextBox_H12.Text = dt_od[0].H12;
            MultiView1.ActiveViewIndex = 1;
        }

        protected void LinkButton_Archive_Click(object sender, EventArgs e)
        {
            da.Archive_Od(int.Parse(Request.QueryString["id"].ToString()));
            int mode = 0;
            if (HiddenField_Mode.Value.ToString() == "0") mode = 3;
            if (HiddenField_Mode.Value.ToString() == "1") mode = 6;
            UserOnline.Add_Point(int.Parse(Request.QueryString["uid"].ToString()), mode,  "auto");
            Response.Redirect("od_form.aspx");
        }

        protected void LinkButton_Delete_Click(object sender, EventArgs e)
        {
            da.Delete_Id(int.Parse(Request.QueryString["id"].ToString()));
            Response.Redirect("od_form.aspx");
        }
    }
}
