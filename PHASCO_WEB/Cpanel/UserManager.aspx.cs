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
using System.Globalization;
using PHASCO_WEB.DAL;
using DataAccessLayer;

namespace phasco_webproject.Cpanel
{
    public partial class UserManager : System.Web.UI.Page
    {
        #region dataset
        User da_User = new User();
        DataTable dt = new DataTable();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) { HiddenField_Mode_Search.Value = "select_all"; Bid_Grd(); } }
        #region Grid Transaction
        void Bid_Grd()
        {
            Grid_Users.DataSource = da_User.GetUsers_Tra_DT(HiddenField_Mode_Search.Value.ToString(), 0, TextBox_Search.Text.ToString(), "", "", "", "", 0, DateTime.Now, "", "", "", "", "", 0, 0, 0, 0); ;
            Grid_Users.DataBind();
        }
        protected void LinkButton_EditUser_Command(object sender, CommandEventArgs e)
        {
            try
            {
                PersianCalendar ps = new PersianCalendar();
                HiddenField_UserId.Value = e.CommandArgument.ToString();
                dt = da_User.GetUsers_Tra_DT("select_Item", Convert.ToInt32(HiddenField_UserId.Value.ToString()));
                LBL_UserId.Text = dt.Rows[0]["Id"].ToString();
                TextBox_uid.Text = dt.Rows[0]["Uid"].ToString();
                TextBox_Pass.Text = dt.Rows[0]["Password"].ToString();
                TextBox_Name.Text = dt.Rows[0]["Name"].ToString();
                TextBox_Famil.Text = dt.Rows[0]["Famil"].ToString();
                TextBox_Father.Text = dt.Rows[0]["Father"].ToString();
                TextBox_Website.Text = dt.Rows[0]["Website"].ToString();
                TextBox_Email.Text = dt.Rows[0]["Email"].ToString();
                TextBox_Address.Text = dt.Rows[0]["Address"].ToString();

                TextBox_Description.Text = dt.Rows[0]["Description"].ToString();
                TextBox_IntriId.Text = dt.Rows[0]["IntriId"].ToString();

                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(Convert.ToDateTime(dt.Rows[0]["RegisterDate"].ToString()));
                Label_RegisterDate.Text = sunDate.Weekday;
                Persia.SunDate sunDate_LastLoginDate = Persia.Calendar.ConvertToPersian(Convert.ToDateTime(dt.Rows[0]["LastLoginDate"].ToString()));
                Label_LastDate.Text = sunDate_LastLoginDate.Weekday;
                if (dt.Rows[0]["Sex"].ToString() == "0") RadioButtonList_sex.SelectedValue = "0";
                else if (dt.Rows[0]["Sex"].ToString() == "1") RadioButtonList_sex.SelectedValue = "1";

                Image_role.ImageUrl = "~/CPanel/Images/star" + dt.Rows[0]["UserRole"].ToString() + ".jpg";
                DropDownList_User_Role.SelectedValue = dt.Rows[0]["UserRole"].ToString();
                if (dt.Rows[0]["UserActive"].ToString() == "1") Label_UserMode.Text = "غیر فعال";
                else if (dt.Rows[0]["UserActive"].ToString() == "0") Label_UserMode.Text = "فعال";

                Panel_Edit.Visible = true;
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
        protected void LinkButton_ChangeModeUser_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            da_User.GetUsers_Tra_DT("Change_Mode", id);
            Bid_Grd();
        }
        protected void Grid_Users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_Users.PageIndex = e.NewPageIndex;
            Bid_Grd();
        }
        #endregion

        protected void Button_Search_Click(object sender, EventArgs e)
        {
            int mode = Convert.ToInt32(RadioButtonList_Search_Mode.SelectedValue.ToString());
            switch (mode)
            {
                case 0:
                    HiddenField_Mode_Search.Value = "select_all";
                    break;
                case 1:
                    HiddenField_Mode_Search.Value = "select_UId";
                    break;
                case 2:
                    HiddenField_Mode_Search.Value = "select_id";
                    break;
                case 3:
                    HiddenField_Mode_Search.Value = "select_Email";
                    break;
            }
            Bid_Grd();
        }


        #region Edit Profile
        protected void Button_Edit_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(HiddenField_UserId.Value.ToString());
                int URole = Convert.ToInt32(DropDownList_User_Role.SelectedValue);
                int sex = Convert.ToInt32(RadioButtonList_sex.SelectedValue);
                da_User.GetUsers_Tra_DT("Update_Admin", id, "", TextBox_Pass.Text.ToString(), TextBox_Name.Text, TextBox_Famil.Text, TextBox_Father.Text, sex, DateTime.Now,
TextBox_Website.Text, TextBox_Email.Text, TextBox_Tel.Text, TextBox_Address.Text, TextBox_Description.Text, 0, Convert.ToInt32(TextBox_IntriId.Text), URole, 0);
                Panel_Edit.Visible = false;
                Label_Alarm.Text = "ويرايش با موفقیت انجام شد";
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
        protected void Button_Edit_Cancle_Click(object sender, EventArgs e)
        { }
        #endregion

        protected void Button_Edit_Cancle_Command(object sender, CommandEventArgs e)
        { Panel_Edit.Visible = false; }
    }
}
