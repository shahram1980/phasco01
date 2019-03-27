using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.Component;

using System.Data;
using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class ChangePassword : BasePage
    {
        TBL_User_Biz dauser = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnChangePass_Click(object sender, EventArgs e)
        {
            try
            {
                divMessage.Visible = true;
                if (txtNewPassword.Text.Length > 5)
                {
                    bool check = false;
                    DataTable dtUser = dauser.Changepass("ChangePass", UserOnline.id(), txtOldPassword.Text, txtNewPassword.Text);
                    if (dtUser.Rows.Count > 0)
                    {
                        if (dtUser.Rows[0][0].ToString() == "1")
                            check = true;
                    }

                    if (check)
                    {
                        divMessage.Style.Add("background-color", "Green");
                        lblMessage.Text = "رمز عبور با موفقیت تغییر کرد";
                    }
                    else
                    {
                        divMessage.Style.Add("background-color", "Yellow");
                        lblMessage.Text = "اشکال در تغییر رمز عیور . امکان دارد رمز عبور قبلی را اشتباه وارد کرده باشید.";
                    }
                }
                else
                {
                    divMessage.Style.Add("background-color", "Yellow");
                    lblMessage.Text = "رمز عبور باید حداقل 6 کاراکتر باشد";
                }
            }
            catch
            {
                divMessage.Style.Add("background-color", "Red");
                lblMessage.Text = "اشکال در تغییر رمز عبور";
            }
        }
    }
}