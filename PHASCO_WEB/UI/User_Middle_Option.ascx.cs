using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Membership_Manage;
using DataAccessLayer;

namespace PHASCO_WEB.UI
{
    public partial class User_Middle_Option : System.Web.UI.UserControl
    {
        #region SMS_QU
        T_Qu_Weekly da = new T_Qu_Weekly();
        #endregion
        #region datatable Sol
        T_Solution_Answer Sol_Ans = new T_Solution_Answer();
        T_Solution Sol = new T_Solution();
        #endregion
        #region SMS
        SMS_TO_User da_SMS = new SMS_TO_User();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (UserOnline.User_Online_Valid())
                { Set_New_Qu(); Set_QU(); Set_SMS(); Panel_All.Visible = true; }
                else Panel_All.Visible = false;
        }
        #region Sol_Code
        protected void Set_QU()
        {
            DataTable dt;
            DataTable dt_ans;
            dt = Sol.Message_Tra("Select_new", 0, "", 0);
            if (dt.Rows.Count > 0)
            {
                string ss = dt.Rows[0]["id"].ToString();
                ss = UserOnline.id().ToString();
                dt_ans = Sol_Ans.T_Solution_Answer_Tra("Select_Me", int.Parse(dt.Rows[0]["id"].ToString()), UserOnline.id(), "");
                if (dt_ans.Rows.Count <= 0)
                {
                    Label_Solu_Qu.Text = dt.Rows[0]["Question"].ToString();
                    HiddenField_Id.Value = dt.Rows[0]["id"].ToString();
                    MultiView_Sol.ActiveViewIndex = 0;
                }
                else MultiView_Sol.ActiveViewIndex = 2;
            }
            //dt=sol.Message_Tra("Select_Me",
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {

            if (TextBox_Ans.Text.ToString() == "")
            { Label_Alaram.Text = "لطفا ابتدا پاسخ خود را وارد کنید"; return; }
            Sol_Ans.T_Solution_Answer_Tra("insert", int.Parse(HiddenField_Id.Value.ToString()), UserOnline.id(), TextBox_Ans.Text.ToString());
            MultiView_Sol.ActiveViewIndex = 1;
        }
        #endregion
        #region QU_Code
        protected void Set_New_Qu()
        {
            DataTable dt = da.Select_Top_Qu_Weekly();

            if (dt.Rows.Count > 0)
            {
                DataTable dt_Qu = da.Select_Valid_User_Qu(UserOnline.id(), int.Parse(dt.Rows[0]["id"].ToString()));
                if (dt_Qu.Rows.Count <= 0)
                {
                    Label_Qu.Text = dt.Rows[0]["Question"].ToString();
                    HiddenField_Answer_Id.Value = dt.Rows[0]["answer"].ToString();

                    point.Text = dt.Rows[0]["point"].ToString();
                    HiddenField_QU_ID.Value = dt.Rows[0]["id"].ToString();
                    RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q1"].ToString(), "1"));
                    RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q2"].ToString(), "2"));
                    RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q3"].ToString(), "3"));
                    RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q4"].ToString(), "4"));
                    MultiView_QU.ActiveViewIndex = 0;
                }
                else MultiView_QU.ActiveViewIndex = 2;
            }
            else MultiView_QU.ActiveViewIndex = 2;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (RadioButtonList_QU.SelectedValue == "")  
            { return; }

            int QU_Id=int.Parse(HiddenField_QU_ID.Value.ToString());
            int USER_Id=int.Parse(RadioButtonList_QU.SelectedValue.ToString());
             int True_Id=int.Parse(HiddenField_Answer_Id.Value.ToString());

             Button_Answer.Visible = false;
            if (RadioButtonList_QU.SelectedValue == HiddenField_Answer_Id.Value)
            {
                da.Qu_weekly_Tra("a_True", 0, UserOnline.id(), QU_Id, USER_Id, True_Id);
              //  UserOnline.Add_Point(UserOnline.id(), 4, "auto");
                Label_QU_ALARM.Text = " با عرض تبريک  ، پاسخ شما صحيح می باشد.";
            }
            else
            {
                da.Qu_weekly_Tra("a_false", 0, UserOnline.id(), QU_Id, USER_Id, True_Id);
                //Label_QU_ALARM.Text = " متاسفانه پاسخ شما صحيح نمي باشد . گزينه صحيح " + HiddenField_Answer_Id.Value.ToString() + " ميباشد.";
                Label_QU_ALARM.Text = " متاسفانه پاسخ شما صحيح نمي باشد .";
            }
            MultiView_QU.ActiveViewIndex = 1;
            //Set_New_Qu();
        }
        #endregion
        #region SMS
        protected void Set_SMS()
        {
            DataTable dt;
            dt = da_SMS.SELECT_Top_1(UserOnline.id());
            if (dt.Rows.Count > 0)
            {
                Label_FlashMessage.Text = dt.Rows[0]["Message"].ToString();
                HiddenField_ID_SMS.Value = dt.Rows[0]["id"].ToString();
                MultiView_SMS.ActiveViewIndex = 0;
            }
            else MultiView_SMS.ActiveViewIndex = 1;
        }

        protected void LinkButton_Ok_Click(object sender, EventArgs e)
        {
            da_SMS.delete(int.Parse(HiddenField_ID_SMS.Value.ToString()));
            Set_SMS();
        }
        #endregion
    }
}