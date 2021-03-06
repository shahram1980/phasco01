using System;
using System.Data;
using System.Web.UI.HtmlControls;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class webloglist : System.Web.UI.Page
    {
        User_Blog User_Blog_class = new User_Blog();
        User User_class = new User();
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
            if (!IsPostBack) Top_Blog_User();
        }
        void Top_Blog_User()
        {
            DataTable dt = User_Blog_class.GetUsers_Blog_Tra_DT("Select_Top_50", 0, "", 0, "", 0, "");
            
            DataList_Blog.DataSource = dt;
            DataList_Blog.DataBind();


            dt = User_Blog_class.GetUsers_Blog_Tra_DT("Select_TopLatest_50", 0, "", 0, "", 0, "");
            DataList_BlogLates.DataSource = dt;
            DataList_BlogLates.DataBind();

        }
    }
}
