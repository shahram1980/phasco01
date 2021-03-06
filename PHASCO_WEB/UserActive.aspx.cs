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
using PHASCO_WEB.DAL;
using phasco_webproject.BaseClass;
using Membership_Manage;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class UserActive : System.Web.UI.Page
    {
        #region dataset
        DataTable dt = new DataTable();
        User da_User = new User();
        #endregion
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
            if (Request.QueryString["Usecid"] != null && Request.QueryString["modeactive"] != null)
            {
                string id = UN_Secret(Request.QueryString["Usecid"].ToString());
                string mode = UN_Secret(Request.QueryString["modeactive"].ToString());
                if (mode == "newuserregisterd")
                {
                    dt = da_User.GetUsers_Tra_DT("select_Item", int.Parse(id));
                    if (dt.Rows.Count > 0)
                    {
                        switch (int.Parse(dt.Rows[0]["UserActive"].ToString()))
                        {
                            case 5:
                                {
                                    da_User.GetUsers_Tra_DT("ActiveUser", int.Parse(id));

                                    if (int.Parse(dt.Rows[0]["IntriId"].ToString()) > 0)
                                        UserOnline.Add_Point(int.Parse(dt.Rows[0]["IntriId"].ToString()), 5, "auto");





                                    string welcomeMessage = " کاربر گرامی،&nbsp; " + da_User.GetUsers_Tra_DT("select_Item", int.Parse(id)).Rows[0]["uid"].ToString()+ "&nbsp; سلام، به سایت جامع علوم آزمایشگاهی و پزشکی ";
                                    welcomeMessage += " فاسکو خوش آمدید.از شما دعوت می شود مشخصات فردی و عکس پرسنلی خود را در دفتر ";
                                    welcomeMessage += "کارتان، بخش (ویرایش پروفایل) تکمیل و به روز رسانی کنید تا کاربران دیگر با شما و ";
                                    welcomeMessage += "توانمندی های علمی تان بیشتر از اینها آشنا شوند.موفق تر و سربلند تر باشید.	";

                                    Users_Wall da_w = new Users_Wall();
                                    da_w.Users_Wall_tra("insert", 49164, int.Parse(id), 0, welcomeMessage);

                                    Label_Alarm.Text = "کاربر " + dt.Rows[0]["Uid"].ToString() + "  </br> و از امکانات متنوع آن و دفتر کارتان استفاده نمائید. . با تشکر از ثبت نام شما ،  هم اکنون می توانید با وارد کردن نام کاربری خود و کلمه عبورتان وارد سایت جامع علوم آزمایشگاهی و پزشکی فاسکو شوید";
                                    break;
                                }
                            case 1: { Label_Alarm.Text = "این نام کاربری فعال می باشد"; break; }
                            case 0: { Label_Alarm.Text = "شما مجاز به فعال سازی این کاربر نمی باشید"; break; }
                        }
                        if (dt.Rows[0]["UserActive"].ToString() == "5") { }
                    }
                }
            }
        }
        public string UN_Secret(string strChange)
        {
            byte[] MyByte = Convert.FromBase64String(strChange);
            return System.Text.Encoding.ASCII.GetString(MyByte);
        }
    }
}
