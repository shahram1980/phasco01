using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLink.Web.Helpers;
using System.Data;
using QLCommon.AdvertisementManagement.Data;
using QLAdvertisementManagementValidation;

namespace AdvertisementManagement.Admin
{
    public partial class Advertiser : BasePage
    {
        #region Properties

        int _userID;
        public int UserID
        {
            get
            {
                return _userID;
            }
            set
            {
                _userID = value;
            }
        }

        int _advertiserID;
        public int AdvertiserID
        {
            get
            {
                return _advertiserID;
            }
            set
            {
                _advertiserID = value;
            }
        }

        public AdvertisementManagementBusinessLogics.AdvertiserMethod AdvertiserMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.AdvertiserMethod blTemp = new AdvertisementManagementBusinessLogics.AdvertiserMethod();
                return blTemp;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true)) == false)//False --> True For Encode
                AdvertiserID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true));
            if (!Page.IsPostBack)
                Initialize();
        }

        private void Initialize()
        {
            BindAdvertiserList();
            if (AdvertiserID > 0)
                FillEditControls(AdvertiserID);
        }

        private void BindAdvertiserList()
        {
            //int advertiserID = Utilities.ConverToNullableInt(SessionData.ActiveInstance.UserID);
            DataTable dtAdvertiser = AdvertiserMethod.GetAdvertiser().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    grdAdvertiser, dtAdvertiser
              );
        }

        private void FillEditControls(int advertiserID)
        {
            DataSet dtsAdvertiser = new DataSet();
            try
            {
                dtsAdvertiser = AdvertiserMethod.GetAdvertiserByID(advertiserID);
                DataRow dtrAdvertiser;
                if (dtsAdvertiser.Tables[0].Rows.Count > 0)
                {
                    dtrAdvertiser = dtsAdvertiser.Tables[0].Rows[0];
                    txtAdvertiserName.Text = Utilities.ConverToNullableString(dtrAdvertiser[tblAdvertiserTable.ADVERTISERNAME_FIELD]);
                    txtDescription.Text = Utilities.ConverToNullableString(dtrAdvertiser[tblAdvertiserTable.DESCRIPTION_FIELD]);
                    ddlUser.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrAdvertiser[tblAdvertiserTable.USERID_FIELD]);
                    chkEmailDailyReport.Checked = Utilities.ConverToBoolean(dtrAdvertiser[tblAdvertiserTable.EMAILDAILYREPORT_FIELD]);
                    chkEmailMonthlyReport.Checked = Utilities.ConverToBoolean(dtrAdvertiser[tblAdvertiserTable.EMAILMONTHLYREPORT_FIELD]);
                    chkEmailWeeklyReport.Checked = Utilities.ConverToBoolean(dtrAdvertiser[tblAdvertiserTable.EMAILWEEKLYREPORT_FIELD]);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true)) == false)
            {
                AdvertiserID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true));
                EditAdvertiser(AdvertiserID);
            }
            else
                InsertNewAdvertiser();
        }

        protected void InsertNewAdvertiser()
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                InsertResult = AdvertiserMethod.InsertNewAdvertiser(
                      Utilities.ConvertStringForDBForDDL(ddlUser.SelectedValue)
                    , Utilities.ConvertStringForDB(txtAdvertiserName.Text)
                    , Utilities.ConvertStringForDB(txtDescription.Text)
                    , Utilities.ConvertBooleanForDB(chkEmailDailyReport.Checked)
                    , Utilities.ConvertBooleanForDB(chkEmailWeeklyReport.Checked)
                    , Utilities.ConvertBooleanForDB(chkEmailMonthlyReport.Checked)
                    , out lstError);
                //if (InsertResult.HasValue)
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Ok;
                //    (this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding, (int)(Enumerations.enumValidationMessage.Insert));
                //}

                //else
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).ArPageMessages = lstError;
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
            BindAdvertiserList();
        }

        protected void EditAdvertiser(int advertiserID)
        {
            List<QLError> lstError = null;
            int? EditResult = null;
            try
            {
                EditResult = AdvertiserMethod.EditAdvertiser(
                      advertiserID
                    , Utilities.ConvertStringForDBForDDL(ddlUser.SelectedValue)
                    , Utilities.ConvertStringForDB(txtAdvertiserName.Text)
                    , Utilities.ConvertStringForDB(txtDescription.Text)
                    , Utilities.ConvertBooleanForDB(chkEmailDailyReport.Checked)
                    , Utilities.ConvertBooleanForDB(chkEmailWeeklyReport.Checked)
                    , Utilities.ConvertBooleanForDB(chkEmailMonthlyReport.Checked)
                    , out lstError);
                //if (EditResult.HasValue)
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Ok;
                //    (this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding, (int)(Enumerations.enumValidationMessage.Edit));
                //}
                //else
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).ArPageMessages = lstError;
                //}
            }
            catch (Exception ex)
            {

                throw ex;
            }
            BindAdvertiserList();
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            AdvertiserID = Utilities.ConverToNullableInt(e.CommandArgument);
            Utilities.ClearQueryString();
            Utilities.AddToQueryString(Resources.QueryString.AdvertiserID, AdvertiserID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString(Resources.Pages.Advertiser, Utilities.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            bool deleteAdvertiser = false;
            List<QLError> arError = new List<QLError>();
            try
            {
                AdvertiserID = Utilities.ConverToNullableInt(e.CommandArgument);
                deleteAdvertiser = AdvertiserMethod.DeleteAdvertiser(AdvertiserID, out arError);
                //if (deleteNews)
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Ok;
                //    (this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding, (int)(Enumerations.enumValidationMessage.Delete));
                //}
                //else
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).ArPageMessages = arError;
                //}
            }
            catch (System.Data.SqlClient.SqlException sqx)
            {
                //(this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Error;
                //(this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding,
                //    sqx.ErrorCode);

            }
            catch (Exception ex)
            {
                throw (ex);
            }
            BindAdvertiserList();
        }

        protected void grdAdvertiser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAdvertiser.PageIndex = e.NewPageIndex;
            BindAdvertiserList();
        }

        protected void grdAdvertiser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string AdvertiserName = "";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                AdvertiserName = e.Row.Cells[0].Text;
                ((LinkButton)e.Row.FindControl("lnkDelete")).OnClientClick =
                    "return confirm(' برای حذف" + "«" + AdvertiserName + "»" + " مطمئنید؟ ')";
            }
        }
    }
}