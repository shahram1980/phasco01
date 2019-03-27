using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.DAL;
using BiztBiz.DAL.MenuPageTableAdapters;

namespace BiztBiz
{
    public partial class ContactUS : BasePage
    {
        #region datset
        Menu_TextTableAdapter da_Text = new Menu_TextTableAdapter();
        MenuPage.Menu_TextDataTable ds_Text = new MenuPage.Menu_TextDataTable();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Page_Set(); }
        }

        private void Page_Set()
        {
            try
            {
                ds_Text = da_Text.Menu_text_Tra("select", 6, "");
                if (Request.QueryString["b"] != null)
                {
                    Label_Text.Text = ds_Text[0].Text.Replace(Session["serach_Text_Item"].ToString(), "<font color='#FF3300'><u>" + Session["serach_Text_Item"].ToString() + "</u></font>");
                    goback.Visible = true;
                }
                else
                {
                    Label_Text.Text = ds_Text[0].Text.ToString();
                    goback.Visible = false;
                }
                LBL_Title.Text = ds_Text[0]["Title"].ToString();
            }
            catch (Exception)
            {
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (txtTelNum.Text == string.Empty)
            { return; }
            try
            {
                string mailbody = "<div style='direction:rtl;'>آدرس ایمیل :" + txtSenderEmail.Text + "<br />نام : " + txtFirstName.Text + "<br />متن: " + txtTelNum.Text + "</div>";

                Mailer.Send_Mail("فرم تماس با ما", "support1@perisanweb.com", mailbody);
                LBL_Alarm.Text = "پیام با موفقیت ارسال شد";

                LBL_Alarm.Visible = true;
            }
            catch (Exception)
            {
                LBL_Alarm.Text = "بروز خطا هنگام ارسال";
                LBL_Alarm.Visible = true;
            }

        }
    }
}