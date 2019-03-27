using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QLCommon.AdvertisementManagement.Data;
using QLAdvertisementManagementValidation;

namespace AdvertisementManagement.UC
{
    public partial class uscAdvertisement : BaseUserControl
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

        int _bannerCount;
        public int BannerCount
        {
            get
            {
                return _bannerCount;
            }
            set
            {
                _bannerCount = value;
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

        public AdvertisementManagementBusinessLogics.CampaignMethod CampaignMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.CampaignMethod blTemp = new AdvertisementManagementBusinessLogics.CampaignMethod();
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

        public AdvertisementManagementBusinessLogics.ViewerReportMethod ViewerReportMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.ViewerReportMethod blTemp = new AdvertisementManagementBusinessLogics.ViewerReportMethod();
                return blTemp;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Initialize();
        }

        private void Initialize()
        {
            BindAdvertisementList();
        }

        protected void BindAdvertisementList()
        {
            DataTable dtZone = ZoneMethod.GetZoneByID(ZoneID).Tables[0];
            if (dtZone.Rows.Count > 0)
            {
                BannerCount = Utilities.ConverToNullableInt(dtZone.Rows[0][tblZoneTable.BANNERCOUNT_FIELD]);

                DataTable dtAdvertisement = CampaignMethod.GetRandomAdvertisement(BannerCount, ZoneID, 1);// (int)DateTime.Now.DayOfWeek);

                if (dtAdvertisement.Rows.Count > 0)
                {
                    //pnlZone.Width = Utilities.ConverToNullableString(dtAdvertisement.Rows[0]["ZoneWidth"]) + "px";
                    //pnlZone.Height = Utilities.ConverToNullableString(dtAdvertisement.Rows[0]["ZoneHeight"]) + "px";

                    switch (Utilities.ConverToNullableInt(dtAdvertisement.Rows[0][tblBannerTable.BANNERTYPE_FIELD]))
                    {
                        case (int)Enumerations.BannerType.Image:
                            repAdvertisementImage.DataSource = dtAdvertisement;
                            repAdvertisementImage.DataBind();
                            break;
                        case (int)Enumerations.BannerType.TextLink:
                            repAdvertisementText.DataSource = dtAdvertisement;
                            repAdvertisementText.DataBind();
                            break;
                        case (int)Enumerations.BannerType.Flash:
                            repAdvertisementFlash.DataSource = dtAdvertisement;
                            repAdvertisementFlash.DataBind();
                            break;
                    }
                    try
                    {
                        for (int i = 0; i < dtAdvertisement.Rows.Count; i++)
                        {
                            InsertNewViewerReport(Utilities.ConverToNullableInt(dtAdvertisement.Rows[i][tblCampaignTable.CAMPAIGNID_FIELD]),
                                Utilities.ConverToNullableInt(dtAdvertisement.Rows[i][tblZoneTable.ZONEID_FIELD]),
                                Utilities.ConverToNullableInt(dtAdvertisement.Rows[i][tblBannerTable.BANNERID_FIELD]));
                        }
                    }
                    catch (Exception)
                    { }
                }
            }
        }

        protected void InsertNewViewerReport(int campaignID, int zoneID, int bannerID)
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                InsertResult = ViewerReportMethod.InsertNewViewerReport(
                      Utilities.ConvertStringForDB(Request.UserHostAddress)
                    , Utilities.ConvertStringForDB(Request.Browser.Platform)
                    , Utilities.ConvertStringForDB(Request.Browser.Id)
                    , DateTime.Now
                    , Utilities.ConvertStringForDB(Request.Url.AbsoluteUri)
                    , campaignID
                    , zoneID
                    , bannerID
                    , DBNull.Value
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
        }

        public string GetBannerURL(string bannerUrl)
        {
            return ResolveUrl("~") + "phascoupfile/Adv/" + bannerUrl;
        }

        public string GetBannerTargetURL(string targetUrl, string bannerID, string zoneID, string campaignID)
        {
            string url = string.Empty;
            Utilities.ClearQueryString();
            Utilities.AddToQueryString(Resources.QueryString.CampaignID, campaignID);
            Utilities.AddToQueryString(Resources.QueryString.ZoneID, zoneID);
            Utilities.AddToQueryString(Resources.QueryString.BannerID, bannerID);
            Utilities.AddToQueryString(Resources.QueryString.TargetUrl, targetUrl);
            url = ResolveUrl("~") + QLink.Web.Helpers.QueryStringHelper.SetQueryString(Resources.Pages.Avdertisement, Utilities.arQueryString, true);
            return url;
        }
    }
}