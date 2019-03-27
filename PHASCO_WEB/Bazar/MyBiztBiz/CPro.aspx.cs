using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading;
using System.Globalization;
using Membership_Manage;
using DataAccessLayer.BIZ;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class CPro : BasePage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Apply_Click(object sender, EventArgs e)
        {
            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            if (TextBox_NewPass1.Text != TextBox_NewPass2.Text)
            {
                Label_Alarm.Text = "نام رمزهای جدید یکسان نمی باشد";
                return;
            }
            if (TextBox_NewPass1.Text == "")
            {
                Label_Alarm.Text = "نام رمزهای جدید نمی تواند خالی باشد";
                return;
            }
            dt = dauser.Changepass("ChangePass", UserOnline.id(), TextBox_CurrentPass.Text, TextBox_NewPass1.Text);
            if (dt.Rows[0][0].ToString() == "0")
            {
                Label_Alarm.Text = "نام رمز فعلی صحیح نمی باشد";
                return;
            }
            else
                MultiView1.ActiveViewIndex = 1;

        }
    }
}