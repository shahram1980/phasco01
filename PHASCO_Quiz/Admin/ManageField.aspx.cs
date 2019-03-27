using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using OnlineTest.BLL;

namespace OnlineTest.Admin
{
    public partial class ManageField : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindDataGroup();
            }
        }

        private void BindDataGroup()
        {
  
            //
            TBL_Phasco_OnlineTest_FieldsGroupTable selectAllgroups = new TBL_Phasco_OnlineTest_FieldsGroupTable();

            GridView_FieldsGroup.DataSource = selectAllgroups.TBL_Phasco_OnlineTest_FieldsGroup_I(2);
            GridView_FieldsGroup.DataBind();
        }
        private void BindDataField(int GroupID)
        {
            TBL_Phasco_OnlineTest_FieldsTable selectAll = new TBL_Phasco_OnlineTest_FieldsTable();

            GridView_Fields.DataSource = selectAll.TBL_Phasco_OnlineTest_Fields_I(2, GroupID);
            GridView_Fields.DataBind();
     
        }
        protected void GridView_FieldsGroupRowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                string FieldsGroup = "";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    FieldsGroup = e.Row.Cells[2].Text;
                    ((LinkButton)(e.Row.Controls[3].Controls[0])).OnClientClick =
                        "return confirm('گروه" + "«" + FieldsGroup + "»" + " حذف شود ')";
                }
            }
            catch { }
        }
        protected void GridView_FieldsRowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                string Fields = "";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Fields = e.Row.Cells[2].Text;
                    ((LinkButton)(e.Row.Controls[3].Controls[0])).OnClientClick =
                        "return confirm('رشته" + "«" + Fields + "»" + " حذف شود ')";
                }
            }
            catch { }
        }

        protected void GridView_Fields_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Fields.EditIndex = e.NewEditIndex;
            BindDataField(Convert.ToInt32(HiddenField_groupID.Value));
        }
        protected void GridView_Fields_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Fields.EditIndex = -1;
            BindDataField(Convert.ToInt32(HiddenField_groupID.Value));
        }
        protected void GridView_Fields_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            if (((LinkButton)GridView_Fields.Rows[0].Cells[0].Controls[0]).Text == "افزودن")
            {
                string FieldsName = ((TextBox)GridView_Fields.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_FieldsTable insert = new TBL_Phasco_OnlineTest_FieldsTable();
                int GroupID = Convert.ToInt32(HiddenField_groupID.Value);
                GridView_Fields.DataSource = insert.TBL_Phasco_OnlineTest_Fields_I(1, FieldsName,GroupID);
            }
            else
            {
                int id = Convert.ToInt32(GridView_Fields.Rows[e.RowIndex].Cells[1].Text);
                string FieldsName = ((TextBox)GridView_Fields.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_FieldsTable update = new TBL_Phasco_OnlineTest_FieldsTable();
                update.TBL_Phasco_OnlineTest_Fields_U(1, id, FieldsName);
            }


            GridView_Fields.EditIndex = -1;
            BindDataField(Convert.ToInt32(HiddenField_groupID.Value));
        }

        protected void GridView_Fields_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView_Fields.Rows[e.RowIndex].Cells[1].Text);

            TBL_Phasco_OnlineTest_FieldsTable delete = new TBL_Phasco_OnlineTest_FieldsTable();
            delete.TBL_Phasco_OnlineTest_Fields_D(1, id);



            BindDataField(Convert.ToInt32(HiddenField_groupID.Value));

        }

        protected void ButtonAddField_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_field_Click(object sender, EventArgs e)
        {

            TBL_Phasco_OnlineTest_FieldsTable selectAll = new TBL_Phasco_OnlineTest_FieldsTable();

            DataTable dt = selectAll.TBL_Phasco_OnlineTest_Fields_I(2);

            // Here we'll add a blank row to the returned DataTable
            DataRow dr = dt.NewRow();
            dt.Rows.InsertAt(dr, 0);
            //Creating the first row of GridView to be Editable
            GridView_Fields.EditIndex = 0;
            GridView_Fields.DataSource = dt;
            GridView_Fields.DataBind();
            //Changing the Text for Inserting a New Record
            ((LinkButton)GridView_Fields.Rows[0].Cells[0].Controls[0]).Text = "افزودن";
        }
        ////////////////
        
        protected void GridView_FieldsGroup_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_FieldsGroup.EditIndex = e.NewEditIndex;
            BindDataGroup();
        }
        protected void GridView_FieldsGroup_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_FieldsGroup.EditIndex = -1;
            BindDataGroup();
        }
        protected void GridView_FieldsGroup_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            if (((LinkButton)GridView_FieldsGroup.Rows[0].Cells[0].Controls[0]).Text == "افزودن")
            {  
             
                string FieldsGroupName = ((TextBox)GridView_FieldsGroup.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_FieldsGroupTable insert = new TBL_Phasco_OnlineTest_FieldsGroupTable();
                GridView_FieldsGroup.DataSource = insert.TBL_Phasco_OnlineTest_FieldsGroup_I(1, FieldsGroupName);
            }
            else
            {
                int id = Convert.ToInt32(GridView_FieldsGroup.Rows[e.RowIndex].Cells[1].Text);
              
                string FieldsGroupName = ((TextBox)GridView_FieldsGroup.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_FieldsGroupTable update = new TBL_Phasco_OnlineTest_FieldsGroupTable();
                update.TBL_Phasco_OnlineTest_FieldsGroup_U(1, id, FieldsGroupName);
            }


            GridView_FieldsGroup.EditIndex = -1;
            BindDataGroup();
        }

        protected void GridView_FieldsGroup_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView_FieldsGroup.Rows[e.RowIndex].Cells[1].Text);

            TBL_Phasco_OnlineTest_FieldsGroupTable delete = new TBL_Phasco_OnlineTest_FieldsGroupTable();
            delete.TBL_Phasco_OnlineTest_FieldsGroup_D(1, id);



            BindDataGroup();

        }



        protected void ButtonAdd_fieldGroup_Click(object sender, EventArgs e)
        {
            TBL_Phasco_OnlineTest_FieldsGroupTable selectAll = new TBL_Phasco_OnlineTest_FieldsGroupTable();

            DataTable dt = selectAll.TBL_Phasco_OnlineTest_FieldsGroup_I(2);

            // Here we'll add a blank row to the returned DataTable
            DataRow dr = dt.NewRow();
            dt.Rows.InsertAt(dr, 0);
            //Creating the first row of GridView to be Editable
            GridView_FieldsGroup.EditIndex = 0;
            GridView_FieldsGroup.DataSource = dt;
            GridView_FieldsGroup.DataBind();
            //Changing the Text for Inserting a New Record
            ((LinkButton)GridView_FieldsGroup.Rows[0].Cells[0].Controls[0]).Text = "افزودن";
        }
        public void LinkButton_viewCMD(object sender, CommandEventArgs e)
        {
            int groupID = int.Parse(e.CommandArgument.ToString());
            HiddenField_groupID.Value = groupID.ToString();
            Div_Fields.Visible = true;
            BindDataField(groupID);
            //
            TBL_Phasco_OnlineTest_FieldsGroupTable selectAllgroups = new TBL_Phasco_OnlineTest_FieldsGroupTable();

            DataTable dt = selectAllgroups.TBL_Phasco_OnlineTest_FieldsGroup_I(3,groupID);
            ButtonAdd_field.Text = "افزودن رشته به گروه" + "  " + dt.Rows[0]["GroupName"].ToString();
        }

    }
}
