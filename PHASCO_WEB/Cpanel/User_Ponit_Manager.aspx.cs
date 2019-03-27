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
using System.Data.OleDb;
using System.Configuration;
namespace PHASCO_WEB.Cpanel
{
    public partial class User_Ponit_Manager : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button Button2;
        protected System.Web.UI.WebControls.DataGrid DataGrid2;
        protected System.Web.UI.WebControls.Panel Panel3;
        #region dataset
        DAL.DS_MainPhascoTableAdapters.Point_ManageTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Point_ManageTableAdapter();
        DAL.DS_MainPhasco.Point_ManageDataTable dt = new PHASCO_WEB.DAL.DS_MainPhasco.Point_ManageDataTable();
        #endregion
        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData(DataGrid2);
            }
        }

        private void BindData(DataGrid DataGrid1)
        {
            dt = da.select_All();
            DataGrid1.DataSource = dt;
            DataGrid1.DataBind();
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {

            this.DataGrid2.CancelCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.Cancel_Grid);
            this.DataGrid2.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.Edit_Grid);
            this.DataGrid2.UpdateCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.Update_Grid);
            this.DataGrid2.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.Delete_Grid);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void Button2_Click(object sender, System.EventArgs e)
        {
            foreach (DataGridItem objItem in DataGrid2.Items)
            {
                if (objItem.ItemType != ListItemType.Header && objItem.ItemType != ListItemType.Footer && objItem.ItemType != ListItemType.Pager)
                {

                    if (((CheckBox)objItem.Cells[0].FindControl("cbSelected")).Checked == true)
                    {
                        OleDbConnection con = new OleDbConnection(ConfigurationSettings.AppSettings["connectionString"]);
                        OleDbCommand cmd = new OleDbCommand();
                        cmd.CommandText = "DELETE from emp where empId=@empId";
                        cmd.Parameters.Add("@empId", OleDbType.Numeric).Value = DataGrid2.DataKeys[objItem.ItemIndex];
                        cmd.Connection = con;
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();

                    }
                }
            }
            BindData(DataGrid2);
        }

        private void Delete_Grid(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            OleDbConnection con = new OleDbConnection(ConfigurationSettings.AppSettings["connectionString"]);
            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandText = "DELETE from emp where empId=@empId";


            cmd.Parameters.Add("@empId", OleDbType.Numeric).Value = DataGrid2.DataKeys[e.Item.ItemIndex];

            cmd.Connection = con;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

            DataGrid2.EditItemIndex = -1;
            BindData(DataGrid2);
        }

        private void Edit_Grid(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            DataGrid2.EditItemIndex = e.Item.ItemIndex;

            // Always bind the data so the datagrid can be displayed.
            BindData(DataGrid2);
        }

        private void Update_Grid(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            da.Update_Item(int.Parse(((TextBox)e.Item.Cells[1].Controls[0]).Text), ((TextBox)e.Item.Cells[2].Controls[0]).Text, int.Parse(DataGrid2.DataKeys[e.Item.ItemIndex].ToString()));
            DataGrid2.EditItemIndex = -1;
            BindData(DataGrid2);
        }

        private void Cancel_Grid(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            DataGrid2.EditItemIndex = -1;
            BindData(DataGrid2);
        }

    }
}
