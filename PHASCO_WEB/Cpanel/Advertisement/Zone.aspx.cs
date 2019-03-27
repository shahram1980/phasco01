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
    public partial class Zone : BasePage
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

        int _zoneID;
        public int ZoneID
        {
            get
            {
                return _zoneID;
            }
            set
            {
                _zoneID = value;
            }
        }

        public AdvertisementManagementBusinessLogics.ZoneMethod ZoneMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.ZoneMethod blTemp = new AdvertisementManagementBusinessLogics.ZoneMethod();
                return blTemp;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true)) == false)//False --> True For Encode
                ZoneID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true));
            if (!Page.IsPostBack)
                Initialize();
        }

        private void Initialize()
        {
            BindZoneList();
            if (ZoneID > 0)
                FillEditControls(ZoneID);
        }

        private void BindZoneList()
        {
            //int advertiserID = Utilities.ConverToNullableInt(SessionData.ActiveInstance.UserID);
            DataTable dtZone = ZoneMethod.GetZone().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    grdZone, dtZone
              );
        }

        private void FillEditControls(int zoneID)
        {
            DataSet dtsZone = new DataSet();
            try
            {
                dtsZone = ZoneMethod.GetZoneByID(zoneID);
                DataRow dtrZone;
                if (dtsZone.Tables[0].Rows.Count > 0)
                {
                    dtrZone = dtsZone.Tables[0].Rows[0];
                    txtZoneName.Text = Utilities.ConverToNullableString(dtrZone[tblZoneTable.ZONENAME_FIELD]);
                    txtDescription.Text = Utilities.ConverToNullableString(dtrZone[tblZoneTable.DESCRIPTION_FIELD]);
                    ddlZoneLocation.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrZone[tblZoneTable.ZONELOCATION_FIELD]);
                    ddlStatus.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrZone[tblZoneTable.STATUS_FIELD]);
                    txtBackgroundColor.Text = Utilities.ConverToNullableString(dtrZone[tblZoneTable.BACKGROUNDCOLOR_FIELD]);
                    txtHeight.Text = Utilities.ConverToNullableString(dtrZone[tblZoneTable.HEIGHT_FIELD]);
                    txtWidth.Text = Utilities.ConverToNullableString(dtrZone[tblZoneTable.WIDTH_FIELD]);
                    txtRefreshInterval.Text = Utilities.ConverToNullableString(dtrZone[tblZoneTable.REFRESHINTERVAL_FIELD]);
                    txtBannerCount.Text = Utilities.ConverToNullableString(dtrZone[tblZoneTable.BANNERCOUNT_FIELD]);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true)) == false)
            {
                ZoneID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true));
                EditZone(ZoneID);
            }
            else
                InsertNewZone();
        }

        protected void InsertNewZone()
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                InsertResult = ZoneMethod.InsertNewZone(
                      Utilities.ConvertStringForDB(txtZoneName.Text)
                    , Utilities.ConvertStringForDB(txtDescription.Text)
                    , Utilities.ConvertStringForDB(txtWidth.Text)
                    , Utilities.ConvertStringForDB(txtHeight.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlStatus.SelectedValue)
                    , Utilities.ConvertStringForDB(txtBackgroundColor.Text)
                    , Utilities.ConvertStringForDB(txtRefreshInterval.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlZoneLocation.SelectedValue)
                    , Utilities.ConvertIntForDB(txtBannerCount.Text)
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
            BindZoneList();
        }

        protected void EditZone(int zoneID)
        {
            List<QLError> lstError = null;
            int? EditResult = null;
            try
            {
                EditResult = ZoneMethod.EditZone(
                      zoneID
                    , Utilities.ConvertStringForDB(txtZoneName.Text)
                    , Utilities.ConvertStringForDB(txtDescription.Text)
                    , Utilities.ConvertStringForDB(txtWidth.Text)
                    , Utilities.ConvertStringForDB(txtHeight.Text)
                  , Utilities.ConvertStringForDBForDDL(ddlStatus.SelectedValue)
                    , Utilities.ConvertStringForDB(txtBackgroundColor.Text)
                    , Utilities.ConvertStringForDB(txtRefreshInterval.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlZoneLocation.SelectedValue)
                    , Utilities.ConvertIntForDB(txtBannerCount.Text)
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
            BindZoneList();
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            ZoneID = Utilities.ConverToNullableInt(e.CommandArgument);
            Utilities.ClearQueryString();
            Utilities.AddToQueryString(Resources.QueryString.ZoneID, ZoneID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString(Resources.Pages.Zone, Utilities.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            bool deleteZone = false;
            List<QLError> arError = new List<QLError>();
            try
            {
                ZoneID = Utilities.ConverToNullableInt(e.CommandArgument);
                deleteZone = ZoneMethod.DeleteZone(ZoneID, out arError);
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
            BindZoneList();
        }

        protected void grdZone_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdZone.PageIndex = e.NewPageIndex;
            BindZoneList();
        }

        protected void grdZone_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string ZoneName = "";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ZoneName = e.Row.Cells[0].Text;
                ((LinkButton)e.Row.FindControl("lnkDelete")).OnClientClick =
                    "return confirm(' برای حذف" + "«" + ZoneName + "»" + " مطمئنید؟ ')";
            }
        }
    }
}