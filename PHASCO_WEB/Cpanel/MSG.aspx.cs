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
using phasco.BaseClass;
using PHASCO_WEB.DAL.DS_MainPhascoTableAdapters;
using PHASCO_WEB.DAL;
using DataAccessLayer;
using BusinessAccessLayer;

namespace phasco_webproject.Cpanel
{
    public partial class MSG : System.Web.UI.Page
    {
        #region dataset
        Tbl_Message da_mss = new Tbl_Message();
        DataTable dt = new DataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        { bind_grd_Mss(); }
        void bind_grd_Mss()
        {
            dt = da_mss.Message_Tra("List_admin", 0, 0, 0, 0, "", "", 0, "", 0);
            if (dt.Rows.Count <= 0) Label_Alarm.Text = "هیج پیام جدید وجود ندارد";
            Grid_Users.DataSource = dt;
            Grid_Users.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Grid_Users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        { Grid_Users.PageIndex = e.NewPageIndex; bind_grd_Mss(); }
        protected void LinkButton_ViewMssg_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Mss_UserId.Value = e.CommandArgument.ToString();
            int id = Convert.ToInt32(HiddenField_Mss_UserId.Value);
            dt = da_mss.Message_Tra("ViewMss", id, 0, 0, 0, "", "", 0, "", 0);
            set_Veiw_Command(dt);
        }
        protected void LinkButton_Next_Message_Click(object sender, EventArgs e)
        {
            dt = da_mss.Message_Tra("Select_Next", Convert.ToInt32(HiddenField_Mss_UserId.Value));
            if (dt.Rows.Count <= 0)
            { Label_Alarm.Text = "انتهای لیست پیام ها قرار دارید  . پيامی دیگر وحود ندارد"; MultiView1.ActiveViewIndex = 2; return; }
            HiddenField_Mss_UserId.Value = dt.Rows[0]["Id"].ToString();
            int id = int.Parse(dt.Rows[0]["Id"].ToString());
            dt = da_mss.Message_Tra("ViewMss", id);
            set_Veiw_Command(dt);
        }
        protected void LinkButton_Back_Message_Click(object sender, EventArgs e)
        {
            dt = da_mss.Message_Tra("Selec_Back", Convert.ToInt32(HiddenField_Mss_UserId.Value));
            if (dt.Rows.Count <= 0)
            { Label_Alarm.Text = "ابتدای لیست پیام ها قرار دارید  ."; MultiView1.ActiveViewIndex = 2; return; }
            HiddenField_Mss_UserId.Value = dt.Rows[0]["Id"].ToString();
            int id = int.Parse(dt.Rows[0]["Id"].ToString());
            dt = da_mss.Message_Tra("ViewMss", id);
            set_Veiw_Command(dt);
        }
        void set_Veiw_Command(DataTable ds_set)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(ds_set.Rows[0]["DateSend"].ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            LBL_Sender.Text = ds_set.Rows[0]["uid"].ToString();
            Lbl_Body.Text = ds_set.Rows[0]["Body"].ToString();
            LBL_Date_Send.Text = sunDate.Weekday.ToString();
            Lbl_Title.Text = ds_set.Rows[0]["Title"].ToString();
            MultiView1.ActiveViewIndex = 2;
        }
        protected void LinkButton_BackTOList_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 1; }
        #region Message Transaction
        protected void LinkButton_Answer_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField_Mss_UserId.Value);
            dt = da_mss.Message_Tra("Select_Item", id, 0, 0, 0, "", "", 0, "", 0);
            Label_Send_To.Text = LBL_Sender.Text.ToString();
            HiddenField_Back_UserId.Value = dt.Rows[0]["Sender"].ToString();
            RadEditor_Text.Value = " <p dir='rtl'  align='right'><br><br><br><hr><br>" + dt.Rows[0]["Body"].ToString() + "</P>";
            MultiView1.ActiveViewIndex = 3;
        }

        protected void LinkButton_Delete_Message_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(HiddenField_Mss_UserId.Value);
                dt = da_mss.Message_Tra("Delete_Mss", id);
                bind_grd_Mss();
                Label_Alarm.Text = "پيام با موفقيت حذف شد";
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
        #endregion
        protected void Button_Send_Message_Click(object sender, EventArgs e)
        {
            string filename = "none";
            try
            {
                if (FileUpload_Attach.HasFile)
                {
                    Random rand = new Random();
                    filename = rand.Next().ToString().PadLeft(4) + "per" + DateTime.Now.Ticks.ToString().Substring(10).ToString().PadLeft(4) + MyFileUploader.IsExtension(FileUpload_Attach);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Attach, "\\Pup\\MssAttach", filename, "*", "*", "*", this.Server);
                }
                da_mss.Message_Tra("send", 0, Convert.ToInt32(HiddenField_Back_UserId.Value), 0, 0, TextBox_Title.Text, RadEditor_Text.Value, 0, filename, 0);
                Label_Alarm.Text = "پیام با موفقیت ارسال شد";
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }
    }
}
