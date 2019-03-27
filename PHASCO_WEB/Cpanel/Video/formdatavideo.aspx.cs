using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using DataAccessLayer.Video;
using phasco.BaseClass;
using Membership_Manage;
using BiztBiz;
using BusinessAccessLayer;


namespace NewFifa.Admin.VideoManage
{
    public partial class formdatavideo : System.Web.UI.Page
    {
        tblVideo da_Video = new tblVideo();
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) Initialize();
        }

        private void Initialize()
        {
            if (Request.QueryString["s"] != null)
                Setviewedit();
        }
        private void Setviewedit()
        {
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["vid"]);
            dt = da_Video.tblVideo_SP(5, videoId, 0, 0, "", "", "", "", "", DateTime.Now, 0, 0, 0);
            TextBox_VideoName.Text = dt.Rows[0]["VideoName"].ToString();
            TextBox_VideoDescription.Text = dt.Rows[0]["VideoDescription"].ToString();
            TextBox_VideoTag.Text = dt.Rows[0]["VideoTag"].ToString();
            Image_View.ImageUrl = "~/phascoupfile/Video/thumbnail/Small/" + dt.Rows[0]["VideoPhotoname"].ToString();

            HiddenField_UserId.Value =dt.Rows[0]["UserID"].ToString(); 

            DropDownList_CategorieID.SelectedValue = dt.Rows[0]["CategorieID"].ToString();
            HiddenField_Photoname.Value = dt.Rows[0]["VideoPhotoname"].ToString();

            System.Web.UI.HtmlControls.HtmlGenericControl Span = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            string filename = dt.Rows[0]["VideoFilename"].ToString();
            string photo = "/phascoupfile/Video/thumbnail/Orginal/" + dt.Rows[0]["VideoPhotoname"].ToString();
            Span.Attributes.Add("style", "z-index: 80");
            string InnerHtml_ = "<a href=\"/phascoupfile/Video/file/" + filename + "\" style=\"display:block; width:500px; height:300px;\" id=\"player\"  ></a> ";
            Span.InnerHtml = InnerHtml_;


            PlaceHolder1.Controls.Add(Span);
             


            Button_Edit.Visible = true;
            Button_Insert.Enabled = false;
            FileUpload_Video.Enabled = false;   
        }

        private string GetDate(string date)
        {
            string Date = "";
            if (!string.IsNullOrEmpty(date))
            { Date = QLink.Helpers.DateHelper.GregorianToJalaali(date, 3); }
            return Date;
        }


        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            string VideoFilename_ = "";
            string VideoPhotoname_ = GetRandomPasswordUsingGUID(30);
            string VideoFileame_ = VideoPhotoname_;
            string VideoPhotoname_Extension = VideoPhotoname_ + ".jpg";
            int CategorieID_ = int.Parse(DropDownList_CategorieID.SelectedValue.ToString());

            if (FileUpload_Photo.PostedFile != null && !string.IsNullOrEmpty(FileUpload_Photo.FileName))
            {
                if (!IsValidFile(FileUpload_Photo.FileName.Trim(), "jpg,jpeg"))
                { Lbl_Alarm.Text = "فرمت تصویر باید از نوع jpg,jpeg باشد"; return; }

                if (!IsValidFile(FileUpload_Video.FileName.Trim(), "flv,3gp"))
                { Lbl_Alarm.Text = "فرمت ویدیو باید از نو flv,3gp باشد  "; return; }

                HttpPostedFile Pic = FileUpload_Photo.PostedFile;
                string filename = Server.MapPath("~//phascoupfile//Video//thumbnail//");
                ImageHelper.UploadAndResizeImage(Pic, filename, VideoPhotoname_Extension, 300, 200);


                VideoFileame_ = VideoFileame_ + MyFileUploader.IsExtension(FileUpload_Video);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Video, "~//phascoupfile//Video//file//", VideoFileame_, "*", "*", "*", this.Server);

                string ID_ = da_Video.tblVideo_SP(1, 0, CategorieID_, 49164, VideoFileame_, VideoPhotoname_Extension,

                TextBox_VideoName.Text, TextBox_VideoDescription.Text, TextBox_VideoTag.Text, DateTime.Now, 1, 1).Rows[0]["id"].ToString();
                Lbl_Alarm.Text = "ویدیو با موفقیت ثبت شد.";
                TextBox_VideoName.Text = TextBox_VideoTag.Text = TextBox_VideoDescription.Text = "";
            }
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

            if (strValidImageFile.Length <= 0)
            {
                return false;
            }

            for (int indx = 0; indx < strValidImageFile.Length; indx++)
            {
                if (strFileType.ToUpper() == strValidImageFile[indx].ToUpper())
                {
                    blnIsValid = true;
                }
            }
            return blnIsValid;
        }

        public string GetRandomPasswordUsingGUID(int length)
        {
            string guidResult = System.Guid.NewGuid().ToString();
            guidResult = guidResult.Replace("-", string.Empty);
            string date_ = DateTime.Now.ToShortDateString().Replace("/", "");
            return date_ + guidResult.Substring(0, length);
        }

        protected void Button_Edit_Click(object sender, EventArgs e)
        {
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["vid"]);
            int CategorieID_ = int.Parse(DropDownList_CategorieID.SelectedValue.ToString());

            da_Video.tblVideo_SP(2, videoId, CategorieID_, 0, "", HiddenField_Photoname.Value,
         TextBox_VideoName.Text, TextBox_VideoDescription.Text, TextBox_VideoTag.Text, DateTime.Now, 1, 1) ;

            if (FileUpload_Photo.PostedFile != null && !string.IsNullOrEmpty(FileUpload_Photo.FileName))
            {
                if (!IsValidFile(FileUpload_Photo.FileName.Trim(), "jpg,jpeg"))
                { Lbl_Alarm.Text = "فرمت تصویر باید از نوع jpg,jpeg باشد"; return; }

                HttpPostedFile Pic = FileUpload_Photo.PostedFile;
                string filename = Server.MapPath("~//phascoupfile//Video//thumbnail//");
                ImageHelper.UploadAndResizeImage(Pic, filename, HiddenField_Photoname.Value, 300, 200);
            }
            Lbl_Alarm.Text = "ویدیو با موفقیت ویرایش شد.";

            int uid =int.Parse(HiddenField_UserId.Value);
            #region Insert Notification
            // Insert Notification
            //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
            NotificationUsers.AddNewNotification(0, uid, 0, "http://www.phasco.com/video/watch.aspx?Vid=" + videoId.ToString(), 4, 1, 15, TextBox_VideoName.Text);
            #endregion


            Button_Edit.Visible = false;
            Button_Insert.Enabled = true;
            FileUpload_Video.Enabled = true;
        }
    }
}