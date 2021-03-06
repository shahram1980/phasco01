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
using System.Text;
using phasco.BaseClass;
using System.IO;
using PHASCO_WEB.DAL;

namespace phasco.Cpanel
{
    public partial class Products : System.Web.UI.Page
    {
        #region Dataset
        


        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SubjectListEnTableAdapter da_s = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SubjectListEnTableAdapter();
        DS_MainPhasco.SubjectListEnDataTable ds_s = new DS_MainPhasco.SubjectListEnDataTable();


        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Company_PropertiesTableAdapter da_c = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Company_PropertiesTableAdapter();
        DS_MainPhasco.Company_PropertiesDataTable ds_c = new DS_MainPhasco.Company_PropertiesDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Kict_ProrapeiesTableAdapter da_k = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Kict_ProrapeiesTableAdapter();
        DS_MainPhasco.Kict_ProrapeiesDataTable ds_k = new DS_MainPhasco.Kict_ProrapeiesDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Company_ListTableAdapter da_li = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Company_ListTableAdapter();
        DS_MainPhasco.Company_ListDataTable ds_li = new DS_MainPhasco.Company_ListDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.E_Shop_Price_TableTableAdapter da_eshop = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.E_Shop_Price_TableTableAdapter();
        DS_MainPhasco.E_Shop_Price_TableDataTable ds_eshop = new DS_MainPhasco.E_Shop_Price_TableDataTable();

