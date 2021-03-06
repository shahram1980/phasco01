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
using System.Text;
using phasco.BaseClass;
using PHASCO_WEB.DAL.DS_MainPhascoTableAdapters;
using PHASCO_WEB.DAL;
using DataAccessLayer;
using BusinessAccessLayer;

namespace phasco_webproject.Cpanel
{
    public partial class MssManager : System.Web.UI.Page
    {
        #region dataset
        User da_User = new User();
        Tbl_Message da_mss = new Tbl_Message();
        DataTable dt = new DataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {        }
        #region User_List
        void Bid_Grd_User()
        {
            try
            {
                MultiView1.ActiveViewIndex = 0;
                dt = da_User.GetUsers_Tra_DT(HiddenField_Mode_Search.Value.ToString(), 0, TextBox_Search.Text.ToString());
                if (dt.Rows.Count <= 0) Label_Alarm.Text = "متناسب با درخواست شما هیچ کاربری پیدا نشد";
                Grid_Users.DataSource = dt;
                Grid_Users.DataBind();
            }
            catch (Exception)
            { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
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
            Bid_Grd_User();
        }
        protected void Grid_Users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_Users.PageIndex = e.NewPageIndex;
            Bid_Grd_User();
        }
        #endregion

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Button_Send_Message.Visible = true;
            Button_Send_To_all.Visible = false;
        }
        protected void Button_Select_User_Click(object sender, EventArgs e)
        {
            LBL_User_Reciver.Text = "";
            string User_List = "";
            int count = 0;
            try
            {
                StringBuilder str = new StringBuilder();
                for (int i = 0; i < Grid_Users.Rows.Count; i++)
                {
                    GridViewRow row = Grid_Users.Rows[i];
                    bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;

                    if (isChecked)
                    {
                        count = count + 1;
                        User_List = User_List + "  " + Grid_Users.Rows[i].Cells[2].Text.ToString() + "  ";
                    }
                }

                User_Count_List.Attributes.Add("onMouseover", "showfloatie('" + User_List + "', event)");
                User_Count_List.Attributes.Add("onMouseout", "hidefloatie();");
                LBL_User_Reciver.Text = "ارسال به " + count.ToString() + " کاربر ";
                if (count == 0) Label_Alarm.Text = "هيچ کاربری برای ارسال پیام انتخاب نشده";
                else MultiView1.ActiveViewIndex = 1;

            }
            catch (Exception)
            { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
        protected void Button_Send_Message_Click(object sender, EventArgs e)
        {
            string filename = "none";
            int count = 0;
            try
            {
                if (FileUpload_Attach.HasFile)
                {
                    Random rand = new Random();
                    filename = rand.Next().ToString().PadLeft(4) + "per" + DateTime.Now.Ticks.ToString().Substring(10).ToString().PadLeft(4) + MyFileUploader.IsExtension(FileUpload_Attach);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Attach, "\\Pup\\MssAttach", filename, "*", "*", "*", this.Server);
                }
                StringBuilder str = new StringBuilder();
                for (int i = 0; i < Grid_Users.Rows.Count; i++)
                {
                    GridViewRow row = Grid_Users.Rows[i];
                    bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
                    if (isChecked)
                    {
                        da_mss.Message_Tra("send",0,Convert.ToInt32(Grid_Users.Rows[i].Cells[1].Text),0,0,TextBox_Title.Text,RadEditor_Text.Html,0,filename,0);
                        count = count + 1;
                    }
                }
                Label_Alarm.Text = "پیام با موفقيت برای" + count.ToString() + "از کاربران ارسال شد";
            }
            catch (Exception)
            { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            LBL_User_Reciver.Text = "ارسال به تمام کاربران";
            Button_Send_Message.Visible = false;
            Button_Send_To_all.Visible = true;
            User_Count_List.Attributes.Add("onMouseover", "showfloatie('تمام کاربران', event)");
            User_Count_List.Attributes.Add("onMouseout", "hidefloatie();");
        }
        protected void Button_Send_To_all_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = "none";
                if (FileUpload_Attach.HasFile)
                {
                    Random rand = new Random();
                    filename = rand.Next().ToString().PadLeft(4) + "per" + DateTime.Now.Ticks.ToString().Substring(10).ToString().PadLeft(4) + MyFileUploader.IsExtension(FileUpload_Attach);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Attach, "\\Pup\\MssAttach", filename, "*", "*", "*", this.Server);
                }
                da_mss.Message_Tra("Send_To_all",0,0,0,0,TextBox_Title.Text.ToString(),RadEditor_Text.Html,0,filename,0);
                Label_Alarm.Text = "پيام با موفقيت برای تمام کاربران ارسال شد";
            }
            catch (Exception)
            { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
    }
}
