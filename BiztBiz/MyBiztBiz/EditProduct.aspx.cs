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
using BiztBiz.BLL;
using BiztBiz.Component;
using System.Threading;
using System.Globalization;

namespace BiztBiz.MyBiztBiz
{
    public partial class EditProduct : BasePage
    {
        Tbl_Products da = new Tbl_Products();
        TBL_Coding coding = new TBL_Coding();
        TBL_Categories da_Categories = new TBL_Categories();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                set_form();
        }

        void set_form()
        {
            coding.BindSendModeCheckBoxList(CheckBoxList_SendMode);
            coding.BindPaymentTypeCheckBoxList(CheckBoxList_Terms_Payment);

            if (Request.QueryString["id"] == null) return;
            int id = int.Parse(Request.QueryString["id"].ToString());
            DataTable dt = da.Tbl_Products_Tra(id, "Select_item", UserOnline.id(), 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "");

            TextBox_Produc_Name.Text = dt.Rows[0]["Produc_Name"].ToString();
            TextBox_Product_Keywords.Text = dt.Rows[0]["Product_Keywords"].ToString();
            TextBox_Specialty_Product.Text = dt.Rows[0]["Specialty_Product"].ToString();
            TextBox_Place_Origin.Text = dt.Rows[0]["Place_Origin"].ToString();
            TextBox_Product_Brand.Text = dt.Rows[0]["Product_Brand"].ToString();
            TextBox_Model_Number.Text = dt.Rows[0]["Model_Number"].ToString();
            TextBox_Defined_Attributes.Text = dt.Rows[0]["Defined_Attributes"].ToString();
            TextBox_Description.Text = dt.Rows[0]["Description"].ToString();
            TextBox_Minimum_Order.Text = dt.Rows[0]["Minimum_Order"].ToString();
            //TextBox_Supply_Ability.Text = dt.Rows[0]["Supply_Ability"].ToString();
            //TextBox_Delivery_Time.Text = dt.Rows[0]["Delivery_Time"].ToString();
            //TextBox_Packaging.Text = dt.Rows[0]["Packaging"].ToString();

            string mainCategoryID = "0";
            string subCategoryId = "0";
            DataTable dtCategory = da_Categories.TBL_Categories_Tra(Utility.ConverToNullableInt(dt.Rows[0]["Group_id"]), "select_L3_fa");
            if (dtCategory.Rows.Count > 0)
            {
                mainCategoryID = dtCategory.Rows[0]["subid"].ToString();
                subCategoryId = dtCategory.Rows[0]["id"].ToString();
            }
            ccdCat1.SelectedValue = mainCategoryID;
            ccdCat2.SelectedValue = subCategoryId;
            ccdCat3.SelectedValue = Utility.ConverToNullableStringForDDL(dt.Rows[0]["Group_id"]);


            if (dt.Rows[0]["image"].ToString() == "1")
                Image_Photo.ImageUrl = "~/MyBiztBiz/Pupload/sm_" + dt.Rows[0]["image_name"].ToString();
            if (dt.Rows[0]["image"].ToString() == "0")
                Image_Photo.ImageUrl = "~/MyBiztBiz/Pupload/none.jpg";


            char[] splitter = { ',' };

            string Terms_Payment = dt.Rows[0]["Terms_Payment"].ToString();
            string[] Terms_PaymentItem = Terms_Payment.Split(splitter);

            for (int i = 0; i < Terms_PaymentItem.Length; i++)
            {
                if (!string.IsNullOrEmpty(Terms_PaymentItem[i]))
                    CheckBoxList_Terms_Payment.Items.FindByValue(Terms_PaymentItem[i]).Selected = true;
            }

            string SendMode = dt.Rows[0]["SendMode"].ToString();
            string[] SendModeItem = SendMode.Split(splitter);
            for (int j = 0; j < SendModeItem.Length; j++)
            {
                if (!string.IsNullOrEmpty(SendModeItem[j]))
                    CheckBoxList_SendMode.Items.FindByValue(SendModeItem[j]).Selected = true;
            }

            //Label_Cat_Current.Text = dt.Rows[0][Resources.Resource.fld_Categories_title].ToString();
            HiddenField_current_Groupid.Value = dt.Rows[0]["sub_id"].ToString();
            //DropDownList_Cat1.Visible = DropDownList_Cat2.Visible = DropDownList_Cat3.Visible = false;
        }

        protected void Button_Edit_Click(object sender, EventArgs e)
        {
            int image = 0;
            if (FileUpload_Photo.HasFile) image = 1;
            int groupid = 0;

            string Terms_P = string.Empty;
            for (int i = 0; i < CheckBoxList_Terms_Payment.Items.Count; i++)
            {
                if (CheckBoxList_Terms_Payment.Items[i].Selected)
                {
                    Terms_P += CheckBoxList_Terms_Payment.Items[i].Value;
                    Terms_P += ",";
                }
            }

            string SendMode = string.Empty;
            for (int j = 0; j < CheckBoxList_SendMode.Items.Count; j++)
            {
                if (CheckBoxList_SendMode.Items[j].Selected)
                {
                    SendMode += CheckBoxList_SendMode.Items[j].Value;
                    SendMode += ",";
                }
            }



            groupid = Utility.ConvertintForDBForDDLNotDBNull(ccdCat3.SelectedValue.Split(new char[] { ':' })[0]);


            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            DataTable dt = da.Tbl_Products_Tra(id, "Update", UserOnline.id(), groupid, 3, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                TextBox_Specialty_Product.Text, TextBox_Place_Origin.Text, TextBox_Product_Brand.Text, TextBox_Model_Number.Text, TextBox_Defined_Attributes.Text,
                TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", "", SendMode);


            //if (image == 1)
            //{
            //    string filename = Request.QueryString["id"].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
            //    MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
            //    da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "");
            //}

            if (image == 1)
            {
                string filename = Request.QueryString["id"].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                string filenam_path = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + filename);
                string path = Server.MapPath("~//MyBiztBiz//Pupload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "");
            }

            Response.Redirect("listproduct.aspx");
        }


    }
}
