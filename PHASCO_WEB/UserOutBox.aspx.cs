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
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class UserOutBox : System.Web.UI.Page
    {
        #region dataset
        //PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Tbl_Message_OutboxTableAdapter da_Out = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Tbl_Message_OutboxTableAdapter();
        //PHASCO_WEB.DAL.DS_MainPhasco.Tbl_Message_OutboxDataTable dt_Out = new PHASCO_WEB.DAL.DS_MainPhasco.Tbl_Message_OutboxDataTable();


        Tbl_Message_Outbox da_Out = new Tbl_Message_Outbox();
        DataTable dt_Out = new DataTable();
        Tbl_Message da_mss = new Tbl_Message();
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
            if (!UserOnline.User_Online_Valid()) Response.Redirect("Default.aspx");
            if (!IsPostBack) bind_grd_Mss();
        }
        void bind_grd_Mss()
        {
            dt_Out = da_Out.Select_Id(UserOnline.id());
            if (dt_Out.Rows.Count <= 0) LBL_Alarm.Text="هیج پیام جدید وجود ندارد" ;
            Grid_Users.DataSource = dt_Out;
            Grid_Users.DataBind();
        }
        protected void Grid_Users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_Users.PageIndex = e.NewPageIndex;
            bind_grd_Mss();
        }
        protected void LinkButton_Delete_Click(object sender, EventArgs e)
        {
            int count = 0;
            try
            {
                System.Text.StringBuilder str = new System.Text.StringBuilder();
                for (int i = 0; i < Grid_Users.Rows.Count; i++)
                {
                    GridViewRow row = Grid_Users.Rows[i];
                    bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
                    string dd = Grid_Users.Rows[i].Cells[1].Text.ToString();
                    if (isChecked)
                    {
                        count = count + 1;
                        da_mss.Message_Tra("Delete_OutBox",Convert.ToInt32(Grid_Users.Rows[i].Cells[1].Text.ToString()));
                    }
                }
                bind_grd_Mss();
                if (count == 0) LBL_Alarm.Text="هيچ کاربری برای ارسال پیام انتخاب نشده" ;
                else { LBL_Alarm.Text = count.ToString() + " " + "پیام با موفقیت حذف شد"; bind_grd_Mss(); }
            }
            catch (Exception)
            { LBL_Alarm.Text="بروز خطا هنگام اجرا" ; }
        }
    }
}
