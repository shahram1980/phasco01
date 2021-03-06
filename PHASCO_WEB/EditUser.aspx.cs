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
using System.Globalization;
using Membership_Manage;
using DataAccessLayer.Users;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB
{
    public partial class EditUser : System.Web.UI.Page
    {
        #region dataset
        DataTable dt = new DataTable();
        #endregion
        int? refid = 0;
        TBL_User_Profile User_P = new TBL_User_Profile();
        User da_User = new User();

        #region Image

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
            if (!IsPostBack)
            {
                if (Request.QueryString["mode"] != null)
                    if (Request.QueryString["mode"].ToString() == "img")
                    {
                        try { if (Request.QueryString["del"].ToString() == "true") Label_Alarm.Text = "تصویر با موفقیت ارسال شد"; }
                        catch (Exception) { }

                        try { if (Request.QueryString["ins"].ToString() == "true") Label_Alarm.Text = "تصویر با موفقیت ارسال شد"; }
                        catch (Exception) { }
                        Label_Alarm.Text = "تصویر با موفقیت ارسال شد";

                        MultiView1.ActiveViewIndex = 0;
                        Image_Photo.ImageUrl = UserOnline.image();
                    }
                if (Request.QueryString["mode"].ToString() == "pro")
                {
                    try { if (Request.QueryString["upd"].ToString() == "true") Label_Alarm.Text = "ویرایش با موفقیت انجام شد"; }
                    catch (Exception) { }
                    set_UserProfile();
                }

                if (Request.QueryString["mode"].ToString() == "pss")
                {
                    try { if (Request.QueryString["upd"].ToString() == "true") Label_Alarm.Text = "نام رمز با موفقيت تغییر کرد"; }
                    catch (Exception) { }
                    MultiView1.ActiveViewIndex = 2;
                }
            }
        }
        protected void Button_UpLoadPhoto_Click(object sender, EventArgs e)
        {
            if (!MyFileUploader.IsHasFile(FileUpload_NewPhoto))
            { Label_Alarm.Text = "لطفا فایل تصویر خود را نتخاب کنيد."; return; }

            if (!(MyFileUploader.IsExtensionTrue(FileUpload_NewPhoto, ".JPG") || MyFileUploader.IsExtensionTrue(FileUpload_NewPhoto, ".JPEG")))
            { Label_Alarm.Text = "فایل انتخابی از نوع استاندارد JPEG نمی باشد"; return; }

            try
            {
                string filename = Server.MapPath("~//phascoupfile//Userphoto//" + UserOnline.id().ToString() + ".jpg").ToString();
                MyFileUploader.SaveFile_MyFileName(FileUpload_NewPhoto, "~//phascoupfile//Userphoto", UserOnline.id().ToString() + ".jpg", "*", "*", "*", this.Server);
                MyFileUploader.ResizeImage(filename, filename, 107, 125, true);
              //  da_user.Users_Tra("ins_Image", UserOnline.id(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ref refid);
                da_User.GetUsers_Tra_DT("ins_Image", UserOnline.id());
                Session["Current_User_Image"] = "1";

                #region Insert Notification
                // Insert Notification
                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                NotificationUsers.AddNewNotification(0, UserOnline.id(), 0, "http://phasco.com/UserProfile.aspx?id=" + UserOnline.id() + "&mode=gallery", 1, 1, 12, "");
                #endregion


                Response.Redirect("EditUser.aspx?mode=img&ins=true");
            }
            catch (Exception)
            { Label_Alarm.Text = "بروز خطا زمان اجرا"; return; }
            Image_Photo.ImageUrl = UserOnline.image();
        }
        protected void LinkButton_DeleteImage_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = Server.MapPath("~//phascoupfile//Userphoto//" + UserOnline.id().ToString() + ".jpg").ToString();
                //da_user.Users_Tra("del_Image", UserOnline.id(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ref refid);
                da_User.GetUsers_Tra_DT("del_Image", UserOnline.id());
                Session["Current_User_Image"] = "0";
                MyFileUploader.Delete_File(filename);
                Response.Redirect("EditUser.aspx?mode=img&del=true");

            }
            catch (Exception)
            { Label_Alarm.Text = "بروز خطا زمان اجرا"; return; }
            Image_Photo.ImageUrl = UserOnline.image();
        }
        #endregion

        #region profile
        void set_UserProfile()
        {
            DataTable dtt;
            MultiView1.ActiveViewIndex = 1;
            SetYear();
            dtt = User_P.Users_Profile_Tra_DT("Select_Item", UserOnline.id(), "", "", "", "", "", "", "", DateTime.Now);
            if (dtt.Rows.Count > 0)
            {
                TextBox_City.Text = dtt.Rows[0]["City"].ToString();
                TextBox_Job.Text = dtt.Rows[0]["job"].ToString();
                TextBox_Maghata.Text = dtt.Rows[0]["Maghata"].ToString();
                TextBox_OfficeName.Text = dtt.Rows[0]["OfficeName"].ToString();
                TextBox_Reshte.Text = dtt.Rows[0]["Reshte"].ToString();
                TextBox_Takhasos.Text = dtt.Rows[0]["Takhasos"].ToString();
                TextBox_Email.Text = dtt.Rows[0]["Email"].ToString();



                TextBox_Name.Text = dtt.Rows[0]["Name_"].ToString();
                TextBox_Famil.Text = dtt.Rows[0]["Famil"].ToString();
                TextBox_Tel.Text = dtt.Rows[0]["Tel"].ToString();
                TextBox_Address.Text = dtt.Rows[0]["Address"].ToString();

                RadioButtonList_sex.SelectedValue = dtt.Rows[0]["sex"].ToString();

                DateTime dt_brth = Convert.ToDateTime(dtt.Rows[0]["BirthDay"].ToString());
                PersianCalendar calendar = new PersianCalendar();
                cmbYear.SelectedValue = calendar.GetYear(dt_brth).ToString();
                cmbMonth.SelectedValue = calendar.GetMonth(dt_brth).ToString();
                cmbDay.SelectedValue = calendar.GetDayOfMonth(dt_brth).ToString();
            }
        }
        private void SetYear()
        {
            PersianCalendar calendar = new PersianCalendar();
            int num = calendar.GetYear(DateTime.Now) - 0x12;
            for (int i = num - 0x55; i <= num; i++)
            { cmbYear.Items.Add(i.ToString()); }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int year = Convert.ToInt32(cmbYear.SelectedValue);
                int month = Convert.ToInt32(cmbMonth.SelectedValue);
                int day = Convert.ToInt32(cmbDay.SelectedValue);
                PersianCalendar calendar = new PersianCalendar();

                DateTime BrtDate = calendar.ToDateTime(year, month, day, 0, 0, 0, 0);
                int id = UserOnline.id();
                User_P.Users_Profile_Tra_DT("Update_Item", UserOnline.id(), TextBox_City.Text, TextBox_Reshte.Text, TextBox_Maghata.Text, TextBox_Takhasos.Text, TextBox_OfficeName.Text, TextBox_Job.Text, TextBox_Email.Text, BrtDate);


                User da_User = new  User();

                da_User.GetUsers_Tra_DT("Update_Prof", UserOnline.id(), "", "", TextBox_Name.Text, TextBox_Famil.Text, "", int.Parse(RadioButtonList_sex.SelectedValue.ToString()), DateTime.Now, "",
                    TextBox_Email.Text, TextBox_Tel.Text, TextBox_Address.Text, "", 0, 0, 0, 0);

                #region Insert Notification
                // Insert Notification
                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                NotificationUsers.AddNewNotification(0, UserOnline.id(), 0, "http://phasco.com/UserProfile.aspx?id=" +UserOnline.id(), 1, 1, 11, "");
                #endregion


                Response.Redirect("EditUser.aspx?mode=pro&upd=true");
            }
            catch (Exception) { Label_Alarm.Text = "بروز خطا زمان اجرا"; return; }
        }
        #endregion

        #region Pass
        protected void Button_ChangePAss_Click(object sender, EventArgs e)
        {
            dt= da_User.GetUsers_Tra_DT("select_Item",UserOnline.id());

            if (TextBox_Pass_Current.Text != dt.Rows[0]["Password"].ToString())
            { Label_Alarm.Text = "نام رمز فعلی صحیح نمی باشد"; return; }

            da_User.GetUsers_Tra_DT("changePass", UserOnline.id(),"",TextBox_Pass_New1.Text,"","","",0,DateTime.Now,"","","","","",0,0,0,0);
            Response.Redirect("EditUser.aspx?mode=pss&upd=true");
        }
        #endregion
    }
}
