using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.Component;
using PHASCO_Shopping.BLL;
using System.Data;
using System.Globalization;

namespace PHASCO_Shopping.bizpanel
{
    public partial class News : System.Web.UI.Page
    {
        #region Dataset
        //PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter da_n = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.NewsTableAdapter();
        //DS_MainPhasco.NewsDataTable ds_n = new DS_MainPhasco.NewsDataTable();

        //DS_MainPhasco.News_CommentDataTable ds_c = new DS_MainPhasco.News_CommentDataTable();
        //PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.News_CommentTableAdapter da_c = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.News_CommentTableAdapter();
        TBL_News da_news = new TBL_News();
        DataTable dt;

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = "News";
            //if (adminUser.UserValid() == true)
            //{
            //    //DataTable dt = new DataTable();
            //    dt = adminUser.check_Page(6, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), this.Page.Title, 0, null);
            //    if (dt.Rows.Count > 0)
            //    {
                    if (!IsPostBack) { MultiView1.ActiveViewIndex = 0; }
                    if (Request.QueryString["IdArchive_m"] != null && Request.QueryString["IdArchive_d"] != null)
                    { bind_Grd_Lit_Edit(); }
              //  }
            //    else
            //        Response.Redirect("AccessDenied.aspx");
            //}
            //else
            //    Response.Redirect("AccessDenied.aspx");
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

            string Chekcer;
            PersianCalendar prs = new PersianCalendar();
            string comment_ = CheckBox.Checked.ToString();
            dt = da_news.News_Insert_Edit(0, "Insert", Title.Text.ToString(), FCKeditor1.Value, "none.jpg", DropDownList1.SelectedValue.ToString(), comment_,
               Convert.ToInt32(prs.GetMonth(DateTime.Now)), Convert.ToInt32(prs.GetYear(DateTime.Now)));
            int idoffer = int.Parse(dt.Rows[0][0].ToString());
            if (MyFileUploader.IsHasFile(FileUpload1))
            {
                MyFileUploader.SaveFile(FileUpload1, "News\\images", Convert.ToInt32(idoffer), ".jpg", ".jpeg", ".jpg", this.Server);
                string filename = MyFileUploader.GetImageSingleName_calcul(Convert.ToInt32(idoffer), ".jpg");

                string filenam_path = Server.MapPath("~\\News\\images\\" + filename);
                string path = Server.MapPath("~//News//images//");
                MyFileUploader.ResizeImage(path + filename, path +  filename, 200, 200, true);

                da_news.News_Insert_Edit(idoffer, "Update_Image", "", "", filename, "", "", 0, 0);
            }
            Title.Text = "";
            CheckBox.Checked = false;
        }
        #endregion

        #region Edit List
        protected void LinkButton_Edit_News_Click(object sender, EventArgs e)
        { Grid_Bind_Arc(); }

        void bind_Grd_Lit_Edit()
        {
            dt = da_news.News_Insert_Edit(Convert.ToInt32(Request.QueryString["Id"]), "SeLect_Edit", "", "", "", "", "", Convert.ToInt32(Request.QueryString["IdArchive_m"]), Convert.ToInt32(Request.QueryString["IdArchive_d"]));
            Grid_editList.DataSource = dt;
            Grid_editList.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Grid_Bind_Arc()
        {
            dt = da_news.News_Insert_Edit(1, "Archive_List", "", "", "", "", "", 0, 0);
            DataList_archive.DataSource = dt;
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
            da_news.News_Insert_Edit(Convert.ToInt32(e.CommandArgument), "Delete_News", "", "", "", "", "", 0, 0);
            bind_Grd_Lit_Edit();
        }

        protected void Link_Edit_News_Command(object sender, CommandEventArgs e)
        {
            dt = da_news.News_Insert_Edit(Convert.ToInt32(e.CommandArgument), "SeLect_Item", "", "", "", "", "", 0, 0);
            Title.Text = dt.Rows[0]["Title"].ToString();
            FCKeditor1.Value = dt.Rows[0]["News"].ToString();
            DropDownList1.SelectedValue = dt.Rows[0]["lang"].ToString();
            HiddenField_Edit_Id.Value = dt.Rows[0]["Id"].ToString();
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
            da_news.News_Insert_Edit(id_, "Edit_Item", Title.Text.ToString(), FCKeditor1.Value, "", DropDownList1.SelectedValue.ToString(), checker, 0, 0);
            MultiView1.ActiveViewIndex = 0;
            if (MyFileUploader.IsHasFile(FileUpload1))
            {
                MyFileUploader.SaveFile(FileUpload1, "News\\images", Convert.ToInt32(id.ToString()), ".jpg", ".jpeg", ".jpg", this.Server);
                string filename = MyFileUploader.GetImageSingleName_calcul(Convert.ToInt32(id.ToString()), ".jpg");
                da_news.News_Insert_Edit(Convert.ToInt32(id.ToString()), "Update_Image", "", "", filename, "", "", 0, 0);
            }
            Button_Insert_New.Visible = true;

            lbl_alarm.Text = "خبر ويرايش شد";
            MultiView1.ActiveViewIndex = 0;
        }
        #endregion

        #region Nazarat
        void bind_Nazar()
        {
            //ds_c = da_c.select_By_id(Convert.ToInt32(HiddenField_Nazar_Id.Value));
            dt = da_news.News_Insert_Edit(Convert.ToInt32(HiddenField_Nazar_Id.Value), "Select_all_comm", "", "", "", "", "", 0, 0);
            GRD_Comm.DataSource = dt;
            GRD_Comm.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Link_delete_Commnet_Command(object sender, CommandEventArgs e)
        {
            //da_c.Delete_Item(Convert.ToInt32(e.CommandArgument));
            da_news.News_Insert_Edit(Convert.ToInt32(e.CommandArgument), "Delete_COmm", "", "", "", "", "", 0, 0);
            bind_Nazar();
        }

        protected void lnk_Command(object sender, CommandEventArgs e)
        {
            //da_c.Update_Active(Convert.ToInt32(e.CommandArgument));
            da_news.News_Insert_Edit(Convert.ToInt32(e.CommandArgument), "Active_COmm", "", "", "", "", "", 0, 0);
            bind_Nazar();
        }
        #endregion

    }
}