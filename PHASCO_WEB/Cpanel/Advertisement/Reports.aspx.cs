using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer.ADV;

namespace AdvertisementManagement.Admin
{
    public partial class Reports : BasePage
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
            BindReportList();
        }

        private void BindReportList()
        {
            int BannerID_ = Utilities.ConverToNullableInt(Request.QueryString["BannerId"]);
            tblViewerReport da = new tblViewerReport();
            Label_Click.Text = da.tblViewerReport_SP(5, 0, BannerID_).Rows[0]["click"].ToString();
            Label_Total.Text = da.tblViewerReport_SP(6, 0, BannerID_).Rows[0]["totalcount_"].ToString();
            DataTable dtReport = da.tblViewerReport_SP(4, 0, BannerID_);

          //  DataTable dtReport = ViewerReportMethod.GetViewserReport().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    grdReport, dtReport
              );
        }

        public string browersIcon(object browser_)
        {
            switch (browser_.ToString())
            {
                case "safari1plus":
                    return "";
                case "mozillafirefox":
                    return "";
                case "ie6to9":
                    return "";
                    

                default:
                    break;
            }


            return browser_.ToString();
        }
    }
}