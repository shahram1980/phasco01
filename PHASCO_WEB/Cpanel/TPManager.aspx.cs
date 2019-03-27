using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.DAL.MenuPageTableAdapters;
using BiztBiz.DAL;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.HtmlControls;
using BusinessAccessLayer;
using System.IO;
using System.Configuration;

namespace PHASCO_WEB.Cpanel
{
    public partial class TPManager : System.Web.UI.Page
    {
        Menu_DocTableAdapter da_Doc = new Menu_DocTableAdapter();
        MenuTableAdapter da_Menu = new MenuTableAdapter();
        Menu_Images_galleryTableAdapter da_menu_gallery = new Menu_Images_galleryTableAdapter();
        Menu_UsersTableAdapter da_Menu_User = new Menu_UsersTableAdapter();
        Menu_TextTableAdapter da_Text = new Menu_TextTableAdapter();
        //  UsersTableAdapter da_User = new UsersTableAdapter();

        MenuPage.Menu_DocDataTable ds_Doc = new MenuPage.Menu_DocDataTable();
        MenuPage.MenuDataTable ds_Menu = new MenuPage.MenuDataTable();
        MenuPage.Menu_Images_galleryDataTable ds_menu_gallery = new MenuPage.Menu_Images_galleryDataTable();
        MenuPage.Menu_TextDataTable ds_Text = new MenuPage.Menu_TextDataTable();
        //  MenuPage.UsersDataTable ds_User = new MenuPage.UsersDataTable();
        MenuPage.Menu_UsersDataTable dt_Menu_User = new MenuPage.Menu_UsersDataTable();

        int? getid = 0;



        void Bid_Grd_User()
        {
            MultiView1.ActiveViewIndex = 4;
            //int? id = null;
            //id = null;
            //id = null;
            //id = null;
            //id = null;
            //ds_User = da_User.Users_Tra(HiddenField_Mode_Search.Value.ToString(), id, TextBox_Search.Text.ToString(), null, null, null, null, id, null, null, null, null, null, null, id, id, id, null);
            //Grid_Users.DataSource = ds_User;
            //if (ds_User.Rows.Count <= 0)
            //{
            //    Button_AddUser.Visible = false;
            //}
            //else
            //{
            //    Button_AddUser.Visible = true;
            //}
            //Grid_Users.DataBind();
            //Bid_Grd_UserAllow();
        }

        void Bid_Grd_UserAllow()
        {
            dt_Menu_User = da_Menu_User.Menu_Users_Tra("ListUser", new int?(Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString())), 0);
            if (dt_Menu_User.Rows.Count <= 0)
            {
                Button_Delete_User_Active.Visible = false;
            }
            else
            {
                Button_Delete_User_Active.Visible = true;
            }
            Grid_Users_Access.DataSource = dt_Menu_User;
            Grid_Users_Access.DataBind();
        }

        protected void Bind_Gallery()
        {
            ds_menu_gallery = da_menu_gallery.menu_gallery_Tra(new int?(Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString())), "Select", "", "");
            DataList_Gallary.DataSource = ds_menu_gallery;
            DataList_Gallary.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        void Bind_GRD_List()
        {
            if (HiddenField_CurrentId.Value == "0")
            {
                ds_Menu = da_Menu.select_Null(DropDownList1.SelectedValue.ToString());
                LinkButton_Back_To_Parent.Visible = false;
            }
            else
            {
                ds_Menu = da_Menu.select_ParentID(new int?(Convert.ToInt32(HiddenField_CurrentId.Value.ToString())));
            }
            GRD_List.DataSource = ds_Menu;
            GRD_List.DataBind();
        }

