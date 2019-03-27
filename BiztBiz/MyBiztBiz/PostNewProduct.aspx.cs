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
using System.Threading;
using System.Globalization;
using BiztBiz.Component;

namespace BiztBiz
{
    public partial class PostNewProduct : BasePage
    {
        Tbl_Products da = new Tbl_Products();
        DataTable dt;

        TBL_Coding coding = new TBL_Coding();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Is_Valid())
            {
                Response.Redirect("Default.aspx"); 
            }

            if (!IsPostBack)
            {
                Initialize();
            }
        }

        protected void Initialize()
        {
            coding.BindSendModeCheckBoxList(CheckBoxList_SendMode);
            coding.BindPaymentTypeCheckBoxList(CheckBoxList_Terms_Payment);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (DropDownList_Cat3.Enabled == false || DropDownList_Cat3.SelectedValue == "")
            {
                return;
            }
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

            DataTable dt = da.Tbl_Products_Tra(0, "insert", UserOnline.id(), groupid, 3, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                TextBox_Specialty_Product.Text, TextBox_Place_Origin.Text, TextBox_Product_Brand.Text, TextBox_Model_Number.Text, TextBox_Defined_Attributes.Text,
                TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, string.Empty, string.Empty, string.Empty, image, "", "", Page.Culture.ToString(),SendMode);

            if (image == 1)
            {
                string filename = dt.Rows[0][0].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\Pupload\\", filename, "*", "*", "*", this.Server);
                string filenam_path = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + filename);
                string path = Server.MapPath("~//MyBiztBiz//Pupload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                da.Tbl_Products_Tra(int.Parse(dt.Rows[0][0].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "", "");
            }
            Response.Redirect("Wait_Pro.aspx");
        }



    }
}
