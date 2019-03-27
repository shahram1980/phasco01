using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using PHASCO_Shopping.Component;
using System.Threading;
using System.Globalization;
using System.Data;
using Membership_Manage;

namespace PHASCO_Shopping.MyPHASCO_Shopping
{
    public partial class EditProduct1 : System.Web.UI.Page
    {
        Tbl_Products da = new Tbl_Products();
        TBL_product_Images_gallery da_galllery = new TBL_product_Images_gallery();
        DataTable dt;
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    this.Page.Culture = name;
                    this.Page.UICulture = name;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    this.Page.Culture = str2;
                    this.Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) set_form(); Bind_Gallery(); }

        void set_form()
        {
            if (Request.QueryString["id"] == null) return;
            int id = int.Parse(Request.QueryString["id"].ToString());
            DataTable dt = da.Tbl_Products_Tra(id, "Select_item", UserOnline.id(), 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");

            TextBox_Produc_Name.Text = dt.Rows[0]["Produc_Name"].ToString();
            TextBox_Product_Keywords.Text = dt.Rows[0]["Product_Keywords"].ToString();
            TextBox_Specialty_Product.Text = dt.Rows[0]["Specialty_Product"].ToString();
            TextBox_Place_Origin.Text = dt.Rows[0]["Place_Origin"].ToString();
            TextBox_Product_Brand.Text = dt.Rows[0]["Product_Brand"].ToString();
            TextBox_Model_Number.Text = dt.Rows[0]["Model_Number"].ToString();
            TextBox_Defined_Attributes.Text = dt.Rows[0]["Defined_Attributes"].ToString();
            TextBox_Description.Text = dt.Rows[0]["Description"].ToString();
            TextBox_Minimum_Order.Text = dt.Rows[0]["Minimum_Order"].ToString();
            TextBox_Supply_Ability.Text = dt.Rows[0]["Supply_Ability"].ToString();
            TextBox_Delivery_Time.Text = dt.Rows[0]["Delivery_Time"].ToString();
            TextBox_Packaging.Text = dt.Rows[0]["Packaging"].ToString();


            if (dt.Rows[0]["image"].ToString() == "1")
                Image_Photo.ImageUrl = "~/MyPHASCO_Shopping/Pupload/sm_" + dt.Rows[0]["image_name"].ToString();
            if (dt.Rows[0]["image"].ToString() == "0")
                Image_Photo.ImageUrl = "~/MyPHASCO_Shopping/Pupload/none.jpg";


            string Terms_Payment = dt.Rows[0]["Terms_Payment"].ToString();
            string[] arInfo = new string[4];
            string check = "";
            string checkarr = "";

            char[] splitter = { ',' };
            arInfo = Terms_Payment.Split(splitter);
            for (int x = 0; x < arInfo.Length; x++)
            {
                for (int i = 0; i < CheckBoxList_Terms_Payment.Items.Count; i++)
                {
                    check = CheckBoxList_Terms_Payment.Items[i].Value.ToString();
                    checkarr = arInfo[x].ToString();

                    if (check == checkarr)
                        CheckBoxList_Terms_Payment.Items[i].Selected = true;

                    if (checkarr == "Other")
                    { TextBox_Terms_Payment.Text = arInfo[arInfo.Length - 1].ToString(); }
                }
            }

            Label_Cat_Current.Text = dt.Rows[0][Resources.Resource.fld_Categories_title].ToString();
            HiddenField_current_Groupid.Value = dt.Rows[0]["sub_id"].ToString();
            DropDownList_Cat1.Visible = DropDownList_Cat2.Visible = DropDownList_Cat3.Visible = false;
        }
        void Bind_Cat1()
        {
            TBL_Categories da = new TBL_Categories();
            DataTable dt = da.TBL_Categories_Tra(0, "select", 0, "", "", "", 0);

            DropDownList_Cat1.DataValueField = "id";
            DropDownList_Cat1.DataTextField = Resources.Resource.F_Subject.ToString();

            DropDownList_Cat1.Items.Add(new ListItem("P l e a s e   S e l e c t ", "0"));

            DropDownList_Cat1.DataSource = dt;
            DropDownList_Cat1.DataBind();
            DropDownList_Cat1.Visible = true;
        }

        #region categorie control
        protected void DropDownList_Cat1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(DropDownList_Cat1.SelectedValue.ToString());
            bind_drop1(id);

        }
        void bind_drop1(int id)
        {
            TBL_Categories da = new TBL_Categories();
            DataTable dt = da.TBL_Categories_Tra(0, "select", id, "", "", "", 0);
            if (dt.Rows.Count > 0)
            {
                DropDownList_Cat2.Visible = true;
                DropDownList_Cat2.DataValueField = "id";
                DropDownList_Cat2.DataTextField = Resources.Resource.F_Subject.ToString();

                DropDownList_Cat2.DataSource = dt;
                DropDownList_Cat2.DataBind();

                bind_drop2(int.Parse(DropDownList_Cat2.SelectedValue.ToString()));
            }
            else
            {
                DropDownList_Cat2.Items.Clear();
                DropDownList_Cat2.Visible = false;
            }
        }
        protected void DropDownList_Cat2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(DropDownList_Cat2.SelectedValue.ToString());
            bind_drop2(id);
        }
        void bind_drop2(int id)
        {
            TBL_Categories da = new TBL_Categories();
            DataTable dt = da.TBL_Categories_Tra(0, "select", id, "", "", "", 0);
            if (dt.Rows.Count > 0)
            {
                DropDownList_Cat3.Visible = true;
                DropDownList_Cat3.DataValueField = "id";
                DropDownList_Cat3.DataTextField = Resources.Resource.F_Subject.ToString();

                DropDownList_Cat3.DataSource = dt;
                DropDownList_Cat3.DataBind();
            }
            else
            {
                DropDownList_Cat3.Items.Clear();
                DropDownList_Cat3.Visible = false;
            }
        }
        protected void CheckBox_Change_cat_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox_Change_cat.Checked == true)
                Bind_Cat1();
            if (CheckBox_Change_cat.Checked == false) { DropDownList_Cat1.Visible = DropDownList_Cat2.Visible = false; }
        }
        #endregion

        protected void Button_Edit_Click(object sender, EventArgs e)
        {
            if (CheckBox_Change_cat.Checked == true)
                if (DropDownList_Cat3.Enabled == false || DropDownList_Cat3.SelectedValue == "")
                { CheckBox_Change_cat.ForeColor = System.Drawing.Color.Red; CheckBox_Change_cat.Font.Bold = true; return; }

            int image = 0;
            if (FileUpload_Photo.HasFile) image = 1;
            int groupid = 0;

            string Terms_P = "";
            if (CheckBoxList_Terms_Payment.Items[0].Selected) Terms_P = CheckBoxList_Terms_Payment.Items[0].Value.ToString();
            if (CheckBoxList_Terms_Payment.Items[1].Selected) Terms_P = Terms_P + "," + CheckBoxList_Terms_Payment.Items[1].Value.ToString();
            if (CheckBoxList_Terms_Payment.Items[2].Selected) Terms_P = Terms_P + "," + CheckBoxList_Terms_Payment.Items[2].Value.ToString();
            if (CheckBoxList_Terms_Payment.Items[3].Selected) Terms_P = Terms_P + "," + CheckBoxList_Terms_Payment.Items[3].Value.ToString();
            if (CheckBoxList_Terms_Payment.Items[4].Selected) Terms_P = Terms_P + "," + CheckBoxList_Terms_Payment.Items[4].Value.ToString();
            if (CheckBoxList_Terms_Payment.Items[5].Selected) Terms_P = Terms_P + "," + CheckBoxList_Terms_Payment.Items[5].Value.ToString();
            if (CheckBoxList_Terms_Payment.Items[6].Selected) Terms_P = Terms_P + "," + CheckBoxList_Terms_Payment.Items[6].Value.ToString();
            if (CheckBoxList_Terms_Payment.Items[7].Selected) Terms_P = Terms_P + "," + CheckBoxList_Terms_Payment.Items[7].Value.ToString() + "," + TextBox_Terms_Payment.Text.ToString();


            if (CheckBox_Change_cat.Checked)
                groupid = int.Parse(DropDownList_Cat3.SelectedValue.ToString());
            else
                groupid = int.Parse(HiddenField_current_Groupid.Value.ToString());

            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            DataTable dt = da.Tbl_Products_Tra(id, "Update", UserOnline.id(), groupid, 3, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                TextBox_Specialty_Product.Text, TextBox_Place_Origin.Text, TextBox_Product_Brand.Text, TextBox_Model_Number.Text, TextBox_Defined_Attributes.Text,
                TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, TextBox_Supply_Ability.Text, TextBox_Delivery_Time.Text, TextBox_Packaging.Text, image, "", "", "");


            //if (image == 1)
            //{
            //    string filename = Request.QueryString["id"].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
            //    MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyPHASCO_Shopping\\Pupload\\", filename, "*", "*", "*", this.Server);
            //    da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "");
            //}

            if (image == 1)
            {
                string filename = Request.QueryString["id"].ToString() + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyPHASCO_Shopping\\Pupload\\", filename, "*", "*", "*", this.Server);
                string filenam_path = Server.MapPath("~\\MyPHASCO_Shopping\\Pupload\\" + filename);
                string path = Server.MapPath("~//MyPHASCO_Shopping//Pupload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "");
            }

            Response.Redirect("listproduct.aspx");
        }

        #region Gallery
        protected void Button_Images_Command(object sender, CommandEventArgs e)
        {
            if (!MyFileUploader.IsHasFile(FileUpload_Image_Big))
            { LBL_Alarm.Text = Resources.Resource.Photo_not_selected; return; }
            else
            {
                string Ext = MyFileUploader.IsExtension(FileUpload_Image_Big);
                if (Ext.ToLower() == ".jpg" || Ext.ToLower() == ".jpeg")
                {
                    int id_ = Convert.ToInt32(Request.QueryString["id"].ToString());
                    dt = da_galllery.TBL_product_Images_gallery_SP(id_, "New", "", "");

                    id_ = int.Parse(dt.Rows[0]["Id"].ToString());
                    string Filename = MyFileUploader.GetImageSingleName(id_, ".jpg");
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Image_Big, "~//MyPHASCO_Shopping//ProductGallery", "b" + Filename, ".jpg", ".jpeg", ".jpeg", this.Server);
                    string path = Server.MapPath("~//MyPHASCO_Shopping//ProductGallery");
                    MyFileUploader.ResizeImage(path + "//b" + Filename, path + "//s" + Filename, 70, 50, true);
                    MyFileUploader.ResizeImage(path + "//b" + Filename, path + "//m" + Filename, 200, 250, true);

                    da_galllery.TBL_product_Images_gallery_SP(id_, "UPDATE", Filename, Filename);
                    LBL_Alarm.Text = Resources.Resource.photo_uploaded_successfully;
                    Bind_Gallery();
                }
                else
                { LBL_Alarm.Text = Resources.Resource.Selected_photo_standard_format; return; }
            }
        }
        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int id_ = Convert.ToInt32(e.CommandArgument);
            da_galllery.TBL_product_Images_gallery_SP(id_, "Delete", "", "");
            Bind_Gallery();
        }
        protected void Bind_Gallery()
        {
            DataList_Gallary.DataSource = da_galllery.TBL_product_Images_gallery_SP(Convert.ToInt32(Request.QueryString["id"].ToString()), "Select", "", ""); ;
            DataList_Gallary.DataBind();
        }
        #endregion

    }
}