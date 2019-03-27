using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;
using PHASCO_Shopping.BLL;
using PHASCO_Shopping.Component;
using Membership_Manage;
using System.Data;
namespace PHASCO_Shopping
{
    public partial class inquiry : System.Web.UI.Page
    {
        TBL_inquire da = new TBL_inquire();
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
            {
                if (UserOnline.User_Online_Valid())
                    Set_Detail();
                else
                    if (Request.QueryString["pid"] != null)
                    {
                        MultiView1.ActiveViewIndex = 2;
                    }
            }
        }
        void Set_Detail()
        {
            try
            {
                int p_id = int.Parse(Request.QueryString["pid"].ToString());
                Tbl_Products da_p = new Tbl_Products();
                DataTable dt = da_p.Tbl_Products_Tra(p_id, "Select_Product_Inq", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");
                Label_Detail.Text = dt.Rows[0]["Produc_Name"].ToString() + ".   " + dt.Rows[0]["Company_Name"].ToString();
                link_Product.HRef = "C-p/Productdetails.aspx?pid=" + dt.Rows[0]["id"].ToString() + "&uid=" + dt.Rows[0]["uid_id"].ToString();
                HiddenField_Id.Value = dt.Rows[0]["Uid_id"].ToString();
                Label_Product.Text = dt.Rows[0]["Produc_Name"].ToString() + ".   " + dt.Rows[0]["Company_Name"].ToString() + "<br/><br/>" + dt.Rows[0]["Description"].ToString() + " ...";
                if (int.Parse(dt.Rows[0]["image"].ToString()) == 1)
                    product_img.Src = "MyPHASCO_Shopping/Pupload/sm_" + dt.Rows[0]["image_name"].ToString();
                else
                    product_img.Src = "MyPHASCO_Shopping/Pupload/None/NONE.jpg";
                MultiView1.ActiveViewIndex = 0;
            }
            catch (Exception)
            {
                Label_Alarm.Text = Resources.Resource.Company_Profile_Det;
            }

        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            try
            {
                int p_id = int.Parse(Request.QueryString["pid"].ToString());
                int adminmss = 0;
                da.TBL_inquire_Tra(0, "insert", UserOnline.id(), int.Parse(HiddenField_Id.Value), p_id, TextBox_topic.Text, TextBox_Message.Text, "", adminmss);
                MultiView1.ActiveViewIndex = 1;
            }
            catch (Exception) { }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}