        //DS_MainPhascoTableAdapters.Product_DocTableAdapter da_d = new DS_MainPhascoTableAdapters.Product_DocTableAdapter();
        //DS_MainPhasco.Product_DocDataTable ds_d = new DS_MainPhasco.Product_DocDataTable();
        
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) { HiddenField_Subjects_Id.Value = "1"; Bind_Grd(); } }

        #region Subjects Transaction
        protected void Bind_Grd()
        {
            if (Convert.ToInt32(HiddenField_Subjects_Id.Value) <= 1) { ds_s = da_s.SubjectListEn_Tra("Level1", 0, 0, ""); LinkButton_Back_Level.Visible = false; }
            else { ds_s = da_s.SubjectListEn_Tra("Level_Other", Convert.ToInt32(HiddenField_Subjects_Id.Value), 0, ""); LinkButton_Back_Level.Visible = true; }
            GRD_LIST.DataSource = ds_s;
            GRD_LIST.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            da_s.SubjectListEn_Tra("Insert", Convert.ToInt32(HiddenField_Subjects_Id.Value), 0, Txt_Title.Text);
            Bind_Grd();
        }

        protected void LinkButton_Subject_Command(object sender, CommandEventArgs e)
        { HiddenField_Subjects_Id.Value = e.CommandArgument.ToString(); Bind_Grd(); }

        protected void LinkButton_Delete_Subject_Command(object sender, CommandEventArgs e)
        {

        }

        protected void GRD_LIST_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        { GRD_LIST.EditIndex = -1; Bind_Grd(); }

        protected void GRD_LIST_RowEditing(object sender, GridViewEditEventArgs e)
        { GRD_LIST.EditIndex = (int)e.NewEditIndex; Bind_Grd(); }

        protected void GRD_LIST_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GRD_LIST.Rows[e.RowIndex];
            TextBox id = (TextBox)row.Cells[0].Controls[0];
            TextBox title = (TextBox)row.Cells[1].Controls[0];
            da_s.SubjectListEn_Tra("Upadte", Convert.ToInt32(id.Text), 0, title.Text);

            GRD_LIST.EditIndex = -1; Bind_Grd();
        }

        protected void LinkButton_Delete_Subject_Command1(object sender, CommandEventArgs e)
        {
            ds_s = da_s.SubjectListEn_Tra("Delete", Convert.ToInt32(e.CommandArgument), 0, "");
            Bind_Grd();
        }

        protected void LinkButton_Back_Level_Click(object sender, EventArgs e)
        {
            ds_s = da_s.SubjectListEn_Tra("Level_Back", Convert.ToInt32(HiddenField_Subjects_Id.Value), 0, "");
            HiddenField_Subjects_Id.Value = ds_s[0].SubGroup.ToString();
            Bind_Grd();
        }

        protected void LinkButton_Peroperties_Ins_Esit_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Properties_Id.Value = e.CommandArgument.ToString();
            set_peroperties_From();
            bind_Grd_Comapy();
        }
        protected void set_peroperties_From()
        {
            int id = Convert.ToInt32(HiddenField_Properties_Id.Value.ToString());
            ds_k = da_k.Select_Subid(id);
            ds_eshop = da_eshop.Select_Id(id);
            if (ds_k.Rows.Count > 0)
            {
                Button_propertis_Edit.Visible = true;
                Button_propertis_Insert.Visible = false;
                TextBox_R1.Text = ds_k[0].r1;
                TextBox_R2.Text = ds_k[0].r2;
                TextBox_R3.Text = ds_k[0].r3;
                TextBox_R4.Text = ds_k[0].r4;
                TextBox_R5.Text = ds_k[0].r5;
                TextBox_R6.Text = ds_k[0].r6;
                TextBox_R7.Text = ds_k[0].r7;
                TextBox_R8.Text = ds_k[0].r8;
                TextBox_R9.Text = ds_k[0].r9;
                TextBox_R10.Text = ds_k[0].r10;
                TextBox_R11.Text = ds_k[0].r11;
                TextBox_R12.Text = ds_k[0].r12;

                TextBox_q1.Text = ds_k[0].q1;
                TextBox_q2.Text = ds_k[0].q2;
                TextBox_q3.Text = ds_k[0].q3;
                TextBox_q4.Text = ds_k[0].q4;
                TextBox_q5.Text = ds_k[0].q5;
                TextBox_q6.Text = ds_k[0].q6;
                TextBox_q7.Text = ds_k[0].q7;
                TextBox_q8.Text = ds_k[0].q8;
                TextBox_q9.Text = ds_k[0].q9;
                TextBox_q10.Text = ds_k[0].q10;
                TextBox_q11.Text = ds_k[0].q11;
                TextBox_q12.Text = ds_k[0].q12;

                if (ds_eshop.Rows.Count > 0)
                {
                    TextBox_Expire_Time.Text = ds_eshop[0].Expire_Time.ToString();
                    TextBox_Price_Kit.Text = ds_eshop[0].Price_Kit.ToString();
                }
            }
            else
            {
                Button_propertis_Edit.Visible = false;
                Button_propertis_Insert.Visible = true;
            }
        }
        #endregion


        #region Company peroperties
        protected void bind_Grd_Comapy()
        {
            ds_c = da_c.Select_All();
            GRD_Company.DataSource = ds_c;
            GRD_Company.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        #endregion

        protected void Button_propertis_Insert_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField_Properties_Id.Value.ToString());
            da_k.Insert_New(id, TextBox_R1.Text.ToString(), TextBox_R2.Text.ToString(), TextBox_R3.Text.ToString(), TextBox_R4.Text.ToString(), TextBox_R5.Text.ToString(),
                                         TextBox_R6.Text.ToString(), TextBox_R7.Text.ToString(), TextBox_R8.Text.ToString(), TextBox_R9.Text.ToString(), TextBox_R10.Text.ToString(), TextBox_R11.Text.ToString(), TextBox_R12.Text.ToString(),
                                         TextBox_q1.Text.ToString(), TextBox_q2.Text.ToString(), TextBox_q3.Text.ToString(), TextBox_q4.Text.ToString(), TextBox_q5.Text.ToString(), TextBox_q6.Text.ToString(), TextBox_q7.Text.ToString(), TextBox_q8.Text.ToString(),
                                         TextBox_q9.Text.ToString(), TextBox_q10.Text.ToString(), TextBox_q11.Text.ToString(), TextBox_q12.Text.ToString(), DateTime.Now, "", "", "");
            da_li.Delete_By_Id(id);

            StringBuilder str = new StringBuilder();
            for (int i = 0; i < GRD_Company.Rows.Count; i++)
            {
                GridViewRow row = GRD_Company.Rows[i];
                bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
                if (isChecked)
                {
                    da_li.Insert_New(id, Convert.ToInt32(GRD_Company.Rows[i].Cells[0].Text));
                }
            }
            Bind_Grd();
        }

        protected void Button_propertis_Edit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField_Properties_Id.Value.ToString());
            da_k.Update_Item(TextBox_R1.Text.ToString(), TextBox_R2.Text.ToString(), TextBox_R3.Text.ToString(), TextBox_R4.Text.ToString(), TextBox_R5.Text.ToString(),
                                         TextBox_R6.Text.ToString(), TextBox_R7.Text.ToString(), TextBox_R8.Text.ToString(), TextBox_R9.Text.ToString(), TextBox_R10.Text.ToString(), TextBox_R11.Text.ToString(), TextBox_R12.Text.ToString(),
                                         TextBox_q1.Text.ToString(), TextBox_q2.Text.ToString(), TextBox_q3.Text.ToString(), TextBox_q4.Text.ToString(), TextBox_q5.Text.ToString(), TextBox_q6.Text.ToString(), TextBox_q7.Text.ToString(), TextBox_q8.Text.ToString(),
                                         TextBox_q9.Text.ToString(), TextBox_q10.Text.ToString(), TextBox_q11.Text.ToString(), TextBox_q12.Text.ToString(), id);

            da_li.Delete_By_Id(id);
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < GRD_Company.Rows.Count; i++)
            {
                GridViewRow row = GRD_Company.Rows[i];
                bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
                if (isChecked)
                {
                    // da_li.Insert_New(id, Convert.ToInt32(GRD_Company.Rows[i].Cells[0].Text));
                    Response.Write(GRD_Company.Rows[i].Cells[0].Text);
                }
            }
            Bind_Grd();
        }


        #region Company Peroperties
        void bind_Grd_Company()
        {
            ds_c = da_c.Select_All();
            Grd_Copmany.DataSource = ds_c;
            Grd_Copmany.DataBind();
            MultiView1.ActiveViewIndex = 3;
        }

        protected void Button_Company_Insert_Click(object sender, EventArgs e)
        { da_c.Insert_New(TextBox_COName.Text, TextBox_CODate.Text, TextBox_COCountry.Text, TextBox_COShort.Text, TextBox_COAbout.Text); bind_Grd_Company(); }

        protected void Button_Company_Edit_Click(object sender, EventArgs e)
        { da_c.Update_Item(TextBox_COName.Text, TextBox_CODate.Text, TextBox_COCountry.Text, TextBox_COShort.Text, TextBox_COAbout.Text, Convert.ToInt32(HiddenField_Company_Id.Value)); bind_Grd_Company(); }

        protected void LinkButton_Delete_Company_Command(object sender, CommandEventArgs e)
        { int id = Convert.ToInt32(e.CommandArgument.ToString()); da_c.Delete_Item(id); bind_Grd_Company(); }

        protected void LinkButton_Edit_Company_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            ds_c = da_c.Select_Item(id);
            TextBox_COName.Text = ds_c[0].COName.ToString();
            TextBox_CODate.Text = ds_c[0].CODate.ToString();
            TextBox_COCountry.Text = ds_c[0].COCountry.ToString();
            TextBox_COShort.Text = ds_c[0].COShort.ToString();
            TextBox_COAbout.Text = ds_c[0].COAbout.ToString();
            HiddenField_Company_Id.Value = ds_c[0].ID.ToString();
            MultiView1.ActiveViewIndex = 2;
            Button_Company_Edit.Visible = true;
            Button_Company_Insert.Visible = false;
        }

        protected void LinkButton_Edit_Company_Click(object sender, EventArgs e)
        { bind_Grd_Company(); }

        protected void LinkButton_Insert_New_Company_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            Button_Company_Edit.Visible = false;
            Button_Company_Insert.Visible = true;
        }

        protected void LinkButton_Back_ToList_Click1(object sender, EventArgs e)
        { HiddenField_Subjects_Id.Value = "1"; Bind_Grd(); }

        protected void LinkButton_Back_ToList_Click(object sender, EventArgs e)
        { bind_Grd_Company(); }
        #endregion


        #region Attachmet File
        protected void Button_Doc_Click(object sender, EventArgs e)
        {
            //int id_ = Convert.ToInt32(HiddenField_Company_attach_Id.Value);
            //if (FileUpload_DOc.HasFile)
            //{
            //    int? offId = 0;
            //    string ex_ = MyFileUploader.IsExtension(FileUpload_DOc);
            //    da_d.Product_doc_Tra(id_, ex_, "new", Text_Comment.Text.ToString(), ref offId);
            //    MyFileUploader.SaveFile(FileUpload_DOc, "Up\\Product_Doc", Convert.ToInt32(offId), "*", "*", "*", this.Server);
            //    Bind_Grd_Doc();
            //}
            //else { }
        }

        void Bind_Grd_Doc()
        {
            //int? offId = 0;
            //ds_d = da_d.Product_doc_Tra(Convert.ToInt32(HiddenField_Company_attach_Id.Value), "", "select", "", ref offId);
            //GridView_docs.DataSource = ds_d;
            //GridView_docs.DataBind();
        }
        protected void LinkButton_Attach_File_Command(object sender, CommandEventArgs e)
        { HiddenField_Company_attach_Id.Value = e.CommandArgument.ToString(); Bind_Grd_Doc(); MultiView1.ActiveViewIndex = 4; }

        protected void delete_Command(object sender, CommandEventArgs e)
        {
            //int id_ = Convert.ToInt32(e.CommandArgument);
            //int? offId = 0;
            //da_d.Product_doc_Tra(id_, "", "delete", "", ref offId);
            //Bind_Grd_Doc();
        }

        protected void DOwn_Command(object sender, CommandEventArgs e)
        {
            //try
            //{
            //    int? offId = 0;
            //    int id = Convert.ToInt32(e.CommandArgument);
            //    //DS_MainPhasco.Product_DocRow dr;
            //    //dr = da_d.Product_doc_Tra(id, "", "select1", "", ref offId)[0];
            //    string singleName = MyFileUploader.GetImageName("~/Up/Product_Doc", id, dr.ex_.ToString());
            //    string filename = Server.MapPath(singleName);
            //    FileStream myStream = new FileStream(filename, FileMode.Open, FileAccess.Read);
            //    byte[] buffer = new byte[(int)myStream.Length];
            //    myStream.Read(buffer, 0, (int)myStream.Length);
            //    myStream.Close();
            //    Response.Clear();
            //    Response.ContentType = "application/octet-stream";
            //    Response.AddHeader("Content-Length", buffer.Length.ToString());
            //    Response.AddHeader("Content-Disposition", "attachment; filename=phascodocument_" +id.ToString()+ dr.ex_.ToString());
            //    Response.BinaryWrite(buffer);
            //    Response.End();
            //}
            //catch (Exception) { }
        }
        protected void Link_Back_Click(object sender, EventArgs e)
        {
            Bind_Grd();
        }
        #endregion









    }
}
