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
    public partial class QuestionsOFaLesson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            processRequest();

        }
        private void processRequest()
        {
            if (Request["status"] != null)
            {
                if (Request["status"].ToString() == "insert")
                {
                    MultiView1.ActiveViewIndex = 0;
                    int LessonID = Convert.ToInt32(Request["id"].ToString());

                 //   GridBind(LessonID);
                }
                else if (Request["status"].ToString() == "edit")
                {
                    MultiView1.ActiveViewIndex = 1;
                    int QuestionID = Convert.ToInt32(Request["QuestionID"].ToString());
                    if (!Page.IsPostBack)
                        GetQuestionByID(QuestionID);
                }

            }
        }
        protected void ButtonAdd_QuestionAndAnswerOfLesson_Click(object sender, EventArgs e)
        {
            string QuestionBody = FCKeditor_QuestionBody.Value;
            string QuestionAnatomicalResponse = FCKeditor_QuestionAnatomicalResponse.Value;
            int LessonID = int.Parse(Request["id"].ToString());
            TBL_Phasco_OnlineTest_QuestionAnswerTable new_question = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            DataTable dt = new_question.TBL_Phasco_OnlineTest_QuestionAnswer_I(1, QuestionBody, QuestionAnatomicalResponse, LessonID);
            //Inserting switch answers
            int QuestionID = Convert.ToInt32(dt.Rows[0]["id"].ToString());
            int[] SwitchNumber = { 1, 2, 3, 4 };
            bool[] IsTrueAnswer = { RadioButton_SwitchBody1.Checked, RadioButton_SwitchBody2.Checked, RadioButton_SwitchBody3.Checked, RadioButton_SwitchBody4.Checked };
            string[] SwitchBody = { FCKeditor_SwitchBody1.Value, FCKeditor_SwitchBody2.Value, FCKeditor_SwitchBody3.Value, FCKeditor_SwitchBody4.Value };
            //
            TBL_Phasco_OnlineTest_AnswerSwitchTable InserSwitchs = new TBL_Phasco_OnlineTest_AnswerSwitchTable();
            for (int i = 0; i < 4; i++)
            {
                InserSwitchs.TBL_Phasco_OnlineTest_AnswerSwitch_I(1, SwitchBody[i], SwitchNumber[i], QuestionID, IsTrueAnswer[i]);
            }
            GridBind(LessonID);
            Label_report.Text = "سوال مورد نظر درج شد";
            RadioButton_SwitchBody1.Checked = true;
            RadioButton_SwitchBody2.Checked = false;
            RadioButton_SwitchBody3.Checked = false;
            RadioButton_SwitchBody4.Checked = false;
            //
            FCKeditor_QuestionAnatomicalResponse.Value = "";
            FCKeditor_QuestionBody.Value = "";
            FCKeditor_SwitchBody1.Value = "";
            FCKeditor_SwitchBody2.Value = "";
            FCKeditor_SwitchBody3.Value = "";
            FCKeditor_SwitchBody4.Value = "";


        }
        private void GridBind(int LessonID)
        {
            TBL_Phasco_OnlineTest_QuestionAnswerTable allQuestion = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            GridView_Questions.DataSource = allQuestion.TBL_Phasco_OnlineTest_QuestionAnswer_I(2, LessonID, 0);
            GridView_Questions.DataBind();
        }
        public void LinkButton_deleteCMD(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            TBL_Phasco_OnlineTest_QuestionAnswerTable delete = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            delete.TBL_Phasco_OnlineTest_QuestionAnswer_D(1, id);
            GridBind(Convert.ToInt32(Request["id"].ToString()));
        }
        public void GetQuestionByID(int QuestionID)
        {
            TBL_Phasco_OnlineTest_QuestionAnswerTable select = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            DataTable dt = select.TBL_Phasco_OnlineTest_QuestionAnswer_I(3, QuestionID);
            //
            FCKeditor_QuestionBody_E.Value = dt.Rows[0]["QuestionBody"].ToString();
            FCKeditor_QuestionAnatomicalResponse_E.Value = dt.Rows[0]["QuestionAnatomicalResponse"].ToString();
            //
            //getting swith answers
            TBL_Phasco_OnlineTest_AnswerSwitchTable AllSwitchs = new TBL_Phasco_OnlineTest_AnswerSwitchTable();
            DataTable dt_switchs = AllSwitchs.TBL_Phasco_OnlineTest_AnswerSwitch_I(3, QuestionID);
            RadioButton_SwitchBody1_E.Checked = bool.Parse(dt_switchs.Rows[0]["IsTrueAnswer"].ToString());
            FCKeditor_SwitchBody1_E.Value = dt_switchs.Rows[0]["SwitchBody"].ToString();
            HiddenField_SwitchID1.Value=dt_switchs.Rows[0]["id"].ToString();
            //
            RadioButton_SwitchBody2_E.Checked = bool.Parse(dt_switchs.Rows[1]["IsTrueAnswer"].ToString());
            FCKeditor_SwitchBody2_E.Value = dt_switchs.Rows[1]["SwitchBody"].ToString();
            HiddenField_SwitchID2.Value = dt_switchs.Rows[1]["id"].ToString();
            //
            RadioButton_SwitchBody3_E.Checked = bool.Parse(dt_switchs.Rows[2]["IsTrueAnswer"].ToString());
            FCKeditor_SwitchBody3_E.Value = dt_switchs.Rows[2]["SwitchBody"].ToString();
            HiddenField_SwitchID3.Value = dt_switchs.Rows[2]["id"].ToString();
            //
            RadioButton_SwitchBody4_E.Checked = bool.Parse(dt_switchs.Rows[3]["IsTrueAnswer"].ToString());
            FCKeditor_SwitchBody4_E.Value = dt_switchs.Rows[3]["SwitchBody"].ToString();
            HiddenField_SwitchID4.Value = dt_switchs.Rows[3]["id"].ToString();
        }

        protected void Button_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/QuestionsOFaLesson.aspx?status=insert&id=" + Request["id"].ToString());
        }

        protected void ButtonAdd_QuestionAndAnswerOfLesson_E_Click(object sender, EventArgs e)
        {
            string QuestionBody = FCKeditor_QuestionBody_E.Value;
            string QuestionAnatomicalResponse = FCKeditor_QuestionAnatomicalResponse_E.Value;
            int QuestionID = int.Parse(Request["QuestionID"].ToString());
            TBL_Phasco_OnlineTest_QuestionAnswerTable update_question = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            DataTable dt = update_question.TBL_Phasco_OnlineTest_QuestionAnswer_U(1, QuestionBody, QuestionAnatomicalResponse, QuestionID);
            //Inserting switch answers

            int[] SwitchNumber = { 1, 2, 3, 4 };
            int[] switchID = { int.Parse(HiddenField_SwitchID1.Value), int.Parse(HiddenField_SwitchID2.Value), int.Parse(HiddenField_SwitchID3.Value), int.Parse(HiddenField_SwitchID4.Value) };
            bool[] IsTrueAnswer = { RadioButton_SwitchBody1_E.Checked, RadioButton_SwitchBody2_E.Checked, RadioButton_SwitchBody3_E.Checked, RadioButton_SwitchBody4_E.Checked };
            string[] SwitchBody = { FCKeditor_SwitchBody1_E.Value, FCKeditor_SwitchBody2_E.Value, FCKeditor_SwitchBody3_E.Value, FCKeditor_SwitchBody4_E.Value };
            //
            TBL_Phasco_OnlineTest_AnswerSwitchTable updateSwitchs = new TBL_Phasco_OnlineTest_AnswerSwitchTable();
            for (int i = 0; i < 4; i++)
            {
                updateSwitchs.TBL_Phasco_OnlineTest_AnswerSwitch_U(1, SwitchBody[i], SwitchNumber[i], switchID[i], IsTrueAnswer[i]);
            }

            Label_report.Text = "سوال مورد نظر با موفقیت تغییر یافت";
        }
    }
}