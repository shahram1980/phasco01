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
    public partial class ManageLessons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request["id"] == null)
                {
                    //Farsi_calendar farsi = new Farsi_calendar();
                    //farsi.Get_farsi_calendar();
                    BindData();
                    MultiView1.ActiveViewIndex = 0;
                    BindLessonType();
                }
                else
                {
                    int id = Convert.ToInt32(Request["id"].ToString());
                    MultiView1.ActiveViewIndex = 1;
                    BindLessonTypeEdit();
                    GetlessonByID(id);
                }
            }
        }

        private void BindData()
        {
            TBL_Phasco_OnlineTest_LessonTable selectAll = new TBL_Phasco_OnlineTest_LessonTable();

            GridView_Lesson.DataSource = selectAll.TBL_Phasco_OnlineTest_Lesson_I(2);
            GridView_Lesson.DataBind();


        }
        //
        private void BindLessonType()
        {


            TBL_Phasco_OnlineTest_LessonTypeTable allTypes = new TBL_Phasco_OnlineTest_LessonTypeTable();
            DropDownList_LessonType.DataSource = allTypes.TBL_Phasco_OnlineTest_LessonType_I(2);
            DropDownList_LessonType.DataBind();
        }
        private void BindLessonTypeEdit()
        {


            TBL_Phasco_OnlineTest_LessonTypeTable allTypes = new TBL_Phasco_OnlineTest_LessonTypeTable();
            DropDownList_LessonType_E.DataSource = allTypes.TBL_Phasco_OnlineTest_LessonType_I(2);
            DropDownList_LessonType_E.DataBind();
        }
        //
        private void GetlessonByID(int id)
        {
            TBL_Phasco_OnlineTest_LessonTable selectAll = new TBL_Phasco_OnlineTest_LessonTable();

            DataTable dt = selectAll.TBL_Phasco_OnlineTest_Lesson_I(3, id);
            TextBox_LessonCoefficient_E.Text = dt.Rows[0]["LessonCoefficient"].ToString();
            TextBox_LessonName_E.Text = dt.Rows[0]["LessonName"].ToString();
            DropDownList_LessonType_E.SelectedValue = dt.Rows[0]["LessonType"].ToString();
            TextBox_TimeToAnswer_E.Text = dt.Rows[0]["TimeToAnswer"].ToString();
            FCKeditor_Lessondescription_E.Value = dt.Rows[0]["Lessondescription"].ToString();
            HyperLink_questions.NavigateUrl = "~/admin/QuestionsOFaLesson.aspx?status=insert&id=" + id.ToString();
            //
            //get groups
            TBL_Phasco_OnlineTest_FieldsGroupTable all = new TBL_Phasco_OnlineTest_FieldsGroupTable();
            DropDownList_groups.DataSource = all.TBL_Phasco_OnlineTest_FieldsGroup_I(2);
            DropDownList_groups.DataBind();
            //get degrees
            TBL_Phasco_OnlineTest_DegreeTable allDegree = new TBL_Phasco_OnlineTest_DegreeTable();
            CheckBoxList_Degrees.DataSource = allDegree.TBL_Phasco_OnlineTest_Degree_I(2);
            CheckBoxList_Degrees.DataBind();
            int LessonID = Convert.ToInt32(Request["id"].ToString());
            TBL_Phasco_OnlineTest_Lesson_DegreeTable alldegrees = new TBL_Phasco_OnlineTest_Lesson_DegreeTable();
            DataTable dt_degrees = alldegrees.TBL_Phasco_OnlineTest_Lesson_Degree_I(2, LessonID);
            for (int i = 0; i < dt_degrees.Rows.Count; i++)
            {
                for (int j = 0; j < CheckBoxList_Degrees.Items.Count; j++)
                {
                    if (dt_degrees.Rows[i]["DegreeID"].ToString() == CheckBoxList_Degrees.Items[j].Value)
                    {
                        CheckBoxList_Degrees.Items[j].Selected = true;
                    }
                }
            }


        }



        protected void ButtonAdd_Lesson_Click(object sender, EventArgs e)
        {
            string LessonName = TextBox_LessonName.Text.Trim();
            int LessonType = Convert.ToInt32(DropDownList_LessonType.SelectedValue);

            int LessonCoefficient = int.Parse(TextBox_LessonCoefficient.Text.Trim());
            int TimeToAnswer = int.Parse(TextBox_TimeToAnswer.Text.Trim());
            string Lessondescription = FCKeditor_Lessondescription.Value;
            DateTime LastModificationDate = DateTime.Now.Date;

            TBL_Phasco_OnlineTest_LessonTable insert = new TBL_Phasco_OnlineTest_LessonTable();
            insert.TBL_Phasco_OnlineTest_Lesson_I(1, LessonName, LessonType, LessonCoefficient, Lessondescription, LastModificationDate,TimeToAnswer);

            //
            TextBox_LessonName.Text = string.Empty;
            TextBox_LessonCoefficient.Text = string.Empty;
            FCKeditor_Lessondescription.Value = string.Empty;

            BindData();
        }
        public string get_farsi_date(object date)
        {
            DateTime d = DateTime.Parse(date.ToString());
            return d.ToString("d");
        }
        public void GridRowDelete_Lesson(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            TBL_Phasco_OnlineTest_LessonTable delete = new TBL_Phasco_OnlineTest_LessonTable();
            delete.TBL_Phasco_OnlineTest_Lesson_D(1, id);
            BindData();
        }

        protected void Button_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/ManageLessons.aspx");
        }

        protected void ButtonEdit_Lesson_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request["id"].ToString());
            string LessonName = TextBox_LessonName_E.Text.Trim();
            int LessonType = Convert.ToInt32(DropDownList_LessonType_E.SelectedValue);
            int TimeToAnswer = int.Parse(TextBox_TimeToAnswer_E.Text.Trim());
            int LessonCoefficient = int.Parse(TextBox_LessonCoefficient_E.Text.Trim());

            string Lessondescription = FCKeditor_Lessondescription_E.Value;
            DateTime LastModificationDate = DateTime.Now.Date;

            TBL_Phasco_OnlineTest_LessonTable update = new TBL_Phasco_OnlineTest_LessonTable();
            update.TBL_Phasco_OnlineTest_Lesson_U(1, id, LessonName, LessonType, LessonCoefficient, Lessondescription, LastModificationDate, TimeToAnswer);

            //updating Fields and degrees
            //updating Fields
            if (CheckBoxList_Fields.Visible)
            {
                int group_Id = int.Parse(DropDownList_groups.SelectedValue.ToString());
                TBL_Phasco_OnlineTest_Lesson_FieldTable deleteUpdate_Fields = new TBL_Phasco_OnlineTest_Lesson_FieldTable();
                deleteUpdate_Fields.TBL_Phasco_OnlineTest_Lesson_Field_D(1, id, group_Id,"");

                for (int j = 0; j < CheckBoxList_Fields.Items.Count; j++)
                {
                    if (CheckBoxList_Fields.Items[j].Selected)
                        deleteUpdate_Fields.TBL_Phasco_OnlineTest_Lesson_Field_I(1, id, int.Parse(CheckBoxList_Fields.Items[j].Value), group_Id,0);
                }
            }
            //updating degrees
            TBL_Phasco_OnlineTest_Lesson_DegreeTable deleteUpdate_Degrees = new TBL_Phasco_OnlineTest_Lesson_DegreeTable();
            deleteUpdate_Degrees.TBL_Phasco_OnlineTest_Lesson_Degree_D(1, id);
            for (int j = 0; j < CheckBoxList_Degrees.Items.Count; j++)
            {
                if (CheckBoxList_Degrees.Items[j].Selected)
                {

                    deleteUpdate_Degrees.TBL_Phasco_OnlineTest_Lesson_Degree_I(1, id, int.Parse(CheckBoxList_Degrees.Items[j].Value));
                }
            }

            Label_report.Text = "تغییرات با موفقیت اعمال شد";



        }

        protected void DropDownList_groups_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                int GroupID = Convert.ToInt32(DropDownList_groups.SelectedValue);
                TBL_Phasco_OnlineTest_FieldsTable all = new TBL_Phasco_OnlineTest_FieldsTable();
                CheckBoxList_Fields.DataSource = all.TBL_Phasco_OnlineTest_Fields_I(2, GroupID);
                CheckBoxList_Fields.DataBind();
                // 
                CheckBoxList_Fields.Visible = true;
                int LessonID = Convert.ToInt32(Request["id"].ToString());
                TBL_Phasco_OnlineTest_Lesson_FieldTable allFields = new TBL_Phasco_OnlineTest_Lesson_FieldTable();
                DataTable dt_Field = allFields.TBL_Phasco_OnlineTest_Lesson_Field_I(2, LessonID);
                for (int i = 0; i < dt_Field.Rows.Count; i++)
                {
                    for (int j = 0; j < CheckBoxList_Fields.Items.Count; j++)
                    {
                        if (dt_Field.Rows[i]["FieldID"].ToString() == CheckBoxList_Fields.Items[j].Value)
                        {
                            CheckBoxList_Fields.Items[j].Selected = true;
                        }
                    }
                }

            }
            catch
            {
                TBL_Phasco_OnlineTest_FieldsTable all = new TBL_Phasco_OnlineTest_FieldsTable();
                CheckBoxList_Fields.DataSource = all.TBL_Phasco_OnlineTest_Fields_I(2, -1);
                CheckBoxList_Fields.DataBind();
            }


        }

    }
}