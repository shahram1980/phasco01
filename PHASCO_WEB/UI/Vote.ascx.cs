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
using phasco.BaseClass;
using PHASCO_WEB.DAL;
namespace phasco_webproject.UI
{
    public partial class Vote : System.Web.UI.UserControl
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_QuestionTableAdapter da_question = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_QuestionTableAdapter();
        DS_MainPhasco.T_Vote_QuestionDataTable dt_question = new DS_MainPhasco.T_Vote_QuestionDataTable();
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_ItemsTableAdapter da_item = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_Vote_ItemsTableAdapter();
        DS_MainPhasco.T_Vote_ItemsDataTable dt_item = new DS_MainPhasco.T_Vote_ItemsDataTable();
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) { bind_List(); } }

        protected void bind_List()
        {
            try
            {

                MultiView1.Visible = true;
                MultiView1.ActiveViewIndex = 0;
                dt_question = da_question.select_Question();
                Lbl_Question.Text = dt_question[0][GetGlobalResourceObject("Resource", "Question").ToString()].ToString();
                string strClientName = GetGlobalResourceObject("Resource", "Question").ToString();

                dt_item = da_item.Vote_tra(null, "select_Lang", null, Page.Culture.ToString(), null, null);
                RadioButtonList_Item.DataTextField = "Item";
                RadioButtonList_Item.DataValueField = "id";

                RadioButtonList_Item.DataSource = dt_item;
                RadioButtonList_Item.DataBind();

            }
            catch (Exception) { MultiView1.Visible = false; }
        }

        protected void Button_INs_Click(object sender, EventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(RadioButtonList_Item.SelectedValue);
                da_item.VoteUp(Id);
                Lbl_Alarm.Text = Resources.Resource.Vote_Inserted;
            }
            catch (Exception) {  Lbl_Alarm.Text =Resources.Resource.Error_ShowMss; }

        }
        protected void Bid_reporter()
        {
            MultiView1.ActiveViewIndex = 1;
            Set_Totals();
            dt_item = da_item.Select_all(Page.Culture.ToString());
            Repeater_Vote.DataSource = dt_item;
            Repeater_Vote.DataBind();
        }
        protected void Set_Totals()
        {
            dt_item = da_item.Sum_Vote();
            total_vote.Value = dt_item[0]["Sum_Vote"].ToString();
            total_item.Value = dt_item[0]["Sum_item"].ToString();
        }

        protected void LinkButton_View_Result_Click(object sender, EventArgs e)
        { Bid_reporter(); }

        protected void LinkButton_Back_Vote_Click(object sender, EventArgs e)
        { bind_List(); }

    }
}