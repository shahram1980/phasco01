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
    public partial class FAQLIstNEWManagmet : System.Web.UI.Page
    {
        FAQ_Tbl da = new FAQ_Tbl();
        DataTable dt_faq;
        private void bind_Grd()
        {
            dt_faq = da.FAQ_Tra("select_question_admin", 0, 0, "", "", 0, 0, 0, "");
            GridView_Qu.DataSource = dt_faq;
            GridView_Qu.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }
        protected void Button_Send__User_Answer_Click(object sender, EventArgs e)
        {
            if (TextBox_Title_User_Answer.Text == "") { Label_Send_Ans_Alarm.Text = "عنوان وارد نشده"; }
            else if (TextBox_Text_User_Answer.Text == "") { Label_Send_Ans_Alarm.Text = "سوال وارد نشده"; }
            else
            {
                da.FAQ_Tra("insert_Ans", 0, int.Parse(Request.QueryString["id"].ToString()), TextBox_Title_User_Answer.Text, TextBox_Text_User_Answer.Text, 1, 0, int.Parse(Request.QueryString["id"].ToString()), "");
                Response.Redirect("Default.aspx?page=faqnew");
                MultiView1.ActiveViewIndex = 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mode"] != null)
                {
                    if (Request.QueryString["mode"].ToString() == "delete")
                    {
                        da.FAQ_Tra("delete_admin",int.Parse(Request.QueryString["id"].ToString()), 0, "", "", 0, 0, 0, "");
                        bind_Grd();
                    }
                    else { set_Ans(); }
                }
                else { bind_Grd(); }
            }
        }
        private void set_Ans()
        {

            dt_faq = da.FAQ_Tra("select_item", int.Parse(Request.QueryString["id"].ToString()), 0, "", "", 0, 0, 0, "");
            Label_Text_title.Text = dt_faq.Rows[0]["title"] + "<br/>" + dt_faq.Rows[0]["text"];
            MultiView1.ActiveViewIndex = 1;
        }
    }
}
