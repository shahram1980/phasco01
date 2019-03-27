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
    public partial class Members : System.Web.UI.Page
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientificPropertiesTableAdapter da_pro = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientificPropertiesTableAdapter();
        DS_MainPhasco.ScientificPropertiesDataTable dt_pro = new DS_MainPhasco.ScientificPropertiesDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter da_login = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter();
        DS_MainPhasco.ScientifiLoginUserDataTable dt_login = new DS_MainPhasco.ScientifiLoginUserDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Eshterak_NoTableAdapter da_esht = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Eshterak_NoTableAdapter();
        DS_MainPhasco.Eshterak_NoDataTable dt_esht = new DS_MainPhasco.Eshterak_NoDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_GroupsTableAdapter da_Group = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_GroupsTableAdapter();
        DS_MainPhasco.User_GroupsDataTable dt_Group = new DS_MainPhasco.User_GroupsDataTable();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) MultiView1.ActiveViewIndex = 0;
        }

        #region Datagirid Transaction
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        { bind_Datagrid(); }

        void bind_Datagrid()
        {
            if (DropDownList1.SelectedValue.ToString() != "0")
            {
                if (DropDownList1.SelectedValue.ToString() != "1") dt_pro = da_pro.List_New();
                if (DropDownList1.SelectedValue.ToString() != "2") dt_pro = da_pro.List_Old();
            }


            GridView_Member.DataSource = dt_pro;
            GridView_Member.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_Change_Condotion_Command(object sender, CommandEventArgs e)
        {
            dt_login = da_login.Select_Item(Convert.ToInt32(e.CommandArgument.ToString()));
            string new_condition = "";
            if (dt_login[0].Active.Trim() == "yes") new_condition = "no";
            if (dt_login[0].Active.Trim() == "no") new_condition = "yes";

            da_login.Update_Active(new_condition, Convert.ToInt32(e.CommandArgument.ToString()));
            bind_Datagrid();
        }

        protected void GridView_Member_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Member.PageIndex = e.NewPageIndex;
            bind_Datagrid();
        }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        { da_login.Delete_Item(Convert.ToInt32(e.CommandArgument.ToString())); bind_Datagrid(); }

        protected void LinkButton_Edit_Command(object sender, CommandEventArgs e)
        {

            HiddenField_Edit_Id.Value = e.CommandArgument.ToString();
            bind_Member_Group();
            dt_login = da_login.Select_All_Record_Items(Convert.ToInt32(HiddenField_Edit_Id.Value.ToString()));
            try { DropDownList_Member_Group.SelectedValue = dt_login[0].Grade.ToString(); }
            catch (Exception) { }

            TextBox_uid.Text = dt_login[0].Uid.ToString();
            TextBox_Pass2.Text = TextBox_Pass.Text = dt_login[0].Pass.ToString();

            TextBox_Name.Text = dt_login[0]["name"].ToString();
            TextBox_Famil.Text = dt_login[0]["famil"].ToString();
            TextBox_age.Text = dt_login[0]["age"].ToString();
            TextBox_age1.Text = dt_login[0]["age1"].ToString();
            TextBox_age2.Text = dt_login[0]["age2"].ToString();
            TextBox_BirthLoc.Text = dt_login[0]["birthloc"].ToString();
            TextBox_Country.Text = dt_login[0]["country"].ToString();

            TextBox_State.Text = dt_login[0]["State"].ToString();
            TextBox_City.Text = dt_login[0]["City"].ToString();
            TextBox_OrgName.Text = dt_login[0]["OrgName"].ToString();
            TextBox_OrgPosition.Text = dt_login[0]["OrgPosition"].ToString();
            RadioButtonList_Sex.SelectedValue = dt_login[0]["Sex"].ToString();
            RadioButtonList_Marriage.SelectedValue = dt_login[0]["Marriage"].ToString();

            TextBox_Studies.Text = dt_login[0]["Studies"].ToString();
            TextBox_Studies1.Text = dt_login[0]["Studies1"].ToString();
            TextBox_Example.Text = dt_login[0]["Example"].ToString();
            TextBox_Favorites.Text = dt_login[0]["Favorites"].ToString();

            TextBox_tel.Text = dt_login[0]["tel"].ToString();
            TextBox_Mobile.Text = dt_login[0]["Mobile"].ToString();

            TextBox_Email.Text = dt_login[0]["Email"].ToString();
            TextBox_Site.Text = dt_login[0]["Site"].ToString();

            TextBox_address.Text = dt_login[0]["Address"].ToString();
            TextBox_Zipcode.Text = dt_login[0]["ZipCode"].ToString();
            dt_esht = da_esht.select_By_Id(Convert.ToInt32(HiddenField_Edit_Id.Value));
            if (dt_esht.Rows.Count < 0)
                TextBox_User_No.Text = dt_esht[0].User_No.ToString();

            MultiView1.ActiveViewIndex = 1;
        }

        void bind_Member_Group()
        {
            dt_Group = da_Group.Select_All();
            DropDownList_Member_Group.DataTextField = "GroupName";
            DropDownList_Member_Group.DataValueField = "autoid";

            DropDownList_Member_Group.DataSource = dt_Group;
            DropDownList_Member_Group.DataBind();
        }
        #endregion

        #region Edit Form

        protected void Button_Apply_Click(object sender, EventArgs e)
        {
            da_pro.Update_Item(TextBox_Name.Text, TextBox_Famil.Text, TextBox_age.Text, TextBox_age1.Text, TextBox_age2.Text, TextBox_BirthLoc.Text,
            RadioButtonList_Sex.SelectedValue.ToString(), RadioButtonList_Marriage.SelectedValue.ToString(), TextBox_Studies.Text, TextBox_Studies1.Text,
            TextBox_OrgName.Text, TextBox_Zipcode.Text, "", "", TextBox_Example.Text, TextBox_Favorites.Text, TextBox_tel.Text, TextBox_Mobile.Text, TextBox_Email.Text,
            TextBox_Site.Text, TextBox_address.Text, TextBox_State.Text, TextBox_City.Text, TextBox_Country.Text, Convert.ToInt32(HiddenField_Edit_Id.Value));
            da_login.Update_Grade(Convert.ToInt32(DropDownList_Member_Group.SelectedValue.ToString()), Convert.ToInt32(HiddenField_Edit_Id.Value));

            bind_Datagrid();
        }

        protected void Button_Cancle_Click(object sender, EventArgs e)
        { bind_Datagrid(); }

        #endregion

        #region User Group
        protected void LinkButton_UserGroup_Click(object sender, EventArgs e)
        { bind_Levels(); }

        void bind_Levels()
        {
            dt_Group = da_Group.Select_All();
            GridView_Levels.DataSource = dt_Group;
            GridView_Levels.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button_Level_Insert_Click(object sender, EventArgs e)
        {
            da_Group.Insert_NEW(TextBox_GroupName.Text, Convert.ToInt32(DropDownList_Levels.SelectedValue.ToString()));
            bind_Levels();
        }
        #endregion





    }
}
