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
    public partial class Campaign : BasePage
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

        int _bannerID;
        public int BannerID
        {
            get
            {
                return _bannerID;
            }
            set
            {
                _bannerID = value;
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

        int _campaignID;
        public int CampaignID
        {
            get
            {
                return _campaignID;
            }
            set
            {
                _campaignID = value;
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

        public AdvertisementManagementBusinessLogics.DaysofWeeksMethod DaysofWeeksMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.DaysofWeeksMethod blTemp = new AdvertisementManagementBusinessLogics.DaysofWeeksMethod();
                return blTemp;
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

        public AdvertisementManagementBusinessLogics.BannerMethod BannerMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.BannerMethod blTemp = new AdvertisementManagementBusinessLogics.BannerMethod();
                return blTemp;
            }
        }

        public AdvertisementManagementBusinessLogics.CampaignMethod CampaignMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.CampaignMethod blTemp = new AdvertisementManagementBusinessLogics.CampaignMethod();
                return blTemp;
            }
        }

        public AdvertisementManagementBusinessLogics.CampaignDayOfWeekMethod CampaignDayOfWeekMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.CampaignDayOfWeekMethod blTemp = new AdvertisementManagementBusinessLogics.CampaignDayOfWeekMethod();
                return blTemp;
            }
        }

        public AdvertisementManagementBusinessLogics.BannerCampaignsMethod BannerCampaignsMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.BannerCampaignsMethod blTemp = new AdvertisementManagementBusinessLogics.BannerCampaignsMethod();
                return blTemp;
            }
        }

        public AdvertisementManagementBusinessLogics.CampaignZonesMethod CampaignZonesMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.CampaignZonesMethod blTemp = new AdvertisementManagementBusinessLogics.CampaignZonesMethod();
                return blTemp;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true)) == false)//False --> True For Encode
                BannerID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true)) == false)//False --> True For Encode
                AdvertiserID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true)) == false)//False --> True For Encode
                ZoneID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.CampaignID, true)) == false)//False --> True For Encode
                CampaignID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.CampaignID, true));

            if (!Page.IsPostBack)
                Initialize();
        }

        private void Initialize()
        {
            BindCampaignList();
            BindAdvertiserList();
            BindZoneList();
            BindDayOfWeekList();
            if (CampaignID > 0)
                FillEditControls(CampaignID);
        }

        private void BindZoneList()
        {
            DataTable dtZone = ZoneMethod.GetZone().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    grdZoneList, dtZone
              );
        }

        private void BindBannerList(int advertiserID)
        {
            DataTable dtBanner = BannerMethod.GetBannerByAdvertiser(advertiserID).Tables[0];

            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    grdBannerList, dtBanner
              );
        }

        private void BindCampaignList()
        {
            //int campaignID = Utilities.ConverToNullableInt(SessionData.ActiveInstance.UserID);
            DataTable dtCampaign = CampaignMethod.GetCampaign().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    grdCampaign, dtCampaign
              );
        }

        private void BindAdvertiserList()
        {
            DataTable dtAdvertiser = AdvertiserMethod.GetAdvertiser().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    ddlAdvertiser, dtAdvertiser, tblAdvertiserTable.ADVERTISERID_FIELD, tblAdvertiserTable.ADVERTISERNAME_FIELD, "انتخاب کنید"
              );
        }

        private void BindDayOfWeekList()
        {
            DataTable dtDayOfWeek = DaysofWeeksMethod.GetDaysofWeeks().Tables[0];

            chkListDaysOfWeek.DataValueField = tblDaysofWeeksTable.DAYSOFWEEKSID_FIELD;
            chkListDaysOfWeek.DataTextField = tblDaysofWeeksTable.DAYSOFWEEKNAME_FIELD;
            chkListDaysOfWeek.DataSource = dtDayOfWeek;
            chkListDaysOfWeek.DataBind();
        }

        private void FillEditControls(int campaignID)
        {
            DataSet dtsCampaign = new DataSet();
            try
            {
                dtsCampaign = CampaignMethod.GetCampaignByID(campaignID);
                DataRow dtrCampaign;
                if (dtsCampaign.Tables[0].Rows.Count > 0)
                {
                    dtrCampaign = dtsCampaign.Tables[0].Rows[0];
                    txtCampaignName.Text = Utilities.ConverToNullableString(dtrCampaign[tblCampaignTable.CAMPAIGNNAME_FIELD]);
                    txtCampaignClick.Text = Utilities.ConverToNullableString(dtrCampaign[tblCampaignTable.CAMPAIGNCLICK_FIELD]);
                    ddlAdvertiser.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrCampaign[tblCampaignTable.ADVERTISERID_FIELD]);
                    txtCampaignVisit.Text = Utilities.ConverToNullableString(dtrCampaign[tblCampaignTable.CAMPAIGNVISIT_FIELD]);
                    txtCreditForDay.Text = Utilities.ConverToNullableString(dtrCampaign[tblCampaignTable.CREDITFORDAY_FIELD]);
                    txtDailyEndTime.Text = Utilities.ConverToNullableString(dtrCampaign[tblCampaignTable.DAILYENDTIME_FIELD]);
                    txtDailyStartTime.Text = Utilities.ConverToNullableString(dtrCampaign[tblCampaignTable.DAILYSTARTTIME_FIELD]);
                    txtNotes.Text = Utilities.ConverToNullableString(dtrCampaign[tblCampaignTable.NOTES_FIELD]);
                    jqEndDate.Date = Utilities.ConverToNullableDateTime(dtrCampaign[tblCampaignTable.ENDDATE_FIELD]);
                    jqStartDate.Date = Utilities.ConverToNullableDateTime(dtrCampaign[tblCampaignTable.STARTDATE_FIELD]);
                    rdbCampaignType.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrCampaign[tblCampaignTable.CAMPAIGNTYPE_FIELD]);

                    BindBannerList(Utilities.ConverToNullableInt(dtrCampaign[tblCampaignTable.ADVERTISERID_FIELD]));

                    FillEditBannerCampaigns(campaignID);
                    FillEditCampaignDayOfWeek(campaignID);
                    FillEditCampaignZones(campaignID);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void FillEditCampaignDayOfWeek(int campaignID)
        {
            DataTable dtCampaignDayOfWeek = CampaignDayOfWeekMethod.GetCampaignDayOfWeekByCampaignID(campaignID).Tables[0];
            for (int i = 0; i < dtCampaignDayOfWeek.Rows.Count; i++)
            {
                for (int j = 0; j < chkListDaysOfWeek.Items.Count; j++)
                {
                    if (dtCampaignDayOfWeek.Rows[i][tblCampaignDayOfWeekTable.DAYOFWEEKID_FIELD].ToString() == chkListDaysOfWeek.Items[j].Value)
                        chkListDaysOfWeek.Items[j].Selected = true;
                }
            }
        }

        private void FillEditBannerCampaigns(int campaignID)
        {
            DataTable dtBannerCampaigns = BannerCampaignsMethod.GetBannerCampaignsByCampaignsID(campaignID).Tables[0];
            for (int i = 0; i < dtBannerCampaigns.Rows.Count; i++)
            {
                for (int j = 0; j < grdBannerList.Rows.Count; j++)
                {
                    if (dtBannerCampaigns.Rows[i][tblBannerCampaignsTable.BANNERID_FIELD].ToString() == grdBannerList.Rows[j].Cells[0].Text)
                        (grdBannerList.Rows[j].FindControl("chkSelectBanner") as CheckBox).Checked = true;
                }
            }
        }

        private void FillEditCampaignZones(int campaignID)
        {
            DataTable dtCampaignZones = CampaignZonesMethod.GetCampaignZonesByCampaignID(campaignID).Tables[0];
            for (int i = 0; i < dtCampaignZones.Rows.Count; i++)
            {
                for (int j = 0; j < grdZoneList.Rows.Count; j++)
                {
                    if (dtCampaignZones.Rows[i][tblCampaignZonesTable.ZONEID_FIELD].ToString() == grdZoneList.Rows[j].Cells[0].Text)
                        (grdZoneList.Rows[j].FindControl("chkSelectZone") as CheckBox).Checked = true;
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.CampaignID, true)) == false)
            {
                CampaignID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.CampaignID, true));
                EditCampaign(CampaignID);
            }
            else
                InsertNewCampaign();
        }

        protected void InsertNewCampaign()
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                 
                InsertResult = CampaignMethod.InsertNewCampaign(
                      Utilities.ConvertStringForDBForDDL(ddlAdvertiser.SelectedValue)
                    , Utilities.ConvertStringForDB(txtCampaignName.Text)
                    , Utilities.ConvertStringForDB(txtNotes.Text)
                    , Utilities.ConvertDateTimeForDB(jqStartDate.Date)
                    , Utilities.ConvertDateTimeForDB(jqEndDate.Date)
                    , Utilities.ConvertStringForDB(txtDailyStartTime.Text)
                    , Utilities.ConvertStringForDB(txtDailyEndTime.Text)
                    , Utilities.ConvertStringForDBForDDL(rdbCampaignType.SelectedValue)
                    , 0
                    , Utilities.ConvertStringForDB(txtCreditForDay.Text)
                    , Utilities.ConvertStringForDB(txtCampaignVisit.Text)
                    , Utilities.ConvertStringForDB(txtCampaignClick.Text)
                    , DBNull.Value
                    , out lstError);

                InsertNewCampaignDayOfWeek(InsertResult.Value);
                InsertNewCampaignZones(InsertResult.Value);
                InsertNewBannerCampaigns(InsertResult.Value);
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
            BindCampaignList();
        }

        protected void InsertNewCampaignDayOfWeek(int campaignID)
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                for (int i = 0; i < chkListDaysOfWeek.Items.Count; i++)
                {
                    if (chkListDaysOfWeek.Items[i].Selected == true)
                    {
                        InsertResult = CampaignDayOfWeekMethod.InsertNewCampaignDayOfWeek(
                              campaignID
                            , Utilities.ConvertStringForDBForDDL(chkListDaysOfWeek.Items[i].Value)
                            , out lstError);
                    }
                }
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
        }

        protected void InsertNewCampaignZones(int campaignID)
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                for (int i = 0; i < grdZoneList.Rows.Count; i++)
                {
                    if ((grdZoneList.Rows[i].FindControl("chkSelectZone") as CheckBox).Checked == true)
                    {
                        InsertResult = CampaignZonesMethod.InsertNewCampaignZones(
                              campaignID
                            , Utilities.ConvertIntForDB(grdZoneList.Rows[i].Cells[0].Text)
                            , 0
                            , 0
                            , out lstError);
                    }
                }
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
        }

        protected void InsertNewBannerCampaigns(int campaignID)
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                for (int i = 0; i < grdBannerList.Rows.Count; i++)
                {
                    if ((grdBannerList.Rows[i].FindControl("chkSelectBanner") as CheckBox).Checked == true)
                    {
                        InsertResult = BannerCampaignsMethod.InsertNewBannerCampaigns(
                             Utilities.ConvertIntForDB(grdBannerList.Rows[i].Cells[0].Text)
                            , campaignID
                            , out lstError);
                    }
                }
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
        }

        protected void EditCampaign(int campaignID)
        {
            List<QLError> lstError = null;
            int? EditResult = null;
            //try
            //{
                EditResult = CampaignMethod.EditCampaign(
                      campaignID
                    , Utilities.ConvertStringForDBForDDL(ddlAdvertiser.SelectedValue)
                    , Utilities.ConvertStringForDB(txtCampaignName.Text)
                    , Utilities.ConvertStringForDB(txtNotes.Text)
                    , Utilities.ConvertDateTimeForDB(jqStartDate.Date)
                    , Utilities.ConvertDateTimeForDB(jqEndDate.Date)
                    , Utilities.ConvertStringForDB(txtDailyStartTime.Text)
                    , Utilities.ConvertStringForDB(txtDailyEndTime.Text)
                    , Utilities.ConvertStringForDBForDDL(rdbCampaignType.SelectedValue)
                    , 0
                    , Utilities.ConvertStringForDB(txtCreditForDay.Text)
                    , Utilities.ConvertStringForDB(txtCampaignVisit.Text)
                    , Utilities.ConvertStringForDB(txtCampaignClick.Text)
                    , DBNull.Value
                    , out lstError);

                EditCampaignDayOfWeek(campaignID);
                EditCampaignZones(campaignID);
                EditBannerCampaigns(campaignID);
                //if (EditResult.HasValue)
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Ok;
                //    (this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding, (int)(Enumerations.enumValidationMessage.Edit));
                //}
                //else
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).ArPageMessages = lstError;
                //}
            //}
            //catch (Exception ex)
            //{

            //    throw ex;
            //}
            BindCampaignList();
        }

        protected void EditCampaignDayOfWeek(int campaignID)
        {
            List<QLError> lstError = null;
            int? EditResult = null;
            try
            {
                CampaignDayOfWeekMethod.DeleteCampaignDayOfWeekByCampaignID(campaignID);

                for (int i = 0; i < chkListDaysOfWeek.Items.Count; i++)
                {
                    if (chkListDaysOfWeek.Items[i].Selected == true)
                    {
                        EditResult = CampaignDayOfWeekMethod.InsertNewCampaignDayOfWeek(
                              campaignID
                            , Utilities.ConvertStringForDBForDDL(chkListDaysOfWeek.Items[i].Value)
                            , out lstError);
                    }
                }
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
        }

        protected void EditCampaignZones(int campaignID)
        {
            List<QLError> lstError = null;
            int? EditResult = null;
            try
            {
                CampaignZonesMethod.DeleteCampaignZonesByCampaignID(campaignID);

                for (int i = 0; i < grdZoneList.Rows.Count; i++)
                {
                    if ((grdZoneList.Rows[i].FindControl("chkSelectZone") as CheckBox).Checked == true)
                    {
                        EditResult = CampaignZonesMethod.InsertNewCampaignZones(
                              campaignID
                            , Utilities.ConvertIntForDB(grdZoneList.Rows[i].Cells[0].Text)
                            , 0
                            , 0
                            , out lstError);
                    }
                }
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
        }

        protected void EditBannerCampaigns(int campaignID)
        {
            List<QLError> lstError = null;
            int? EditResult = null;
            try
            {
                BannerCampaignsMethod.DeleteBannerCampaignsByCampaignID(campaignID);

                for (int i = 0; i < grdBannerList.Rows.Count; i++)
                {
                    if ((grdBannerList.Rows[i].FindControl("chkSelectBanner") as CheckBox).Checked == true)
                    {
                        EditResult = BannerCampaignsMethod.InsertNewBannerCampaigns(
                              Utilities.ConvertIntForDB(grdBannerList.Rows[i].Cells[0].Text)
                            , campaignID
                            , out lstError);
                    }
                }
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
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            CampaignID = Utilities.ConverToNullableInt(e.CommandArgument);
            Utilities.ClearQueryString();
            Utilities.AddToQueryString(Resources.QueryString.CampaignID, CampaignID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString(Resources.Pages.Campaign, Utilities.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            bool deleteCampaigns = false;
            List<QLError> arError = new List<QLError>();
            try
            {
                CampaignID = Utilities.ConverToNullableInt(e.CommandArgument);
                BannerCampaignsMethod.DeleteBannerCampaignsByCampaignID(CampaignID);
                CampaignDayOfWeekMethod.DeleteCampaignDayOfWeekByCampaignID(CampaignID);
                CampaignZonesMethod.DeleteCampaignZonesByCampaignID(CampaignID);
                deleteCampaigns = CampaignMethod.DeleteCampaign(CampaignID, out arError);

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
            BindCampaignList();
        }

        protected void grdCampaign_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCampaign.PageIndex = e.NewPageIndex;
            BindCampaignList();
        }

        protected void grdCampaign_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string CampaignName = "";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CampaignName = e.Row.Cells[0].Text;
                ((LinkButton)e.Row.FindControl("lnkDelete")).OnClientClick =
                    "return confirm(' برای حذف" + "«" + CampaignName + "»" + " مطمئنید؟ ')";
            }
        }

        protected void ddlAdvertiser_SelectedIndexChanged(object send, EventArgs e)
        {
            AdvertiserID = Utilities.ConverToNullableInt(ddlAdvertiser.SelectedValue);
            BindBannerList(AdvertiserID);
        }
    }
}