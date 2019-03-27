using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Threading;
using System.Globalization;
using PHASCO_Shopping.Component;
using System.Data;
using Membership_Manage;
namespace PHASCO_Shopping.MyPHASCO_Shopping
{
    public partial class PostNewProduct : System.Web.UI.Page
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
        { if (!IsPostBack) 
        {
            if (Request.QueryString["InsertPro"] != null)
            {
                if (Request.QueryString["InsertPro"] == "True")
                {
                    MultiView1.ActiveViewIndex = 1; Bind_Gallery();
                }
            }
            else
            {
                MultiView1.ActiveViewIndex = 0; Bind_Cat1();
            }
        } 
        }
        #region Categories
        void Bind_Cat1()
        {
            TBL_Categories da = new TBL_Categories();
             dt = da.TBL_Categories_Tra(0, "select", 0, "", "", "", 0);

            DropDownList_Cat1.DataValueField = "id";
            DropDownList_Cat1.DataTextField = Resources.Resource.F_Subject.ToString();

            DropDownList_Cat1.Items.Add(new ListItem("P l e a s e   S e l e c t ", "0"));

            DropDownList_Cat1.DataSource = dt;
            DropDownList_Cat1.DataBind();
            BindCat2();
        }
        void BindCat2()
        {
            int id = int.Parse(DropDownList_Cat1.SelectedValue.ToString());
            TBL_Categories da = new TBL_Categories();
            DataTable dt = da.TBL_Categories_Tra(0, "select", id, "", "", "", 0);
            if (dt.Rows.Count > 0)
            {
                DropDownList_Cat2.Visible = true;
                DropDownList_Cat2.DataValueField = "id";
                DropDownList_Cat2.DataTextField = Resources.Resource.F_Subject.ToString();

                DropDownList_Cat2.DataSource = dt;
                DropDownList_Cat2.DataBind();
                BindCat3();
            }
            else
            {
                DropDownList_Cat2.Items.Clear();
                DropDownList_Cat2.Visible = false;
            }
        }
        void BindCat3()
        {
            int id = int.Parse(DropDownList_Cat2.SelectedValue.ToString());
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
        #endregion
        protected void DropDownList_Cat1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCat2();
        }
        protected void DropDownList_Cat2_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCat3();
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (DropDownList_Cat3.Enabled == false || DropDownList_Cat3.SelectedValue == "")
            { return; }
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

            groupid = int.Parse(DropDownList_Cat3.SelectedValue.ToString());

            DataTable dt = da.Tbl_Products_Tra(0, "insert", UserOnline.id(), groupid, 3, TextBox_Produc_Name.Text, TextBox_Product_Keywords.Text,
                TextBox_Specialty_Product.Text, TextBox_Place_Origin.Text, TextBox_Product_Brand.Text, TextBox_Model_Number.Text, TextBox_Defined_Attributes.Text,
                TextBox_Description.Text, Terms_P, TextBox_Minimum_Order.Text, TextBox_Supply_Ability.Text, TextBox_Delivery_Time.Text, TextBox_Packaging.Text, image, "", "", Page.Culture.ToString());

            string Insert_Id = dt.Rows[0][0].ToString();
            if (image == 1)
            {
                string filename = Insert_Id + "_P_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyPHASCO_Shopping\\Pupload\\", filename, "*", "*", "*", this.Server);
                string filenam_path = Server.MapPath("~\\MyPHASCO_Shopping\\Pupload\\" + filename);
                string path = Server.MapPath("~//MyPHASCO_Shopping//Pupload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                da.Tbl_Products_Tra(int.Parse(Insert_Id), "Update_img", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", filename, "");
            }
            Response.Redirect("PostNewProduct.aspx?InsertPro=True&Id=" + Insert_Id);
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
                    LBL_Alarm.Text =Resources.Resource.photo_uploaded_successfully ;
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
            MultiView1.ActiveViewIndex = 1;
        }
        #endregion
    }
}