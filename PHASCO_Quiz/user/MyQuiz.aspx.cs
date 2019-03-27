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
    public partial class MyQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ProccessRequest();
        }
        private void ProccessRequest()
        {
            if (Request["QuizID"] == null)
            {
                //Farsi_calendar farsi = new Farsi_calendar();
                //farsi.Get_farsi_calendar();

                MultiView1.ActiveViewIndex = 0;
                int UserID = 1;

                TBL_Phasco_OnlineTest_QuizTable MyQuiz = new TBL_Phasco_OnlineTest_QuizTable();
                GridView_MyQuiz.DataSource = MyQuiz.TBL_Phasco_OnlineTest_Quiz_I(3, UserID, 0);
                GridView_MyQuiz.DataBind();
            }
            if (Request["QuizID"] != null)
            {
                if (Request["status"] != null)
                {
                    if (Request["status"].ToString() == "workbook")
                    {
                        MultiView1.ActiveViewIndex = 1;
                        int QuizID = Convert.ToInt32(Request["QuizID"].ToString());
                        GetWorkBook(QuizID);
                    }
                    if (Request["status"].ToString() == "answers")
                    {
                        MultiView1.ActiveViewIndex = 2;
                        int QuizID = Convert.ToInt32(Request["QuizID"].ToString());
                        GetAnswers(QuizID);
                    }
                }

            }
        }
        public string get_farsi_date(object date)
        {
            DateTime d = DateTime.Parse(date.ToString());
            return d.ToString("d");
        }
        private void GetWorkBook(int QuizID)
        {
        
            //retriving Summary of lessons
            TBL_Phasco_OnlineTest_Lesson_QuizTable Lessons = new TBL_Phasco_OnlineTest_Lesson_QuizTable();
            DataTable dt_lessons = Lessons.TBL_Phasco_OnlineTest_Lesson_Quiz_I(2, QuizID);
            Repeater_results.DataSource = dt_lessons;
            Repeater_results.DataBind();
            //
            float Total_Score = 0;
            int TotalCoefficient = 0;
            for (int k = 0; k < Repeater_results.Items.Count; k++)
            {
                int StartIndex = Convert.ToInt32(((HiddenField)Repeater_results.Items[k].FindControl("HiddenField_StartIndex")).Value);
                int EndIndex = Convert.ToInt32(((HiddenField)Repeater_results.Items[k].FindControl("HiddenField_EndIndex")).Value);
                TBL_Phasco_OnlineTest_QuestionUserAnswerTable Each_Lesson = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
                DataTable dt_EachLesson = Each_Lesson.TBL_Phasco_OnlineTest_QuestionUserAnswer_I(5, QuizID, StartIndex, EndIndex, "");
                int Each_Lesson_all = Convert.ToInt32(dt_EachLesson.Rows[0]["_all"].ToString());
                int Each_Lesson_false = Convert.ToInt32(dt_EachLesson.Rows[0]["_false"].ToString());
                int Each_Lesson_true = Convert.ToInt32(dt_EachLesson.Rows[0]["_true"].ToString());

                ((Label)Repeater_results.Items[k].FindControl("Label_True")).Text = Each_Lesson_true.ToString();
                ((Label)Repeater_results.Items[k].FindControl("Label_False")).Text = Each_Lesson_false.ToString();
                ((Label)Repeater_results.Items[k].FindControl("Label_all")).Text = Each_Lesson_all.ToString();
                float average_Each_Lesson = ((float)(Each_Lesson_true * 3 - Each_Lesson_false) / (float)(Each_Lesson_all * 3)) * 100;
                average_Each_Lesson = (float)Math.Round(average_Each_Lesson, 2);
                ((Label)Repeater_results.Items[k].FindControl("Label_Grade")).Text = average_Each_Lesson.ToString();
                //
                int LessonCoefficient = Convert.ToInt32(((Label)Repeater_results.Items[k].FindControl("Label_LessonCoefficient")).Text);
                Total_Score = Total_Score + LessonCoefficient * average_Each_Lesson;
                TotalCoefficient = TotalCoefficient + LessonCoefficient;

            }
            //

            TBL_Phasco_OnlineTest_QuestionUserAnswerTable Result = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
            DataTable dt = Result.TBL_Phasco_OnlineTest_QuestionUserAnswer_I(3, QuizID);
            int _all = Convert.ToInt32(dt.Rows[0]["_all"].ToString());
            int _false = Convert.ToInt32(dt.Rows[0]["_false"].ToString());
            int _true = Convert.ToInt32(dt.Rows[0]["_true"].ToString());

            Label_all.Text = _all.ToString();
            Label_False.Text = _false.ToString();
            Label_True.Text = _true.ToString();
            float average = Total_Score / TotalCoefficient;
           
            average = (float)Math.Round(average, 2);
            Label_average.Text = average.ToString();
            //

        }
        //
        private void GetAnswers(int QuizID)
        {
            TBL_Phasco_OnlineTest_Lesson_QuizTable Lessons = new TBL_Phasco_OnlineTest_Lesson_QuizTable();
            DataTable dt_lessons = Lessons.TBL_Phasco_OnlineTest_Lesson_Quiz_I(2, QuizID);
            Repeater_Lessons.DataSource = dt_lessons;
            Repeater_Lessons.DataBind();
            //
            TBL_Phasco_OnlineTest_QuizTable GetQuizID = new TBL_Phasco_OnlineTest_QuizTable();
            DataTable dt = GetQuizID.TBL_Phasco_OnlineTest_Quiz_I(2, QuizID);
            Label_QuizTitle.Text = dt.Rows[0]["QuizTitle"].ToString();

            for (int k = 0; k < Repeater_Lessons.Items.Count; k++)
            {
                int StartIndex = Convert.ToInt32(((Label)Repeater_Lessons.Items[k].FindControl("Label_StartIndex")).Text);
                int EndIndex = Convert.ToInt32(((Label)Repeater_Lessons.Items[k].FindControl("Label_EndIndex")).Text);
                Repeater Repeater_questions = ((Repeater)Repeater_Lessons.Items[k].FindControl("Repeater_questions"));
                //

                TBL_Phasco_OnlineTest_QuestionUserAnswerTable All_Q = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
                DataTable dt_All_Q = All_Q.TBL_Phasco_OnlineTest_QuestionUserAnswer_I(4, QuizID, StartIndex, EndIndex, "");
                Repeater_questions.DataSource = dt_All_Q;
                Repeater_questions.DataBind();
                //
                for (int i = 0; i < Repeater_questions.Items.Count; i++)
                {
                    int QuestionID = Convert.ToInt32(((HiddenField)Repeater_questions.Items[i].FindControl("HiddenField_QuestionID")).Value);
                    //getting swith answers
                    TBL_Phasco_OnlineTest_AnswerSwitchTable AllSwitchs = new TBL_Phasco_OnlineTest_AnswerSwitchTable();
                    DataTable dt_switchs_body = AllSwitchs.TBL_Phasco_OnlineTest_AnswerSwitch_I(3, QuestionID);
                    for (int l = 0; l < 4; l++)
                    {
                        BoldAnswer(((Label)Repeater_questions.Items[i].FindControl("Label_answer" + (l + 1).ToString())), dt_switchs_body.Rows[l], l + 1);
                    }
                 

                    //getting answers
                    TBL_Phasco_OnlineTest_QuestionUserAnswerTable answer = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
                    DataTable dt_switchs = answer.TBL_Phasco_OnlineTest_QuestionUserAnswer_I(7, QuizID, QuestionID, 0);
                    ((Label)Repeater_questions.Items[i].FindControl("Label_CorrectSwitch")).Text = dt_switchs.Rows[0]["CorrectAnswer"].ToString();
                    int UserAnswer = 0;
                    try
                    {
                        UserAnswer = Convert.ToInt32(dt_switchs.Rows[0]["userAnswer"].ToString());
                    }
                    catch { UserAnswer = 0; }
                    if (UserAnswer != 0)
                    {
                        ((Label)Repeater_questions.Items[i].FindControl("Label_UserSwitch")).Text = UserAnswer.ToString();
                    }
                    else
                    {
                        ((Label)Repeater_questions.Items[i].FindControl("Label_UserSwitch")).Text = "---";
                    }

                    ((Label)Repeater_questions.Items[i].FindControl("Label_QuestionAnatomicalResponse")).Text = dt_switchs.Rows[0]["QuestionAnatomicalResponse"].ToString();

                }
            }
        }

        public string GetRowNumber()
        {
            HiddenField_RowNumber.Value = (Convert.ToInt32(HiddenField_RowNumber.Value) + 1).ToString();
            return HiddenField_RowNumber.Value;
        }
        public void BoldAnswer(Label label_temp,DataRow row,int index)
        {
            label_temp.Text =index.ToString()+ ")" + "  " + row["SwitchBody"].ToString();
            if (Convert.ToBoolean(row["IsTrueAnswer"].ToString()))
            {
                label_temp.Font.Bold = true;
                label_temp.Font.Underline = true;
            }
        }
    }
}
