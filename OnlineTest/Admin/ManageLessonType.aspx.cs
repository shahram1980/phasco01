using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineTest.BLL;
using System.Data;

namespace OnlineTest.Admin
{
    public partial class ManageLessonType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            TBL_Phasco_OnlineTest_LessonTypeTable selectAll = new TBL_Phasco_OnlineTest_LessonTypeTable();

            GridView_LessonType.DataSource = selectAll.TBL_Phasco_OnlineTest_LessonType_I(2);
            GridView_LessonType.DataBind();
            GridView_LessonType.RowDataBound+=new GridViewRowEventHandler(GridView_LessonType_RowDataBound);
        }

        protected void GridView_LessonType_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                string DegreeName = "";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DegreeName = e.Row.Cells[2].Text;
                    ((LinkButton)(e.Row.Controls[3].Controls[0])).OnClientClick =
                        "return confirm('نوع" + "«" + DegreeName + "»" + " حذف شود ')";
                }
            }
            catch { }
        }

        protected void GridView_LessonType_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_LessonType.EditIndex = e.NewEditIndex;
            BindData();
        }
        protected void GridView_LessonType_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_LessonType.EditIndex = -1;
            BindData();
        }
        protected void GridView_LessonType_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            if (((LinkButton)GridView_LessonType.Rows[0].Cells[0].Controls[0]).Text == "افزودن")
            {
                string LessonTypeName = ((TextBox)GridView_LessonType.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_LessonTypeTable insert = new TBL_Phasco_OnlineTest_LessonTypeTable();
                GridView_LessonType.DataSource = insert.TBL_Phasco_OnlineTest_LessonType_I(1, LessonTypeName);
            }
            else
            {
                int id = Convert.ToInt32(GridView_LessonType.Rows[e.RowIndex].Cells[1].Text);
                string LessonTypeName = ((TextBox)GridView_LessonType.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_LessonTypeTable update = new TBL_Phasco_OnlineTest_LessonTypeTable();
                update.TBL_Phasco_OnlineTest_LessonType_U(1, id, LessonTypeName);
            }


            GridView_LessonType.EditIndex = -1;
            BindData();
        }

        protected void GridView_LessonType_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView_LessonType.Rows[e.RowIndex].Cells[1].Text);

            TBL_Phasco_OnlineTest_LessonTypeTable delete = new TBL_Phasco_OnlineTest_LessonTypeTable();
            delete.TBL_Phasco_OnlineTest_LessonType_D(1, id);



            BindData();

        }

 

        protected void ButtonAdd_LessonType_Click(object sender, EventArgs e)
        {
          TBL_Phasco_OnlineTest_LessonTypeTable selectAll = new TBL_Phasco_OnlineTest_LessonTypeTable();

            DataTable dt = selectAll.TBL_Phasco_OnlineTest_LessonType_I(2);

            // Here we'll add a blank row to the returned DataTable
            DataRow dr = dt.NewRow();
            dt.Rows.InsertAt(dr, 0);
            //Creating the first row of GridView to be Editable
            GridView_LessonType.EditIndex = 0;
            GridView_LessonType.DataSource = dt;
            GridView_LessonType.DataBind();
            //Changing the Text for Inserting a New Record
            ((LinkButton)GridView_LessonType.Rows[0].Cells[0].Controls[0]).Text = "افزودن";
        }
    }
}
