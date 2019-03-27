using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using PHASCO_Shopping.Component;
using System.Threading;
using System.Globalization;
using System.Data;
using Membership_Manage;
namespace PHASCO_Shopping.MyPHASCO_Shopping
{
    public partial class News1 : System.Web.UI.Page
    {
        TBL_User_News da = new TBL_User_News();
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    this.Page.Culture = name;
                    this.Page.UICulture = name;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    this.Page.Culture = str2;
                    this.Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.QueryString["statue"] != null)
                {
                    string statu = Request.QueryString["statue"].ToString();
                    switch (statu)
                    {
                        case "editapp":
                            Set_Edit_View();
                            break;
                        case "new":
                            set_New();
                            break;
                        case "edit":
                            Set_Edit();
                            break;
                        case "delete":
                            Delete_News();
                            break;
                        case "sucss":
                            Lbl_ALARM.Text = Resources.Resource.News_Ins_Success;
                            break;
                    }
                }
        }

        void set_New()
        { MultiView1.ActiveViewIndex = 0; }

        void Set_Edit()
        { Bind_News(); }

        protected void Button_News_insert_Click(object sender, EventArgs e)
        {
            int id = 0;
            try { id = int.Parse(Request.QueryString["id"].ToString()); }
            catch (Exception) { }

            da.TBL_User_News_Tra(id, "insert", UserOnline.id(), Title.Text, FCKeditor1.Value);
            Response.Redirect("News.aspx?statue=sucss");

        }

        void Bind_News()
        {
            DataTable dt = da.TBL_User_News_Tra("select_Uid", UserOnline.id());
            Grid_editList.DataSource = dt;
            Grid_editList.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        void Delete_News()
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
            da.TBL_User_News_Tra("delete", id);
            Response.Redirect("News.aspx?statue=edit");
        }
        void Set_Edit_View()
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
            DataTable dt = da.TBL_User_News_Tra(id);
            Title.Text = dt.Rows[0]["Title"].ToString();
            FCKeditor1.Value = dt.Rows[0]["news"].ToString();
            MultiView1.ActiveViewIndex = 0;
        }
    }
}