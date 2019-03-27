using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineTest.BLL;
using System.Data;

namespace OnlineTest.user
{
    public partial class MakeQuiz : System.Web.UI.Page
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

            DropDownList_Degree.DataSource = selectAll.TBL_Phasco_OnlineTest_Degree_I(2);
            DropDownList_Degree.DataBind();
            //
            TBL_Phasco_OnlineTest_FieldsGroupTable selectAllgroups = new TBL_Phasco_OnlineTest_FieldsGroupTable();

            DropDownList_group.DataSource = selectAllgroups.TBL_Phasco_OnlineTest_FieldsGroup_I(2);
            DropDownList_group.DataBind();
            //

        }

        protected void DropDownList_group_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList_Fields.DataSource = null;
            DropDownList_Fields.DataBind();
            TBL_Phasco_OnlineTest_FieldsTable selectAllFields = new TBL_Phasco_OnlineTest_FieldsTable();
            int GroupID = int.Parse(DropDownList_group.SelectedValue);
            DropDownList_Fields.DataSource = selectAllFields.TBL_Phasco_OnlineTest_Fields_I(2, GroupID);
            DropDownList_Fields.DataBind();
            //
            int FieldID = Convert.ToInt32(DropDownList_Fields.SelectedValue);
            TBL_Phasco_OnlineTest_Lesson_FieldTable AllLessons = new TBL_Phasco_OnlineTest_Lesson_FieldTable();
            DataTable dt = AllLessons.TBL_Phasco_OnlineTest_Lesson_Field_I(3, 0, FieldID,0,0);
            Repeater_lessons.DataSource = dt;
            Repeater_lessons.DataBind();
        }

        protected void Button_MakeQuiz_Click(object sender, EventArgs e)
        {
            int FieldID = Convert.ToInt32(DropDownList_Fields.SelectedValue);
            int DegreeID = Convert.ToInt32(DropDownList_Degree.SelectedValue);
            int UserID = 1;
            string QuizTitle = TextBox_QuizTitle.Text.Trim();
            double QuizScore = 0;

            DateTime CreationDate = DateTime.Now.Date;
            //
            TBL_Phasco_OnlineTest_QuizTable newQuiz = new TBL_Phasco_OnlineTest_QuizTable();
            DataTable dt = newQuiz.TBL_Phasco_OnlineTest_Quiz_I(1, FieldID, DegreeID, UserID, QuizTitle, QuizScore, CreationDate);
            int QuizID = Convert.ToInt32(dt.Rows[0]["id"].ToString());
            //Now we invoke the questions randomly
            int QuestionNumber = 1;
            int TimeOfTest = 0;
            for (int i = 0; i < Repeater_lessons.Items.Count; i++)
            {

                int QuestionCount = Convert.ToInt32(((TextBox)Repeater_lessons.Items[i].FindControl("TextBox_LessonCount")).Text);
                int TimeToAnswer = Convert.ToInt32(((HiddenField)Repeater_lessons.Items[i].FindControl("HiddenField_TimeToAnswer")).Value);
                if (QuestionCount > 0)
                {
                    TimeOfTest = TimeOfTest + (TimeToAnswer * QuestionCount);
                    TBL_Phasco_OnlineTest_QuestionAnswerTable RandomQuestions = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
                    int LessonID = Convert.ToInt32(((HiddenField)Repeater_lessons.Items[i].FindControl("HiddenField_LessonID")).Value);
                    DataTable dt_QuestionCount = RandomQuestions.TBL_Phasco_OnlineTest_QuestionAnswer_I(4, QuestionCount, "", LessonID);
                    TBL_Phasco_OnlineTest_QuestionUserAnswerTable selected = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
                    for (int j = 0; j < dt_QuestionCount.Rows.Count; j++)
                    {
                        selected.TBL_Phasco_OnlineTest_QuestionUserAnswer_I(1, QuizID, Convert.ToInt32(
                            dt_QuestionCount.Rows[j]["QuestionID"].ToString()), QuestionNumber);
                        QuestionNumber++;
                    }
                    TBL_Phasco_OnlineTest_Lesson_QuizTable insert = new TBL_Phasco_OnlineTest_Lesson_QuizTable();
                    insert.TBL_Phasco_OnlineTest_Lesson_Quiz_I(1, QuizID, LessonID, QuestionNumber - QuestionCount, QuestionNumber - 1);
                }
            }
            if (RadioButton_Arbitrary.Checked)
            {
                int min = Convert.ToInt32(TextBox_TimeToAnswer.Text.Trim());
                Session["TimeOfTest"] = (min * 60).ToString();
            }
            else if (RadioButton_Infinite.Checked)
            {
                Session["TimeOfTest"] = "36000";
            }
            else if (RadioButton_standard.Checked)
            {
                Session["TimeOfTest"] = TimeOfTest;
            }
            Response.Redirect("~/user/UserCreatedQuiz.aspx?QuizID=" + QuizID);
        }

        protected void DropDownList_Fields_SelectedIndexChanged(object sender, EventArgs e)
        {
            int FieldID = Convert.ToInt32(DropDownList_Fields.SelectedValue);
            TBL_Phasco_OnlineTest_Lesson_FieldTable AllLessons = new TBL_Phasco_OnlineTest_Lesson_FieldTable();
            DataTable dt = AllLessons.TBL_Phasco_OnlineTest_Lesson_Field_I(3, 0, FieldID,0,0);
            Repeater_lessons.DataSource = dt.DefaultView;
            Repeater_lessons.DataBind();

        }

        protected void Repeater_lessons_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {



        }

        protected void RadioButton_Arbitrary_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton_Arbitrary.Checked)
            {
                Td_TimeToAnswer.Visible = true;
                TextBox_TimeToAnswer.Text = "";
            }
            else if (!RadioButton_Arbitrary.Checked)
            {
                Td_TimeToAnswer.Visible = false;
            }
        }

        protected void RadioButton_Infinite_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton_Infinite.Checked)
            {
                Td_TimeToAnswer.Visible = false;
                TextBox_TimeToAnswer.Text = "-1";
            }
         
        }

        protected void RadioButton_standard_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton_standard.Checked)
            {
                Td_TimeToAnswer.Visible = false;
                TextBox_TimeToAnswer.Text = "0";
            }
        }


    }
}
