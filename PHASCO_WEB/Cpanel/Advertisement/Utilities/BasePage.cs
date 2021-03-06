using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using QLink.Web.Helpers;
using QLCommon.AdvertisementManagement;


namespace AdvertisementManagement
{
    /// <summary>
    /// Summary description for QLinkPage2
    /// </summary>

    public class BasePage : System.Web.UI.Page
    {
        private string staticSiteFolder;
        public string StaticSiteFolder
        {
            get { staticSiteFolder = ResolveUrl("~") + "site/"; return staticSiteFolder; }
        }

        private string variantSiteFolder;
        public string VariantSiteFolder
        {
            get { variantSiteFolder = ResolveUrl("~") + "site/" + MultiLanguage.GetCurrentDirection().ToString() + "/"; return variantSiteFolder; }
        }

        private string imgSiteFolder;
        public string ImgSiteFolder
        {
            get
            {
                imgSiteFolder = ResolveUrl("~") + "site/images/";
                return imgSiteFolder;
            }
        }

        private string siteFolder;
        public string SiteFolder
        {
            get
            {
                siteFolder = ResolveUrl("~/");
                return siteFolder;
            }
        }

        private int actionID;
        public int ActionID
        {
            get { return actionID; }
            set { actionID = value; }
        }

        private int pageAction;
        public int PageAction
        {
            get
            {

                return pageAction;
            }
            set
            {
                pageAction = value;
            }
        }

        private int systemObjectID;

        public int SystemObjectID
        {
            get { return systemObjectID; }
            set { systemObjectID = value; }
        }

        private int memberID;
        public int MemberID
        {
            get { return memberID; }
            set { memberID = value; }
        }

        private int groupID;
        public int GroupID
        {
            get { return groupID; }
            set { groupID = value; }
        }

        private bool editPermission;

        public bool EditPermission
        {
            get { return editPermission; }
            set { editPermission = value; }
        }

        protected override void InitializeCulture()
        {
            MultiLanguage.SetdefaultThemeANDCulture(this);
        }

        private ArrayList arPageMessages;
        public ArrayList ArPageMessages
        {
            get { return arPageMessages; }
            set { arPageMessages = value; }
        }

    }

    /// <summary>
    /// Summary description for QLinkUserControl2
    /// </summary>

    public class BaseUserControl : UserControl
    {
        private string staticSiteFolder;
        public string StaticSiteFolder
        {
            get { staticSiteFolder = ResolveUrl("~") + "site/"; return staticSiteFolder; }
        }

        private string variantSiteFolder;
        public string VariantSiteFolder
        {
            get { variantSiteFolder = ResolveUrl("~") + "site/" + MultiLanguage.GetCurrentDirection().ToString() + "/"; return variantSiteFolder; }
        }

        private string pageSiteFolder;
        public string PageSiteFolder
        {
            get
            {
                pageSiteFolder = ResolveUrl("~"); return pageSiteFolder;
            }
        }

        private string imgSiteFolder;
        public string ImgSiteFolder
        {
            get
            {
                imgSiteFolder = ResolveUrl("~") + "site/images/";
                return imgSiteFolder;
            }
        }

        private string siteFolder;
        public string SiteFolder
        {
            get
            {
                siteFolder = ResolveUrl("~/");
                return siteFolder;
            }
        }

        private string myRahbinaSiteFolder;
        public string MyRahbinaSiteFolder
        {
            get
            {
                myRahbinaSiteFolder = ResolveUrl("~") + "phasco";
                return myRahbinaSiteFolder;
            }
        }
    }

    /// <summary>
    /// Summary description for QLinkMasterPage2
    /// </summary>

    public class BaseMasterPage : System.Web.UI.MasterPage
    {
        private string staticSiteFolder;
        public string StaticSiteFolder
        {
            get { staticSiteFolder = ResolveUrl("~") + "site/"; return staticSiteFolder; }
        }

        private string variantSiteFolder;
        public string VariantSiteFolder
        {
            get
            {
                variantSiteFolder = ResolveUrl("~") + "site/" +
                MultiLanguage.GetCurrentDirection().ToString() + "/"; return variantSiteFolder;
            }
        }

        private string imgSiteFolder;
        public string ImgSiteFolder
        {
            get
            {
                imgSiteFolder = ResolveUrl("~") + "site/images/";
                return imgSiteFolder;
            }
        }

        private string siteFolder;
        public string SiteFolder
        {
            get
            {
                siteFolder = ResolveUrl("~/");
                return siteFolder;
            }
        }

        private string pageSiteFolder;
        public string PageSiteFolder
        {
            get
            {
                pageSiteFolder = ResolveUrl("~"); return pageSiteFolder;
            }
        }

    }


}