        protected void Bind_GridView_docs()
        {
            int? idoffer = 0;
            ds_Doc = da_Doc.Menu_doc_Tra(new int?(Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString())), "", "select", "", 0, ref idoffer);
            GridView_docs.DataSource = ds_Doc;
            GridView_docs.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }

        void bind_Menu()
        {
            DataSet dataSet = new DataSet();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter("Select MenuID, Text, Description, ParentID from Menu where lang='" + DropDownList1.SelectedValue.ToString() + "' order by Text ", connection);
                adapter.Fill(dataSet);
                adapter.Dispose();
                if (dataSet.Tables[0].Rows.Count <= 0)
                {
                    Menu1.Visible = false;
                }
                else
                {
                    Menu1.Visible = true;
                }
            }
            dataSet.DataSetName = "Menus";
            dataSet.Tables[0].TableName = "Menu";
            DataRelation relation = new DataRelation("ParentChild", dataSet.Tables["Menu"].Columns["MenuID"], dataSet.Tables["Menu"].Columns["ParentID"], true);
            relation.Nested = true;
            dataSet.Relations.Add(relation);
            xmlDataSource.Data = dataSet.GetXml();
            if (Request.Params["Sel"] != null)
            {
                Page.Controls.Add(new LiteralControl("You selected " + Request.Params["Sel"]));
            }
        }

        protected void Button_Button_AddUser(object sender, EventArgs e)
        {
            try
            {
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < Grid_Users.Rows.Count; i++)
                {
                    GridViewRow row = Grid_Users.Rows[i];
                    if (((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked)
                    {
                        da_Menu_User.Menu_Users_Tra("AddUser", new int?(Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString())), new int?(Convert.ToInt32(Grid_Users.Rows[i].Cells[1].Text)));
                    }
                }
                Bid_Grd_UserAllow();
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            }
        }

        protected void Button_Delete_User_Active_click(object sender, EventArgs e)
        {
            try
            {
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < Grid_Users_Access.Rows.Count; i++)
                {
                    GridViewRow row = Grid_Users_Access.Rows[i];
                    if (((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked)
                    {
                        da_Menu_User.Menu_Users_Tra("DeleteUser", new int?(Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString())), new int?(Convert.ToInt32(Grid_Users_Access.Rows[i].Cells[1].Text)));
                    }
                }
                Bid_Grd_UserAllow();
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            }
        }

        protected void Button_Doc_Click(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString());
            if (FileUpload_DOc.HasFile)
            {
                int? idoffer = 0;
                string str = MyFileUploader.IsExtension(FileUpload_DOc);
                da_Doc.Menu_doc_Tra(new int?(num), str, "new", Text_Comment.Text.ToString(), 0, ref idoffer);
                MyFileUploader.SaveFile(FileUpload_DOc, @"phascoupfile\DownFile", Convert.ToInt32(idoffer), "*", "*", "*", Server);
                Bind_GridView_docs();
            }
        }

        protected void Button_Edit_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Convert.ToInt32(ViewState["edit_Menu_Id"].ToString());
                int num2 = 0;
                int num3 = 0;
                if (CheckBox_Allow_wview.Checked)
                {
                    num2 = 1;
                }
                if (MyFileUploader.IsHasFile(FileUpload_Banner))
                {
                    num3 = 1;
                }
                else if (ViewState["edit_banner_Valid"].ToString() == "1")
                {
                    num3 = 1;
                }
                else
                {
                    num3 = 0;
                }
                da_Menu.menu_tra(new int?(num), "update", TextBox_Text.Text.ToString(), TextBox_Description.Text.ToString(), 0, new int?(num2), new int?(num3), "", ref getid);
                if (num3 == 1)
                {
                    string filename = "mperis_" + getid.ToString() + MyFileUploader.IsExtension(FileUpload_Banner);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Banner, @"\phascoupfile\FolderImages", filename, ".jpg", ".jpeg", ".jpg", Server);
                }
                Button_Edit.Visible = false;
                Button_Insert.Visible = true;
                LinkButton_delete_Image.Visible = false;
                empty_form();
                bind_Menu();
                Bind_GRD_List();
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            }
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Images_Click(object sender, EventArgs e)
        {
            if (!MyFileUploader.IsHasFile(FileUpload_Image_Big))
            {
                Lbl_ALARM.Text = "تصویر انتخاب نشده";
            }
            else
            {
                string str = MyFileUploader.IsExtension(FileUpload_Image_Big);
                if ((str.ToLower() == ".jpg") || (str.ToLower() == ".jpeg"))
                {
                    int id = Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString());
                    ds_menu_gallery = da_menu_gallery.menu_gallery_Tra(new int?(id), "New", "", "");
                    id = ds_menu_gallery[0].Id;
                    string imageSingleName = MyFileUploader.GetImageSingleName(id, ".jpg");
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Image_Big, "~//phascoupfile//imgtpme", "b" + imageSingleName, ".jpg", ".jpeg", ".jpeg", Server);
                    string str3 = Server.MapPath("~//phascoupfile//imgtpme");
                    MyFileUploader.ResizeImage(str3 + "//b" + imageSingleName, str3 + "//s" + imageSingleName, 70, 50, true);
                    MyFileUploader.ResizeImage(str3 + "//b" + imageSingleName, str3 + "//m" + imageSingleName, 200, 250, true);
                    da_menu_gallery.menu_gallery_Tra(new int?(id), "UPDATE", imageSingleName, imageSingleName);
                    Lbl_ALARM.Text = "تصویر با موفقيت ارسال گردید";
                    Bind_Gallery();
                }
                else
                {
                    Lbl_ALARM.Text = "تصویر بزرگ از نوع استاندارد نيست";
                }
            }
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            //try
            //{
            int num = 0;
            int num2 = 0;
            if (CheckBox_Allow_wview.Checked) { num = 1; }
            if (MyFileUploader.IsHasFile(FileUpload_Banner)) { num2 = 1; }
            if (HiddenField_CurrentId.Value == "0")
            {
                da_Menu.menu_tra(0, "insert", TextBox_Text.Text.ToString(), TextBox_Description.Text.ToString(), 0, new int?(num), new int?(num2), DropDownList1.SelectedValue.ToString(), ref getid);
            }
            else
            {
                int num3 = Convert.ToInt32(HiddenField_CurrentId.Value.ToString());
                da_Menu.menu_tra(0, "insert", TextBox_Text.Text.ToString(), TextBox_Description.Text.ToString(), new int?(num3), new int?(num), new int?(num2), DropDownList1.SelectedValue.ToString(), ref getid);
            }
            if (num2 == 1)
            {
                string filename = "mperis_" + getid.ToString() + MyFileUploader.IsExtension(FileUpload_Banner);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Banner, @"\phascoupfile\FolderImages", filename, ".jpg", ".jpeg", ".jpg", Server);
            }
            empty_form();
            bind_Menu();
            Bind_GRD_List();
            //}
            //catch (Exception)
            //{
            //    Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            //}
            //MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Insert_Menutext(object sender, EventArgs e)
        {
            //try
            //{
            int num = Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString());
            da_Text.Menu_text_Tra("insert", new int?(num), FCKeditor1.Value);
            Lbl_ALARM.Text = "متن با موفقيت درج گردید";
            //}
            //catch (Exception)
            //{
            //    Lbl_ALARM.Text = "بروز خطا در هنگام درج متن";
            //}
            //MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Search_Click(object sender, EventArgs e)
        {
            switch (Convert.ToInt32(RadioButtonList_Search_Mode.SelectedValue.ToString()))
            {
                case 0:
                    HiddenField_Mode_Search.Value = "select_all";
                    break;

                case 1:
                    HiddenField_Mode_Search.Value = "select_UId";
                    break;

                case 2:
                    HiddenField_Mode_Search.Value = "select_id";
                    break;

                case 3:
                    HiddenField_Mode_Search.Value = "select_Email";
                    break;
            }
            Bid_Grd_User();
        }

        void Calcul_ParentId()
        {
            ds_Menu = da_Menu.Select_id(Convert.ToInt32(HiddenField_CurrentId.Value.ToString()));
            try
            { ViewState["ParentId"] = ds_Menu[0].ParentID.ToString(); }
            catch (Exception)
            { ViewState["ParentId"] = 0; }
            if (ViewState["ParentId"] != null) { LinkButton_Back_To_Parent.Visible = true; }
            else { LinkButton_Back_To_Parent.Visible = false; }
        }

        protected void delete_Command(object sender, CommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            int? idoffer = 0;
            da_Doc.Menu_doc_Tra(new int?(num), "", "delete", "", 0, ref idoffer);
            Bind_GridView_docs();
        }

        protected void DOwn_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int? idoffer = 0;
                int num = Convert.ToInt32(e.CommandArgument);
                ds_Doc = da_Doc.Menu_doc_Tra(new int?(num), "", "select1", "", 0, ref idoffer);
                FileStream stream = new FileStream(Server.MapPath(MyFileUploader.GetImageName("~/phascoupfile/DownFile", num, ds_Doc[0].ex_.ToString())), FileMode.Open, FileAccess.Read);
                byte[] buffer = new byte[(int)stream.Length];
                stream.Read(buffer, 0, (int)stream.Length);
                stream.Close();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                int length = buffer.Length;
                Response.AddHeader("Content-Length", length.ToString());
                Response.AddHeader("Content-Disposition", "attachment; filename=PFile" + ds_Doc[0].ex_.ToString());
                Response.BinaryWrite(buffer);
                Response.End();
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا در همگام اجرا";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField_CurrentId.Value = "0";
            bind_Menu();
            Bind_GRD_List();
        }

        void empty_form()
        {
            TextBox_Description.Text = TextBox_Text.Text = "";
            CheckBox_Allow_wview.Checked = false;
        }

        protected void Grid_Users_Access_PageChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_Users.PageIndex = e.NewPageIndex;
            Bid_Grd_UserAllow();
        }

        protected void Grid_Users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_Users.PageIndex = e.NewPageIndex;
            Bid_Grd_User();
        }

        protected void LinkButton_Back_To_Parent_Click(object sender, EventArgs e)
        {
            HiddenField_CurrentId.Value = ViewState["ParentId"].ToString();
            Bind_GRD_List();
            ds_Menu = da_Menu.Select_id(Convert.ToInt32(HiddenField_CurrentId.Value.ToString()));
            try
            {
                int num = Convert.ToInt32(ds_Menu[0].ParentID);
                ViewState["ParentId"] = ds_Menu[0].ParentID.ToString();
            }
            catch (Exception)
            {
                HiddenField_CurrentId.Value = "0";
                ViewState["ParentId"] = "0";
            }
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_Change_Mode_click(object sender, EventArgs e)
        {
            if (Menu1.Orientation == Orientation.Vertical)
            {
                Menu1.Orientation = Orientation.Horizontal;
            }
            else
            {
                Menu1.Orientation = Orientation.Vertical;
            }
        }

        protected void LinkButton_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                try
                {
                    int? parentID = null;
                    parentID = null;
                    da_Menu.menu_tra(new int?(Convert.ToInt32(e.CommandArgument.ToString())), "delete", null, null, parentID, parentID, null, null, ref getid);
                }
                catch (Exception)
                {
                    ViewState["ParentId"] = 0;
                }
                Bind_GRD_List();
                bind_Menu();
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            }
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            da_menu_gallery.menu_gallery_Tra(new int?(num), "Delete", "", "");
            Bind_Gallery();
        }

        protected void LinkButton_delete_Image_Click(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(ViewState["edit_Menu_Id"].ToString());
            da_Menu.menu_tra(new int?(num), "deleteImage", "", "", 0, 0, 0, "", ref getid);
            LinkButton_delete_Image.Visible = false;
            Bind_GRD_List();
        }

        protected void LinkButton_Doc_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Current_cell_Id.Value = e.CommandArgument.ToString();
            Bind_GridView_docs();
        }

        protected void LinkButton_edit_Command(object sender, CommandEventArgs e)
        {
            try
            {
                ViewState["edit_Menu_Id"] = e.CommandArgument.ToString();
                ds_Menu = da_Menu.menu_tra(new int?(Convert.ToInt32(ViewState["edit_Menu_Id"].ToString())), "selectitem", "", "", 0, 0, 0, "", ref getid);
                TextBox_Text.Text = ds_Menu[0].Text.ToString();
                TextBox_Description.Text = ds_Menu[0].Description.ToString();
                ViewState["edit_banner_Valid"] = ds_Menu[0].Banner.ToString();
                if (ds_Menu[0].Banner == 1)
                {
                    LinkButton_delete_Image.Visible = true;
                }
                else
                {
                    LinkButton_delete_Image.Visible = false;
                }
                if (ds_Menu[0].View_Allow == 1)
                {
                    CheckBox_Allow_wview.Checked = true;
                }
                else
                {
                    CheckBox_Allow_wview.Checked = false;
                }
                Button_Edit.Visible = true;
                Button_Insert.Visible = false;
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            }
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_Gallery_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Current_cell_Id.Value = e.CommandArgument.ToString();
            MultiView1.ActiveViewIndex = 1;
            Bind_Gallery();
        }

        protected void LinkButton_Secuirty_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Current_cell_Id.Value = e.CommandArgument.ToString();
            Bid_Grd_User();
        }

        protected void LinkButton_SubLevel_Command(object sender, CommandEventArgs e)
        {
            try
            {
                HiddenField_CurrentId.Value = e.CommandArgument.ToString();
                Calcul_ParentId();
                Bind_GRD_List();
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            }
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_Text_Command(object sender, CommandEventArgs e)
        {
            try
            {
                HiddenField_Current_cell_Id.Value = e.CommandArgument.ToString();
                MultiView1.ActiveViewIndex = 3;
                ds_Text = da_Text.Menu_text_Tra("select", new int?(Convert.ToInt32(HiddenField_Current_cell_Id.Value.ToString())), "");
                if (ds_Text.Rows.Count <= 0)
                {
                    FCKeditor1.Value = "";
                }
                else
                {
                    FCKeditor1.Value = ds_Text[0].Text.ToString();
                }
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "بروز خطا هنگام اجرا";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    HiddenField_CurrentId.Value = Request.QueryString["id"].ToString();
                    LinkButton_Back_To_Parent.Visible = true;
                    Calcul_ParentId();
                }
                catch (Exception)
                {
                    HiddenField_CurrentId.Value = "0";
                }
                Bind_GRD_List();
                bind_Menu();
            }
        }

        protected void set_edit_Item()
        {
            ds_Menu = da_Menu.Select_id(Convert.ToInt32(HiddenField_CurrentId.Value.ToString()));
            TextBox_Text.Text = ds_Menu[0].Text.ToString();
        }
    }
}