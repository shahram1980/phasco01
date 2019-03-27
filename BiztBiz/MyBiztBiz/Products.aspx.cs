using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.Component;
using System.Data;

using Membership_Manage;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;

namespace BiztBiz.MyBiztBiz
{
    public partial class Products : BasePage
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

        Tbl_Products da = new Tbl_Products();
        TBL_Coding coding = new TBL_Coding();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("PageView", true)))
                PageView = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("PageView", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true)))
                StatusID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true));

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            //lnkNewProducts.Text = "محصول جدید";
            CheckCompanyComplate();
            coding.BindSendModeCheckBoxList(CheckBoxList_SendMode);
            coding.BindPaymentTypeCheckBoxList(CheckBoxList_Terms_Payment);

            CheckButtonVisible();

            BindExpireSchedule();

            muvProducts.ActiveViewIndex = PageView;
            switch (PageView)
            {
                case 0://for list
                    BindProducts(StatusID);
                    break;

                case 1://for detail
                    FillEditControls(ProductID);
                    break;
            }
        }

        protected void CheckCompanyComplate()
        {
            Users.CompanyProfileStatus status = Users.GetUserCompanyProfileStatus();
            switch (status)
            {
                case Users.CompanyProfileStatus.NotSend:
                case Users.CompanyProfileStatus.SendNotComplate:
                    Response.Redirect("company_profile.aspx?CompanyProfileNotComplate=1", true);
                    break;
                case Users.CompanyProfileStatus.SendAndComplate:
                    break;
            }
        }

        protected void CheckButtonVisible()
        {
            if (Users.UserValid())
            {
                DataTable dtCountProduct = da.Tbl_Products_Tra("select_validbyuserid", UserOnline.id(), UserOnline.UsersRoleID());
        
                if (dtCountProduct.Rows.Count > 0)
                {
                    if (dtCountProduct.Rows[0][0].ToString() == "1")
                        ImageButton_Insert.Visible = true;
                    else
                        ImageButton_Insert.Visible = false;
                }
                else
                    ImageButton_Insert.Visible = false;
            }
            else
                ImageButton_Insert.Visible = false;

        }

        protected void BindExpireSchedule()
        {
            if (Users.UserValid())
            {
                if (UserOnline.UsersRoleID() == 3) // ForGoldenUser
                    coding.BindExpireScheduleProductForGoldenUserDropDown(ddlExpireSchedule);
                else
                    coding.BindExpireScheduleProductForNormalUserDropDown(ddlExpireSchedule);
            }
        }

        protected void BindProducts(int status)
        {
            DataTable dtProduct = da.Tbl_Products_Tra("select_byuidandstatus", UserOnline.id(), status);
            repProducts.DataSource = dtProduct;
            repProducts.DataBind();
        }

        protected void FillEditControls(int productID)
        {
            DataTable dtProduct = da.Tbl_Products_Tra("Select_item", productID);
            if (dtProduct.Rows.Count > 0)
            {
                if (Utility.ConverToNullableInt(dtProduct.Rows[0]["Uid_id"]) == UserOnline.id())
                {
                    lnkNewProducts.Text = "ویرایش محصول";
                    TextBox_Produc_Name.Text = dtProduct.Rows[0]["Produc_Name"].ToString();
                    TextBox_Product_Keywords.Text = dtProduct.Rows[0]["Product_Keywords"].ToString();
                    TextBox_Specialty_Product.Text = dtProduct.Rows[0]["Specialty_Product"].ToString();
                    //TextBox_Place_Origin.Text = dtProduct.Rows[0]["Place_Origin"].ToString();
                    //TextBox_Product_Brand.Text = dtProduct.Rows[0]["Product_Brand"].ToString();
                    TextBox_Model_Number.Text = dtProduct.Rows[0]["Model_Number"].ToString();
                    //TextBox_Defined_Attributes.Text = dtProduct.Rows[0]["Defined_Attributes"].ToString();
                    TextBox_Description.Text = dtProduct.Rows[0]["Description"].ToString();
                    TextBox_Minimum_Order.Text = dtProduct.Rows[0]["Minimum_Order"].ToString();
                    //TextBox_Supply_Ability.Text = dtProduct.Rows[0]["Supply_Ability"].ToString();
                    //TextBox_Delivery_Time.Text = dtProduct.Rows[0]["Delivery_Time"].ToString();
                    //TextBox_Packaging.Text = dtProduct.Rows[0]["Packaging"].ToString();
                    //TextBox_Terms_Payment.Text = dtProduct.Rows[0]["Packaging"].ToString();

                    string mainCategoryID = "0";
                    string subCategoryId = "0";
                    DataTable dtCategory = da_Categories.TBL_Categories_Tra(Utility.ConverToNullableInt(dtProduct.Rows[0]["Group_id"]), "select_L3_fa");
                    if (dtCategory.Rows.Count > 0)
                    {
                        if (Utility.ConverToNullableInt(dtCategory.Rows[0]["LevelID"]) == 0)
                        {
                            mainCategoryID = dtCategory.Rows[0]["id"].ToString();
                            subCategoryId = dtProduct.Rows[0]["Group_id"].ToString();
                        }
                        else if (Utility.ConverToNullableInt(dtCategory.Rows[0]["LevelID"]) == 1)
                        {
                            mainCategoryID = dtCategory.Rows[0]["subid"].ToString();
                            subCategoryId = dtCategory.Rows[0]["id"].ToString();
                        }
                    }
                    ccdCat1.SelectedValue = mainCategoryID;
                    ccdCat2.SelectedValue = subCategoryId;
                    ccdCat3.SelectedValue = Utility.ConverToNullableStringForDDL(dtProduct.Rows[0]["Group_id"]);


                    ddlExpireSchedule.SelectedValue = Utility.ConverToNullableStringForDDL(dtProduct.Rows[0]["ExpireSchedule"]);
                    txtPrice.Text = Utility.ConverToNullableString(dtProduct.Rows[0]["Price"]);
                    txtProductCountInPakage.Text = Utility.ConverToNullableString(dtProduct.Rows[0]["ProductCountInPakage"]);

                    Image_Photo.Visible = true;
                    if (dtProduct.Rows[0]["image"].ToString() == "1")
                        Image_Photo.ImageUrl = "~/MyBiztBiz/Pupload/sm_" + dtProduct.Rows[0]["image_name"].ToString();
                    if (dtProduct.Rows[0]["image"].ToString() == "0")
                        Image_Photo.ImageUrl = "~/MyBiztBiz/Pupload/none.jpg";


                    char[] splitter = { ',' };

                    string Terms_Payment = dtProduct.Rows[0]["Terms_Payment"].ToString();
                    string[] Terms_PaymentItem = Terms_Payment.Split(splitter);

                    for (int i = 0; i < Terms_PaymentItem.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(Terms_PaymentItem[i]) && Utility.ConverToNullableInt(Terms_PaymentItem[i]) > 0)
                            CheckBoxList_Terms_Payment.Items.FindByValue(Terms_PaymentItem[i]).Selected = true;
                    }

                    string SendMode = dtProduct.Rows[0]["SendMode"].ToString();
                    string[] SendModeItem = SendMode.Split(splitter);
                    for (int j = 0; j < SendModeItem.Length; j++)
                    {
                        if (!string.IsNullOrEmpty(SendModeItem[j]) && Utility.ConverToNullableInt(SendModeItem[j]) > 0)
                            CheckBoxList_SendMode.Items.FindByValue(SendModeItem[j]).Selected = true;
                    }
                }
            }
        }

        public string image_view(int Mode, string imagename)
        {
            if (Mode == 1) return "<img src='Pupload/sm_" + imagename + "' width='40'  style='border: 1px #818181 solid;'/>";
            if (Mode == 0) return "<img src='Pupload/none.jpg'  width='40' style='border: 1px #818181 solid;' />";
            return "نامشخص";
        }

        public string Set_Date(string date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date))
            {
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 3);
            }
            return sdate;
            //DateTime dtm = new DateTime();
            //dtm = Convert.ToDateTime(date);

            //if (Page.Culture.ToString() == "English (United States)")
            //    return dtm.ToString();
            //if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
            //{
            //    Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            //    return sunDate.Weekday.ToString() + "&nbsp;&nbsp; ساعت" + dtm.Hour + ":" + dtm.Minute;
            //}

            //return dtm.ToString();
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            divMessage.Visible = true;
            int groupid = Utility.ConvertintForDBForDDLNotDBNull(ccdCat3.SelectedValue.Split(new char[] { ':' })[0]);
            if (groupid <= 0)
            {
                groupid = Utility.ConvertintForDBForDDLNotDBNull(ccdCat2.SelectedValue.Split(new char[] { ':' })[0]);
            }

            if (groupid > 0)
            {
                int image = 0;
                if (FileUpload_Photo.HasFile)
                    image = 1;

                string Terms_P = "0,";
                for (int i = 0; i < CheckBoxList_Terms_Payment.Items.Count; i++)
                {
                    if (CheckBoxList_Terms_Payment.Items[i].Selected)
                    {
                        Terms_P += CheckBoxList_Terms_Payment.Items[i].Value;
                        Terms_P += ",";
                    }
                }
                Terms_P += "0";

                if (Terms_P == "0,0")
                {
                    divMessage.Style.Add("background-color", "Red");
                    lblMessage.Text = "شرایط پرداخت را انتخاب کنید";
                    return;
                }


                string SendMode = "0,";
                for (int j = 0; j < CheckBoxList_SendMode.Items.Count; j++)
                {
                    if (CheckBoxList_SendMode.Items[j].Selected)
                    {
                        SendMode += CheckBoxList_SendMode.Items[j].Value;
                        SendMode += ",";
                    }
                }
                SendMode += "0";

                if (SendMode == "0,0")
                {
                    divMessage.Style.Add("background-color", "Red");
                    lblMessage.Text = "نحوه ارسال را انتخاب کنید";
                    return;
                }

                DataTable dtProduct = new DataTable();

                if (ProductID > 0)
                {
                    dtProduct = da.Tbl_Products_Tra("Select_item", ProductID);
                    if (Utility.ConverToNullableInt(dtProduct.Rows[0]["Uid_id"]) == UserOnline.id())
                    {
                        dtProduct = da.Tbl_Products_Tra(ProductID, "Update", UserOnline.id(), groupid, 0, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                          TextBox_Specialty_Product.Text, "", "", TextBox_Model_Number.Text, "",
                          TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", "", SendMode,
                          Utility.ConverToNullableString(txtPrice.Text), DateTime.Now, DateTime.Now, Utility.ConverToNullableInt(ddlExpireSchedule.SelectedValue), Utility.ConverToNullableString(txtProductCountInPakage.Text));

                        if (image == 1)
                        {
                            string filename = ProductID.ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                            MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                            string filenam_path = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + filename);
                            string path = Server.MapPath("~//MyBiztBiz//Pupload//");
                            MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                            da.Tbl_Products_Tra(ProductID, "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "", "", DateTime.Now, DateTime.Now, 0, "");
                        }
                    }
                    else
                        return;
                }
                else
                {
                    dtProduct = da.Tbl_Products_Tra(0, "insert", UserOnline.id(), groupid, 0, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                        TextBox_Specialty_Product.Text, "", "", TextBox_Model_Number.Text, "",
                        TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", Page.Culture.ToString(), SendMode,
                        Utility.ConverToNullableString(txtPrice.Text), DateTime.Now, DateTime.Now, Utility.ConverToNullableInt(ddlExpireSchedule.SelectedValue), Utility.ConverToNullableString(txtProductCountInPakage.Text));

                    if (image == 1)
                    {
                        string filename = dtProduct.Rows[0][0].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                        MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                        string filenam_path = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + filename);
                        string path = Server.MapPath("~//MyBiztBiz//Pupload//");
                        MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 120, 120, false);
                        da.Tbl_Products_Tra(int.Parse(dtProduct.Rows[0][0].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "", "", DateTime.Now, DateTime.Now, 0, "");
                    }

                }

                if (dtProduct.Rows.Count > 0)
                {
                    if (ProductID > 0)
                        ShowSuccessfulMessage(1);
                    else
                        ShowSuccessfulMessage(2);

                    Utility.ClearQueryString();
                    Utility.AddToQueryString("PageView", "0");
                    Utility.AddToQueryString("Status", "0");
                    Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/Products.aspx", Utility.arQueryString, true), true);
                }
                else
                {
                    divMessage.Style.Add("background-color", "Red");
                    if (ProductID > 0)
                        lblMessage.Text = "اشکال در ویرایش اطلاعات";
                    else
                        lblMessage.Text = "اشکال در ثبت اطلاعات";
                }
            }
            else
            {
                divMessage.Style.Add("background-color", "Red");
                if (ProductID > 0)
                    lblMessage.Text = "دسته بندی را انتخاب کنید";
                else
                    lblMessage.Text = "دسته بندی را انتخاب کنید";
            }
        }

        protected void ShowSuccessfulMessage(int messageType)
        {
            divMessage.Visible = true;
            divMessage.Style.Add("background-color", "Green");
            if (messageType == 1)
                lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";
            else
                lblMessage.Text = "عملیات ثبت اطلاعات با موفقیت انجام شد";
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            ProductID = Utility.ConverToNullableInt(e.CommandArgument);
            Utility.ClearQueryString();
            Utility.AddToQueryString("PageView", "1");
            Utility.AddToQueryString("ProductID", ProductID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/Products.aspx", Utility.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            ProductID = Utility.ConverToNullableInt(e.CommandArgument);
            da.Tbl_Products_Tra("delete_Item", ProductID);
            BindProducts(StatusID);
        }

        protected void lnkPicture_Command(object sender, CommandEventArgs e)
        {
            ProductID = Utility.ConverToNullableInt(e.CommandArgument);
            Utility.ClearQueryString();
            Utility.AddToQueryString("ProductID", ProductID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/ProductPicture.aspx", Utility.arQueryString, true), true);
        }

        protected void lnkNewProduct_Click(object sender, EventArgs e)
        {
            Utility.ClearQueryString();
            Utility.AddToQueryString("PageView", "1");
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/Products.aspx", Utility.arQueryString, true), true);
        }

        protected void grdProduct_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string ProductName = "";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ProductName = e.Row.Cells[0].Text;
                ((LinkButton)e.Row.FindControl("lnkDelete")).OnClientClick =
                    "return confirm(' برای حذف" + "«" + ProductName + "»" + " مطمئنید؟ ')";
            }
        }

        protected void grdProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            //grdProduct1.PageIndex = e.NewPageIndex;
            BindProducts(StatusID);
        }
    }
}