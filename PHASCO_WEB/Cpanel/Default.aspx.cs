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
using PHASCO_WEB.DAL;

namespace phasco.Cpanel
{
    public partial class Default : System.Web.UI.Page
    {
        //#region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.alluserloginTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.alluserloginTableAdapter();
        DS_MainPhasco.alluserloginDataTable dt = new DS_MainPhasco.alluserloginDataTable(); 
        //#endregion
        protected void Page_Load(object sender, EventArgs e)
        { Session["Valid_admin"] = "false"; Session["uid"] = ""; }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dt = da.Select_Login(TextBox_UId.Text, TextBox_Pass.Text);
            if (dt.Rows.Count <= 0)
            { Label_Alarm.Text = "نام کاربری یا رمز اشتباه است"; return; }
            Session["Valid_admin"] = "true";
            Session["uid"] = TextBox_UId.Text;
            Response.Redirect("main.aspx");
        }
    }
}
