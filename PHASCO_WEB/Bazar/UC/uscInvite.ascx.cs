using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscInvite : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                PMail.SendInviteEmail(txtEmail.Text);
                TBL_InviteEmails da = new TBL_InviteEmails();
                da.TBL_InviteEmails_Tra(txtEmail.Text, "insert");
                txtEmail.Text = string.Empty;
                lbl_Alaram.Text = "ایمیل با موفقیت ارسال شد";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "$(function () { alert('اشکال در ارسال ایمیل'); });", true);

            }
            catch (Exception)
            {
                lbl_Alaram.Text = "اشکال در ارسال ایمیل";
            }
        }
    }
}