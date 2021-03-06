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
using DataAccessLayer;
using Membership_Manage;

namespace PHASCO_WEB.Template
{
    public partial class Weblog : System.Web.UI.MasterPage
    {
        int id = 0;
        User_Blog da = new User_Blog();
        Users_Blog_Links da_Links = new Users_Blog_Links();
        User da_usr = new User();
        DataTable dt = new DataTable();
        public string userId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) { Bind_Archive(); Bind_Links(); Set_UserProfile(); } }
        void Bind_Archive()
        {
            int id = 0;
            try { id = Convert.ToInt32(Request.QueryString["Bid"].ToString()); }
            catch (Exception) { return; }
            DataTable dt = da.GetUsers_Blog_Tra_DT("Select_Archive", 0, "", id, "", 0, "");
            DataList_Archive.DataSource = dt;
            DataList_Archive.DataBind();
        }
        void Bind_Links()
        {
            int id = 0;
            try { id = Convert.ToInt32(Request.QueryString["Bid"].ToString()); }
            catch (Exception) { return; }
            DataTable dt = da_Links.Users_Blog_Links_Tra("select_Uid", 0, id, "", "");
            Repeater_Links.DataSource = dt;
            Repeater_Links.DataBind();
        }
        void Set_UserProfile()
        {
            if (Request.QueryString["OBid"] != null)
            {
                try { id = Convert.ToInt32(Request.QueryString["OBid"].ToString()); }
                catch (Exception) { return; }
                dt = da_usr.GetUsers_Tra_DT("select_byblog", id);
            }
            else
            {
                try { id = Convert.ToInt32(Request.QueryString["Bid"].ToString()); }
                catch (Exception) { return; }
                dt = da_usr.GetUsers_Tra_DT("select_Item", id);
            }

            try
            {
                userId = dt.Rows[0]["Id"].ToString();
                Label_Name.Text = dt.Rows[0]["Name"] + " " + dt.Rows[0]["Famil"];
                HyperLink_UserLine.Text = dt.Rows[0]["Uid"].ToString();
                HyperLink_UserLine.NavigateUrl = "../Wblog.aspx?Bid=" + dt.Rows[0]["Id"].ToString();
                if (UserOnline.User_Online_Valid())
                {
                    if (UserOnline.id().ToString() != id.ToString())
                    { HyperLink_PM.Visible = true; }
                    else
                    { HyperLink_PM.Visible = false; }
                }
                else HyperLink_PM.Visible = false;
                HyperLink_PM.Text = "ارسال پیام به " + dt.Rows[0]["name"].ToString();
                HyperLink_PM.NavigateUrl = "../SendMss.aspx?id=" + dt.Rows[0]["Id"].ToString();
                if (dt.Rows[0]["Image"]?.ToString() == "1") Image_User.ImageUrl = "~/phascoupfile/Userphoto/" + id.ToString() + ".jpg";
                else Image_User.ImageUrl = "~/phascoupfile/Userphoto/Nopic.jpg";
                TextBox_Url.Text = Request.Url.ToString();

            }
            catch (Exception)
            {
            }
        }
        protected void ImageButton_SendMail_Click(object sender, ImageClickEventArgs e)
        { Response.Redirect("SendMss.aspx?id=" + Request.QueryString["Bid"].ToString()); }
    }
}
