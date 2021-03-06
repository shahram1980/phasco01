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

namespace phasco_webproject.Cpanel
{
    public partial class vote : System.Web.UI.Page
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_ItemsTableAdapter da_item = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_ItemsTableAdapter();
        DS_MainPhasco.T_Vote_ItemsDataTable dt_item = new DS_MainPhasco.T_Vote_ItemsDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_QuestionTableAdapter da_question = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_QuestionTableAdapter();
        DS_MainPhasco.T_Vote_QuestionDataTable dt_question = new DS_MainPhasco.T_Vote_QuestionDataTable();
        #endregion
  
 
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DataEdit(Object S, DataGridCommandEventArgs E)
        {
            Grd_Tax.EditItemIndex = (int)E.Item.ItemIndex;
            Bind_grd();
        }
        protected void DataUpdate(Object S, DataGridCommandEventArgs E)
        {
            try
            {
                Grd_Tax.EditItemIndex = (int)E.Item.ItemIndex;
                TextBox textbox_Uk = (TextBox)E.Item.Cells[2].Controls[0];
                string Subject_Name_uk = textbox_Uk.Text.ToString();

                int Get_Id = Convert.ToInt32(Grd_Tax.DataKeys[(int)E.Item.ItemIndex]);
                da_item.Vote_tra(Get_Id, "update_Item", "", "", Subject_Name_uk, 0);
                Bind_grd();
                Grd_Tax.EditItemIndex = -1;
                Label_Alarm.Text = "عملیات با موفقیت انجام شد";
                Bind_grd();
            }
            catch (Exception)
            { Label_Alarm.Text="بروز خطا هنگام اجرا"; }
        }
        protected void DataCancel(Object S, DataGridCommandEventArgs E)
        {
            Grd_Tax.EditItemIndex = -1;
            Bind_grd();
        }
        protected void Bind_grd()
        {
            try
            {

                dt_question = da_question.select_Lang(ddl_language.SelectedValue.ToString());
                if (dt_question.Rows.Count > 0)
                    Txt_Question.Text = dt_question[0].Question.ToString();
                dt_item = da_item.Vote_tra(null, "select_Lang", null, ddl_language.SelectedValue.ToString(), null, null);
                Grd_Tax.DataSource = dt_item;
                Grd_Tax.DataBind();
            }
            catch (Exception)
            { Label_Alarm.Text="بروز خطا هنگام اجرا"; }
        }
        protected void Grd_Tax_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                int Get_Id = Convert.ToInt32(Grd_Tax.DataKeys[(int)e.Item.ItemIndex]);
                da_item.Vote_tra(Get_Id, "delete", "", "", "", 0);
                Label_Alarm.Text="عملیات با موفقیت انجام شد";
                Bind_grd();
            }
            catch (Exception)
            { Label_Alarm.Text="بروز خطا هنگام اجرا"; }

        }
        protected void Button_Insert_q_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddl_language.SelectedValue.ToString() == "-1")
                {
                    Label_Alarm.Text="زبان انتخاب نشده"; return;
                }
                da_item.Vote_tra(0, "insert", Txt_Question.Text.ToString(), ddl_language.SelectedValue.ToString(), "", 0);
                Label_Alarm.Text="عملیات با موفقیت انجام شد";
            }
            catch (Exception)
            { Label_Alarm.Text="بروز خطا هنگام اجرا"; }
        }
        protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
        { Bind_grd(); }
        protected void Button_Items_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddl_language.SelectedValue.ToString() == "-1")
                {
                    Label_Alarm.Text="زبان انتخاب نشده"; return;
                }
                da_item.Vote_tra(0, "insert_Items", "", ddl_language.SelectedValue.ToString(), Txt_Item.Text.ToString(), 0);
                Label_Alarm.Text="عملیات با موفقیت انجام شد";
                Bind_grd();
            }
            catch (Exception)
            { Label_Alarm.Text="بروز خطا هنگام اجرا"; }


        }


    }
}
