using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DataAccessLayer.BIZ;


namespace BiztBiz.Template
{
    public partial class admin : System.Web.UI.MasterPage
    {
        //    protected override void Render(System.Web.UI.HtmlTextWriter writer)
        //    {

        //    }
        TBL_AdminUsers adminUser = new TBL_AdminUsers();
        protected void Page_Init(object sender, EventArgs e)
        {

            DateTime nowTime = DateTime.Now;

            if (HttpContext.Current.Request.Cookies["Admin_Login"] != null)
            {
                int AdminID = Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["Admin_Login"]["Admin_Id"]));

                string absolutePath = Request.Url.AbsolutePath;


                if (absolutePath.Contains("/"))
                    absolutePath =
                        absolutePath.Substring(absolutePath.LastIndexOf("/") + 1,
                        absolutePath.Length - absolutePath.LastIndexOf("/") - 1);


                if (adminUser.UserValid())
                {
                    if (absolutePath.ToUpper() != "DEFAULT.ASPX")
                    {
                        if (adminUser.HasPermision(6, AdminID, absolutePath))
                        {

                        }
                        else
                        {
                            Response.Redirect("AccessDenied.aspx");
                        }
                    }
                }
                else
                {
                    Response.Redirect("AccessDenied.aspx");
                }

            }
            else
            {
                Response.Redirect("AccessDenied.aspx");
            }

        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Set_admin_SignOut();
            Response.Redirect("~/bizpanel/", true);
        }

        public static void Set_admin_SignOut()
        {
            if (HttpContext.Current.Request.Cookies["Admin_Login"] != null)
            {
                HttpCookie UserLogin = new HttpCookie("Admin_Login");
                UserLogin.Expires = DateTime.Now.AddDays(-1d);
                HttpContext.Current.Response.Cookies.Add(UserLogin);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //try
                //{
                //    if (HttpContext.Current.Request.Cookies["Admin_Login"]["Admin_OnlineValid"].ToString() != "True1")
                //    { Response.Redirect("default.aspx"); }
                //}
                //catch (Exception)
                //{ Response.Redirect("default.aspx"); }


                if (Page.Culture.ToString() == "English (United States)")
                    css.Href = "../css/main.css";
                if (Page.Culture.ToString() == "Persian (Iran)")
                    css.Href = "../css/mainfa.css";



            }
        }
    }
}
