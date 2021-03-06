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
using System.IO;
using Membership_Manage;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB
{
    public partial class UserGallery : System.Web.UI.Page
    {

        User_Gallery_Tbl da = new User_Gallery_Tbl();
        DataTable dt;
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "سایت تخصصی علوم آزمایشگاهی مقالات اطلس ها وبلاگ ها پرسش و پاسخ علمی اخبار لیست کامل آزمایشگاه ها شرکت های تجهیزات و پزشکی با جوایز ارزشمند .";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid()) { Response.Redirect("Default.aspx"); }
            if (!IsPostBack) Bind_Gallery();
        }

        protected void Button_Images_Command(object sender, CommandEventArgs e)
        {
            if (!MyFileUploader.IsHasFile(FileUpload_Image_Big))
            { Lbl_alarm.Text = "تصویر بزرگ انتخاب نشده"; return; }
            else
            {
                string Ext = MyFileUploader.IsExtension(FileUpload_Image_Big);
                if (Ext.ToLower() == ".jpg" || Ext.ToLower() == ".jpeg")
                {
                    dt = da.User_Gallery_Tra("Select_Uid_Count", 0, UserOnline.id(), "");
                    if (dt.Rows.Count > 0)
                    {
                        if (int.Parse(dt.Rows[0]["id"].ToString()) >= 10)
                        { Lbl_alarm.Text = "شما مجاز هستید نهایتا 10 تصویر داشته باشید"; return; }
                    }

                    int id_ = 0;

                    dt = da.User_Gallery_Tra("Insert", 0, UserOnline.id(), TextBox_Comment.Text.ToString());
                    id_ = int.Parse(dt.Rows[0]["Id"].ToString());

                    string Filename = MyFileUploader.GetImageSingleName(id_, ".jpg");
                 int res=   MyFileUploader.SaveFile_MyFileName(FileUpload_Image_Big, "~//phascoupfile//UserGallery//", "b" + Filename, ".jpg", ".jpeg", ".jpeg", this.Server);
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
                    string path = Server.MapPath("~//phascoupfile//UserGallery");
                    MyFileUploader.ResizeImage(path + "\\b" + Filename, path + "\\s" + Filename, 70, 50, true);

                    #region Insert Notification
                    // Insert Notification
                    //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                    NotificationUsers.AddNewNotification(0, UserOnline.id(), 0, "http://phasco.com/UserProfile.aspx?id=" + UserOnline.id() + "&mode=gallery", 1, 1, 10, "");
                    #endregion


                    //da.Product_Images_Gallery(id_, "UPDATE", Filename, Filename);
                    //
                    Lbl_alarm.Text = "تصویر با موفقيت ارسال گردید";
                    Bind_Gallery();
                }
                else
                { Lbl_alarm.Text = "تصویر بزرگ از نوع استاندارد نيست"; return; }
            }
        }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int id_ = Convert.ToInt32(e.CommandArgument);
            da.User_Gallery_Tra("delete", id_, 0, "");
            try
            {
                string name = Server.MapPath("~//phascoupfile//UserGallery//b" + MyFileUploader.GetImageSingleName(id_, ".jpg"));
                File.Delete(name);
                name = Server.MapPath("~//phascoupfile//UserGallery//s" + MyFileUploader.GetImageSingleName(id_, ".jpg"));
                File.Delete(name);
            }
            catch (Exception) { }


            Bind_Gallery();
        }

        protected void Bind_Gallery()
        {
            dt = da.User_Gallery_Tra("Select_Uid", 0, UserOnline.id(), "");
            DataList_Gallary.DataSource = dt;
            DataList_Gallary.DataBind();
        }

        public string image_Check(string id_)
        {
            string ImageName =  MyFileUploader.GetImageSingleName(int.Parse(id_.ToString()), ".jpg").ToString();
            return ImageName;
        }
    }
}
