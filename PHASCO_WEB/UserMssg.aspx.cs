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
using phasco_webproject.BaseClass;
using Membership_Manage;
using phasco.Template;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB
{
    public partial class UserMssg : System.Web.UI.Page
    {
        #region dataset
        Tbl_Message da_mss = new Tbl_Message();
        User da_User = new User();
        DataTable dt = new DataTable();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "سایت تخصصی علوم آزمایشگاهی مقالات اطلس ها وبلاگ ها پرسش و پاسخ علمی اخبار لیست کامل آزمایشگاه ها شرکت های تجهیزات و پزشکی با جوایز ارزشمند .";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (!UserOnline.User_Online_Valid()) Response.Redirect("Default.aspx");
            bind_grd_Mss();
        }
        void bind_grd_Mss()
        {
            dt = da_mss.Message_Tra("List_User", UserOnline.id());
            if (dt.Rows.Count <= 0)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("هیج پیام جدید وجود ندارد", "");
            }
            Grid_Users.DataSource = dt;
            Grid_Users.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Grid_Users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_Users.PageIndex = e.NewPageIndex;
            bind_grd_Mss();
        }
        protected void LinkButton_ViewMssg_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Mss_UserId.Value = e.CommandArgument.ToString();
            int id = Convert.ToInt32(HiddenField_Mss_UserId.Value);
            dt = da_mss.Message_Tra("ViewMss", id);
            set_Veiw_Command(dt);
        }
        protected void LinkButton_Next_Message_Click(object sender, EventArgs e)
        {
            dt = da_mss.Message_Tra("Selec_Back", Convert.ToInt32(HiddenField_Mss_UserId.Value),UserOnline.id());
            if (dt.Rows.Count <= 0)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("انتهای لیست پیام ها قرار دارید  . پيامی دیگر وجود ندارد", "");
                MultiView1.ActiveViewIndex = 2;
                return;
            }
            HiddenField_Mss_UserId.Value = dt.Rows[0]["Id"].ToString();
            int id =int.Parse(dt.Rows[0]["Id"].ToString());
            dt = da_mss.Message_Tra("ViewMss", id);
            set_Veiw_Command(dt);
        }
        protected void LinkButton_Back_Message_Click(object sender, EventArgs e)
        {
            dt = da_mss.Message_Tra("Selec_Back", Convert.ToInt32(HiddenField_Mss_UserId.Value), UserOnline.id());
            if (dt.Rows.Count <= 0)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Warning;
                (this.Page.Master as Phasco01).AddCustomMessage("ابتدای لیست پیام ها قرار دارید", "");
                MultiView1.ActiveViewIndex = 2;
                return;
            }
            HiddenField_Mss_UserId.Value = dt.Rows[0]["Id"].ToString();
            int id =int.Parse(dt.Rows[0]["Id"].ToString());
            dt = da_mss.Message_Tra("ViewMss", id);
            set_Veiw_Command(dt);
        }
        void set_Veiw_Command(DataTable ds_set)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(ds_set.Rows[0]["DateSend"].ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            try
            {
                if (ds_set.Rows[0]["uid"].ToString() == "") LBL_Sender.Text = "مدیریت سایت فاسکو";
                else LBL_Sender.Text = ds_set.Rows[0]["uid"].ToString();
            }
            catch (Exception)
            { LBL_Sender.Text = "مدیریت سایت فاسکو"; }
            Lbl_Body.Text = ds_set.Rows[0]["Body"].ToString();
            LBL_Date_Send.Text = sunDate.Weekday.ToString();
            Label_Time.Text = " ساعت :  " + dtm.Hour.ToString() + ":" + dtm.Minute.ToString();
            Lbl_Title.Text = ds_set.Rows[0]["Title"].ToString();

            if (ds_set.Rows[0]["Attach"].ToString() != "none") { LinkButton_Attach.Visible = true; HiddenField_Attach_Name.Value = ds_set.Rows[0]["Attach"].ToString(); }
            else { LinkButton_Attach.Visible = false; HiddenField_Attach_Name.Value = ""; }
            dt = da_mss.Message_Tra("select_Item", int.Parse(ds_set.Rows[0]["Sender"].ToString()));
            if (dt.Rows.Count > 0)
            {
                //if (dt.Rows[0]["Image"].ToString() == "1")
                //{ Image_User.ImageUrl = "~/phascoupfile/Userphoto/" + dt.Rows[0]["Id"].ToString() + ".jpg"; Image_User.Visible = true; }
                //else Image_User.Visible = false;
            }
            MultiView1.ActiveViewIndex = 2;
        }
        protected void LinkButton_BackTOList_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 1; }
        #region Message Transaction
        protected void LinkButton_Answer_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField_Mss_UserId.Value);
            dt = da_mss.Message_Tra("Select_Item", id);
            Label_Send_To.Text = LBL_Sender.Text.ToString();
            HiddenField_Back_UserId.Value = dt.Rows[0]["Sender"].ToString();
            FCKeditor1.Value = " <p dir='rtl'  align='right'><br><br><br><hr><br>" + dt.Rows[0]["Body"].ToString() + "</P>";
            MultiView1.ActiveViewIndex = 3;
        }

        protected void LinkButton_Delete_Message_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(HiddenField_Mss_UserId.Value);
                dt = da_mss.Message_Tra("Delete_Mss", id);
                bind_grd_Mss();
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("پيام با موفقيت حذف شد", "");
            }
            catch (Exception)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("بروز اشکال در زمان اجرا", "");
            }
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
                dt = da_mss.Message_Tra("send", 0, Convert.ToInt32(HiddenField_Back_UserId.Value), UserOnline.id(),0,TextBox_Title.Text,FCKeditor1.Value,0,filename,0);
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("پیام با موفقیت ارسال شد", "");
            }
            catch (Exception)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("بروز اشکال در زمان اجرا", "");
            }
        }

        protected void LinkButton_Attach_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = Server.MapPath("~\\Pup\\MssAttach\\" + HiddenField_Attach_Name.Value.ToString());
                System.IO.FileStream myStream = new System.IO.FileStream(filename, System.IO.FileMode.Open, System.IO.FileAccess.Read);
                byte[] buffer = new byte[(int)myStream.Length];
                myStream.Read(buffer, 0, (int)myStream.Length);
                myStream.Close();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Length", buffer.Length.ToString());
                Response.AddHeader("Content-Disposition", "attachment; filename=" + HiddenField_Attach_Name.Value.ToString());
                Response.BinaryWrite(buffer);
                Response.End();
            }
            catch (Exception)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("بروز اشکال در زمان اجرا", "");
            }
        }
    }
}
