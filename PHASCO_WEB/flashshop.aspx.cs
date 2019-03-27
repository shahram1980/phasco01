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
using System.Text;
using phasco_webproject.BaseClass;
using Membership_Manage;

namespace PHASCO_WEB
{
    public partial class flashshop : System.Web.UI.Page
    {
        Product_Tbl da = new Product_Tbl();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Bind_Products();
        }

        void Bind_Products()
        {
            dt = da.Products_All();
            GridView_Pro.DataSource = dt;
            GridView_Pro.DataBind();
        }

        protected void Button_Addtoshop_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView_Pro.Rows.Count; i++)
            {
                GridViewRow row = GridView_Pro.Rows[i];
                if (((TextBox)row.FindControl("TextBox_q")).Text.ToString().ToString() != "")
                {
                    try
                    {
                        int no = int.Parse(((TextBox)row.FindControl("TextBox_q")).Text.ToString());
                        if (no > 0)
                        {
                            add_to_card(int.Parse(GridView_Pro.Rows[i].Cells[1].Text.ToString()), no);
                        }
                    }
                    catch (Exception)
                    { }
                }

            }
            Response.Redirect(Request.Url.ToString(), false);
        }

        void add_to_card(int Id_, int Q)
        {
            try
            {
                int User_Id = UserOnline.id();
                Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", Q, User_Id);
            }
            catch (Exception) { Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", Q, 0); }
        }


    }
}
