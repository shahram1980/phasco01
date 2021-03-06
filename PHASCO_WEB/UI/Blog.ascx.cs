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
using phasco_webproject.BaseClass;
using PHASCO_WEB.DAL;

namespace phasco_webproject.UI
{
    public partial class Blog : UnSecureForm
    {
        int id = 0;
        #region SetPage
        public override string FormTitle
        { get { return "وب لاگ"; } }

        public override MasterPageColection MasterPageName
        { get { return MasterPageColection.Phasco01; } }
        #endregion
        #region DataSet
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_BlogTableAdapter da_blg = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_BlogTableAdapter();
        DS_MainPhasco.Users_BlogDataTable dt_blg = new DS_MainPhasco.Users_BlogDataTable();

        DS_MainPhasco.UsersDataTable dt_usr = new DS_MainPhasco.UsersDataTable();
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da_usr = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Set_UserProfile(); bind_Grd(); }
        }
        void Set_UserProfile()
        {
            try { id = Convert.ToInt32(Request.QueryString["Bid"].ToString()); }
            catch (Exception) { MultiView1.ActiveViewIndex = 0; return; }
            dt_usr = da_usr.Select_Id(id);
            Label_Name.Text = dt_usr[0].Name + " " + dt_usr[0].Famil;
            Label_Uid.Text = dt_usr[0].Uid;
            if (dt_usr[0].Image == 1) Image_User.ImageUrl = MyFileUploader.GetImageName("~/phascoupfile/Userphoto/", id, "jpg");
            else Image_User.ImageUrl = "~/phascoupfile/Userphoto/Nopic.jpg";

            if (phasco_webproject.BaseClass.User_Online_Valid())
            {
                if (UserOnline.id().ToString() != id.ToString())
                    ImageButton_SendMail.Visible = true;
                else ImageButton_SendMail.Visible = false;
            }
            else ImageButton_SendMail.Visible = false;
        }
        void bind_Grd()
        {

            try { id = Convert.ToInt32(Request.QueryString["Bid"].ToString()); }
            catch (Exception) { MultiView1.ActiveViewIndex = 0; return; }

            dt_blg = da_blg.Users_Blog_Tra(null, "Select_5", id, null, null, null, null);
            GridView_Blog.DataSource = dt_blg;
            GridView_Blog.DataBind();
            MultiView1.ActiveViewIndex = 1;

        }

        protected void ImageButton_SendMail_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx?page=SendMss&id=" + Request.QueryString["Bid"].ToString());
        }
    }
}