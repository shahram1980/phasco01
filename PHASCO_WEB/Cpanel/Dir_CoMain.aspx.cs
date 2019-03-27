using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using PHASCO_WEB.DAL;
using phasco.BaseClass;
using System.IO;
using Membership_Manage;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB.Cpanel
{
    public partial class Dir_CoMain : System.Web.UI.Page
    {

        #region DataSet
        TBL_Co_Properties da_Dir = new TBL_Co_Properties();

        //   DS_Directory.T_RestaurantDataTable dt_R = new DS_Directory.T_RestaurantDataTable();

        //PHASCO_WEB.DAL.DS_DirectoryTableAdapters.T_stateTableAdapter da_S = new PHASCO_WEB.DAL.DS_DirectoryTableAdapters.T_stateTableAdapter();
        //DS_Directory.T_stateDataTable dt_S = new DS_Directory.T_stateDataTable();
        T_Restaurant dt_R = new T_Restaurant();
        Tbl_state da_S = new Tbl_state();
        TBL_Co_Properties dares = new TBL_Co_Properties();
        TBL_Co_Gallery da_gallery = new TBL_Co_Gallery();
        DataTable dt;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.QueryString["mode"] != null)
                {
                    if (Request.QueryString["mode"].ToString() == "1")
                    { MultiView1.ActiveViewIndex = 0; GridView_region_Bind(); }
                    if (Request.QueryString["mode"].ToString() == "2")
                    { MultiView1.ActiveViewIndex = 3; Bind_Group_3(); }
                    if (Request.QueryString["mode"].ToString() == "3")
                    {
                        MultiView1.ActiveViewIndex = 1;
                        dropdown_State_Bind();
                        dropdown_region_State_Bind();
                        dropdown_region_State_Bind();
                    }
                    if (Request.QueryString["mode"].ToString() == "4")
                    { MultiView1.ActiveViewIndex = 2; bind_drop2(); }// LBL_CountLab.Text = da_R.Scalar_Sum_Total().ToString();

                    if (Request.QueryString["opaid"] != null)
                        apply(int.Parse(Request.QueryString["opaid"].ToString()));
                    if (Request.QueryString["opdid"] != null)
                        delete_new(int.Parse(Request.QueryString["opdid"].ToString()));
                    if (Request.QueryString["mode"].ToString() == "5")
                        Bind_New_Grd();
                }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 0; GridView_region_Bind(); }

        protected void DropDownList_region_SelectedIndexChanged(object sender, EventArgs e)
        { GridView_region_Bind(); }

        protected void GridView_region_Bind()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList_region.SelectedValue), "");
            Grd_region.DataSource = dt;
            Grd_region.DataBind();
        }

        protected void Button_Ins_Click(object sender, EventArgs e)
        {
            da_S.T_state_Tra("insert", 0, Txt_state.Text.ToString(), Convert.ToInt32(DropDownList_region.SelectedValue), Txt_stateEN.Text.ToString());
            GridView_region_Bind();
        }

        protected void DataEdit(Object S, DataGridCommandEventArgs E)
        { Grd_region.EditItemIndex = (int)E.Item.ItemIndex; GridView_region_Bind(); }
        protected void DataDelete(Object S, DataGridCommandEventArgs E)
        {
            int Get_Id = Convert.ToInt32(Grd_region.DataKeys[(int)E.Item.ItemIndex]);
            da_S.T_state_Tra("delete",Get_Id,"",Convert.ToInt32(DropDownList_region.SelectedValue),"");
            Grd_region.EditItemIndex = -1;
            GridView_region_Bind();
        }
        protected void DataCancel(Object S, DataGridCommandEventArgs E)
        { Grd_region.EditItemIndex = -1; GridView_region_Bind(); }
        protected void DataUpdate(Object S, DataGridCommandEventArgs E)
        {
            Grd_region.EditItemIndex = (int)E.Item.ItemIndex;
            TextBox textbox_ = (TextBox)E.Item.Cells[1].Controls[0];
            string Subject_Name_ = textbox_.Text.ToString();
            TextBox textbox_En = (TextBox)E.Item.Cells[0].Controls[0];
            string Subject_Name_en = textbox_En.Text.ToString();
            int Get_Id = Convert.ToInt32(Grd_region.DataKeys[(int)E.Item.ItemIndex]);
            da_S.T_state_Tra("update", Get_Id, Subject_Name_, Convert.ToInt32(DropDownList_region.SelectedValue), Subject_Name_en);
            Grd_region.EditItemIndex = -1;
            GridView_region_Bind();
        }
        protected void Drop_Dataentry_SelectedIndexChanged(object sender, EventArgs e)
        { dropdown_State_Bind(); dropdown_region_State_Bind(); }
        protected void Drop_down_ChangeList(object sender, EventArgs e)
        { dropdown_region_State_Bind(); }
        protected void dropdown_State_Bind()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(Drop_Dataentry.SelectedValue), "");
            if (dt.Rows.Count > 0)
            {
                Drop_state.DataTextField = "Satate";
                Drop_state.DataValueField = "Id";
                Drop_state.DataSource = dt;
                Drop_state.DataBind();
                Drop_state.Enabled = true;
            }
            else Drop_state.Enabled = false;
        }
        protected void dropdown_region_State_Bind()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(Drop_state.SelectedValue), "");
            if (dt.Rows.Count > 0 && Drop_state.Enabled == true)
            {
                DropDownList_Region_newINsert.DataTextField = "Satate";
                DropDownList_Region_newINsert.DataValueField = "Id";
                DropDownList_Region_newINsert.DataSource = dt;
                DropDownList_Region_newINsert.DataBind();
                DropDownList_Region_newINsert.Enabled = true;
            }
            else DropDownList_Region_newINsert.Enabled = false;
        }
        protected void Link_rest_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            dropdown_State_Bind();
            dropdown_region_State_Bind();
            dropdown_region_State_Bind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string FileName;
            if (DropDownList_Region_newINsert.Enabled = true)
            {
                if (File_Image.HasFile) FileName = MyFileUploader.IsExtension(File_Image);
                else FileName = "None.jpg";
                int? id = 0;
                DataTable dt_;
                dt_ = da_Dir.TBL_Co_Properties_Tra("insert", Convert.ToInt32(DropDownList_Region_newINsert.SelectedValue), txt_name.Text, txt_nameEN.Text,
                Convert.ToInt32(Drop_stars.SelectedValue), txt_Address.Text, txt_manager.Text, txt_Time.Text, Txt_foods.Text, TXT_website.Text, Txt_tel.Text, FileName
                 , Convert.ToInt32(Drop_Expire.SelectedValue), 0, 1, txt_email.Text);


                id = int.Parse(dt_.Rows[0][0].ToString());
                MyFileUploader.SaveFile_MyFileName(File_Image, "\\phascoupfile\\Dir_Co_Images", id.ToString() + ".jpg", ".jpg", ".jpeg", ".jpg", this.Server);
                Lbl_success.Visible = true;
                Lbl_success.Text = "  رکورد با موفقيت درج شد";
            }
            else Lbl_success.Text = "بروز خطا ! منطقه تعيين نشده";
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 2; bind_drop2(); }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        { bind_drop2(); bind_drop2_2(); }
        protected void bind_drop2()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList1.SelectedValue), "");
            Drop_View_State.DataTextField = "Satate";
            Drop_View_State.DataValueField = "Id";
            Drop_View_State.DataSource = dt;
            Drop_View_State.DataBind();
        }
        protected void Drop_View_State_SelectedIndexChanged(object sender, EventArgs e)
        { bind_drop2_2(); }
        protected void bind_drop2_2()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(Drop_View_State.SelectedValue), "");
            Drop_View_State2.DataTextField = "Satate";
            Drop_View_State2.DataValueField = "Id";
            Drop_View_State2.DataSource = dt;
            Drop_View_State2.DataBind();
        }
        protected void Button_ListGrid_Click(object sender, EventArgs e)
        {
            if (TextBox_Serach_Code.Text != "")
            {
                try
                {
                    int company_Code = int.Parse(TextBox_Serach_Code.Text.ToString());
                    DataTable dt;
                    dt = da_Dir.TBL_Co_Properties_Tra("selectAuto", company_Code, "", "", 0, "", "", "", "", "", "", "", 0, 0, 0, "");
                    Grid_Rest.DataSource = dt;
                    Grid_Rest.DataBind();
                }
                catch (Exception)
                {  }
            }
            else
            bind_grid_rest(); }
        protected void bind_grid_rest()
        {
            int? id = 0;
            DataTable dt;
            dt = da_Dir.TBL_Co_Properties_Tra("select", Convert.ToInt32(Drop_View_State2.SelectedValue), "", "", 0, "", "", "", "", "", "", "", 0, 0, 0, "");
            Grid_Rest.DataSource = dt;
            Grid_Rest.DataBind();
        }
        protected void Link_Delete_Command(object sender, CommandEventArgs e)
        {
            int rid = Convert.ToInt32(e.CommandArgument);
            int? id = 0;
            da_Dir.TBL_Co_Properties_Tra("Delete", rid, "", "", 0, "", "", "", "", "", "", "", 0, 0, 0, "");
            bind_grid_rest();
        }
        protected void Link_Edit_Command(object sender, CommandEventArgs e)
        {
            edit.Enabled = true;
            int? id = 0;
            int e_id = Convert.ToInt32(e.CommandArgument);
            DataTable dt;
            dt = da_Dir.TBL_Co_Properties_Tra("select1", e_id, "", "", 0, "", "", "", "", "", "", "", 0, 0, 0, "");
            txt_Ename.Text = dt.Rows[0]["Name"].ToString();
            txt_EnameEN.Text = dt.Rows[0]["NameEn"].ToString();
            txt_Eaddress.Text = dt.Rows[0]["Address"].ToString();
            txt_EaddressEN.Text = dt.Rows[0]["AddressEn"].ToString();
            Drop_estar.SelectedValue = dt.Rows[0]["star"].ToString();
            txt_Emagaer.Text = dt.Rows[0]["Manager"].ToString();
            txt_EmagaerEN.Text = dt.Rows[0]["ManagerEn"].ToString();
            Txt_Efood.Text = dt.Rows[0]["Foods"].ToString();
            Txt_EfoodEN.Text = dt.Rows[0]["FoodsEn"].ToString();
            Txt_Etime.Text = dt.Rows[0]["Time"].ToString();
            Txt_EtimeEN.Text = dt.Rows[0]["TimeEN"].ToString();
            TXT_EEmail.Text = dt.Rows[0]["EMail"].ToString();
            TXT_Ewebsite.Text = dt.Rows[0]["WebSite"].ToString();
            Txt_etel.Text = dt.Rows[0]["tel"].ToString();
            Txt_id.Text = dt.Rows[0]["Autoid"].ToString();
            img_Edit.ImageUrl = "~\\Resimg\\" + dt.Rows[0]["Pic"].ToString();

            DropDownList_edit_Region.SelectedValue = DropDownList1.SelectedValue;
            bind_drop_edit_2(); bind_drop_edit_2_2();
            DropDownList_edit_State.SelectedValue = Drop_View_State.SelectedValue;
            if (dt.Rows[0]["ExpDate"].ToString() == dt.Rows[0]["InsDate"].ToString()) lbl_Exp_date.Text = "نامحدود";
            else lbl_Exp_date.Text = dt.Rows[0]["ExpDate"].ToString();
            Bind_Gallery();
        }
        protected void DropDownList_edit_Region_SelectedIndexChanged(object sender, EventArgs e)
        { bind_drop_edit_2(); }
        protected void bind_drop_edit_2()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList_edit_Region.SelectedValue), "");
            DropDownList_edit_State.DataTextField = "Satate";
            DropDownList_edit_State.DataValueField = "Id";
            DropDownList_edit_State.DataSource = dt;
            DropDownList_edit_State.DataBind();
        }
        protected void DropDownList_edit_State_SelectedIndexChanged(object sender, EventArgs e)
        { bind_drop_edit_2_2(); }
        protected void bind_drop_edit_2_2()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList_edit_State.SelectedValue), "");
            DropDownList_Region_Edit_3.DataTextField = "Satate";
            DropDownList_Region_Edit_3.DataValueField = "Id";
            DropDownList_Region_Edit_3.DataSource = dt;
            DropDownList_Region_Edit_3.DataBind();
        }
        protected void Button_Apply_Edit_Click(object sender, EventArgs e)
        {
            string image_name = Txt_id.Text.ToString() + ".jpg";
            if (FileUpload_E.HasFile)
            {
                MyFileUploader.SaveFile_MyFileName(FileUpload_E, "\\phascoupfile\\Dir_Co_Images", Txt_id.Text.ToString() + ".jpg", ".jpg", ".jpeg", ".jpg", this.Server);
                if (img_Edit.ImageUrl == "~\\Resimg\\None.jpg")
                    image_name = Txt_id.Text.ToString() + ".jpg";
            }
            else image_name = "None.jpg";

            da_Dir.TBL_Co_Properties_Tra("Update", Convert.ToInt32(Txt_id.Text), txt_Ename.Text, txt_EnameEN.Text, Convert.ToInt32(Drop_estar.SelectedValue), txt_Eaddress.Text, txt_Emagaer.Text,
            Txt_Etime.Text, Txt_Efood.Text, TXT_Ewebsite.Text, Txt_etel.Text, "", Convert.ToInt32(Drop_Eexpire.SelectedValue),
            Convert.ToInt32(DropDownList_Region_Edit_3.SelectedValue), 1, TXT_EEmail.Text);

            dares.TBL_Co_Properties_Tra("Update_pic", Convert.ToInt32(Txt_id.Text), image_name);
        }
        protected void LinkButton_Group3_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 3; Bind_Group_3(); }
        protected void Bind_Group_3()
        {
            dt = da_S.T_state_Tra("select",0,"",Convert.ToInt32(DropDownList_Group1.SelectedValue),"");
            DropDownList_Group2.DataTextField = "satate";
            DropDownList_Group2.DataValueField = "id";
            DropDownList_Group2.DataSource = dt;
            DropDownList_Group2.DataBind();
            if (dt.Rows.Count != 0)
            {
                DropDownList_Group2.Enabled = true;
                Bind_Grid_group();
                DataGrid_Group3.Visible = true;
                Button_group3.Enabled = true;
            }
            else
            {
                DropDownList_Group2.Enabled = false;
                DataGrid_Group3.Visible = false;
                Button_group3.Enabled = false;
            }
        }
        protected void DropDownList_Group1_SelectedIndexChanged(object sender, EventArgs e)
        { Bind_Group_3(); }
        protected void Button_group3_Click(object sender, EventArgs e)
        {
            if (DropDownList_Group2.Enabled == false) Lbl_Alarm_group3.Visible = true;
            else
            {
                Lbl_Alarm_group3.Visible = false;
                da_S.T_state_Tra("insert",0,TXt_Group3.Text.ToString(),Convert.ToInt32(DropDownList_Group2.SelectedValue),TXt_Group3EN.Text);
                Bind_Grid_group();
            }
        }
        protected void Bind_Grid_group()
        {
            DataGrid_Group3.DataSource = da_S.T_state_Tra("select",0,"",Convert.ToInt32(DropDownList_Group2.SelectedValue),"");
            DataGrid_Group3.DataBind();
        }
        protected void DropDownList_Group2_SelectedIndexChanged(object sender, EventArgs e)
        { Bind_Grid_group(); }
        protected void DataGrid_Group3_CancelCommand(object source, DataGridCommandEventArgs e)
        { DataGrid_Group3.EditItemIndex = -1; Bind_Grid_group(); }
        protected void DataGrid_Group3_DeleteCommand(object source, DataGridCommandEventArgs E)
        {
            int Get_Id = Convert.ToInt32(DataGrid_Group3.DataKeys[(int)E.Item.ItemIndex]);
            da_S.T_state_Tra("delete", Get_Id, "", 0, "");
            DataGrid_Group3.EditItemIndex = -1;
            Bind_Grid_group();
        }
        protected void DataGrid_Group3_EditCommand(object source, DataGridCommandEventArgs E)
        { DataGrid_Group3.EditItemIndex = (int)E.Item.ItemIndex; Bind_Grid_group(); }
        protected void DataGrid_Group3_UpdateCommand(Object S, DataGridCommandEventArgs E)
        {
            DataGrid_Group3.EditItemIndex = (int)E.Item.ItemIndex;
            TextBox textbox_ = (TextBox)E.Item.Cells[1].Controls[0];
            string Subject_Name_ = textbox_.Text.ToString();
            TextBox textbox_En = (TextBox)E.Item.Cells[0].Controls[0];
            string Subject_Name_en = textbox_En.Text.ToString();

            int Get_Id = Convert.ToInt32(DataGrid_Group3.DataKeys[(int)E.Item.ItemIndex]);
            da_S.T_state_Tra("update", Get_Id, Subject_Name_, Convert.ToInt32(DropDownList_Group2.SelectedValue), Subject_Name_en);
            DataGrid_Group3.EditItemIndex = -1;
            Bind_Grid_group();
        }
        protected void dgrdTitles_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        { Grid_Rest.CurrentPageIndex = e.NewPageIndex; bind_grid_rest(); }
        #region new file send
        void Bind_New_Grd()
        {
            DataTable dtt = da_Dir.TBL_Co_Properties_Tra("NewList");
            DataGrid_NewList.DataSource = dtt;
            DataGrid_NewList.DataBind();
            MultiView1.ActiveViewIndex = 4;
        }
        #endregion
        void apply(int id)
        {

            DataTable dtt = da_Dir.TBL_Co_Properties_Tra("select1", id);
            int uid = int.Parse(dtt.Rows[0]["uid"].ToString());
            da_Dir.TBL_Co_Properties_Tra("active", id);
           UserOnline.Add_Point(uid, 10, "manu");
            Bind_New_Grd();
        }
        void delete_new(int id)
        {
            da_Dir.TBL_Co_Properties_Tra("Delete", id);
            Bind_New_Grd();
        }
        #region Gallery
        protected void Button_Images_Command(object sender, CommandEventArgs e)
        {
            if (!MyFileUploader.IsHasFile(FileUpload_Image_Big))
            { Lbl_alarm.Text = "تصویر بزرگ انتخاب نشده"; return; }
            else
            {
                string Ext = MyFileUploader.IsExtension(FileUpload_Image_Big);
                if (Ext.ToLower() == ".jpg" || Ext.ToLower() == ".jpeg")
                {
                    dt = da_gallery.Lab_Gallery_Tra("Select_Uid_Count", 0, int.Parse(Txt_id.Text.ToString()), "");
                    if (dt.Rows.Count > 0)
                    {
                        if (int.Parse(dt.Rows[0]["id"].ToString()) >= 10)
                        { Lbl_alarm.Text = "شما مجاز هستید نهایتا 10 تصویر داشته باشید"; return; }
                    }

                    int id_ = 0;

                    dt = da_gallery.Lab_Gallery_Tra("Insert", 0, int.Parse(Txt_id.Text.ToString()), TextBox_Comment.Text.ToString());
                    id_ = int.Parse(dt.Rows[0]["Id"].ToString());

                    string Filename = MyFileUploader.GetImageSingleName(id_, ".jpg");
                    int res = MyFileUploader.SaveFile_MyFileName(FileUpload_Image_Big, "~//phascoupfile//Dir_Co_Gallery//", "b" + Filename, ".jpg", ".jpeg", ".jpeg", this.Server);
                    if (res != 0)
                    {
                        switch (res)
                        {
                            case 1:
                                Lbl_alarm.Text = "تصویر بزرگ از نوع استاندارد نيست"; return;
                                break;
                            case 2:
                                Lbl_alarm.Text = "تصویر با موفقيت ارسال گردید"; return;
                                break;
                        }
                        return;
                    }
                    string path = Server.MapPath("~//phascoupfile//Dir_Co_Gallery");
                    MyFileUploader.ResizeImage(path + "\\b" + Filename, path + "\\s" + Filename, 70, 50, true);

                    Lbl_alarm.Text = "تصویر با موفقيت ارسال گردید";
                    Bind_Gallery();
                }
                else { Lbl_alarm.Text = "تصویر بزرگ از نوع استاندارد نيست"; return; }
            }
        }
        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int id_ = Convert.ToInt32(e.CommandArgument);
            da_gallery.Lab_Gallery_Tra("delete", id_);
            try
            {
                string name = Server.MapPath("~//phascoupfile//Dir_Co_Gallery//b" + MyFileUploader.GetImageSingleName(id_, ".jpg"));
                File.Delete(name);
                name = Server.MapPath("~//phascoupfile//Dir_Co_Gallery//s" + MyFileUploader.GetImageSingleName(id_, ".jpg"));
                File.Delete(name);
            }
            catch (Exception) { }
            Bind_Gallery();
        }
        protected void Bind_Gallery()
        {
            dt = da_gallery.Lab_Gallery_Tra("Select_Uid", 0, int.Parse(Txt_id.Text.ToString()), "");
            DataList_Gallary.DataSource = dt;
            DataList_Gallary.DataBind();
        }
        #endregion


        public string image_Check(string Image_Mode)
        {
            string ret_ = "";
            if (Image_Mode == "None.jpg")
            {
                ret_ = "<img border='0' src='images/Photo_no.jpg' width='16' height='16'>";
            }
            else
            {
                ret_ = "<a href='" + "javascript:popUp(&#39showimage.aspx?Img=" + Image_Mode + "&#39)" + "'><img border='0' src='images/Photo_yes.jpg' width='16' height='16'></a>";
            }
            return ret_;
        }
        public string image_Check_dir(string id_)
        {
            string ImageName =  MyFileUploader.GetImageSingleName(int.Parse(id_.ToString()), ".jpg").ToString();
            return ImageName;
        }


    }
}
