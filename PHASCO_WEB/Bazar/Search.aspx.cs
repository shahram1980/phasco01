using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz
{
    public partial class Search : BasePage
    {
        #region Properties
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

        string _GroupID;
        public string GroupID
        {
            get
            {
                return _GroupID;
            }
            set
            {
                _GroupID = value;
            }
        }

        string _SearchWord;
        public string SearchWord
        {
            get
            {
                return _SearchWord;
            }
            set
            {
                _SearchWord = value;
            }
        }

        int _SearchType;//and or like ...
        public int SearchType
        {
            get
            {
                return _SearchType;
            }
            set
            {
                _SearchType = value;
            }
        }

        string _State;
        public string State
        {
            get
            {
                return _State;
            }
            set
            {
                _State = value;
            }
        }

        string _FromDate;
        public string FromDate
        {
            get
            {
                return _FromDate;
            }
            set
            {
                _FromDate = value;
            }
        }

        string _ToDate;
        public string ToDate
        {
            get
            {
                return _ToDate;
            }
            set
            {
                _ToDate = value;
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

        int _SearchResultCount;
        public int SearchResultCount
        {
            get
            {
                return _SearchResultCount;
            }
            set
            {
                _SearchResultCount = value;
            }
        }

        Tbl_Products da = new Tbl_Products();
        TBL_Coding coding = new TBL_Coding();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_SearchHistory da_Searchs = new TBL_SearchHistory();
        TBL_User_Biz da_User = new TBL_User_Biz();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = PHASCOUtility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchType"])) // 1 -> OR . 2 -> AND . 3 -> All
                SearchType = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchType"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["GroupID"]))
                GroupID = PHASCOUtility.ConverToNullableString(Request.QueryString["GroupID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchWord"]))
                SearchWord = PHASCOUtility.ConverToNullableString(Request.QueryString["SearchWord"]).Replace("ي","ی");

            if (!string.IsNullOrEmpty(Request.QueryString["State"]))
                State = PHASCOUtility.ConverToNullableString(Request.QueryString["State"]);

            if (!string.IsNullOrEmpty(Request.QueryString["FromDate"]))
                FromDate = PHASCOUtility.ConverToNullableString(Request.QueryString["FromDate"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ToDate"]))
                ToDate = PHASCOUtility.ConverToNullableString(Request.QueryString["ToDate"]);

            SearchResultCount = 0;

            if (!Page.IsPostBack)
                Initialize();

            Adertisment();
        }

        protected void Initialize()
        {
            ddlSearchSection.SelectedValue = SearchSection.ToString();
            //ddlSearchSection1.SelectedValue = SearchSection.ToString();
            tblProduct.Visible = false;
            tblRequest.Visible = false;
            tblCompany.Visible = false;

            switch (SearchSection)
            {
                case 1:
                    tblProduct.Visible = true;
                    BindProductList();
                    break;
                case 2:
                    tblRequest.Visible = true;
                    BindRequestList();
                    break;
                case 3:
                    tblCompany.Visible = true;
                    BindCompanyList();
                    break;
                default:
                    tblProduct.Visible = true;
                    tblRequest.Visible = true;
                    tblCompany.Visible = true;
                    BindProductList();
                    BindRequestList();
                    BindCompanyList();
                    break;
            }
        }

        protected void BindProductList()
        {
            try
            {
                string SearchTypeName = string.Empty;
                switch (SearchType)
                {
                    case 1:
                        SearchTypeName = " OR ";
                        break;
                    case 2:
                        SearchTypeName = " AND ";
                        break;
                    case 3:
                        SearchTypeName = " ";
                        break;
                }

                char[] splitter = { ' ' };
                if (SearchType == 3)
                {
                    splitter = new char[1] { '$' };
                }
                string conditon = string.Empty;

                if (!string.IsNullOrEmpty(SearchWord))
                {
                    string[] conditonItem = SearchWord.Trim().Replace("  ", " ").Split(splitter);
                    // For ProductName
                    conditon += "((";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Produc_Name like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Produc_Name like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    //For Product ProductKeywords
                    conditon += "(";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Product_Keywords like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Product_Keywords like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    //For Product Specialty_Product
                    conditon += "(";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Specialty_Product like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Specialty_Product like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    //For Product Place_Origin
                    conditon += "(";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Place_Origin like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Place_Origin like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    //For Product Product_Brand
                    conditon += "(";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Product_Brand like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Product_Brand like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    //For Product Model_Number
                    conditon += "(";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Model_Number like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Model_Number like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    //For Product Defined_Attributes
                    conditon += "(";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Defined_Attributes like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Defined_Attributes like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    //For Product Description
                    conditon += "(";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " Tbl_Products.Description like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " Tbl_Products.Description like  N'%" + conditonItem[conditonItem.Length - 1] + "%' )) ";
                }
                else
                    conditon += " ( 1 = 1 ) ";

                if (!string.IsNullOrEmpty(State))
                {
                    string state = State;
                    DataTable dtState = da_State.T_state_Tra("selectName_byParentID",PHASCOUtility.ConverToNullableInt(state));
                    if (dtState.Rows.Count > 1)
                    {
                        for (int i = 0; i < dtState.Rows.Count; i++)
                        {
                            state += "," + dtState.Rows[i]["StateID"].ToString();
                        }
                    }
                    conditon += " AND ( TBL_Company_Profile.City in (" + state + ") ) ";
                }
                else
                    conditon += " AND ( 1 = 1 ) ";


                if (!string.IsNullOrEmpty(FromDate) && !string.IsNullOrEmpty(ToDate))
                {
                    conditon += " AND ( Tbl_Products.Send_Date between N'" + FromDate + "' and N'" + ToDate + "' ) ";
                }
                else
                    conditon += " AND ( 1 = 1 )";

                DataTable dtProduct = da_Searchs.AdvanceSearch(conditon, 1, CategoryID);
                dtlProduct.DataSource = dtProduct;
                dtlProduct.DataBind();

                SearchResultCount += dtProduct.Rows.Count;
            }
            catch
            {
            }
        }

        protected void BindRequestList()
        {
            try
            {
                string SearchTypeName = string.Empty;
                switch (SearchType)
                {
                    case 1:
                        SearchTypeName = " OR ";
                        break;
                    case 2:
                        SearchTypeName = " AND ";
                        break;
                    case 3:
                        SearchTypeName = " ";
                        break;
                }

                char[] splitter = { ' ' };
                if (SearchType == 3)
                {
                    splitter = new char[1] { '$' };
                }
                string conditon = string.Empty;

                if (!string.IsNullOrEmpty(SearchWord))
                {
                    string[] conditonItem = SearchWord.Trim().Replace("  ", " ").Split(splitter);

                    // For ProductName
                    conditon += " (( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Request.ProductName like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Request.ProductName like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    // For Model
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Request.Model like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Request.Model like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    // For Model
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Request.DetailsAndFeatures like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Request.DetailsAndFeatures like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    // For Model
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Request.Description like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Request.Description like  N'%" + conditonItem[conditonItem.Length - 1] + "%' )) ";

                }
                else
                    conditon += " ( 1 = 1 ) ";

                if (!string.IsNullOrEmpty(State))
                {
                    string state = State;
                    DataTable dtState = da_State.T_state_Tra("selectName_byParentID",PHASCOUtility.ConverToNullableInt(state));
                    if (dtState.Rows.Count > 1)
                    {
                        for (int i = 0; i < dtState.Rows.Count; i++)
                        {
                            state += "," + dtState.Rows[i]["StateID"].ToString();
                        }
                    }
                    conditon += " AND ( TBL_Request.CityID in (" + state + ") ) ";
                }
                else
                    conditon += " AND ( 1 = 1 ) ";

                if (!string.IsNullOrEmpty(FromDate) && !string.IsNullOrEmpty(ToDate))
                {
                    conditon += " AND ( TBL_Request.RequestDate between N'" + FromDate + "' and N'" + ToDate + "' ) ";
                }
                else
                    conditon += " AND ( 1 = 1 ) ";


                DataTable dtRequest = da_Searchs.AdvanceSearch(conditon, 2, CategoryID);
                dtlRequest.DataSource = dtRequest;
                dtlRequest.DataBind();

                SearchResultCount += dtRequest.Rows.Count;
            }
            catch
            {
            }
        }

        protected void BindCompanyList()
        {
            try
            {
                string SearchTypeName = string.Empty;
                switch (SearchType)
                {
                    case 1:
                        SearchTypeName = " OR ";
                        break;
                    case 2:
                        SearchTypeName = " AND ";
                        break;
                    case 3:
                        SearchTypeName = " ";
                        break;
                }

                char[] splitter = { ' ' };
                string conditon = string.Empty;
                if (SearchType == 3)
                {
                    splitter = new char[1] { '$' };
                }
                if (!string.IsNullOrEmpty(SearchWord))
                {
                    string[] conditonItem = SearchWord.Trim().Replace("  ", " ").Split(splitter);

                    // For Company_Name
                    conditon += " (( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.Company_Name like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.Company_Name like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";

                    // For Company_Address
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.Company_Address like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.Company_Address like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";


                    // For BrandTypeOne
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.BrandTypeOne like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.BrandTypeOne like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";


                    // For BrandNameOne
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.BrandNameOne like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.BrandNameOne like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";


                    // For BrandTypeTwo
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.BrandTypeTwo like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.BrandTypeTwo like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";


                    // For BrandNameTwo
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.BrandNameTwo like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.BrandNameTwo like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";


                    // For BrandTypeThree
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.BrandTypeThree like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.BrandTypeThree like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) OR ";


                    // For BrandNameThree
                    conditon += " ( ";
                    for (int i = 0; i < conditonItem.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(conditonItem[i]))
                        {
                            conditon += " TBL_Company_Profile.BrandNameThree like  N'%" + conditonItem[i] + "%' " + SearchTypeName;
                        }
                    }
                    conditon += " TBL_Company_Profile.BrandNameThree like  N'%" + conditonItem[conditonItem.Length - 1] + "%' ) ) ";



                }
                else
                    conditon += " ( 1 = 1 ) ";

                if (!string.IsNullOrEmpty(State))
                {
                    string state = State;
                    DataTable dtState = da_State.T_state_Tra("selectName_byParentID",PHASCOUtility.ConverToNullableInt(state));
                    if (dtState.Rows.Count > 1)
                    {
                        for (int i = 0; i < dtState.Rows.Count; i++)
                        {
                            state += "," + dtState.Rows[i]["StateID"].ToString();
                        }
                    }
                    conditon += " AND ( TBL_Company_Profile.City in (" + state + ") ) ";
                }
                else
                    conditon += " AND ( 1 = 1 ) ";

                if (!string.IsNullOrEmpty(FromDate) && !string.IsNullOrEmpty(ToDate))
                {
                    conditon += " AND ( TBL_Company_Profile.date_Update between N'" + FromDate + "' and N'" + ToDate + "' ) ";
                }
                else
                    conditon += " AND ( 1 = 1 ) ";

                if (CategoryID > 0)
                {
                    conditon += " TBL_Company_Profile.Group_ID like  N'%" + CategoryID + "%'  ";
                }
                else
                    conditon += " AND ( 1 = 1 ) ";


                DataTable dtCompany = da_Searchs.AdvanceSearch(conditon, 3, CategoryID);
                dtlCompany.DataSource = dtCompany;
                dtlCompany.DataBind();

                SearchResultCount += dtCompany.Rows.Count;
            }
            catch
            {
            }

        }

        public string GetShamsiDate(string date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date))
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 1);
            return sdate;
        }

        protected void ddlSearchSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((sender as DropDownList).ID == "ddlSearchSection")
                SearchSection = PHASCOUtility.ConverToNullableInt(ddlSearchSection.SelectedValue);

            //if ((sender as DropDownList).ID == "ddlSearchSection1")
            //    SearchSection = PHASCOUtility.ConverToNullableInt(ddlSearchSection1.SelectedValue);

            Response.Redirect("~/bazar/Search.aspx?SearchSection=" + SearchSection + "&SearchType=" + SearchType + "&SearchWord=" + SearchWord +
               "&FromDate=" + FromDate + "&ToDate=" + ToDate + "&State=" + State, true);
        }

        public string GetUserName(string userID)
        {
            string UserFullName = string.Empty;
            DataTable dtUsers = da_User.TBL_User_Tra("selectFullNameById", PHASCOUtility.ConverToNullableInt(userID));
            if (dtUsers.Rows.Count > 0)
                UserFullName = dtUsers.Rows[0]["FullName"].ToString();

            return UserFullName;
        }

        public string GetProductImage(string image, string imagepath)
        {
            if (PHASCOUtility.ConverToNullableInt(image) == 1)
                return "~/Bazar/MyBiztBiz/Pupload/" + imagepath;
            else
                return "~/Bazar/MyBiztBiz/Pupload/None/NONE.jpg";
        }

        public string GetCompanyImage(string image)
        {
            if (image != "none.jpg")
                return "~\\Bazar\\MyBiztBiz\\Coupload\\" + image;
            else
                return "~\\Bazar\\MyBiztBiz\\Coupload\\None\\none.jpg";
        }

        public string GetUserRole(string UserRole, int mode)
        {
            if (mode == 1)
            {
                switch (UserRole)
                {
                    case "1":
                        return "";
                        break;
                    case "2":
                        return "<div style='margin: 4px; float: left; margin-left: 30px;'><img alt='' src='\\bazar\\images\\goldenuser.jpg' /></div>";
                        break;
                    default:
                        return "";
                }
            }


            if (mode == 2)
            {
                switch (UserRole)
                {
                    case "1":
                        return "";
                        break;
                    case "2":
                        return "<div style='margin: 4px; float: left; margin-left: 30px;'><img alt='' src='\\bazar\\images\\goldenuser_req.jpg' /></div>";
                        break;
                    default:
                        return "";
                }
            }

            if (mode == 3)
            {
                switch (UserRole)
                {
                    case "1":
                        return "";
                        break;
                    case "2":
                        return "<div style='margin: 4px; float: left; margin-left: 30px;'><img alt='' src='\\bazar\\images\\goldenuser_com.jpg' /></div>";
                        break;
                    default:
                        return "";
                }
            }

            return "";
        }
        // Adertisment
        protected void Adertisment()
        {
            //DataTable dtAdvertisement = new DataTable();
            //SqlDataReader rdr = null;

            //// SqlConnection conn = new SqlConnection("Password=1045;Persist Security Info=True;User ID=sa;Initial Catalog=Adertisement_DB;Data Source=SRV773\\SQLEXPRESS_08A");
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //conn.Open();
            //SqlCommand cmd = new SqlCommand("GetRandomAdvertisement", conn);
            //cmd.CommandType = CommandType.StoredProcedure;

            //cmd.Parameters.Add(new SqlParameter("@Count", 10));
            //cmd.Parameters.Add(new SqlParameter("@ZoneID", 17));
            //cmd.Parameters.Add(new SqlParameter("@DayOfWeek", 1));

            //rdr = cmd.ExecuteReader();

            //repAdvertisementImage.DataSource = rdr;
            //repAdvertisementImage.DataBind();
            //conn.Close();
        }

        public string GetBannerTargetURL(string targetUrl, string bannerID, string zoneID, string campaignID)
        {
            string url = string.Empty;
            Utilities.ClearQueryString();
            Utilities.AddToQueryString("CampaignID", campaignID);
            Utilities.AddToQueryString("ZoneID", zoneID);
            Utilities.AddToQueryString("BannerID", bannerID);
            Utilities.AddToQueryString("TargetUrl", targetUrl);
            url = ResolveUrl("~") + QLink.Web.Helpers.QueryStringHelper.SetQueryString("ads.aspx", Utilities.arQueryString, true);
            return url;
        }

        public string GetBannerURL(string bannerUrl)
        {
            return ResolveUrl("~") + "bazar/images/banner/" + bannerUrl;
        }
        // Adertisment
    }
}