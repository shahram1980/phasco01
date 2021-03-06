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
    public partial class FAQListManagment : System.Web.UI.Page
    {

        FAQ_Tbl da = new FAQ_Tbl();
        DataTable dt;

        private void bind_Grd()
        {
            dt = da.FAQ_List_Tra("select_all", 0, "", "");
            int count = dt.Rows.Count;
            GridView_Qu_List.DataSource = dt;
            GridView_Qu_List.DataBind();
        }

        protected void Button_Edit_Click(object sender, EventArgs e)
        {
            try
            {
                da.FAQ_List_Tra("update", int.Parse(HiddenField_Id.Value.ToString()), TextBox_title.Text, "");
                Button_Edit.Visible = false;
                Button_Insert.Visible = true;
                DropDownList_Lang.Enabled = true;
                Label_Alarm.Text = "عملیات با موفقیت انجام شد";
                bind_Grd();
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            try
            {
                da.FAQ_List_Tra("insert", 0, TextBox_title.Text, "");
                Label_Alarm.Text = "عملیات با موفقیت انجام شد";
                bind_Grd();
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }

        protected void DropDownList_Lang_SelectedIndexChanged(object sender, EventArgs e)
        { Response.Redirect("FAQListManagment.aspx?lang=" + DropDownList_Lang.SelectedValue.ToString()); }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                da.FAQ_List_Tra("delete", int.Parse(e.CommandArgument.ToString()), "", "");
                Label_Alarm.Text = "عملیات با موفقیت انجام شد";
                bind_Grd();
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }

        protected void LinkButton_Edit_Command(object sender, CommandEventArgs e)
        {
            try
            {
                HiddenField_Id.Value = e.CommandArgument.ToString();
                dt = da.FAQ_List_Tra("select_Item", int.Parse(HiddenField_Id.Value.ToString()), "", "");
                TextBox_title.Text = dt.Rows[0]["Title"].ToString();
                Button_Edit.Visible = true;
                Button_Insert.Visible = false;
                DropDownList_Lang.Enabled = false;
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا هنگام اجرا"; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && (Request.QueryString["lang"] != null)) { DropDownList_Lang.SelectedValue = Request.QueryString["lang"].ToString(); }
            bind_Grd();
        }





    }
}
