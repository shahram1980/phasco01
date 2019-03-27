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
    public partial class Register : UnSecureForm
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter da_Login = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter();
        DS_MainPhasco.ScientifiLoginUserDataTable ds_Login = new DS_MainPhasco.ScientifiLoginUserDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientificPropertiesTableAdapter da_Pro = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientificPropertiesTableAdapter();
        DS_MainPhasco.ScientificPropertiesDataTable ds_Pro = new DS_MainPhasco.ScientificPropertiesDataTable();
        #endregion

        public override string FormTitle
        { get { return Resources.Resource.Page_Register.ToString(); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { MultiView1.ActiveViewIndex = 0; }
        }

        public override phasco.BaseClass.MasterPageColection MasterPageName
        { get { return MasterPageColection.Phasco01; } }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            ds_Login = da_Login.Select_UID(TextBox_Uid.Text);
            if (ds_Login.Rows.Count > 0)
            { ShowMessage(Resources.Resource.R_err_Has_Uid, phasco_webproject.BaseClass.Enum.MessageType.Error); return; }

            da_Login.Users_Insert_New_User(TextBox_Uid.Text.ToString(), TextBox_Pass.Text.ToString(), TextBox_Intro.Text.ToString(), Textbox_FirstName.Text.ToString(), TextBox_LastName.Text.ToString(),
                                           TextBox_Day.Text.ToString(), TextBox_Month.Text.ToString(), TextBox_Years.Text, TextBox_B_Locate.Text.ToString(), RadioButtonList_Sex.SelectedValue.ToString(),
                                           RadioButtonList_Marriage.SelectedValue.ToString(), DropDownList_Studies.SelectedValue.ToString(), TextBox_Studies_R.Text.ToString(), TextBox_OrgName.Text.ToString(),
                                           TextBox_Fax.Text.ToString(), "", TextBox_OrgPosition.Text.ToString(), TextBox_Example.Text.ToString(), TextBox_Favorites.Text.ToString(), TextBox_Tel.Text.ToString(),
                                           TextBox_Mobile.Text.ToString(), TextBox_Email.Text.ToString(), TextBox_WEbSite.Text.ToString(), TextBox_Address.Text.ToString(), TextBox_State.ToString(), TextBox_City.ToString(), TextBox_Country.Text.ToString());

            MultiView1.ActiveViewIndex = 1;
            ShowMessage(Resources.Resource.R_err_Final, phasco_webproject.BaseClass.Enum.MessageType.FinalAction);          
        }
    }
}