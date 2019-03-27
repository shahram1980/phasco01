using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Data;

namespace PHASCO_Shopping.bizpanel
{
    public partial class SubmitProducts : System.Web.UI.Page
    {
        Tbl_Products Product_Bll = new Tbl_Products();
        DataTable dt = new DataTable();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (adminUser.UserValid() == true)
            //{
            //    DataTable dt = new DataTable();
            //    dt = adminUser.check_Page(6, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), this.Title, 0, null);
            //    if (dt.Rows.Count > 0)
            //    {

                    if (!IsPostBack)
                    {
                        MultiView1.ActiveViewIndex = 0;
                        dt = Product_Bll.Tbl_Products_Tra("SelectSomeFields");
                        gv_products.DataSource = dt;

                        gv_products.DataBind();
                    }
            //    }
            //    else
            //        Response.Redirect("AccessDenied.aspx");
            //}
            //else
            //    Response.Redirect("AccessDenied.aspx");
        }

        protected void gv_products_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void lnk_btn_select_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MultiView1.ActiveViewIndex = 1;
                int id = int.Parse(e.CommandArgument.ToString());
                Session["Product_Id"] = id;
                dt = Product_Bll.Tbl_Products_Tra(id, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString());


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



            }
            catch (Exception) { }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Session["Product_Id"].ToString());
                Product_Bll.Tbl_Products_Tra("AdminSubmit", id);
                MultiView1.ActiveViewIndex = 0;
                lbl_msg.Text = "Product Submited";
            }
            catch
            {
                lbl_msg.Text = "Error Occured During the JOb!";
            }
        }

        protected void btn_denied_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Session["Product_Id"].ToString());
                Product_Bll.Tbl_Products_Tra("AdminDenied", id);
                Product_Bll.TBL_Product_Detail_Desc(1, id, txt_desc.Text, 0, null);
                MultiView1.ActiveViewIndex = 0;
                lbl_msg.Text = "Product Denied";
            }
            catch(Exception ex)
            {
               lbl_msg.Text = "Error Occured During the JOb!";
                //lbl_msg.Text = ex.Message;
            }
        }

        protected void lnk_btn_DeniedProduct_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;

            dt = Product_Bll.Tbl_Products_Tra("SelectDeniedProduct");
            gv_Deniedproducts.DataSource = dt;

            gv_Deniedproducts.DataBind();
            lbl_msg.Text = "";
        }

        protected void lnk_btn_select_denied_product_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MultiView1.ActiveViewIndex = 1;
                int id = int.Parse(e.CommandArgument.ToString());
                Session["Product_Id"] = id;
                dt = Product_Bll.Tbl_Products_Tra(id, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString());

                DataTable dt_desc = new DataTable();
                if (dt.Rows[0]["status"].ToString() == "2")
                {
                    dt_desc = Product_Bll.TBL_Product_Detail_Desc(6, int.Parse(e.CommandArgument.ToString()), null, 0, null);
                    if (dt_desc.Rows.Count>0)
                     txt_desc.Text = dt_desc.Rows[0]["Description"].ToString();
                    
                }

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

                //txt_desc.Text = dt_desc.Rows[0]["Description"].ToString();

                if (int.Parse(dt.Rows[0]["image"].ToString()) == 1)
                    Image_Product.ImageUrl = "~/MyPHASCO_Shopping/Pupload/sm_" + dt.Rows[0]["image_name"].ToString();
                else
                    Image_Product.ImageUrl = "~/MyPHASCO_Shopping/Pupload/None/NONE.jpg";



            }
            catch (Exception ex) 
            {
                lbl_msg.Text = ex.Message;
            }
        }

        protected void lnk_btn_sendProducts_Click(object sender, EventArgs e)
        {
            
            lbl_msg.Text = "";

            MultiView1.ActiveViewIndex = 0;
            dt = Product_Bll.Tbl_Products_Tra("SelectSomeFields");
            gv_products.DataSource = dt;

            gv_products.DataBind();
        }

        protected void lnk_btn_search_Click(object sender, EventArgs e)
        {
            lbl_msg.Text = "";
            MultiView1.ActiveViewIndex = 3;
            txt_desc.Text = "";
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_search_productId.Text == string.Empty)
                    txt_search_productId.Text = "0";
                dt=Product_Bll.search("Search", txt_search_productName.Text, int.Parse(txt_search_productId.Text));
                gv_search.DataSource = dt;
                gv_search.DataBind();
                if (dt.Rows.Count == 0)
                    lbl_msg.Text = "NO Record Matched";

            }
            catch(Exception ex)
            {
                lbl_msg.Text = ex.Message;
            }
        }

       
      
    }
}
