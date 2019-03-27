using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.Component;
using System.Data;

using Membership_Manage;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;

namespace BiztBiz.MyBiztBiz
{
    public partial class ProfileSetting : BasePage
    {
        TBL_User_Biz dauser = new TBL_User_Biz();
        Tbl_state da_State = new Tbl_state();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            Bind_indust();
            if (Users.UserValid())
                FillEditControl(UserOnline.id());
        }

        protected void Bind_indust()
        {
            DropDownList_Indus.DataTextField = "";
            DropDownList_Indus.DataValueField = "";
            TBL_Categories dacat = new TBL_Categories();
            DataTable dtcat = dacat.TBL_Categories_Tra(0, Resources.Resource.select_L1.ToString());


            DropDownList_Indus.DataSource = dtcat;
            DropDownList_Indus.DataTextField = Resources.Resource.F_Subject;
            DropDownList_Indus.DataValueField = "id";
            DropDownList_Indus.DataBind();

        }

        protected void FillEditControl(int id)
        {
            DataTable dtUsers = dauser.TBL_User_Tra("selectById", id);
            if (dtUsers.Rows.Count > 0)
            {
                rdbListUserTypes.SelectedValue = Utility.ConverToNullableStringForDDL(dtUsers.Rows[0]["User_Status"]);
                TextBox_Family.Text = Utility.ConverToNullableString(dtUsers.Rows[0]["Family_Name"]);
                TextBox_Mobile.Text = Utility.ConverToNullableString(dtUsers.Rows[0]["Mobile"]);
                TextBox_Name.Text = Utility.ConverToNullableString(dtUsers.Rows[0]["Given_Name"]);
                TextBox_Tel_A_Number.Text = Utility.ConverToNullableString(dtUsers.Rows[0]["Tel_A_Number"]);
                TextBox_Uid_Email.Text = Utility.ConverToNullableString(dtUsers.Rows[0]["Uid"]);
                DropDownList_Indus.SelectedValue = Utility.ConverToNullableStringForDDL(dtUsers.Rows[0]["Industry"]);

                DataTable dtState = da_State.TBL_State_Tra("select_byID",Utility.ConverToNullableInt(dtUsers.Rows[0]["Business_Location"]));
                if (dtState.Rows.Count > 0)
                {
                    if (Utility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 2) // ostan
                    {
                        cddState.SelectedValue = Utility.ConverToNullableStringForDDL(dtUsers.Rows[0]["Business_Location"]);
                    }
                    else if (Utility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 3) // city
                    {
                        cddState.SelectedValue = dtState.Rows[0]["ParentID"].ToString();
                        ccdCity.SelectedValue = Utility.ConverToNullableStringForDDL(dtUsers.Rows[0]["Business_Location"]);
                    }
                }

            }
        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                if (Users.UserValid())
                {
                    int city = Utility.ConverToNullableInt(ccdCity.SelectedValue.Split(new char[] { ':' })[0]);
                    if (city <= 0)
                    {
                        city = Utility.ConverToNullableInt(cddState.SelectedValue.Split(new char[] { ':' })[0]);
                    }

                    dauser.TBL_User_Tra(UserOnline.id(), "update", "", "", Utility.ConverToNullableInt(rdbListUserTypes.SelectedValue),
                        city.ToString(), "", DropDownList_Indus.SelectedValue,
                        TextBox_Name.Text, TextBox_Family.Text, "", "", TextBox_Tel_A_Number.Text, TextBox_Mobile.Text, 0, 0, 0);

                    ShowSuccessfulMessage();
                }
            }
            catch
            {
                divMessage.Visible = true;
                divMessage.Style.Add("background-color", "Red");
                lblMessage.Text = "اشکال در ویرایش ";
            }
        }

        protected void ShowSuccessfulMessage()
        {
            divMessage.Visible = true;
            divMessage.Style.Add("background-color", "Green");
            lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";
        }

    }
}