using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using OnlineTest.BLL;

namespace PHASCO_WEB
{
    public partial class QuestionsBank : System.Web.UI.Page
    {

        int _QuestionID;
        public int QuestionID
        {
            get
            {
                return _QuestionID;
            }
            set
            {
                _QuestionID = value;
            }
        }

        int _LessonID;
        public int LessonID
        {
            get
            {
                return _LessonID;
            }
            set
            {
                _LessonID = value;
            }
        }

        string _Mode;
        public string Mode
        {
            get
            {
                return _Mode;
            }
            set
            {
                _Mode = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["QuestionID"]))
                QuestionID = Convert.ToInt32(Request.QueryString["QuestionID"].ToString());

            if (!string.IsNullOrEmpty(Request.QueryString["LessonID"]))
                LessonID = Convert.ToInt32(Request.QueryString["LessonID"].ToString());

            if (!string.IsNullOrEmpty(Request.QueryString["mode"]))
                Mode = Request.QueryString["mode"].ToString();

            if (!Page.IsPostBack)
                Initialize();


        }

        protected void Initialize()
        {
            switch (Mode)
            {
                case "QuestionsList":
                    BindQuestionsList(LessonID);
                    break;
                case "QuestionsDetails":
                    BindQuestionDetails(QuestionID);
                    break;
                default:
                    BindQuestionsBank();
                    break;
            }
        }

        protected void BindQuestionsBank()
        {
            muvQuestionsBank.ActiveViewIndex = 0;

            TBL_Phasco_OnlineTest_LessonTable Lessons = new TBL_Phasco_OnlineTest_LessonTable();
            DataTable dtLessons = Lessons.TBL_Phasco_OnlineTest_Lesson_I(4);
            repLessons.DataSource = dtLessons;
            repLessons.DataBind();

            TBL_Phasco_OnlineTest_QuestionAnswerTable Question = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            DataTable dtQuestion = Question.TBL_Phasco_OnlineTest_QuestionAnswer_I(6, 20, "", 0);
            repQuestions.DataSource = dtQuestion;
            repQuestions.DataBind();
        }

        protected void BindQuestionsList(int lessonID)
        {
            muvQuestionsBank.ActiveViewIndex = 1;

            TBL_Phasco_OnlineTest_QuestionAnswerTable Question = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            DataTable dtQuestion = Question.TBL_Phasco_OnlineTest_QuestionAnswer_I(7, 0, "", lessonID);
            repQuestionsList.DataSource = dtQuestion;
            repQuestionsList.DataBind();
        }

        protected void BindQuestionDetails(int questionID)
        {
            muvQuestionsBank.ActiveViewIndex = 2;
            TBL_Phasco_OnlineTest_QuestionAnswerTable Question = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
            DataTable dtQuestion = Question.TBL_Phasco_OnlineTest_QuestionAnswer_I(8,questionID);
            RepQuestionDetails.DataSource = dtQuestion;
            RepQuestionDetails.DataBind();
        }

        public DataTable GetAnswerQuestion(string QuestionID)
        {
            TBL_Phasco_OnlineTest_AnswerSwitchTable AnswerSwitch = new TBL_Phasco_OnlineTest_AnswerSwitchTable();
            DataTable dtAnswerSwitch = AnswerSwitch.TBL_Phasco_OnlineTest_AnswerSwitch_I(3, Convert.ToInt32(QuestionID));
            return dtAnswerSwitch;
        }

        public static string StripHtml(string html, bool allowHarmlessTags)
        {
            if (html == null || html == string.Empty)
                return string.Empty;
            
            if (allowHarmlessTags)
                return System.Text.RegularExpressions.Regex.Replace(html, "", string.Empty);
            
            return System.Text.RegularExpressions.Regex.Replace(html, "<[^>]*>", string.Empty);
        }
    }
}