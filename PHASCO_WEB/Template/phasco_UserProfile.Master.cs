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
using Membership_Manage;
using DataAccessLayer.Users;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB.Template
{
    public partial class phasco_UserProfile : System.Web.UI.MasterPage
    {


        TBL_User_Profile User_P = new TBL_User_Profile();
        TBL_User_Friends da_fr = new TBL_User_Friends();
        TBL_User_Rated_Archive da_rated = new TBL_User_Rated_Archive();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                { set_UserProfile(); Set_Rated(); }
                else
                { return; }
            }
        }


        void Set_Rated()
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
            DataList_Rated.DataSource = da_rated.TBL_User_Rated_Archive_SP(3, 0, id, 0, 0);
            DataList_Rated.DataBind();
        }
        void set_UserProfile()
        {
            DataTable dtt;
            int id = 0;
            try
            { id = int.Parse(Request.QueryString["id"].ToString()); }
            catch (Exception)
            { return; }

            if (UserOnline.User_Online_Valid())
            {
                if (UserOnline.id().ToString() != id.ToString())
                { HyperLink_PM.Enabled = true; }
                else
                { HyperLink_PM.Enabled = false; }
            }
            else HyperLink_PM.Visible = false;
            dtt = User_P.Users_Profile_Tra_DT("Select_Item", id, "", "", "", "", "", "", "", DateTime.Now);
            if (dtt.Rows.Count > 0)
            {
                Label_Citty.Text = dtt.Rows[0]["City"].ToString();
                Label_Job.Text = dtt.Rows[0]["job"].ToString();
                Label_Maghata.Text = dtt.Rows[0]["Maghata"].ToString();
                Label_OfficeName.Text = dtt.Rows[0]["OfficeName"].ToString();
                Label_Reshte.Text = dtt.Rows[0]["Reshte"].ToString();
                //  Label_Takhasos.Text = dtt.Rows[0]["Takhasos"].ToString();
                Label_Point.Text = dtt.Rows[0]["Point"].ToString();
                Image_PhascoRate.ImageUrl = "~//images//star" + dtt.Rows[0]["UserRole"].ToString() + ".gif";

                if (dtt.Rows[0]["Image"].ToString() == "0") img_User.Src = @"/phascoupfile/Userphoto/Nopic.jpg";
                if (dtt.Rows[0]["Image"].ToString() == "1") img_User.Src = @"~/phascoupfile/Userphoto/" + dtt.Rows[0]["id"].ToString() + ".jpg";

                if (dtt.Rows[0]["UserRole"].ToString() == "5") KingIcon.Visible = true;
                else KingIcon.Visible = false;

                if (dtt.Rows[0]["Sex"].ToString() == "1") Label_Sex.Text = "زن";
                if (dtt.Rows[0]["Sex"].ToString() == "0") Label_Sex.Text = "مرد";


                Label_Uid.Text = dtt.Rows[0]["Uid"].ToString();
                Label_Name.Text = dtt.Rows[0]["name"].ToString();
                DateTime dtm;
                dtm = Convert.ToDateTime(dtt.Rows[0]["BirthDay"].ToString());
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

                Label_Birth.Text = sunDate.Weekday.ToString();


                HyperLink_PM.NavigateUrl = "~/SendMss.aspx?id=" + Request.QueryString["id"].ToString();
                HyperLink_WebLog.NavigateUrl = "~/Wblog.aspx?Bid=" + Request.QueryString["id"].ToString();
                alink_allfre.HRef = "../UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=all-cat";

                DataList_User.DataSource = da_fr.Insert_del_update(6, id);
                DataList_User.DataBind();
            }
            //else
            //    MultiView1.ActiveViewIndex = 1;

        }

        public string image_Check(string id_)
        {
            string ImageName = MyFileUploader.GetImageSingleName(int.Parse(id_.ToString()), ".jpg").ToString();
            return ImageName;
        }

        public string addfriend(string id)
        {
            if (Membership_Manage.UserOnline.User_Online_Valid() == true)
                return "<a class='text-green' href='UserSearch.aspx?userid=" + id + "'><i class='fa fa-plus'></i> افزودن به دوستان</a>";
            else return "<img src='images/addtolist_offline.png'  />";


        }

        public string Images(int Image, int id, int sex)
        {

            if (Image == 1) return "phascoupfile/Userphoto/" + id.ToString() + ".jpg";

            if (sex == 0) return "phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "phascoupfile/Userphoto/Nopic_female.jpg";
            return "~/phascoupfile/Userphoto/Nopic_female.jpg";

        }
    }
}
