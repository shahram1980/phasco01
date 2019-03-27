using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineTest.BLL;
using System.Data;
using Membership_Manage;
using System.Web.UI.HtmlControls;
using DataAccessLayer.Quiz;

namespace OnlineTest.user
{
    public partial class MakeQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserQuizSumbit"]?.ToString() == "True") Response.Redirect("~\\myhome.aspx");
            ImageButton_MakeQuiz.Attributes.Add("onclick", "this.disabled=true;" + GetPostBackEventReference(ImageButton_MakeQuiz).ToString());
            if (!UserOnline.User_Online_Valid()) Response.Redirect("~\\Default.aspx");
            if (!IsPostBack)
            {
                //DateTime dtm = new DateTime();
                //dtm = Convert.ToDateTime(DateTime.Now);
                //Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

                //string QuizCode = UserOnline.id() + "cq" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day;
                //TBL_User_Daily da_Daily = new TBL_User_Daily();
                //string QuizCode_ = da_Daily.TBL_User_Daily_SP(1,QuizCode).Rows[0][0].ToString();
                //if (QuizCode_ != "0")
                //{ 
                //    Response.Redirect("~\\myhome.aspx"); 
                //    return; 
                //}

                System.Globalization.PersianCalendar pcal = new System.Globalization.PersianCalendar();

                string QuizCode = UserOnline.id() + "cq" + pcal.GetYear(DateTime.Now) + pcal.GetMonth(DateTime.Now) + pcal.GetDayOfMonth(DateTime.Now);
                //TBL_User_Daily da_Daily = new TBL_User_Daily();
                //if (da_Daily.TBL_User_Daily_SP(2, QuizCode).Rows.Count > 0)
                //{
                //    Response.Redirect("~\\myhome.aspx");
                //}

                TextBox_QuizTitle.Text = QuizCode;
                BindData();
            }
        }

        private void SetPage(Boolean status)
        {
            DropDownList_group.Enabled = DropDownList_Fields.Enabled = ImageButton_MakeQuiz.Enabled = status;
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
            //   SetPage(false);
        }

        protected void DropDownList_group_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
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
                DataTable dt = AllLessons.TBL_Phasco_OnlineTest_Lesson_Field_I(3, 0, FieldID, 0, 0, UserOnline.id());
                Repeater_lessons.DataSource = dt;
                Repeater_lessons.DataBind();

                bind_Lessons();
            }
            catch (Exception) { }
        }

        protected void Button_MakeQuiz_Click(object sender, EventArgs e)
        {
            System.Globalization.PersianCalendar pcal = new System.Globalization.PersianCalendar();

            string QuizCode = UserOnline.id() + "cq" + pcal.GetYear(DateTime.Now) + pcal.GetMonth(DateTime.Now) + pcal.GetDayOfMonth(DateTime.Now);

            int FieldID = Convert.ToInt32(DropDownList_Fields.SelectedValue);
            int DegreeID = Convert.ToInt32(DropDownList_Degree.SelectedValue);
            int UserID = UserOnline.id();
            string QuizTitle = QuizCode;
            DateTime CreationDate = DateTime.Now.Date;

            double QuizScore = 0;
            TBL_Phasco_OnlineTest_QuizTable newQuiz = new TBL_Phasco_OnlineTest_QuizTable();
            DataTable dt = newQuiz.TBL_Phasco_OnlineTest_Quiz_I(1, FieldID, DegreeID, UserID, QuizTitle, QuizScore, CreationDate);

            if (Convert.ToInt32(dt.Rows[0]["id"].ToString()) > 0)
            {
                int QuizID = Convert.ToInt32(dt.Rows[0]["id"].ToString());
                //Now we invoke the questions randomly
                int QuestionNumber = 1;
                int TimeOfTest = 0;
                int TotalQu = 0;

                for (int i = 0; i < Repeater_lessons.Items.Count; i++)
                {
                    //int QuestionCount = Convert.ToInt32(((TextBox)Repeater_lessons.Items[i].FindControl("TextBox_LessonCount")).Text);
                    //int TimeToAnswer = Convert.ToInt32(((HiddenField)Repeater_lessons.Items[i].FindControl("HiddenField_TimeToAnswer")).Value);
                    int QuestionCount = Convert.ToInt32(((HtmlInputControl)Repeater_lessons.Items[i].FindControl("TextBox_LessonCount")).Value);
                    int TimeToAnswer = Convert.ToInt32(((HiddenField)Repeater_lessons.Items[i].FindControl("HiddenField_TimeToAnswer")).Value);
                    TotalQu = TotalQu + QuestionCount;
                    if (TotalQu > 10) { Label_Alarm.Text = "کاربر گرامی : <br/>شما مجاز به انتخاب 10 سوال می باشید تعداد سوالات انتخابی شما بیشتر از حد مجاز است"; return; }

                    if (QuestionCount > 0)
                    {
                        TimeOfTest = TimeOfTest + (TimeToAnswer * QuestionCount);
                        TBL_Phasco_OnlineTest_QuestionAnswerTable RandomQuestions = new TBL_Phasco_OnlineTest_QuestionAnswerTable();
                        int LessonID = Convert.ToInt32(((HiddenField)Repeater_lessons.Items[i].FindControl("HiddenField_LessonID")).Value);

                        DataTable dt_QuestionCount = RandomQuestions.TBL_Phasco_OnlineTest_QuestionAnswer_I(4, QuestionCount, "", LessonID);
                        TBL_Phasco_OnlineTest_QuestionUserAnswerTable selected = new TBL_Phasco_OnlineTest_QuestionUserAnswerTable();
                        TB_User_Priod_Question DA_Period_User = new TB_User_Priod_Question();

                        int Uid_ = UserOnline.id();
                        int QuiID_;
                        for (int j = 0; j < dt_QuestionCount.Rows.Count; j++)
                        {
                            QuiID_ = Convert.ToInt32(dt_QuestionCount.Rows[j]["QuestionID"].ToString());
                            selected.TBL_Phasco_OnlineTest_QuestionUserAnswer_I(1, QuizID, QuiID_, QuestionNumber);
                            DA_Period_User.TB_User_Priod_Question_SP("insert", Uid_, QuiID_, 0);
                            QuestionNumber++;
                        }
                        TBL_Phasco_OnlineTest_Lesson_QuizTable insert = new TBL_Phasco_OnlineTest_Lesson_QuizTable();
                        insert.TBL_Phasco_OnlineTest_Lesson_Quiz_I(1, QuizID, LessonID, QuestionNumber - QuestionCount, QuestionNumber - 1);
                    }
                }

                if (TotalQu == 0) { Label_Alarm.Text = "کاربر گرامی : <br/>شما هیچ موردی را انتخاب نکرده اید !"; return; }
                if (RadioButton_Arbitrary.Checked)
                {
                    int min = Convert.ToInt32(TextBox_TimeToAnswer.Text.Trim());
                    Session["TimeOfTest"] = (min * 60).ToString();
                }
                else if (RadioButton_Infinite.Checked) { Session["TimeOfTest"] = "36000"; }
                else if (RadioButton_standard.Checked) { Session["TimeOfTest"] = TimeOfTest; }
                Session["DegreeID"] = DegreeID;


                TBL_User_Daily da_Daily = new TBL_User_Daily();
                string QuizCode_ = da_Daily.TBL_User_Daily_SP(1, QuizCode).Rows[0][0].ToString();
                if (QuizCode_ != "0") { Response.Redirect("~\\myhome.aspx"); return; }

                Response.Redirect("~/UserCreatedQuiz.aspx?QuizID=" + QuizID);
            }
            else Response.Redirect("~\\myhome.aspx");
        }

        protected void DropDownList_Fields_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind_Lessons();
        }

        void bind_Lessons()
        {
            try
            {
                int FieldID = Convert.ToInt32(DropDownList_Fields.SelectedValue);
                int Degree_Id = int.Parse(DropDownList_Degree.SelectedValue);
                TBL_Phasco_OnlineTest_Lesson_FieldTable AllLessons = new TBL_Phasco_OnlineTest_Lesson_FieldTable();

                Repeater_lessons.DataSource = AllLessons.TBL_Phasco_OnlineTest_Lesson_Field_I(3, 0, FieldID, 0, Degree_Id,UserOnline.id());
                Repeater_lessons.DataBind();
            }
            catch (Exception) { }
        }

        protected void Repeater_lessons_ItemCommand(object source, RepeaterCommandEventArgs e)
        { }

        protected void Button2_Click(object sender, EventArgs e)
        { }

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

        protected void DropDownList_Degree_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind_Lessons();
        }

        //protected void DropDownList_Degree_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //try
        //    //{
        //    //    DropDownList_group.Dispose();
        //    //    TBL_Phasco_OnlineTest_FieldsGroupTable selectAllgroups = new TBL_Phasco_OnlineTest_FieldsGroupTable();
        //    //    int id = int.Parse(DropDownList_Degree.SelectedValue.ToString());
        //    //    //DataTable dt = selectAllgroups.TBL_Phasco_OnlineTest_FieldsGroup_I(3, id);
        //    //    DataTable dt = selectAllgroups.TBL_Phasco_OnlineTest_FieldsGroup_I(2, id);
        //    //    if (dt.Rows.Count > 0)
        //    //    {
        //    //        DropDownList_group.DataSource = dt;
        //    //        DropDownList_group.DataBind();
        //    //        SetPage(true);
        //    //    }
        //    //    else
        //    //    { DropDownList_group.Dispose(); SetPage(false); }
        //    //}
        //    //catch (Exception)
        //    //{
        //    //}

        //}
    }
}
