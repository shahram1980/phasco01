using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using OnlineTest.BLL;
using System.Collections;

namespace PHASCO_WEB.Quiz
{
    public partial class UserCreatedQuiz : System.Web.UI.Page, ICallbackEventHandler
    {
        private static Hashtable hashTable;
        protected String returnValue;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ProccessRequest();
                //   Button_submit.Attributes.Add("onclick", "javascritp:Button_submit_Click();");
                CallServerfn();
            }
        }
        private void ProccessRequest()
        {
            if (Request["QuizID"] != null && Request["status"] == null)
            {
                MultiView1.ActiveViewIndex = 0;
                int QuizID = Convert.ToInt32(Request["QuizID"].ToString());
                int TimeOfTest = 0;
                try
                {
                    TimeOfTest = Convert.ToInt32(Session["TimeOfTest"].ToString());
                }
                catch { }
                if (TimeOfTest > 0)
                {
                    int hour = TimeOfTest / 3600;
                    TimeOfTest = TimeOfTest - (hour * 3600);
                    int minute = TimeOfTest / 60;
                    int second = TimeOfTest - (minute * 60);
                    //Label_hour.InnerHtml = hour.ToString();
                    //Label_minute.InnerHtml = minute.ToString();
                    //Label_second.InnerHtml = second.ToString();
                    literal_Time.Text = hour + ":" + minute + ":" + second;//"00:00:20";
                    const string someScript = "runTimer('box1')";
                    ClientScript.RegisterStartupScript(this.GetType(),
                        someScript, "runTimer('box1')", true);
                    Session["TimeOfTest"] = "0";
                    //
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
                            int QuestionID = Convert.ToInt32(((Label)Repeater_questions.Items[i].FindControl("Label_QuestionID")).Text);
                            //getting swith answers
                            TBL_Phasco_OnlineTest_AnswerSwitchTable AllSwitchs = new TBL_Phasco_OnlineTest_AnswerSwitchTable();
                            DataTable dt_switchs = AllSwitchs.TBL_Phasco_OnlineTest_AnswerSwitch_I(3, QuestionID);
                            ((Label)Repeater_questions.Items[i].FindControl("lblSwitchBody1")).Text = ")" + dt_switchs.Rows[0]["SwitchBody"].ToString();
                            //
                            ((Label)Repeater_questions.Items[i].FindControl("lblSwitchBody2")).Text = ")" + dt_switchs.Rows[1]["SwitchBody"].ToString();
                            //
                            ((Label)Repeater_questions.Items[i].FindControl("lblSwitchBody3")).Text = ")" + dt_switchs.Rows[2]["SwitchBody"].ToString();
                            //
                            ((Label)Repeater_questions.Items[i].FindControl("lblSwitchBody4")).Text = ")" + dt_switchs.Rows[3]["SwitchBody"].ToString();
                            //

                        }
                    }
                }
                else if (TimeOfTest <= 0)
                {
                    Response.Redirect("~/Quiz/MyQuiz.aspx");
                }
            }
            if (Request["QuizID"] != null && Request["status"] != null)
            {
                MultiView1.ActiveViewIndex = 1;
                int QuizID = Convert.ToInt32(Request["QuizID"].ToString());
                HyperLink_answers.NavigateUrl = "~/Quiz/MyQuiz.aspx?status=answers&quizID=" + QuizID;
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
                //float average = ((float)(_true * 3 - _false) / (float)(_all * 3)) * 100;
                average = (float)Math.Round(average, 2);
                Label_average.Text = average.ToString();
                //
                //updating the score of quiz
                TBL_Phasco_OnlineTest_QuizTable update = new TBL_Phasco_OnlineTest_QuizTable();
                update.TBL_Phasco_OnlineTest_Quiz_U(2, QuizID, average);

            }
        }

        protected void Button_submit_Click(object sender, EventArgs e)
        {
            int QuizID = Convert.ToInt32(Request["QuizID"].ToString());
            BtnClick();
            Response.Redirect("~/Quiz/UserCreatedQuiz.aspx?QuizID=" + QuizID + "&status=result");
        }

        public void BtnClick()
        {
            returnValue = Request["QuizID"].ToString();
            int QuizID = Convert.ToInt32(Request["QuizID"].ToString());
            for (int k = 0; k < Repeater_Lessons.Items.Count; k++)
            {

                Repeater Repeater_questions = ((Repeater)Repeater_Lessons.Items[k].FindControl("Repeater_questions"));
                for (int i = 0; i < Repeater_questions.Items.Count; i++)
                {
                    int QuestionID = Convert.ToInt32(((Label)Repeater_questions.Items[i].FindControl("Label_QuestionID")).Text);
                    int SwitchNumber = 0;
                    if (((RadioButton)Repeater_questions.Items[i].FindControl("RadioButton_SwitchBody1")).Checked)
                    {
                        SwitchNumber = 1;
                    }
                    if (((RadioButton)Repeater_questions.Items[i].FindControl("RadioButton_SwitchBody2")).Checked)
                    {
                        SwitchNumber = 2;
                    }
                    if (((RadioButton)Repeater_questions.Items[i].FindControl("RadioButton_SwitchBody3")).Checked)
                    {
                        SwitchNumber = 3;
                    }
                    if (((RadioButton)Repeater_questions.Items[i].FindControl("RadioButton_SwitchBody4")).Checked)
                    {
                        SwitchNumber = 4;
                    }
                    TBL_Phasco_OnlineTest_QuestionUserAnswerTable updateAnswers = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
                    updateAnswers.TBL_Phasco_OnlineTest_QuestionUserAnswer_U(2, QuizID, QuestionID, SwitchNumber, "0");
                }
            }
            //Response.Redirect("~/UserCreatedQuiz.aspx?QuizID=" + QuizID + "&status=result");
        }

        public void BtnClickClient(string arg)
        {
            returnValue = Request["QuizID"].ToString();
            int QuizID = Convert.ToInt32(Request["QuizID"].ToString());

            char[] splitter1 = { ',' };
            char[] splitter2 = { ':' };

            string QuestionAnswer = arg;
            string[] QuestionAnswerItem = QuestionAnswer.Split(splitter1);

            for (int i = 0; i < QuestionAnswerItem.Length; i++)
            {
                string[] AnswerItem = QuestionAnswerItem[i].Split(splitter2);
                if (AnswerItem.Length > 0)
                {
                    int QuestionID = Convert.ToInt32(AnswerItem[0]);
                    if (QuestionID > 0)
                    {
                        int SwitchNumber = Convert.ToInt32(AnswerItem[1]);
                        TBL_Phasco_OnlineTest_QuestionUserAnswerTable updateAnswers = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
                        updateAnswers.TBL_Phasco_OnlineTest_QuestionUserAnswer_U(2, QuizID, QuestionID, SwitchNumber, "0");
                    }
                }
            }
        }

        public void CallServerfn()
        {
            String cbReference = Page.ClientScript.GetCallbackEventReference(this, "arg", "ReceiveServerData", "context");
            String callbackScript;
            callbackScript = "function CallServer(arg, context)" +
            "{ " + cbReference + ";}";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
            "CallServer", callbackScript, true);
        }

        public void RaiseCallbackEvent(String eventArgument)
        {
            BtnClickClient(eventArgument);
        }

        public String GetCallbackResult()
        {
            returnValue = Request["QuizID"].ToString();
            return returnValue;
        }

        public string GetRowNumber()
        {
            HiddenField_RowNumber.Value = (Convert.ToInt32(HiddenField_RowNumber.Value) + 1).ToString();
            return HiddenField_RowNumber.Value;
        }
    }
}