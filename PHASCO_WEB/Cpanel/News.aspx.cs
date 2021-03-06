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
using System.Globalization;
using PHASCO_WEB.DAL;
using BusinessAccessLayer;

namespace phasco.Cpanel
{
    public partial class News : System.Web.UI.Page
    {
        #region Dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter da_n = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter();
        DS_MainPhasco.NewsDataTable ds_n = new DS_MainPhasco.NewsDataTable();

        DS_MainPhasco.News_CommentDataTable ds_c = new DS_MainPhasco.News_CommentDataTable();
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.News_CommentTableAdapter da_c = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.News_CommentTableAdapter();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { MultiView1.ActiveViewIndex = 0; }
            if (Request.QueryString["IdArchive_m"] != null && Request.QueryString["IdArchive_d"] != null)
            { bind_Grd_Lit_Edit(); }
        }

        #region Insert New News
        protected void LinkButton_Insert_New_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 0; }

        protected void Button_Insert_New_Click(object sender, EventArgs e)
        {
            if (MyFileUploader.IsHasFile(FileUpload1))
            {
                if (!MyFileUploader.IsExtensionTrue(FileUpload1, ".jpg") && !MyFileUploader.IsExtensionTrue(FileUpload1, ".jpeg"))
                { lbl_alarm.Text = "فایل انتخابی از نوع استاندارد نیست"; return; }
            }

            PersianCalendar prs = new PersianCalendar();
            string comment_ = CheckBox.Checked.ToString();
            int? idoffer = 0;
            int News_Mode = int.Parse(DropDownList_Mode.SelectedValue.ToString());

            int _IsSpecial = int.Parse(DropDownList_IsSpecial.SelectedValue.ToString());
            
            da_n.News_Insert_Edit(0, Title.Text.ToString(), RadEditor_Text.Value, "Insert", "none.jpg", DropDownList1.SelectedValue.ToString(),
                                  comment_, Convert.ToInt32(prs.GetMonth(DateTime.Now)), Convert.ToInt32(prs.GetYear(DateTime.Now)), News_Mode, _IsSpecial,0, TextBox_ShortNews.Text, TextBox_Keyword.Text, ref idoffer);
            if (MyFileUploader.IsHasFile(FileUpload1))
            {
                MyFileUploader.SaveFile(FileUpload1, "phascoupfile\\NewsImages", Convert.ToInt32(idoffer), ".jpg", ".jpeg", ".jpg", this.Server);
                string filename = MyFileUploader.GetImageSingleName_calcul(Convert.ToInt32(idoffer), ".jpg");
                da_n.Ins_Image(filename, Convert.ToInt32(idoffer));
            }
            //int id = cmd.Parameters("@Outid").Value; //+  Request.QueryString("Id")
            //lbl_Suc.Visible = true;
            Title.Text = "";
            CheckBox.Checked = false;
        }
        #endregion

        #region Edit List
        protected void LinkButton_Edit_News_Click(object sender, EventArgs e)
        { Grid_Bind_Arc(); }

        void bind_Grd_Lit_Edit()
        {
            int? id = 0;
            ds_n = da_n.News_Insert_Edit(Convert.ToInt32(Request.QueryString["Id"]), "", "", "SeLect_Edit", "", "Persian (Iran)", "", Convert.ToInt32(Request.QueryString["IdArchive_m"]), Convert.ToInt32(Request.QueryString["IdArchive_d"]), 0,0,0,"","", ref id);
            Grid_editList.DataSource = ds_n;
            Grid_editList.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Grid_Bind_Arc()
        {
            int? idoffer = 0;
            ds_n = da_n.News_Insert_Edit(1, "", "", "Archive_List", "", "", "", 0, 0,0,0,0,"","", ref idoffer);
            DataList_archive.DataSource = ds_n;
            DataList_archive.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Comment_User_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Nazar_Id.Value = e.CommandArgument.ToString();
            bind_Nazar();
        }

        protected void Link_Delete_Command(object sender, CommandEventArgs e)
        {
            int? id = 0;
            da_n.News_Insert_Edit(Convert.ToInt32(e.CommandArgument), "", "", "Delete_News", "", "", "", 0, 0,0,0,0,"","", ref id);
            bind_Grd_Lit_Edit();
        }

        protected void Link_Edit_News_Command(object sender, CommandEventArgs e)
        {
            ds_n = da_n.select_Item(Convert.ToInt32(e.CommandArgument));
            Title.Text = ds_n[0].Title.ToString();
            RadEditor_Text .Value= ds_n[0].News.ToString();
            DropDownList1.SelectedValue = ds_n[0].lang.ToString();
            HiddenField_Edit_Id.Value = ds_n[0].Id.ToString();
            MultiView1.ActiveViewIndex = 0;
            Button_News_Edit.Visible = true;
            Button_Insert_New.Visible = false;
        }

        protected void Button_News_Edit_Click(object sender, EventArgs e)
        {
            if (MyFileUploader.IsHasFile(FileUpload1))
            {
                if (!MyFileUploader.IsExtensionTrue(FileUpload1, ".jpg") && !MyFileUploader.IsExtensionTrue(FileUpload1, ".jpeg"))
                { lbl_alarm.Text = "فایل انتخابی از نوع استاندارد نیست"; return; }
            }
            string checker = Convert.ToString(CheckBox.Checked);
            int? id = 0;

            int id_ = Convert.ToInt32(System.Convert.ToInt32(HiddenField_Edit_Id.Value.ToString()));
            int News_Mode = Convert.ToInt32(DropDownList_Mode.SelectedValue.ToString());
            int _IsSpecial = int.Parse(DropDownList_IsSpecial.SelectedValue.ToString());

            da_n.News_Insert_Edit(id_, Title.Text.ToString(), RadEditor_Text.Value, "Edit_Item", "", DropDownList1.SelectedValue.ToString(), checker, 0, 0, News_Mode,_IsSpecial,0, TextBox_ShortNews.Text, TextBox_Keyword.Text,ref id);
            MultiView1.ActiveViewIndex = 0;
            if (MyFileUploader.IsHasFile(FileUpload1))
            {
                MyFileUploader.SaveFile(FileUpload1, "phascoupfile\\NewsImages", Convert.ToInt32(id.ToString()), ".jpg", ".jpeg", ".jpg", this.Server);
                string filename = MyFileUploader.GetImageSingleName_calcul(Convert.ToInt32(id.ToString()), ".jpg");
                da_n.Ins_Image(filename, Convert.ToInt32(id.ToString()));
            }
            Button_Insert_New.Visible = true;

            lbl_alarm.Text = "خبر ويرايش شد";
            MultiView1.ActiveViewIndex = 0;
        }
        #endregion

        #region Nazarat
        void bind_Nazar()
        {
            ds_c = da_c.select_By_id(Convert.ToInt32(HiddenField_Nazar_Id.Value));
            GRD_Comm.DataSource = ds_c;
            GRD_Comm.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Link_delete_Commnet_Command(object sender, CommandEventArgs e)
        {
            da_c.Delete_Item(Convert.ToInt32(e.CommandArgument));
            bind_Nazar();
        }

        protected void lnk_Command(object sender, CommandEventArgs e)
        {
            da_c.Update_Active(Convert.ToInt32(e.CommandArgument));
            bind_Nazar();
        }
        #endregion

    }
}
