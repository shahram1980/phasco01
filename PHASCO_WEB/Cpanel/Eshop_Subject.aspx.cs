using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using phasco.BaseClass;
using System.IO;
using PHASCO_WEB.DAL;

namespace phasco_webproject.Cpanel
{
    public partial class Eshop_Subject : System.Web.UI.Page
    {
        #region Dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SubJectSTableAdapter da_sub = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SubJectSTableAdapter();
        DS_MainPhasco.SubJectSDataTable dt_sub = new DS_MainPhasco.SubJectSDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SubJectSTableAdapter da_sub2 = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SubJectSTableAdapter();
        DS_MainPhasco.SubJectSDataTable dt_sub2 = new DS_MainPhasco.SubJectSDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.product_PropertiesTableAdapter da_pro = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.product_PropertiesTableAdapter();
        DS_MainPhasco.product_PropertiesDataTable dt_pro = new DS_MainPhasco.product_PropertiesDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ProDuct_Tax_CatTableAdapter da_tax = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ProDuct_Tax_CatTableAdapter();
        DS_MainPhasco.ProDuct_Tax_CatDataTable dt_tax = new DS_MainPhasco.ProDuct_Tax_CatDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.product_Images_galleryTableAdapter da_galllery = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.product_Images_galleryTableAdapter();
        DS_MainPhasco.product_Images_galleryDataTable dt_gallery = new DS_MainPhasco.product_Images_galleryDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter da_doc = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter();
        DS_MainPhasco.Product_DocDataTable dt_doc = new DS_MainPhasco.Product_DocDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.productTableAdapter da_Product = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.productTableAdapter();
        DS_MainPhasco.productDataTable dt_product = new DS_MainPhasco.productDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) { bind_grd(); HiddenField_Subject_Id.Value = "0"; } }

        #region datagrid
        protected void bind_grd()
        {
            dt_sub = da_sub.Select_Levels(0);
            Grd_SubJect.DataSource = dt_sub;
            Grd_SubJect.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void DataEdit(Object S, DataGridCommandEventArgs E)
        { Grd_SubJect.EditItemIndex = (int)E.Item.ItemIndex; bind_grd(); }

        protected void DataUpdate(Object S, DataGridCommandEventArgs E)
        {
            Grd_SubJect.EditItemIndex = (int)E.Item.ItemIndex;
            TextBox textbox_ = (TextBox)E.Item.Cells[0].Controls[0];
            string Subject_Name_ = textbox_.Text.ToString();
            //TextBox textbox_Uk = (TextBox)E.Item.Cells[1].Controls[0];
            //string Subject_Name_Uk = textbox_Uk.Text.ToString();

            int Get_Id = Convert.ToInt32(Grd_SubJect.DataKeys[(int)E.Item.ItemIndex]);
            da_sub.Update_Title(Subject_Name_, Get_Id);// .Get_SubJect_tran("Update_Rename", Get_Id, Get_Id, Subject_Name_, Subject_Name_Uk);
            Grd_SubJect.EditItemIndex = -1;
            bind_grd();
        }

        protected void DataDelete(Object S, DataGridCommandEventArgs E)
        {
            int Get_Id = Convert.ToInt32(Grd_SubJect.DataKeys[(int)E.Item.ItemIndex]);
            da_sub.Delete_Item(Get_Id, Get_Id);
            Grd_SubJect.EditItemIndex = -1;
            bind_grd();
        }

        protected void DataCancel(Object S, DataGridCommandEventArgs E)
        { Grd_SubJect.EditItemIndex = -1; bind_grd(); }

        protected void Button_Click(object sender, EventArgs e)
        {
            string Image_Mode = "np";
            int valid_Image;

            if (FileUpload1.HasFile)
            {
                if (Check_File.Checked == true) valid_Image = 1;
                else valid_Image = 0;
                Image_Mode = MyFileUploader.IsExtension(FileUpload1);
            }
            else { valid_Image = 0; }
            int? ID_Identity = 0;
            da_sub.Subjects_Insert(Convert.ToInt32(HiddenField_Subject_Id.Value), Text_Title.Text, DropDownList_Lang.SelectedValue.ToString(), valid_Image, Image_Mode, ref ID_Identity);
            //da.Get_SubJect_Insert_cat_tra(0, "Level_1", valid_Image, Image_Mode, Text.Text, Text_Uk.Text, ref ID_Identity);
            if (FileUpload1.HasFile)
            {
                int id = Convert.ToInt32(ID_Identity);
                MyFileUploader.SaveFile(FileUpload1, "phascoupfile\\BrandImage", id, ".jpg", ".jpeg", ".gif", this.Server);

                string filename = MyFileUploader.GetImageSingleName(id, ".jpg");
                string filepath = Server.MapPath("~//phascoupfile//BrandImage//" + filename).ToString();
                MyFileUploader.ResizeImage(filepath, filepath, 120, 120, true);
            }
            bind_grd();
        }
        #endregion

        #region datagrid_2
        protected void LinkButton_Sub_category_Command(object sender, CommandEventArgs e)
        { HiddenField_Subject_Id.Value = e.CommandArgument.ToString(); bind_grd2(); }

        protected void bind_grd2()
        {
            int Get_Id;
            Label_Current_Subject.Text = da_sub.Select_Item(Convert.ToInt32(HiddenField_Subject_Id.Value.ToString()))[0]["SubJect"].ToString();
            dt_sub2 = da_sub2.Select_Levels(Convert.ToInt32(HiddenField_Subject_Id.Value.ToString()));
            Grd_SubJect2.DataSource = dt_sub2;
            Grd_SubJect2.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void DataDelete2(object source, DataGridCommandEventArgs e)
        {
            int Get_Id = Convert.ToInt32(Grd_SubJect2.DataKeys[(int)e.Item.ItemIndex]);
            da_sub.Delete_Item(Get_Id, Get_Id);
            Grd_SubJect2.EditItemIndex = -1;
            bind_grd2();
        }

        protected void DataCancel2(object source, DataGridCommandEventArgs e)
        { Grd_SubJect2.EditItemIndex = -1; bind_grd2(); }

        protected void DataEdit2(object source, DataGridCommandEventArgs E)
        { Grd_SubJect2.EditItemIndex = (int)E.Item.ItemIndex; bind_grd2(); }

        protected void DataUpdate2(object source, DataGridCommandEventArgs E)
        {
            Grd_SubJect2.EditItemIndex = (int)E.Item.ItemIndex;
            TextBox textbox_ = (TextBox)E.Item.Cells[0].Controls[0];
            string Subject_Name_ = textbox_.Text.ToString();

            int Get_Id = Convert.ToInt32(Grd_SubJect2.DataKeys[(int)E.Item.ItemIndex]);
            da_sub.Update_Title(Subject_Name_, Get_Id);
            Grd_SubJect2.EditItemIndex = -1;
            bind_grd2();
        }

        protected void Button_Insert_Level2_Click(object sender, EventArgs e)
        {
            int? ID_Identity = 0;
            da_sub.Subjects_Insert(Convert.ToInt32(HiddenField_Subject_Id.Value), Text_Title2.Text, DropDownList_Lang2.SelectedValue.ToString(), 0, "np", ref ID_Identity);
            bind_grd2();
        }
        protected void lnk_btn_thisPage_Command(object sender, CommandEventArgs e)
        { bind_grd(); HiddenField_Subject_Id.Value = "0"; }

        #endregion

        #region Product
        protected void LinkButton_New_Product_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Id_Sub_Cat.Value = e.CommandArgument.ToString();
            dt_sub = da_sub.Select_Item(Convert.ToInt32(HiddenField_Subject_Id.Value.ToString()));
            HiddenField_Lang.Value = dt_sub[0].Lang.ToString();
            Bind_Tax();

            Button_Edit_Product.Visible = false;
            btt_Ins.Visible = true;
            //Panel_Image_Upload.Visible = true;

            MultiView1.ActiveViewIndex = 2;

        }

        void Bind_Tax()
        {
            dt_tax = da_tax.Select_all();
            Drop_Tax.DataValueField = "id";
            Drop_Tax.DataTextField = "Coment";
            Drop_Tax.DataSource = dt_tax;
            Drop_Tax.DataBind();
        }

        protected void btt_Ins_Click(object sender, EventArgs e)
        {
            int? ID_Identity = 0;
            string valid_Image;
            string Image_Mode = "nb";
            int H_V = 0;
            if (CheckBox_View_HomePage.Checked == true) H_V = 1;

            if (File_up.HasFile) { valid_Image = "yes"; Image_Mode = MyFileUploader.IsExtension(File_up); }
            else valid_Image = "no";

            int tax_Id = Convert.ToInt32(Drop_Tax.SelectedValue.ToString());
            int Price_Id = Convert.ToInt32(Price.Text.ToString());
            int total_id = Convert.ToInt32(Total_No.Text.ToString());
            int? Ide_Identity = 0;
            da_pro.Product_Ins_Edit(Convert.ToInt32(HiddenField_Id_Sub_Cat.Value.ToString()), "New_Ins", total_id, 1, Price_Id, Title.Text.ToString(), RadEditor_Content.Html, "Comment", tax_Id,
                tax_Id, valid_Image, Image_Mode, H_V, ref Ide_Identity, Checker.Checked, HiddenField_Lang.Value.ToString());

            MyFileUploader.SaveFile(File_up, "phascoupfile\\Product_Images", Convert.ToInt32(Ide_Identity), ".jpg", ".jpeg", ".gif", this.Server);
            bind_grd2();
        }
        #endregion

        #region List_Product
        protected void LinkButton_List_Product_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Id_Sub_Cat.Value = e.CommandArgument.ToString();
            bind_Pro();
        }

        void bind_Pro()
        {
            dt_pro = da_pro.Product_List(Convert.ToInt32(HiddenField_Id_Sub_Cat.Value.ToString()));
            Grid_List_Pro.DataSource = dt_pro;
            Grid_List_Pro.DataBind();
            MultiView1.ActiveViewIndex = 3;
        }

        protected void Button_Doc_Click(object sender, EventArgs e)
        {
            int id_ = Convert.ToInt32(HiddenField_Product_Doc.Value.ToString());
            if (FileUpload_DOc.HasFile)
            {
                int? offId = 0;
                string ex_ = MyFileUploader.IsExtension(FileUpload_DOc);
                da_doc.Product_doc_Tra(id_, ex_, "new", Text_Comment.Text.ToString(), ref offId);
                MyFileUploader.SaveFile(FileUpload_DOc, "phascoupfile\\Product_Doc", Convert.ToInt32(offId), "*", "*", "*", this.Server);
                Bind_GridView_docs();
            }
            else { }
        }

        protected void Bind_GridView_docs()
        {
            int? offId = 0;
            dt_doc = da_doc.Product_doc_Tra(Convert.ToInt32(HiddenField_Product_Doc.Value.ToString()), "", "select", "", ref offId);
            GridView_docs.DataSource = dt_doc;
            GridView_docs.DataBind();
            MultiView1.ActiveViewIndex = 4;
        }

        protected void Link_Back_Click(object sender, EventArgs e)
        { bind_Pro(); }

        protected void Button_Images_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton_Gallery_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Product_Doc.Value = Convert.ToString(e.CommandArgument);
            Bind_Gallery();
        }

        protected void Bind_Gallery()
        {
            dt_gallery = da_galllery.Product_Images_Gallery(Convert.ToInt32(HiddenField_Product_Doc.Value.ToString()), "Select", "", "");
            DataList_Gallary.DataSource = dt_gallery;
            DataList_Gallary.DataBind();
            MultiView1.ActiveViewIndex = 5;
        }

        protected void DOwn_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int? offId = 0;
                int id = Convert.ToInt32(e.CommandArgument);
                dt_doc = da_doc.Product_doc_Tra(id, "", "select1", "", ref offId);
                string filename = Server.MapPath(MyFileUploader.GetImageName("~/phascoupfile/Product_Doc", id, dt_doc[0].ex_.ToString()));

                FileStream myStream = new FileStream(filename, FileMode.Open, FileAccess.Read);
                byte[] buffer = new byte[(int)myStream.Length];
                myStream.Read(buffer, 0, (int)myStream.Length);
                myStream.Close();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Length", buffer.Length.ToString());
                Response.AddHeader("Content-Disposition", "attachment; filename=PFile" + dt_doc[0].ex_.ToString());
                Response.BinaryWrite(buffer);
                Response.End();
            }
            catch (Exception) { }
        }

        protected void Doc_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Product_Doc.Value = Convert.ToString(e.CommandArgument);
            Bind_GridView_docs();
        }

        protected void lnk_btn_Delete_Command(object sender, CommandEventArgs e)
        {
            da_pro.Delete_Item(Convert.ToInt32(e.CommandArgument));
            bind_Pro();
        }

        protected void Change_Mode(Object S, DataGridCommandEventArgs E)
        {
            int Get_Id = Convert.ToInt32(Grid_List_Pro.DataKeys[(int)E.Item.ItemIndex]);
            da_Product.Product_Enabled_Disable(Get_Id);
            bind_Pro();
        }

        protected void delete_Command(object sender, CommandEventArgs e)
        {
            int id_ = Convert.ToInt32(e.CommandArgument);
            int? offId = 0;
            da_doc.Product_doc_Tra(id_, "", "delete", "", ref offId);
            Bind_GridView_docs();
        }

        protected void Button_Images_Command(object sender, CommandEventArgs e)
        {
            if (!MyFileUploader.IsHasFile(FileUpload_Image_Big))
            { LBL_Alarm.Text = "تصویر بزرگ انتخاب نشده"; return; }
            else
            {
                string Ext = MyFileUploader.IsExtension(FileUpload_Image_Big);
                if (Ext.ToLower() == ".jpg" || Ext.ToLower() == ".jpeg")
                {
                    int id_ = Convert.ToInt32(HiddenField_Product_Doc.Value.ToString());
                    dt_gallery = da_galllery.Product_Images_Gallery(id_, "New", "", "");

                    id_ = dt_gallery[0].Id;
                    string Filename = MyFileUploader.GetImageSingleName(id_, ".jpg");
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Image_Big, "~//phascoupfile//Productgallery", "b" + Filename, ".jpg", ".jpeg", ".jpeg", this.Server);
                    string path = Server.MapPath("~//phascoupfile//Productgallery");
                    MyFileUploader.ResizeImage(path + "//b" + Filename, path + "//s" + Filename, 70, 50, true);
                    MyFileUploader.ResizeImage(path + "//b" + Filename, path + "//m" + Filename, 200, 250, true);

                    da_galllery.Product_Images_Gallery(id_, "UPDATE", Filename, Filename);
                    LBL_Alarm.Text = "تصویر با موفقيت ارسال گردید";
                    Bind_Gallery();
                }
                else
                { LBL_Alarm.Text = "تصویر بزرگ از نوع استاندارد نيست"; return; }
            }
        }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int id_ = Convert.ToInt32(e.CommandArgument);
            da_galllery.Product_Images_Gallery(id_, "Delete", "", "");
            Bind_Gallery();
        }
        #endregion

        protected void LinkButton_Edit_Product_Command(object sender, CommandEventArgs e)
        {
            Bind_Tax();
            int id_edit = Convert.ToInt32(e.CommandArgument.ToString());
            HiddenField_Edit_Id.Value = e.CommandArgument.ToString();
            dt_pro = da_pro.Product_Detail(id_edit);

            Title.Text = dt_pro[0].Title.ToString();
            RadEditor_Content.Html = dt_pro[0].Full_Comment.ToString();
            Total_No.Text = dt_pro[0]["Total_No"].ToString();
            Checker.Checked = Convert.ToBoolean(dt_pro[0]["cheker"]);
            Price.Text = dt_pro[0]["Price"].ToString();

            if (dt_pro[0]["Home_View"].ToString() == "1") CheckBox_View_HomePage.Checked = true;
            else CheckBox_View_HomePage.Checked = false;
            try { Drop_Tax.SelectedValue = dt_pro[0]["Percent_Tax"].ToString(); }
            catch (Exception) { }



            string name_Fiel = phasco.BaseClass.MyFileUploader.GetImageName("Product_Images", id_edit, dt_pro[0]["Image_Mode"].ToString());
            if (dt_pro[0]["Image_Mode"].ToString() != "np")
            {
                Image_Edit_Product.ImageUrl = "~/phascoupfile/" + name_Fiel;
                LinkButton_Delete_Product_Image.Visible = true; Image_Edit_Product.Visible = true;
            }
            else
            { LinkButton_Delete_Product_Image.Visible = false; Image_Edit_Product.Visible = false; }

            Button_Edit_Product.Visible = true;
            btt_Ins.Visible = false;
           // Panel_Image_Upload.Visible = false;


            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button_Edit_Product_Click(object sender, EventArgs e)
        {
            int? ID_Identity = 0;
            string valid_Image;
            string Image_Mode = "nb";
            int H_V = 0;
            if (CheckBox_View_HomePage.Checked == true) H_V = 1;

            if (File_up.HasFile) { valid_Image = "yes"; Image_Mode = MyFileUploader.IsExtension(File_up); }
            else valid_Image = "no";

            int tax_Id = Convert.ToInt32(Drop_Tax.SelectedValue.ToString());
            int Price_Id = Convert.ToInt32(Price.Text.ToString());
            int total_id = Convert.ToInt32(Total_No.Text.ToString());
            int? Ide_Identity = 0;
            da_pro.Product_Ins_Edit(Convert.ToInt32(HiddenField_Edit_Id.Value.ToString()), "Edit_Ins", total_id, 1, Price_Id, Title.Text.ToString(), RadEditor_Content.Html, "Comment", tax_Id,
           tax_Id, valid_Image, Image_Mode, H_V, ref Ide_Identity, Checker.Checked, HiddenField_Lang.Value.ToString());

            MyFileUploader.SaveFile(File_up, "phascoupfile\\Product_Images", Convert.ToInt32(HiddenField_Edit_Id.Value.ToString()), ".jpg", ".jpeg", ".gif", this.Server);
            bind_Pro();

        }

        protected void LinkButton_Delete_Product_Image_Command(object sender, CommandEventArgs e)
        {
            da_pro.delete_Image(Convert.ToInt32(HiddenField_Edit_Id.Value.ToString()));
            LinkButton_Delete_Product_Image.Visible = false; Image_Edit_Product.Visible = false;
        }
    }
}
