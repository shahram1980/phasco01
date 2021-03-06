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
using phasco_webproject.BaseClass;
using System.Text;
using PHASCO_WEB.DAL.DS_MainPhascoTableAdapters;
using PHASCO_WEB.DAL;
using Membership_Manage;
using phasco.Template;
using DataAccessLayer;

namespace phasco_webproject.UI
{
    public partial class UserOutBox : System.Web.UI.UserControl
    {
        #region dataset
        //Tbl_Message_OutboxTableAdapter da_Out = new Tbl_Message_OutboxTableAdapter();
        //DataAccessLayer.DS_MainPhasco.Tbl_Message_OutboxDataTable dt_Out = new DataAccessLayer.DS_MainPhasco.Tbl_Message_OutboxDataTable();


        Tbl_Message_Outbox da_Out = new Tbl_Message_Outbox();
        DataTable dt_Out = new DataTable();

        Tbl_Message da_mss = new Tbl_Message();
        DataTable dt = new DataTable();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack)  bind_grd_Mss(); }
        void bind_grd_Mss()
        {
            dt_Out = da_Out.Select_Id(UserOnline.id());
            if (dt_Out.Rows.Count <= 0)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("هیج پیام جدید وجود ندارد", (int)(1));
            }
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
                StringBuilder str = new StringBuilder();
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
                if (count == 0)
                {
                    (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                    (this.Page.Master as Phasco01).AddCustomMessage("هيچ کاربری برای ارسال پیام انتخاب نشده", (int)(1));
                }
                else
                {
                    (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                    (this.Page.Master as Phasco01).AddCustomMessage(count.ToString() + " " + "پیام با موفقیت حذف شد", (int)(3));

                    bind_grd_Mss();
                }
            }
            catch (Exception)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("بروز خطا هنگام اجرا", (int)(4));
            }
        }
    }
}