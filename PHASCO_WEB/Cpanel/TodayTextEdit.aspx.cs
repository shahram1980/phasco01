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
using DataAccessLayer;

namespace PHASCO_WEB.Cpanel
{
    public partial class TodayTextEdit : System.Web.UI.Page
    {
        Tbl_TodayText da = new Tbl_TodayText();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) set_Form();
        }
        void set_Form()
        {
            dt = da.Tbl_TodayText_Tra("select", "", "", 0);
            if (dt.Rows.Count > 0)
            {
                TextBox_Text.Text = dt.Rows[0]["text"].ToString();
                TextBox_Url.Text = dt.Rows[0]["Url"].ToString();
                if (dt.Rows[0]["view_Url"].ToString() == "1") CheckBox_Link.Checked = true;
                else CheckBox_Link.Checked = false; ;
            }
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            int view_Url = 0;
            if (CheckBox_Link.Checked) view_Url = 1;

            da.Tbl_TodayText_Tra("insert", TextBox_Text.Text, TextBox_Url.Text, view_Url);
        }
    }
}
