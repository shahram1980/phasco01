using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLink.Web.Helpers;
using QLAdvertisementManagementValidation;

namespace AdvertisementManagement
{
    public partial class ads : System.Web.UI.Page
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

        string _targetUrl;
        public string TargetUrl
        {
            get
            {
                return _targetUrl;
            }
            set
            {
                _targetUrl = value;
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
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true)) == false)//False --> True For Encode
                BannerID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true)) == false)//False --> True For Encode
                AdvertiserID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true)) == false)//False --> True For Encode
                ZoneID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.ZoneID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.CampaignID, true)) == false)//False --> True For Encode
                CampaignID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.CampaignID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.TargetUrl, true)) == false)//False --> True For Encode
                TargetUrl = QueryStringHelper.GetQueryString(Resources.QueryString.TargetUrl, true);

            if (!Page.IsPostBack)
                Initialize();
        }

        private void Initialize()
        {
            InsertNewViewerReport();
        }

        protected void InsertNewViewerReport()
        {
            List<QLError> lstError = null;
            int? InsertResult = null;
            try
            {
                if (CampaignID > 0 && ZoneID > 0 && BannerID > 0 && Request.UrlReferrer != null)
                {
                    try
                    {
                        InsertResult = ViewerReportMethod.InsertNewViewerReport(
                                            Utilities.ConvertStringForDB(Request.UserHostAddress)
                                          , Utilities.ConvertStringForDB(Request.Browser.Platform)
                                          , Utilities.ConvertStringForDB(Request.Browser.Id)
                                          , DateTime.Now
                                          , Utilities.ConvertStringForDB(Request.UrlReferrer.AbsoluteUri)
                                          , CampaignID
                                          , ZoneID
                                          , BannerID
                                          , true
                                          , out lstError);
                    }
                    catch (Exception) { }

                    if (!string.IsNullOrEmpty(TargetUrl))
                        Response.Redirect(TargetUrl, true);
                    else
                        Response.Redirect(Request.UrlReferrer.AbsoluteUri, true);

                }
                else
                    Response.Redirect(Resources.Pages.Default, true);
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
    }
}