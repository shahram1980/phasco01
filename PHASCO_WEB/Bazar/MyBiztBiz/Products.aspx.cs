using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Membership_Manage;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

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

        string _EditMode;
        public string EditMode
        {
            get
            {
                return _EditMode;
            }
            set
            {
                _EditMode = value;
            }
        }


        Tbl_Products da = new Tbl_Products();
        TBL_Coding coding = new TBL_Coding();
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("PageView", true)))
                PageView = PHASCOUtility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("PageView", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = PHASCOUtility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true)))
                StatusID = PHASCOUtility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("EdMode", true)))
                EditMode = QLink.Web.Helpers.QueryStringHelper.GetQueryString("EdMode", true);

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
            //TBL_Company_Profile daCompany = new TBL_Company_Profile();
            //DataTable dtCompany = daCompany.TBL_Company_Profile_Tra("select_item", UserOnline.id());


            //    string s1 = dtCompany.Rows[0]["Company_Name"].ToString();
            //    string s122 = dtCompany.Rows[0]["Company_Address"].ToString();
            //    string s222 = dtCompany.Rows[0]["City"].ToString();
            //    string s3231 = dtCompany.Rows[0]["Zip"].ToString();
            //    string s244 = dtCompany.Rows[0]["BusinessType"].ToString();
            //    string s2421 = dtCompany.Rows[0]["Group_ID"].ToString();
            //    string s3f3 = dtCompany.Rows[0]["UsageType"].ToString();
            //Response.Write("---->"+dtCompany.Rows.Count.ToString()+"<br/>");
            //Response.Write("s1:" + s1 + "<br/>");
            //Response.Write("s122:" + s122 + "<br/>");
            //Response.Write("s222:" + s222 + "<br/>");
            //Response.Write("s3231:" + s3231 + "<br/>");
            //Response.Write("s244:" + s244 + "<br/>");
            //Response.Write("s2421:" + s2421 + "<br/>");
            //Response.Write("s3f3:" + s3f3 + "<br/>");

            //Users.CompanyProfileStatus status = Users.GetUserCompanyProfileStatus();
            //switch (status)
            //{
            //    case Users.CompanyProfileStatus.NotSend:
            //    case Users.CompanyProfileStatus.SendNotComplate:
            //        Response.Redirect("company_profile.aspx?CompanyProfileNotComplate=1", true);
            //        break;
            //    case Users.CompanyProfileStatus.SendAndComplate:
            //        break;
            //}
        }

        protected void CheckButtonVisible()
        {
            if (UserOnline.User_Online_Valid())
            {
                DataTable dtCountProduct = da.Tbl_Products_Tra("select_validbyuserid", UserOnline.id(), UserOnline.UsersRoleID());
                //Response.Write("UID:" + UserOnline.id().ToString() + "  | Role:" + UserOnline.UsersRoleID().ToString() + "  | count : " + dtCountProduct.Rows.Count.ToString() + "<br/>");

                if (dtCountProduct.Rows.Count > 0)
                {
                    if (dtCountProduct.Rows[0][0].ToString() == "1") ImageButton_Insert.Visible = true;
                    else ImageButton_Insert.Visible = false;
                }
                else ImageButton_Insert.Visible = false;
            }
            else ImageButton_Insert.Visible = false;

        }

        protected void BindExpireSchedule()
        {
            if (UserOnline.User_Online_Valid())
            {
                if (UserOnline.UsersRoleID() == 3) // ForGoldenUser
                    coding.BindExpireScheduleProductForGoldenUserDropDown(ddlExpireSchedule);
                else coding.BindExpireScheduleProductForNormalUserDropDown(ddlExpireSchedule);
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
                if (PHASCOUtility.ConverToNullableInt(dtProduct.Rows[0]["Uid_id"]) == UserOnline.id())
                {

                    //TextBox_Place_Origin.Text = dtProduct.Rows[0]["Place_Origin"].ToString();
                    //TextBox_Product_Brand.Text = dtProduct.Rows[0]["Product_Brand"].ToString();
                    //TextBox_Defined_Attributes.Text = dtProduct.Rows[0]["Defined_Attributes"].ToString();
                    //TextBox_Supply_Ability.Text = dtProduct.Rows[0]["Supply_Ability"].ToString();
                    //TextBox_Delivery_Time.Text = dtProduct.Rows[0]["Delivery_Time"].ToString();
                    //TextBox_Packaging.Text = dtProduct.Rows[0]["Packaging"].ToString();
                    //TextBox_Terms_Payment.Text = dtProduct.Rows[0]["Packaging"].ToString();

                    lnkNewProducts.Text = "ویرایش محصول";
                    TextBox_Produc_Name.Text = dtProduct.Rows[0]["Produc_Name"].ToString();
                    TextBox_Product_Keywords.Text = dtProduct.Rows[0]["Product_Keywords"].ToString();
                    TextBox_Specialty_Product.Text = dtProduct.Rows[0]["Specialty_Product"].ToString();
                    TextBox_Description.Text = dtProduct.Rows[0]["Description"].ToString();
                    TextBox_Minimum_Order.Text = dtProduct.Rows[0]["Minimum_Order"].ToString();
                    TextBox_Model_Number.Text = dtProduct.Rows[0]["Model_Number"].ToString();

                    if (dtProduct.Rows[0]["Status"].ToString() == "2")
                    {
                        Label_reasonMessage.Text = dtProduct.Rows[0]["Rejected_reason"].ToString();
                        TblReject.Visible = true;
                    }

                    string mainCategoryID = "0";
                    string subCategoryId = "0";
                    DataTable dtCategory = da_Categories.TBL_Categories_Tra(PHASCOUtility.ConverToNullableInt(dtProduct.Rows[0]["Group_id"]), "select_L3_fa");
                    if (dtCategory.Rows.Count > 0)
                    {
                        if (PHASCOUtility.ConverToNullableInt(dtCategory.Rows[0]["LevelID"]) == 0)
                        {
                            mainCategoryID = dtCategory.Rows[0]["id"].ToString();
                            subCategoryId = dtProduct.Rows[0]["Group_id"].ToString();
                        }
                        else if (PHASCOUtility.ConverToNullableInt(dtCategory.Rows[0]["LevelID"]) == 1)
                        {
                            mainCategoryID = dtCategory.Rows[0]["subid"].ToString();
                            subCategoryId = dtCategory.Rows[0]["id"].ToString();
                        }
                    }
                    ccdCat1.SelectedValue = mainCategoryID;
                    ccdCat2.SelectedValue = subCategoryId;
                    ccdCat3.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dtProduct.Rows[0]["Group_id"]);


                    ddlExpireSchedule.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dtProduct.Rows[0]["ExpireSchedule"]);
                    txtPrice.Text = PHASCOUtility.ConverToNullableString(dtProduct.Rows[0]["Price"]);
                    txtProductCountInPakage.Text = PHASCOUtility.ConverToNullableString(dtProduct.Rows[0]["ProductCountInPakage"]);

                    Image_Photo.Visible = true;
                    if (dtProduct.Rows[0]["image"].ToString() == "1")
                        Image_Photo.ImageUrl = "http://phasco.com/bazar/MyBiztBiz/Pupload/sm_" + dtProduct.Rows[0]["image_name"].ToString();
                    if (dtProduct.Rows[0]["image"].ToString() == "0")
                        Image_Photo.ImageUrl = "http://phasco.com/bazar/MyBiztBiz/Pupload/none.jpg";


                    char[] splitter = { ',' };

                    string Terms_Payment = dtProduct.Rows[0]["Terms_Payment"].ToString();
                    string[] Terms_PaymentItem = Terms_Payment.Split(splitter);

                    for (int i = 0; i < Terms_PaymentItem.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(Terms_PaymentItem[i]) && PHASCOUtility.ConverToNullableInt(Terms_PaymentItem[i]) > 0)
                            CheckBoxList_Terms_Payment.Items.FindByValue(Terms_PaymentItem[i]).Selected = true;
                    }

                    string SendMode = dtProduct.Rows[0]["SendMode"].ToString();
                    string[] SendModeItem = SendMode.Split(splitter);
                    for (int j = 0; j < SendModeItem.Length; j++)
                    {
                        if (!string.IsNullOrEmpty(SendModeItem[j]) && PHASCOUtility.ConverToNullableInt(SendModeItem[j]) > 0)
                            CheckBoxList_SendMode.Items.FindByValue(SendModeItem[j]).Selected = true;
                    }
                }
            }
        }

        public string image_view(int Mode, string imagename)
        {
            if (Mode == 1) return "<img src='http://phasco.com/bazar/mybiztbiz/Pupload/sm_" + imagename + "' width='40'  class='img-thumbnail' />";
            if (Mode == 0) return "<img src='http://phasco.com/bazar/mybiztbiz/Pupload/none.jpg'  width='40' class='img-thumbnail'  />";
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
            int groupid = PHASCOUtility.ConvertintForDBForDDLNotDBNull(ccdCat3.SelectedValue.Split(new char[] { ':' })[0]);
            if (groupid <= 0)
            {
                groupid = PHASCOUtility.ConvertintForDBForDDLNotDBNull(ccdCat2.SelectedValue.Split(new char[] { ':' })[0]);
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
                    if (PHASCOUtility.ConverToNullableInt(dtProduct.Rows[0]["Uid_id"]) == UserOnline.id())
                    {
                        dtProduct = da.Tbl_Products_Tra(ProductID, "Update", UserOnline.id(), groupid, 0, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                          TextBox_Specialty_Product.Text, "", "", TextBox_Model_Number.Text, "",
                          TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", "", SendMode,
                          PHASCOUtility.ConverToNullableString(txtPrice.Text), DateTime.Now, DateTime.Now, PHASCOUtility.ConverToNullableInt(ddlExpireSchedule.SelectedValue), PHASCOUtility.ConverToNullableString(txtProductCountInPakage.Text));

                        if (image == 1)
                        {
                            string filename = ProductID.ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                            MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\Bazar\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                            string filenam_path = Server.MapPath("~\\Bazar\\MyBiztBiz\\Pupload\\" + filename);
                            string path = Server.MapPath("~//Bazar//MyBiztBiz//Pupload//");
                            MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                            da.Tbl_Products_Tra(ProductID, "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "", "", DateTime.Now, DateTime.Now, 0, "");
                        }
                        if (EditMode != null)
                            if (EditMode == "Edoi0029394393fji03jfnsj") Response.Redirect("~/Bazar/MyBiztBiz/Default.aspx");
                    }
                    else
                        return;
                }
                else
                {
                    dtProduct = da.Tbl_Products_Tra(0, "insert", UserOnline.id(), groupid, 0, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                        TextBox_Specialty_Product.Text, "", "", TextBox_Model_Number.Text, "",
                        TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", Page.Culture.ToString(), SendMode,
                        PHASCOUtility.ConverToNullableString(txtPrice.Text), DateTime.Now, DateTime.Now, PHASCOUtility.ConverToNullableInt(ddlExpireSchedule.SelectedValue), PHASCOUtility.ConverToNullableString(txtProductCountInPakage.Text));

                    if (image == 1)
                    {
                        string filename = dtProduct.Rows[0][0].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                        MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\Bazar\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                        string filenam_path = Server.MapPath("~\\Bazar\\MyBiztBiz\\Pupload\\" + filename);
                        string path = Server.MapPath("~//Bazar//MyBiztBiz//Pupload//");
                        MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 120, 120, false);
                        da.Tbl_Products_Tra(int.Parse(dtProduct.Rows[0][0].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "", "", DateTime.Now, DateTime.Now, 0, "");
                    }
                }

                if (dtProduct.Rows.Count > 0)
                {
                    if (ProductID > 0) ShowSuccessfulMessage(1);
                    else ShowSuccessfulMessage(2);

                    PHASCOUtility.ClearQueryString();
                    PHASCOUtility.AddToQueryString("PageView", "0");
                    PHASCOUtility.AddToQueryString("Status", "0");

                    if (EditMode != null)
                        if (EditMode == "Edoi0029394393fji03jfnsj") Response.Redirect("~/Bazar/MyBiztBiz/Default.aspx");


                    Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/Bazar/MyBiztBiz/Products.aspx", PHASCOUtility.arQueryString, true), true);

                }
                else
                {
                    divMessage.Style.Add("background-color", "Red");
                    if (ProductID > 0) lblMessage.Text = "اشکال در ویرایش اطلاعات";
                    else lblMessage.Text = "اشکال در ثبت اطلاعات";
                }
            }
            else
            {
                divMessage.Style.Add("background-color", "Red");
                if (ProductID > 0) lblMessage.Text = "دسته بندی را انتخاب کنید";
                else lblMessage.Text = "دسته بندی را انتخاب کنید";
            }
        }

        protected void ShowSuccessfulMessage(int messageType)
        {
            divMessage.Visible = true;
            divMessage.Style.Add("background-color", "Green");
            if (messageType == 1) lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";
            else lblMessage.Text = "عملیات ثبت اطلاعات با موفقیت انجام شد";
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            ProductID = PHASCOUtility.ConverToNullableInt(e.CommandArgument);
            PHASCOUtility.ClearQueryString();
            PHASCOUtility.AddToQueryString("PageView", "1");
            PHASCOUtility.AddToQueryString("ProductID", ProductID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/bazar/MyBiztBiz/Products.aspx", PHASCOUtility.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = PHASCOUtility.ConverToNullableInt(Request.QueryString["Status"]);

            ProductID = PHASCOUtility.ConverToNullableInt(e.CommandArgument);
            da.Tbl_Products_Tra("delete_Item", ProductID);
            BindProducts(StatusID);
        }

        protected void lnkPicture_Command(object sender, CommandEventArgs e)
        {
            ProductID = PHASCOUtility.ConverToNullableInt(e.CommandArgument);
            PHASCOUtility.ClearQueryString();
            PHASCOUtility.AddToQueryString("ProductID", ProductID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/Bazar/MyBiztBiz/ProductPicture.aspx", PHASCOUtility.arQueryString, true), true);
        }

        protected void lnkNewProduct_Click(object sender, EventArgs e)
        {
            PHASCOUtility.ClearQueryString();
            PHASCOUtility.AddToQueryString("PageView", "1");
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/Bazar/MyBiztBiz/Products.aspx", PHASCOUtility.arQueryString, true), true);
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
                StatusID = PHASCOUtility.ConverToNullableInt(Request.QueryString["Status"]);

            //grdProduct1.PageIndex = e.NewPageIndex;
            BindProducts(StatusID);
        }
    }
}