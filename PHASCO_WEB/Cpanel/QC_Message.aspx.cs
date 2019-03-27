using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace PHASCO_WEB.Cpanel
{
    public partial class QC_Message : System.Web.UI.Page
    {
        TBL_QC_Message da_mss = new TBL_QC_Message();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) bindsetmessage();
        }

        void bindsetmessage()
        {
            GridView_Brand.DataBind();
            Label_CountMessage.Text = da_mss.TBL_QC_Message_SP(7).Rows[0][0].ToString();
        }
        protected void Button_Insert_Edit_Click(object sender, EventArgs e)
        {
            dt = da_mss.TBL_QC_Message_SP(1, 0, TextBox_Code.Text, FCKeditor_Message.Value.ToString(), 1, TextBox_Code_Reason.Text);
            if (dt.Rows.Count == 0)
            {
                Label_Alarm.ForeColor = System.Drawing.Color.Green;
                Label_Alarm.Text = "کد " + TextBox_Code.Text + " ثبت شد";
                TextBox_Code.Text = FCKeditor_Message.Value = "";
                Button_Edit.Visible = Button_Set_To_Edit.Visible = Button_delete.Visible = false;
            }
            else
            {
                Label_Alarm.ForeColor = System.Drawing.Color.Red;
                string message_ = "این کد با این پیغام در دیتابیس موجود است : <br/>";
                message_ = message_ + dt.Rows[0]["Code"] + "<br/>" + dt.Rows[0]["message"];
                Label_Alarm.Text = message_;

                HIddenField_ID.Value = dt.Rows[0]["id"].ToString();
                Button_Set_To_Edit.Visible = Button_delete.Visible = true;
            }
            bindsetmessage();
        }


        protected void Button_Edit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HIddenField_ID.Value.ToString());
            da_mss.TBL_QC_Message_SP(2, id, TextBox_Code.Text, FCKeditor_Message.Value.ToString(), 1, TextBox_Code_Reason.Text);
            Label_Alarm.ForeColor = System.Drawing.Color.Green;
            Label_Alarm.Text = "کد " + TextBox_Code.Text + " ویرایش شد";
            Button_Edit.Visible = Button_Set_To_Edit.Visible = Button_delete.Visible = false;
            bindsetmessage();
        }

        protected void Button_delete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HIddenField_ID.Value.ToString());
            da_mss.TBL_QC_Message_SP(3, id, "", "", 0,"");
            bindsetmessage();
            Label_Alarm.ForeColor = System.Drawing.Color.Green;
            Label_Alarm.Text = "حذف شد";
        }

        protected void Button_Set_To_Edit_Click(object sender, EventArgs e)
        {
            dt = da_mss.TBL_QC_Message_SP(1, 0, TextBox_Code.Text, FCKeditor_Message.Value.ToString(), 1, TextBox_Code_Reason.Text);
            if (dt.Rows.Count > 0)
            {
                Label_Alarm.Visible = false;

                HIddenField_ID.Value = dt.Rows[0]["id"].ToString();
                FCKeditor_Message.Value = dt.Rows[0]["Message"].ToString();
                TextBox_Code.Text = dt.Rows[0]["Code"].ToString();
                TextBox_Code_Reason.Text = dt.Rows[0]["ReasonCodeId"].ToString();
                bindsetmessage();
                Button_Edit.Visible = true;

            }
        }
    }
}