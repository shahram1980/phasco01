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
namespace PHASCO_Shopping.C_p
{
    public partial class Productdetails : System.Web.UI.Page
    {
        Tbl_Products da = new Tbl_Products();
        TBL_product_Images_gallery da_galllery = new TBL_product_Images_gallery();
        DataTable dt;
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
                this.Page.Culture = "fa-ir";
                this.Page.UICulture = "fa-ir";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Set_Product_Deteil();
                Bind_Gallery();
            }
        }

        void Set_Product_Deteil()
        {
            try
            {

                int id = int.Parse(Request.QueryString["pid"].ToString());
                dt = da.Tbl_Products_Tra(id, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString());


                Label_Title.Text = dt.Rows[0]["Produc_Name"].ToString();
                Label_Specialty_of_Product.Text = dt.Rows[0]["Specialty_Product"].ToString();
                Label_Description.Text = dt.Rows[0]["Description"].ToString();

                Label_Model_Number.Text = dt.Rows[0]["Model_Number"].ToString();
                Label_Product_Brand.Text = dt.Rows[0]["Product_Brand"].ToString();
                Label_Place_of_Origin.Text = dt.Rows[0]["Place_Origin"].ToString();

                Label_Supply_Ability.Text = dt.Rows[0]["Supply_Ability"].ToString();
                Label_Minimum_Order.Text = dt.Rows[0]["Minimum_Order"].ToString();
                Label_Delivery_Time.Text = dt.Rows[0]["Delivery_Time"].ToString();
                Label_Terms_of_Payment.Text = dt.Rows[0]["Terms_Payment"].ToString();
                Label_Packaging.Text = dt.Rows[0]["Packaging"].ToString();


                if (int.Parse(dt.Rows[0]["image"].ToString()) == 1)
                    Image_Product.ImageUrl = "~/MyPHASCO_Shopping/Pupload/sm_" + dt.Rows[0]["image_name"].ToString();
                else
                    Image_Product.ImageUrl = "~/MyPHASCO_Shopping/Pupload/None/NONE.jpg";
                Bind_Other_Product(int.Parse(dt.Rows[0]["uid_id"].ToString()));

                inquery_Link.HRef = "../inquiry.aspx?pid=" + dt.Rows[0]["id"].ToString(); ;

            }
            catch (Exception) { }

        }

        void Bind_Other_Product(int uid)
        {
            dt = da.Tbl_Products_Tra(0, "Select_other_p", uid, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");
            Repeater_Other_Product.DataSource = dt;
            Repeater_Other_Product.DataBind();
        }

        protected void Bind_Gallery()
        {
            DataList_Gallary.DataSource = da_galllery.TBL_product_Images_gallery_SP(Convert.ToInt32(Request.QueryString["pid"].ToString()), "Select", "", ""); ;
            DataList_Gallary.DataBind();
        }
    }
}