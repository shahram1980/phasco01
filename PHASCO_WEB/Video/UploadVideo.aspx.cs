using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DataAccessLayer.Video;
using NewFifa;
using Membership_Manage;

namespace PHASCO_WEB.Video
{
    public partial class UploadVideo : System.Web.UI.Page
    {
        public string sss;
        tblVideo da_Video = new tblVideo();
        protected void Page_Load(object sender, EventArgs e)
        {
            alarmAgree.Visible = false;
            if (!IsPostBack) { Initialize(); }
        }

        private void Initialize()
        {
            if (Request.QueryString["s"] != null)
                if (Request.QueryString["s"].ToString() == "Succ") { MultiView1.ActiveViewIndex = 2; return; }

            MultiView1.ActiveViewIndex = 0;
            if (!UserOnline.User_Online_Valid())
            {
                ImageButton_agrement_NextLevel.Visible = false;
                alarmAgree.Visible = true;
                Label_alarmAgree.Text = "کاربر گرامی برای ارسال ویدئو لازم است ابتدا در سایت  " + "<a href='../Register.aspx' title='عضویت'>عضویت</a>" + " و Login  کنید";
                return;
            }

        }

        public string GetRandomPasswordUsingGUID(int length)
        {
            string guidResult = System.Guid.NewGuid().ToString();
            guidResult = guidResult.Replace("-", string.Empty);
            string date_ = DateTime.Now.ToShortDateString().Replace("/", "");
            return date_ + guidResult.Substring(0, length);
        }

        protected void Button_Nexttocomplete_Click(object sender, EventArgs e)
        {
            TextBox_VideoName.Text = txtNameVideo.Text;
            MultiView1.ActiveViewIndex = 2;
        }



        protected void Button_Nexttocomplete_Click(object sender, ImageClickEventArgs e)
        {
            string VideoPhotoname_ = txtNameVideo.Text;
            string VideoFileame_ = VideoPhotoname_ + ".flv";
            string VideoPhotoname_Extension = VideoPhotoname_ + ".jpg";
            int CategorieID_ = int.Parse(DropDownList_CategorieID.SelectedValue.ToString());

            if (FileUpload_Photo.PostedFile != null && !string.IsNullOrEmpty(FileUpload_Photo.FileName))
            {
                if (!IsValidFile(FileUpload_Photo.FileName.Trim(), "jpg,jpeg"))
                { Lable_Alaram.Text = "فرمت تصویر باید از نوع jpg,jpeg باشد"; return; }

                HttpPostedFile Pic = FileUpload_Photo.PostedFile;
                string filename = Server.MapPath("~//phascoupfile//Video//thumbnail//");
                ImageHelper.UploadAndResizeImage(Pic, filename, VideoPhotoname_Extension, 300, 200);
            }

            da_Video.tblVideo_SP(1, 0, CategorieID_, UserOnline.id(), VideoFileame_, VideoPhotoname_Extension,
          TextBox_VideoName.Text, TextBox_VideoDescription.Text, TextBox_VideoTag.Text, DateTime.Now, 1, 0);



            Response.Redirect("UploadVideo.aspx?s=Succ");
        }
        public static string GetFileExtension(string strFileName)
        {
            int intIndex = strFileName.LastIndexOf(".");
            string strExtension = strFileName.Substring(intIndex + 1);
            return strExtension;
        }
        public static bool IsValidFile(string strFilename, string UPLOADFILETYPE)
        {
            string strFileType = GetFileExtension(strFilename);
            string[] strValidImageFile = UPLOADFILETYPE.Split(new char[] { ',' });
            bool blnIsValid = false;

            if (strValidImageFile.Length <= 0) { return false; }

            for (int indx = 0; indx < strValidImageFile.Length; indx++)
            { if (strFileType.ToUpper() == strValidImageFile[indx].ToUpper()) { blnIsValid = true; } }

            return blnIsValid;
        }

        protected void ImageButton_agrement_NextLevel_Click(object sender, EventArgs e)
        {
            if (!CheckBox_Agree.Checked)
            {
                alarmAgree.Visible = true;
                Label_alarmAgree.Text = "برای ارسال ویدئو لازم است که تیک موافقت رو بزنید";
                return;
            }

            string VideoPhotoname_ = GetRandomPasswordUsingGUID(30);
            string VideoFileame_ = VideoPhotoname_;
            string VideoPhotoname_Extension = VideoPhotoname_ + ".jpg";

            Div_Top_Alarm.Visible = true;
            MultiView1.ActiveViewIndex = 1;
            txtNameVideo.Text = VideoFileame_;
        }

    }
}