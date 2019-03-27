using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiztBiz.Component;
using Membership_Manage;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;

namespace BiztBiz.bizpanel
{
    public partial class SubmitProducts : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ProductID"]))
                ProductID = Utility.ConverToNullableInt(Request.QueryString["ProductID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            coding.BindSendModeCheckBoxList(CheckBoxList_SendMode);
            coding.BindPaymentTypeCheckBoxList(CheckBoxList_Terms_Payment);

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

        protected void BindProducts(int status)
        {
            DataTable dtProduct = da.Tbl_Products_Tra("select_bystatus", 0, status);
            grdProduct.DataSource = dtProduct;
            grdProduct.DataBind();
        }

        protected void FillEditControls(int requestID)
        {
            DataTable dtProduct = da.Tbl_Products_Tra("Select_item", requestID);
            if (dtProduct.Rows.Count > 0)
            {

                int codingid = Utility.ConverToNullableInt(dtProduct.Rows[0]["ExpireSchedule"]);
                DataTable dtCoding = coding.TBL_Coding_Tra(codingid, "select_byID");
                if (dtCoding.Rows.Count > 0)
                {
                    DataTable dtExpireSchedule = coding.TBL_Coding_Tra(Utility.ConverToNullableInt(dtCoding.Rows[0]["CodingGroupID"]));
                    ddlExpireSchedule.DataTextField = "CodingName";
                    ddlExpireSchedule.DataValueField = "CodingID";
                    ddlExpireSchedule.DataSource = dtExpireSchedule;
                    ddlExpireSchedule.DataBind();
                }

                TextBox_Produc_Name.Text = dtProduct.Rows[0]["Produc_Name"].ToString();
                TextBox_Product_Keywords.Text = dtProduct.Rows[0]["Product_Keywords"].ToString();
                TextBox_Specialty_Product.Text = dtProduct.Rows[0]["Specialty_Product"].ToString();
                TextBox_Place_Origin.Text = dtProduct.Rows[0]["Place_Origin"].ToString();
                TextBox_Product_Brand.Text = dtProduct.Rows[0]["Product_Brand"].ToString();
                TextBox_Model_Number.Text = dtProduct.Rows[0]["Model_Number"].ToString();
                TextBox_Defined_Attributes.Text = dtProduct.Rows[0]["Defined_Attributes"].ToString();
                TextBox_Description.Text = dtProduct.Rows[0]["Description"].ToString();
                TextBox_Minimum_Order.Text = dtProduct.Rows[0]["Minimum_Order"].ToString();
                txtPrice.Text = dtProduct.Rows[0]["Price"].ToString();
                txtProductCountInPakage.Text = dtProduct.Rows[0]["ProductCountInPakage"].ToString();
                //TextBox_Supply_Ability.Text = dtProduct.Rows[0]["Supply_Ability"].ToString();
                //TextBox_Delivery_Time.Text = dtProduct.Rows[0]["Delivery_Time"].ToString();
                //TextBox_Packaging.Text = dtProduct.Rows[0]["Packaging"].ToString();

                ddlExpireSchedule.SelectedValue = dtProduct.Rows[0]["ExpireSchedule"].ToString();

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

        public string image_view(int Mode, string imagename)
        {
            if (Mode == 1) return "<img src='Pupload/sm_" + imagename + "' width='40'  style='border: 1px #818181 solid;'/>";
            if (Mode == 0) return "<img src='Pupload/none.jpg'  width='40' style='border: 1px #818181 solid;' />";
            return "نامشخص";
        }

        public string Set_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);

            //if (Page.Culture.ToString() == "English (United States)")
            //    return dtm.ToString();
            //if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
            //{
            //    Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            //    return sunDate.Weekday.ToString() + "&nbsp;&nbsp; ساعت" + dtm.Hour + ":" + dtm.Minute;
            //}

            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString() + "&nbsp;&nbsp; ساعت" + dtm.Hour + ":" + dtm.Minute;
            //return dtm.ToString();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            int groupid = Utility.ConvertintForDBForDDLNotDBNull(ccdCat3.SelectedValue.Split(new char[] { ':' })[0]);
            if (groupid <= 0)
            {
                groupid = Utility.ConvertintForDBForDDLNotDBNull(ccdCat2.SelectedValue.Split(new char[] { ':' })[0]);
            }

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


            DataTable dtProduct = new DataTable();

            if (ProductID > 0)
            {
                dtProduct = da.Tbl_Products_Tra(ProductID, "Update", UserOnline.id(), groupid, 0, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                  TextBox_Specialty_Product.Text, TextBox_Place_Origin.Text, TextBox_Product_Brand.Text, TextBox_Model_Number.Text, TextBox_Defined_Attributes.Text,
                  TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", "", SendMode, txtPrice.Text, DateTime.Now, DateTime.Now, 0, ddlExpireSchedule.SelectedValue);

                if (image == 1)
                {
                    string filename = ProductID.ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                    string filenam_path = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + filename);
                    string path = Server.MapPath("~//MyBiztBiz//Pupload//");
                    MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                    da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "", "", DateTime.Now, DateTime.Now, 0, "");
                }
            }
            else
            {
                dtProduct = da.Tbl_Products_Tra(0, "insert", UserOnline.id(), groupid, 0, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                    TextBox_Specialty_Product.Text, TextBox_Place_Origin.Text, TextBox_Product_Brand.Text, TextBox_Model_Number.Text, TextBox_Defined_Attributes.Text,
                    TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", Page.Culture.ToString(), SendMode, txtPrice.Text, DateTime.Now, DateTime.Now, 0, ddlExpireSchedule.SelectedValue);

                if (image == 1)
                {
                    string filename = dtProduct.Rows[0][0].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                    string filenam_path = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + filename);
                    string path = Server.MapPath("~//MyBiztBiz//Pupload//");
                    MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                    da.Tbl_Products_Tra(int.Parse(dtProduct.Rows[0][0].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "", "", DateTime.Now, DateTime.Now, 0, "");
                }

            }

            if (dtProduct.Rows.Count > 0)
            {
                if (ProductID > 0)
                    ShowSuccessfulMessage(1);
                else
                    ShowSuccessfulMessage(2);
            }

        }

        protected void lnkConfirm_Click(object sender, EventArgs e)
        {
            DataTable dtProduct = new DataTable();
            int expirecount = 0;
            DataTable dtcoding = coding.TBL_Coding_Tra(Utility.ConverToNullableInt(ddlExpireSchedule.SelectedValue), "select_byID");
            if (dtcoding.Rows.Count > 0)
                expirecount = Utility.ConverToNullableInt(dtcoding.Rows[0]["CodingValue"]);
            DateTime endDate = DateTime.Now.AddDays(expirecount);
            if (ProductID > 0)
                dtProduct = da.Tbl_Products_Tra(1, ProductID, "updateStatus", endDate);

            if (dtProduct.Rows.Count > 0)
                if (ProductID > 0)
                    ShowSuccessfulMessage(1);
        }

        protected void lnkNotConfirm_Click(object sender, EventArgs e)
        {
            DataTable dtProduct = new DataTable();
            if (ProductID > 0)
                dtProduct = da.Tbl_Products_Tra(2, ProductID, "updateStatus", DateTime.Now);

            if (dtProduct.Rows.Count > 0)
                if (ProductID > 0)
                    ShowSuccessfulMessage(1);
        }

        protected void ShowSuccessfulMessage(int messageType)
        {
            lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Green;
            if (messageType == 1)
                lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";
            else
                lblMessage.Text = "عملیات ثبت اطلاعات با موفقیت انجام شد";
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            ProductID = Utility.ConverToNullableInt(e.CommandArgument);
            Response.Redirect("~/bizpanel/SubmitProducts.aspx?PageView=1&ProductID=" + ProductID.ToString(), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            ProductID = Utility.ConverToNullableInt(e.CommandArgument);
            da.Tbl_Products_Tra("delete", ProductID);
            BindProducts(StatusID);
        }

        protected void lnkPicture_Command(object sender, CommandEventArgs e)
        {
            ProductID = Utility.ConverToNullableInt(e.CommandArgument);
            Response.Redirect("~/bizpanel/SubmitProducts.aspx?Product_Id=" + ProductID.ToString(), true);
        }

        protected void lnkNewProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitProducts.aspx?PageView=1", true);
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

            grdProduct.PageIndex = e.NewPageIndex;
            BindProducts(StatusID);
        }

        protected void lnkWaitProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitProducts.aspx?PageView=0&Status=0", true);
        }

        protected void lnkNotConfirmProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitProducts.aspx?PageView=0&Status=2", true);
        }

        protected void lnkConfirmProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitProducts.aspx?PageView=0&Status=1", true);
        }

        protected void lnkExpireProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitProducts.aspx?PageView=0&Status=3", true);
        }
    }
}
