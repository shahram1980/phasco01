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

using BiztBiz.Component;
using System.Threading;
using System.Globalization;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
namespace BiztBiz.C_p
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

        Tbl_Products da = new Tbl_Products();
        DataTable dt;
        TBL_User_Biz da_User = new TBL_User_Biz();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ProductID"]))
                ProductID = Utility.ConverToNullableInt(Request.QueryString["ProductID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = Utility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = Utility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Level"]))
                Level = Utility.ConverToNullableInt(Request.QueryString["Level"]);

            if (!IsPostBack)
            {
                BindMap();
                Set_Product_Deteil();
            }
        }

        void Set_Product_Deteil()
        {
            try
            {
                dt = da.Tbl_Products_Tra(ProductID, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString(), "", "", DateTime.Now, DateTime.Now, 0, "");

                if (dt.Rows.Count > 0)
                {
                    lblProductTitle.Text = dt.Rows[0]["Produc_Name"].ToString();
                    Label_Specialty_of_Product.Text = dt.Rows[0]["Specialty_Product"].ToString();
                    Label_Description.Text = dt.Rows[0]["Description"].ToString();

                    Label_Model_Number.Text = dt.Rows[0]["Model_Number"].ToString();
                    Label_Product_Brand.Text = dt.Rows[0]["Product_Brand"].ToString();
                    Label_Place_of_Origin.Text = dt.Rows[0]["Place_Origin"].ToString();

                    Label_Supply_Ability.Text = dt.Rows[0]["Supply_Ability"].ToString();
                    Label_Minimum_Order.Text = dt.Rows[0]["Minimum_Order"].ToString();
                    Label_Delivery_Time.Text = dt.Rows[0]["Delivery_Time"].ToString();
                    Label_Terms_of_Payment.Text = dt.Rows[0]["Terms_Payment"].ToString();
                    Label_Packaging.Text = dt.Rows[0]["Packaging"].ToString();


                    if (int.Parse(dt.Rows[0]["image"].ToString()) == 1)
                        Image_Product.ImageUrl = "~/MyBiztBiz/Pupload/sm_" + dt.Rows[0]["image_name"].ToString();
                    else
                        Image_Product.ImageUrl = "~/MyBiztBiz/Pupload/None/NONE.jpg";
                    Bind_Relation_Product(Utility.ConverToNullableInt(dt.Rows[0]["Group_id"]), ProductID);
                    Bind_Other_Product(Utility.ConverToNullableInt(dt.Rows[0]["Uid_id"]), ProductID);
                    BindRequestUserDetails(Utility.ConverToNullableInt(dt.Rows[0]["Uid_id"]));

                    //inquery_Link.HRef = "../inquiry.aspx?pid=" + dt.Rows[0]["id"].ToString();
                    lnkContents.HRef = "~/Contact.aspx?TypeID=2&CompanyID=" + dt.Rows[0]["Uid_id"].ToString() + "&ReciverID=" + dt.Rows[0]["Uid_id"].ToString();
                }

            }
            catch (Exception) { }

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
                    lnkMainCat.NavigateUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["id"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["id"].ToString();
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
                    lnkMainCat.NavigateUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();
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
                    lnkMainCat.NavigateUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["MainID"].ToString() + "&SearchSection=" + SearchSection + "&Level=0&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString();

                    lnkSubCat.Text = dtCategory.Rows[0]["SubName"].ToString();
                    lnkSubCat.NavigateUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["SubID"].ToString() + "&SearchSection=" + SearchSection + "&Level=1&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString();

                    lnkSub2Cat.Text = dtCategory.Rows[0]["Sub2Name"].ToString();
                    lnkSub2Cat.NavigateUrl = "~/Category.aspx?CategoryID=" + dtCategory.Rows[0]["Sub2ID"].ToString() + "&SearchSection=" + SearchSection + "&Level=2&ValuePath=" + dtCategory.Rows[0]["MainID"].ToString() + "/" + dtCategory.Rows[0]["SubID"].ToString() + "/" + dtCategory.Rows[0]["Sub2ID"].ToString();
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

        protected void BindRequestUserDetails(int id)
        {
            DataTable dtUser = da_User.TBL_User_Tra("selectById", id);
            if (dtUser.Rows.Count > 0)
            {
                lblRequestUserFullName.Text = dtUser.Rows[0]["FullName"].ToString();
                lblRequestTel.Text = dtUser.Rows[0]["Tel_A_Number"].ToString();
                lblRequestEmail.Text = dtUser.Rows[0]["Uid"].ToString();

                DataTable dtState = da_State.TBL_State_Tra(Utility.ConverToNullableInt(dtUser.Rows[0]["Business_Location"]), "select_byID");
                if (dtState.Rows.Count > 0)
                {
                    lblRequestCity.Text = dtState.Rows[0]["StateName"].ToString();
                }
            }
        }

        void Bind_Other_Product(int uid, int id)
        {
            dt = da.Tbl_ProductsByUID("Select_other_p", uid, id);
            repOtherProduct.DataSource = dt;
            repOtherProduct.DataBind();
        }


        void Bind_Relation_Product(int categoryID, int id)
        {
            dt = da.Tbl_ProductsByGroupID("selectbycatandnotid", categoryID, id);
            Repeater_Other_Product.DataSource = dt;
            Repeater_Other_Product.DataBind();
        }


    }
}
