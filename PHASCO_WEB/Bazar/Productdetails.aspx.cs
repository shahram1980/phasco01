using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Threading;
using System.Globalization;
using DataAccessLayer.BIZ;
using Membership_Manage;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;
using Membership_Manage.BIZ;
using BusinessAccessLayer.BIZ;
namespace BiztBiz
{
    public partial class Productdetails : BasePage
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

        int _ProductID;
        public int ProductID
        {
            get
            {
                return _ProductID;
            }
            set
            {
                _ProductID = value;
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
        public DataTable dt_;
        Tbl_Products da = new Tbl_Products();
        TBL_User_Biz da_User = new TBL_User_Biz();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_Coding da_Coding = new TBL_Coding();
        TBL_Company_Profile da_Company_Profile = new TBL_Company_Profile();
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc ="";
            string keys = "";

            if (Request.QueryString["ProductID"] != null)
            {
                ProductID = PHASCOUtility.ConverToNullableInt(Request.QueryString["ProductID"]);
                Set_dataset_View();
                keys = keys + dt_.Rows[0]["Product_Keywords"].ToString() ;
                desc = desc + dt_.Rows[0]["Produc_Name"].ToString() + "," + dt_.Rows[0]["Description"].ToString();
            }
 
            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);
            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);
        }
        protected void Set_dataset_View()
        { dt_ = da.Tbl_Products_Tra(ProductID, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString(), "", "", DateTime.Now, DateTime.Now, 0, ""); }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ProductID"]))
                ProductID = PHASCOUtility.ConverToNullableInt(Request.QueryString["ProductID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = PHASCOUtility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Level"]))
                Level = PHASCOUtility.ConverToNullableInt(Request.QueryString["Level"]);

            if (!IsPostBack)
            {
                BindMap();
                Set_Product_Deteil();

                if (UserRole.CheckUserRole_ByProductId(ProductID) == 2) { img_golden.Visible = true; }
                else { img_golden.Visible = false; }
            }
        }

        void Set_Product_Deteil()
        {
            try
            {
                DataTable dt = da.Tbl_Products_Tra(ProductID, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString(), "", "", DateTime.Now, DateTime.Now, 0, "");

                if (dt.Rows.Count > 0)
                {
                    lblProductTitle.Text = dt.Rows[0]["Produc_Name"].ToString();
                    Label_Specialty_of_Product.Text = dt.Rows[0]["Specialty_Product"].ToString();
                    Label_Description.Text = dt.Rows[0]["Description"].ToString();

                    Label_Model_Number.Text = dt.Rows[0]["Model_Number"].ToString();
                    //Label_Product_Brand.Text = dt.Rows[0]["Product_Brand"].ToString();
                    //Label_Place_of_Origin.Text = dt.Rows[0]["Place_Origin"].ToString();

                    //Label_Supply_Ability.Text = dt.Rows[0]["Supply_Ability"].ToString();
                    //Label_Minimum_Order.Text = dt.Rows[0]["Minimum_Order"].ToString();
                    //Label_Delivery_Time.Text = dt.Rows[0]["Delivery_Time"].ToString();
                    //Label_Terms_of_Payment.Text = dt.Rows[0]["Terms_Payment"].ToString();
                    //Label_Packaging.Text = dt.Rows[0]["Packaging"].ToString();
                    if (!string.IsNullOrEmpty(dt.Rows[0]["Minimum_Order"].ToString()))
                    {
                        lbl_Minimum_Order.Text = " <li> حداقل سفارش : <span style='color:#02799b'>" + dt.Rows[0]["Minimum_Order"].ToString() + "</span></li>";
                    }

                    if (!string.IsNullOrEmpty(dt.Rows[0]["Price"].ToString()))
                    {
                        lbl_Minimum_Order.Text = " <li> قیمت : <span style='color:#02799b'>" + dt.Rows[0]["Price"].ToString() + "</span></li>";
                    }

                    if (!string.IsNullOrEmpty(dt.Rows[0]["ProductCountInPakage"].ToString()))
                    {
                        lbl_Minimum_Order.Text = " <li> تعداد در هر بسته : <span style='color:#02799b'>" + dt.Rows[0]["ProductCountInPakage"].ToString() + "</span></li>";
                    }

                    lblStartDate.Text = QLink.Helpers.DateHelper.GregorianToJalaali(dt.Rows[0]["StartDate"].ToString(), 1);
                    lblEndDate.Text = QLink.Helpers.DateHelper.GregorianToJalaali(dt.Rows[0]["EndDate"].ToString(), 1);


                    string Terms_Payment = dt.Rows[0]["Terms_Payment"].ToString();
                    DataTable dtTermsPayment = da_Coding.TBL_Coding_Tra(Terms_Payment, "select_byMultiID");
                    for (int i = 0; i < dtTermsPayment.Rows.Count; i++)
                    {
                        if (i != dtTermsPayment.Rows.Count - 1)
                            lblTerms_of_Payment.Text += dtTermsPayment.Rows[i]["CodingName"].ToString() + "، ";
                        else
                            lblTerms_of_Payment.Text += dtTermsPayment.Rows[i]["CodingName"].ToString();
                    }

                    string SendMode = dt.Rows[0]["SendMode"].ToString();
                    DataTable dtSendMode = da_Coding.TBL_Coding_Tra(SendMode, "select_byMultiID");
                    for (int i = 0; i < dtSendMode.Rows.Count; i++)
                    {
                        if (i != dtSendMode.Rows.Count - 1)
                            lblSendMode.Text += dtSendMode.Rows[i]["CodingName"].ToString() + "، ";
                        else
                            lblSendMode.Text += dtSendMode.Rows[i]["CodingName"].ToString();
                    }
                    //repTermsPayment.DataSource = dtTermsPayment;
                    //repTermsPayment.DataBind();

                    if (int.Parse(dt.Rows[0]["image"].ToString()) == 1)
                        Image_Product.Src = "/bazar/MyBiztBiz/Pupload/" + dt.Rows[0]["image_name"].ToString();
                    else
                        Image_Product.Src = "/bazar/MyBiztBiz/Pupload/None/NONE.jpg";
                    lnkProductImage.HRef = "/bazar/MyBiztBiz/Pupload/" + dt.Rows[0]["image_name"].ToString();

                    Bind_Relation_Product(PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Group_id"]), ProductID);
                    Bind_Other_Product(PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Uid_id"]), ProductID);

                    if (!string.IsNullOrEmpty(Request.QueryString["f"]))
                    {
                        if (Request.QueryString["f"].ToString() == "true")
                        {
                            Bind_FUll_Product_List(PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Uid_id"]), ProductID);
                            Panel_Otherproduct.Visible = true;
                        }
                        else Panel_Otherproduct.Visible = false;
                    }
                    else Panel_Otherproduct.Visible = false;


                    if (UserOnline.User_Online_Valid())
                    {
                        tdUserInfo.Visible = true;
                        tdNotUserInfo.Visible = false;
                        BindRequestUserDetails(PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Uid_id"]));
                    }
                    else
                    {
                        tdNotUserInfo.Visible = true;
                        tdUserInfo.Visible = false;
                        DataTable dtCompany = da_Company_Profile.TBL_Company_Profile_Tra("select_item", PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Uid_id"]));
                        if (dtCompany.Rows.Count > 0)
                        {
                            lnkRequestProfile.Text = dtCompany.Rows[0]["Company_Name"].ToString();
                            lnkRequestProfile.NavigateUrl = "~/bazar/Home.aspx?CompanyID=" + dtCompany.Rows[0]["id"].ToString() + "&Level=2&SearchSection=3";
                        }
                    }
                    Bind_Product_Gallery(ProductID);

                    //inquery_Link.HRef = "../inquiry.aspx?pid=" + dt.Rows[0]["id"].ToString();
                    lnkContents.HRef = "~/bazar/Contact.aspx?TypeID=1&ProductID=" + dt.Rows[0]["id"].ToString() + "&ReciverID=" + dt.Rows[0]["Uid_id"].ToString();
                }

            }
            catch (Exception) { }

        }

        public string GetProductImage(string image, string imagepath)
        {
            if (PHASCOUtility.ConverToNullableInt(image) == 1)
                return "~/bazar/MyBiztBiz/Pupload/sm_" + imagepath;
            else
                return "~/bazar/MyBiztBiz/Pupload/None/NONE.jpg";
        }

        public string GetProductHtmlImage(string image, string imagepath)
        {
            if (PHASCOUtility.ConverToNullableInt(image) == 1)
                return "/bazar/MyBiztBiz/Pupload/sm_" + imagepath;
            else
                return "/bazar/MyBiztBiz/Pupload/None/NONE.jpg";
        }

        public string GetShortenDesc(string desc)
        {
            if (desc.Length > 80)
                return desc.Substring(0, 80) + "...";
            else
                return desc;
        }

        protected void BindMap()
        {
            if (Level == 0)
            {
                //imglblSub2Cat.Visible = false;
                //imglblSubCat.Visible = false;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = false;
                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "select1ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["Subject_ir"].ToString();
                    lnkMainCat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["id"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["id"].ToString();
                }
            }

            else if (Level == 1)
            {
                //imglblSub2Cat.Visible = false;
                //imglblSubCat.Visible = true;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = true;
                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL2ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                    lnkMainCat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();
                }
            }
            else if (Level == 2)
            {
                //imglblSub2Cat.Visible = true;
                //imglblSubCat.Visible = true;
                lnkSub2Cat.Visible = true;
                lnkSubCat.Visible = true;

                DataTable dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL3ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                    lnkMainCat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();

                    lnkSub2Cat.Text = dtCategory.Rows[0]["Sub2Name"].ToString();
                    lnkSub2Cat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&SearchSection=" + SearchSection + "&Level=2&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "/" + dtCategory.Rows[0]["Sub2ID"].ToString();
                }
                else
                {
                    //imglblSub2Cat.Visible = false;
                    //imglblSubCat.Visible = true;
                    lnkSub2Cat.Visible = false;
                    lnkSubCat.Visible = true;
                    dtCategory = da_Categories.TBL_Categories_Tra(CategoryID, "selectL2ByCategoryID");
                    if (dtCategory.Rows.Count > 0)
                    {
                        lnkMainCat.Text = dtCategory.Rows[0]["MainName"].ToString();
                        lnkMainCat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                        lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                        lnkSubCat.NavigateUrl = "~/bazar/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();
                    }
                }
            }
            else
            {
                //imglblSub2Cat.Visible = false;
                //imglblSubCat.Visible = false;
                lnkSub2Cat.Visible = false;
                lnkSubCat.Visible = false;
            }
        }

        protected void BindRequestUserDetails(int id)
        {
            DataTable dtUser = da_User.TBL_User_Tra("selectById", id);
            if (dtUser.Rows.Count > 0)
            {
                lblRequestUserFullName.Text = dtUser.Rows[0]["FullName"].ToString();
                lblRequestTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                lblRequestEmail.Text = dtUser.Rows[0]["email"].ToString();

                DataTable dtState = da_State.T_state_Tra("select_byID", PHASCOUtility.ConverToNullableInt(dtUser.Rows[0]["Business_Location"]));
                lblRequestCity.Text = dtUser.Rows[0]["Business_Location"].ToString();
                if (dtState.Rows.Count > 0)
                {
                    lblRequestCity.Text = dtState.Rows[0]["Satate"].ToString();
                    int regionId_ = int.Parse(dtState.Rows[0]["region"].ToString());
                    lblRequestCity.Text += " / " + da_State.T_state_Tra("select_CitybyID", regionId_).Rows[0]["city"].ToString();

                }

                DataTable dtCompany = da_Company_Profile.TBL_Company_Profile_Tra("select_item", id);
                if (dtCompany.Rows.Count > 0)
                {
                    lnkRequestProfilesec.Text = dtCompany.Rows[0]["Company_Name"].ToString();
                    lnkRequestProfilesec.NavigateUrl = "~/bazar/Home.aspx?CompanyID=" + dtCompany.Rows[0]["id"].ToString() + "&Level=2&SearchSection=3";
                }
            }
        }

        protected void Bind_Product_Gallery(int ProductID)
        {
            DataTable dtPoductGallery = da.Tbl_Product_Gallery_Tra("Select_forProduct", ProductID);
            repProductgallery.DataSource = dtPoductGallery;
            repProductgallery.DataBind();
        }

        void Bind_Other_Product(int uid, int id)
        {
            DataTable dt;

            dt = da.Tbl_ProductsByUID("Select_other_count", uid, id);
            int rowcounts = int.Parse(dt.Rows[0]["rowcounts"].ToString());

            if (rowcounts > 5)
            {
                HyperLink_Allproducts.NavigateUrl = Request.Url.ToString()+"&f=true";
                HyperLink_Allproducts.Visible = true;
            }
            else HyperLink_Allproducts.Visible = false; ;

            dt = da.Tbl_ProductsByUID("Select_other_p5", uid, id);
            repOtherProduct.DataSource = dt;
            repOtherProduct.DataBind();


        }

        void Bind_FUll_Product_List(int uid, int id)
        {
            DataTable dt;
            dt = da.Tbl_ProductsByUID("Select_other_p", uid, id);
            Repeater_Other_Product_list.DataSource = dt;
            Repeater_Other_Product_list.DataBind();
        }

        void Bind_Relation_Product(int categoryID, int id)
        {
            DataTable dt = da.Tbl_ProductsByGroupID("selectbycatandnotid", categoryID, id);
            Repeater_Other_Product.DataSource = dt;
            Repeater_Other_Product.DataBind();
        }

        public string GetCategories(string categoryID)
        {
            string Category = string.Empty;
            DataTable dtCategory = da_Categories.TBL_Categories_Tra(PHASCOUtility.ConverToNullableInt(categoryID), "selectL3ByCategoryID");
            if (dtCategory.Rows.Count > 0)
            {
                Category += "<a href=\"../Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=2"
                        + "\">" + dtCategory.Rows[0]["MainName"].ToString() + "</a>"
                        + " / " + "<a href=\"../Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=2"
                        + "\">" + dtCategory.Rows[0]["SubName"].ToString() + "</a>"
                        + " / " + "<a href=\"../Category.aspx?CategoryID=" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "/" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&SearchSection=2"
                        + "\">" + dtCategory.Rows[0]["Sub2Name"].ToString() + "</a>";
            }
            else
            {
                dtCategory = da_Categories.TBL_Categories_Tra(PHASCOUtility.ConverToNullableInt(categoryID), "selectL2ByCategoryID");
                if (dtCategory.Rows.Count > 0)
                {
                    Category += "<a href=\"../Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=2"
                          + "\">" + dtCategory.Rows[0]["MainName"].ToString() + "</a>"
                          + " / " + "<a href=\"../Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=2"
                          + "\">" + dtCategory.Rows[0]["SubName"].ToString() + "</a>";
                }
            }

            return Category;
        }


    }
}
