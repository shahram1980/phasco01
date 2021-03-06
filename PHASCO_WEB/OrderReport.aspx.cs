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
using PHASCO_WEB.BLL.Eshop;
using phasco_webproject.BaseClass;
using Membership_Manage;

namespace PHASCO_WEB
{
    public partial class OrderReport : System.Web.UI.Page
    {
        User_Eshop da = new User_Eshop();
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
            if (!UserOnline.User_Online_Valid())
                Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null) bind_Shopping_List();
                else Bind_List();
            }

        }
        protected void Bind_List()
        {
            int id = UserOnline.id();
            dt = da.User_Shoping_List(id);
            DataList_Orders.DataSource = dt;
            DataList_Orders.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }
        void bind_Shopping_List()
        {
            int id_ = Convert.ToInt32(Request.QueryString["id"].ToString());
            dt = da.Admin_List_Archive_Products_Details(id_);
            Label_Order_No.Text = Request.QueryString["id"].ToString();
            GridView_List_Arc.DataSource = dt;
            GridView_List_Arc.DataBind();
            Bind_Comment(id_);
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Bind_Comment(int User_Id)
        {
            int id_ = Convert.ToInt32(Request.QueryString["id"].ToString());
            dt = da.Admin_List_Comment_Shop(id_);
            GridView_Comment_Arc.DataSource = dt;
            GridView_Comment_Arc.DataBind();
        }
    }
}
