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
using phasco_webproject.BaseClass;
using Membership_Manage;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class Userwallcomment : System.Web.UI.Page
    {
        Users_Wall da_w = new Users_Wall();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_send_comment_Click(object sender, EventArgs e)
        {

            if (UserOnline.User_Online_Valid())
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                int subid = int.Parse(Request.QueryString["subid"].ToString());
                da_w.Users_Wall_tra("insert", UserOnline.id(), id, subid, TextBox_comment.Text);
                string jScript = "<script>window.opener.location.reload();window.close();</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "jScript", jScript);
            }
            else
                Label_Alaram_Comment.Text = "کاربر محترم لطفا ابتدا لاگین کنید";
        }
    }
}
