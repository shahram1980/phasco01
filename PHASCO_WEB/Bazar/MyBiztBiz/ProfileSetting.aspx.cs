using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Membership_Manage;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

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
            if (UserOnline.User_Online_Valid())
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


                try
                {
                    rdbListUserTypes.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dtUsers.Rows[0]["User_Status"]);
                    TextBox_Family.Text = PHASCOUtility.ConverToNullableString(dtUsers.Rows[0]["Family_Name"]);
                    TextBox_Mobile.Text = PHASCOUtility.ConverToNullableString(dtUsers.Rows[0]["Mobile"]);
                    TextBox_Name.Text = PHASCOUtility.ConverToNullableString(dtUsers.Rows[0]["Given_Name"]);
                    TextBox_Tel_A_Number.Text = PHASCOUtility.ConverToNullableString(dtUsers.Rows[0]["Tel_A_Number"]);
                    TextBox_Email.Text = PHASCOUtility.ConverToNullableString(dtUsers.Rows[0]["EMail"]);
                    TextBox_fax.Text = PHASCOUtility.ConverToNullableString(dtUsers.Rows[0]["fax"]);
                    DropDownList_Indus.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dtUsers.Rows[0]["Industry"]);
                }
                catch (Exception)
                {

                }


                //string  test= dtUsers.Rows[0]["Business_Location"] ;
                //test


                try
                {
                    DataTable dtState = da_State.T_state_Tra("selectJoin_byID", PHASCOUtility.ConverToNullableInt(dtUsers.Rows[0]["Business_Location"]));
                    cddState.SelectedValue = dtState.Rows[0]["ID_CITY"].ToString();
                    ccdCity.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dtUsers.Rows[0]["Business_Location"]);
                }
                catch (Exception)
                { }




                //if (dtState.Rows.Count > 0)
                //{
                //    if (PHASCOUtility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 2) // ostan
                //    {
                //        cddState.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dtUsers.Rows[0]["Business_Location"]);
                //    }
                //    else if (PHASCOUtility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 3) // city
                //    {
                //        cddState.SelectedValue = dtState.Rows[0]["ParentID"].ToString();
                //        ccdCity.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dtUsers.Rows[0]["Business_Location"]);
                //    }
                //}

            }
        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                if (UserOnline.User_Online_Valid())
                {
                    int city = PHASCOUtility.ConverToNullableInt(ddlCity.SelectedValue.Split(new char[] { ':' })[0]);
                    if (city > 0)
                    {
                        city = PHASCOUtility.ConverToNullableInt(ddlCity.SelectedValue.Split(new char[] { ':' })[0]);
                    }
                    else
                    {
                        divMessage.Visible = true;
                        divMessage.Style.Add("background-color", "Red");
                        lblMessage.Text = "شهر انتخاب نشده ";
                        return;
                    }
                    dauser.TBL_User_Tra_Edit(UserOnline.id(), "update", "", "", PHASCOUtility.ConverToNullableInt(rdbListUserTypes.SelectedValue),
                        city.ToString(), "", DropDownList_Indus.SelectedValue,
                        TextBox_Name.Text, TextBox_Family.Text, "", "", TextBox_Tel_A_Number.Text, TextBox_Mobile.Text, 0, 0, 0, TextBox_Email.Text, TextBox_fax.Text);

                    

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