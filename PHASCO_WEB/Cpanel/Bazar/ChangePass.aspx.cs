using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DataAccessLayer.BIZ;


namespace BiztBiz.bizpanel
{
    public partial class ChangePass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Change_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.Cookies["Admin_Login"]["Admin_Id"].ToString());
            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            dt = dauser.Check_login(3, "", "", 1);

            if (TextBox_Old.Text == dt.Rows[0]["Password"].ToString())
            {
                dauser.Check_login(7, "", TextBox_New.Text, 1);
                Label_alarm.Text = "Password is success changed"; 
            }
            else
            { Label_alarm.Text = "Old password is not correct"; }

            //ObjCookie2.Values["Admin_Id"] 
        }
    }
}
