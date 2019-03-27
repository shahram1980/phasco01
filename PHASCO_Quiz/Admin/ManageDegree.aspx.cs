using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineTest.BLL;
using System.Data;
using System.Data.SqlClient;

namespace OnlineTest.Admin
{
    public partial class ManageDegree : System.Web.UI.Page
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
            TBL_Phasco_OnlineTest_DegreeTable selectAll = new TBL_Phasco_OnlineTest_DegreeTable();

            GridView_Degree.DataSource = selectAll.TBL_Phasco_OnlineTest_Degree_I(2);
            GridView_Degree.DataBind();
        }

        protected void GridView_Degree_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                string DegreeName = "";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DegreeName = e.Row.Cells[2].Text;
                    ((LinkButton)(e.Row.Controls[3].Controls[0])).OnClientClick =
                        "return confirm('مقطع تحصیلی" + "«" + DegreeName + "»" + " حذف شود ')";
                }
            }
            catch { }
        }


        protected void GridView_Degree_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Degree.EditIndex = e.NewEditIndex;
            BindData();
        }
        protected void GridView_Degree_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Degree.EditIndex = -1;
            BindData();
        }
        protected void GridView_Degree_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            if (((LinkButton)GridView_Degree.Rows[0].Cells[0].Controls[0]).Text == "افزودن")
            {
                string DegreeName = ((TextBox)GridView_Degree.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_DegreeTable insert = new TBL_Phasco_OnlineTest_DegreeTable();
                GridView_Degree.DataSource = insert.TBL_Phasco_OnlineTest_Degree_I(1, DegreeName);
            }
            else
            {
                int id = Convert.ToInt32(GridView_Degree.Rows[e.RowIndex].Cells[1].Text);
                string DegreeName = ((TextBox)GridView_Degree.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                TBL_Phasco_OnlineTest_DegreeTable update = new TBL_Phasco_OnlineTest_DegreeTable();
                update.TBL_Phasco_OnlineTest_Degree_U(1, id, DegreeName);
            }


            GridView_Degree.EditIndex = -1;
            BindData();
        }

        protected void GridView_Degree_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView_Degree.Rows[e.RowIndex].Cells[1].Text);

            TBL_Phasco_OnlineTest_DegreeTable delete = new TBL_Phasco_OnlineTest_DegreeTable();
            delete.TBL_Phasco_OnlineTest_Degree_D(1, id);



            BindData();

        }

        protected void ButtonAddField_Click(object sender, EventArgs e)
        {

            TBL_Phasco_OnlineTest_DegreeTable selectAll = new TBL_Phasco_OnlineTest_DegreeTable();

            DataTable dt = selectAll.TBL_Phasco_OnlineTest_Degree_I(2);

            // Here we'll add a blank row to the returned DataTable
            DataRow dr = dt.NewRow();
            dt.Rows.InsertAt(dr, 0);
            //Creating the first row of GridView to be Editable
            GridView_Degree.EditIndex = 0;
            GridView_Degree.DataSource = dt;
            GridView_Degree.DataBind();
            //Changing the Text for Inserting a New Record
            ((LinkButton)GridView_Degree.Rows[0].Cells[0].Controls[0]).Text = "افزودن";
        }
    }
}
