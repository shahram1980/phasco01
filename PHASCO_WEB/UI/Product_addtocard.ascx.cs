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
using phasco_webproject.BaseClass;

namespace phasco_webproject.UI
{
    public partial class Product_addtocard : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        { Panle_Basket.Visible = true; }

        protected void ImageButton_Buy_Click(object sender, ImageClickEventArgs e)
        {
            int Id_ = Convert.ToInt32(Request.QueryString["id"]);
            try
            {
                int User_Id = Convert.ToInt32(Session["UId_Id"].ToString());
                Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", Convert.ToInt32(Eshop_Q.Text.ToString()), User_Id);
            }
            catch (Exception)
            { Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", Convert.ToInt32(Eshop_Q.Text.ToString()), 0); }
            Response.Redirect(Request.Url.ToString(), false);
        }

        protected void ImageButton_FinalBuy_Click(object sender, ImageClickEventArgs e)
        { Response.Redirect("~/Final.aspx"); }
    }
}