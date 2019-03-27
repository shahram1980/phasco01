using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer.BIZ;
using Membership_Manage;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz
{
    public partial class Request : BasePage
    {
        int _PageView;
        public int PageView
        {
            get
            {
                return _PageView;
            }
            set
            {
                _PageView = value;
            }
        }

        int _RequestID;
        public int RequestID
        {
            get
            {
                return _RequestID;
            }
            set
            {
                _RequestID = value;
            }
        }

        int _StatusID;
        public int StatusID
        {
            get
            {
                return _StatusID;
            }
            set
            {
                _StatusID = value;
            }
        }

        int _CategoryID;
        public int CategoryID
        {
            get
            {
                return _CategoryID;
            }
            set
            {
                _CategoryID = value;
            }
        }

        int _Level;
        public int Level
        {
            get
            {
                return _Level;
            }
            set
            {
                _Level = value;
            }
        }

        int _SearchSection;
        public int SearchSection
        {
            get
            {
                return _SearchSection;
            }
            set
            {
                _SearchSection = value;
            }
        }


        TBL_Request da_request = new TBL_Request();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_User_Biz da_User = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["RequestID"]))
                RequestID = PHASCOUtility.ConverToNullableInt(Request.QueryString["RequestID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = PHASCOUtility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Level"]))
                Level = PHASCOUtility.ConverToNullableInt(Request.QueryString["Level"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            if (RequestID > 0)
            {
                BindMap();
                BindRequestsDetails(RequestID);
            }
        }

        protected void BindMap()
        {
            if (Level == 0)
            {
                imglblSub2Cat.Visible = false;
                imglblSubCat.Visible = false;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = false;
                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "select1ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["Subject_ir"].ToString();
                    lnkMainCat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["id"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["id"].ToString();
                }
            }

            else if (Level == 1)
            {
                imglblSub2Cat.Visible = false;
                imglblSubCat.Visible = true;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = true;
                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL2ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                    lnkMainCat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();
                }
            }
            else if (Level == 2)
            {
                imglblSub2Cat.Visible = true;
                imglblSubCat.Visible = true;
                lnkSub2Cat.Visible = true;
                lnkSubCat.Visible = true;

                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL3ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                    lnkMainCat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();

                    lnkSub2Cat.Text = dtCategory.Rows[0]["Sub2Name"].ToString();
                    lnkSub2Cat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&SearchSection=" + SearchSection + "&Level=2&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "/" + dtCategory.Rows[0]["Sub2ID"].ToString();
                }
                else
                {
                    imglblSub2Cat.Visible = false;
                    imglblSubCat.Visible = true;
                    lnkSub2Cat.Visible = false;
                    lnkSubCat.Visible = true;
                    dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL2ByCategoryID");
                    if (dtCategory.Rows.Count > 0)
                    {
                        lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                        lnkMainCat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                        lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                        lnkSubCat.NavigateUrl = "~/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();
                    }
                }
            }
            else
            {
                imglblSub2Cat.Visible = false;
                imglblSubCat.Visible = false;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = false;
            }
        }

        protected void BindRequestsDetails(int requestID)
        {
            DataTable dtRequest = da_request.TBL_Request_Tra(RequestID, "select_byid");
            repRequestsDetail.DataSource = dtRequest;
            repRequestsDetail.DataBind();
            if (dtRequest.Rows.Count > 0)
            {
                BindRelationRequest(PHASCOUtility.ConverToNullableInt(dtRequest.Rows[0]["Group_id"]), RequestID);
                BindOtherRequest(PHASCOUtility.ConverToNullableInt(dtRequest.Rows[0]["Uid_id"].ToString()), RequestID);
                lnkContents.HRef = "~/Bazar/Contact.aspx?TypeID=2&RequestID=" + dtRequest.Rows[0]["RequestID"].ToString() + "&ReciverID=" + dtRequest.Rows[0]["Uid_id"].ToString();

                if (UserOnline.User_Online_Valid())
                {
                    tdUserInfo.Visible = true;
                    tdNotUserInfo.Visible = false;
                    BindRequestUserDetails(PHASCOUtility.ConverToNullableInt(dtRequest.Rows[0]["Uid_id"]));
                }
                else
                {
                    tdUserInfo.Visible = false;
                    tdNotUserInfo.Visible = true;
                }
            }
        }

        public string GetShamsiDate(string date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date))
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 1);
            return sdate;
        }

        protected void BindRelationRequest(int categoryID, int requestID)
        {
            DataTable dtRelationRequest = da_request.TBL_RequestByGroups("selectbycatandnotid", categoryID, requestID);
            repRelationRequest.DataSource = dtRelationRequest;
            repRelationRequest.DataBind();
        }

        protected void BindRequestUserDetails(int id)
        {
            DataTable dtUser = da_User.TBL_User_Tra("selectById", id);
            if (dtUser.Rows.Count > 0)
            {
                lblRequestUserFullName.Text = dtUser.Rows[0]["FullName"].ToString();
                lblRequestTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                lblRequestEmail.Text = dtUser.Rows[0]["email"].ToString();
                lnkRequestProfilesec.Text = dtUser.Rows[0]["uid"].ToString(); 
                DataTable dtState = da_State.T_state_Tra("select_byID", PHASCOUtility.ConverToNullableInt(dtUser.Rows[0]["Business_Location"]));
                if (dtState.Rows.Count > 0)
                {
                    lblRequestCity.Text = dtState.Rows[0]["Satate"].ToString();
                }
            }
        }

        protected void BindOtherRequest(int uid, int requestID)
        {
            DataTable dtOtherRequest = da_request.TBL_RequestByUid("selectbyUidandnotid", uid, requestID);
            repOtherRequest.DataSource = dtOtherRequest;
            repOtherRequest.DataBind();
        }

        public string GetStateAndCity(string cityID)
        {
            string stateAndCity = string.Empty;
            try
            {
                DataTable dtState = da_State.T_state_Tra("selectParent_byID", PHASCOUtility.ConverToNullableInt(cityID));
                if (dtState.Rows.Count > 0)
                {
                    stateAndCity += dtState.Rows[0]["Satate"].ToString() + " / " + dtState.Rows[0]["CityName"].ToString();
                }
                return stateAndCity;
            }
            catch (Exception) { return stateAndCity; }
            return stateAndCity;
        }

        public string GetCategories(string categoryID)
        {
            string Category = string.Empty;
            DataTable dtCategory = da_Categories.TBL_Categories_Tra(PHASCOUtility.ConverToNullableInt(categoryID), "selectL3ByCategoryID");
            if (dtCategory.Rows.Count > 0)
            {
                Category += "<a href=\"/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=2"
                        + "\">" + dtCategory.Rows[0]["MainName"].ToString() + "</a>"
                        + " / " + "<a href=\"/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=2"
                        + "\">" + dtCategory.Rows[0]["SubName"].ToString() + "</a>"
                        + " / " + "<a href=\"/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "/" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&SearchSection=2"
                        + "\">" + dtCategory.Rows[0]["Sub2Name"].ToString() + "</a>";
            }
            else
            {
                dtCategory = da_Categories.TBL_Categories_Tra(PHASCOUtility.ConverToNullableInt(categoryID), "selectL2ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    Category += "<a href=\"/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=2"
                          + "\">" + dtCategory.Rows[0]["MainName"].ToString() + "</a>"
                          + " / " + "<a href=\"/Bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=2"
                          + "\">" + dtCategory.Rows[0]["SubName"].ToString() + "</a>";
                }
            }

            return Category;
        }
    }
}