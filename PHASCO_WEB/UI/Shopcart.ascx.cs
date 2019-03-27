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
using phasco.BaseClass;
using phasco_webproject.BaseClass;
using PHASCO_WEB.DAL;
using Membership_Manage;
namespace phasco_webproject.UI
{
    public partial class Shopcart : System.Web.UI.UserControl
    {
        #region DAtaset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_Eshop_TemporaryTableAdapter da_temp = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_Eshop_TemporaryTableAdapter();
        DS_MainPhasco.User_Eshop_TemporaryDataTable dt_temp = new DS_MainPhasco.User_Eshop_TemporaryDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_EshopTableAdapter da_eshop = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_EshopTableAdapter();
        DS_MainPhasco.User_EshopDataTable dt_eshop = new DS_MainPhasco.User_EshopDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TEuroTableAdapter da_Euro = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TEuroTableAdapter();
        DS_MainPhasco.TEuroDataTable dt_Euro = new DS_MainPhasco.TEuroDataTable();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { MultiView1.ActiveViewIndex = 1; }
            Bind_Basket_Grd();
        }

        protected void Bind_Basket_Grd_UnAuthentication()
        {
            SamAuthentication.GetId();
            dt_temp = da_temp.Select_Temporary(SamAuthentication.GetId().ToString());
            try
            {
                ImageButton_FinalBuy.Visible = true;
                Grd_Bsk.DataSource = dt_temp;
                Grd_Bsk.DataBind();
                int? TotalRes = 0;
                
                da_temp.Product_Shop_Temporary_TotalPrice(SamAuthentication.GetId(), ref TotalRes);
                lbl_Total_Price.Text = TotalRes.ToString();
            }
            catch (Exception) { Grd_Bsk.Columns.Clear(); }
        }

        public void Bind_Basket_Grd()
        {
            if (UserOnline.User_Online_Valid())
            {
                int User_Id = UserOnline.id();
                dt_eshop = da_eshop.Product_Eshop_Basket(User_Id);
                try
                {
                    if (dt_eshop.Rows.Count > 0)
                    {
                        ImageButton_FinalBuy.Visible = true;
                        Grd_Bsk.DataSource = dt_eshop;
                        Grd_Bsk.DataBind();

                        string total_Price = Product_Store.Call_Product_Shop_Insert_Edit(0, "Total_Price", "", 0, User_Id);
                        lbl_Total_Price.Text = total_Price;
                    }
                }
                catch (Exception Ex) { Session["lang"] = null; }
            }
            else { Bind_Basket_Grd_UnAuthentication(); }
            
        }

        protected void ImageButton_Up_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(System.Convert.ToInt32(e.CommandArgument));
            if (UserOnline.User_Online_Valid()) { da_eshop.Product_OrderNumber_Change(id, "Up"); }
            else { da_temp.Product_OrderNumber_Change_Temporary(id, "Up"); }
            Response.Redirect(Request.Url.ToString());
        }

        protected void ImageButton_Down_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(System.Convert.ToInt32(e.CommandArgument));
            if (UserOnline.User_Online_Valid()) { da_eshop.Product_OrderNumber_Change(id, "Down"); }
            else { da_temp.Product_OrderNumber_Change_Temporary(id, "Down"); }
            Response.Redirect(Request.Url.ToString());
        }

        protected void ImageButton_Remove_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(System.Convert.ToInt32(e.CommandArgument));
            if (UserOnline.User_Online_Valid()) { da_eshop.Product_OrderNumber_Change(id, "Remove"); }
            else { da_temp.Product_OrderNumber_Change_Temporary(id, "Remove"); }
            Response.Redirect(Request.Url.ToString());
        }
        protected void DataUpdate(Object S, DataGridCommandEventArgs E)
        {
            Grd_Bsk.EditItemIndex = (int)E.Item.ItemIndex;
            TextBox Q_Number_textbox = (TextBox)E.Item.Cells[1].Controls[0];
            int Q_Number = Convert.ToInt32(Q_Number_textbox.Text.ToString());
            Product_Store.Call_Product_Shop_Insert_Edit(Convert.ToInt32(Grd_Bsk.DataKeys[(int)E.Item.ItemIndex]), "Change_Order", "", Q_Number, 0);
            Grd_Bsk.EditItemIndex = -1;
            Bind_Basket_Grd();
        }
        protected void DataCancel(Object S, DataGridCommandEventArgs E)
        {
            Grd_Bsk.EditItemIndex = -1;
            Bind_Basket_Grd();
        }
        protected void DataDelete(Object S, DataGridCommandEventArgs E)
        {
            Product_Store.Call_Product_Shop_Insert_Edit(Convert.ToInt32(Grd_Bsk.DataKeys[(int)E.Item.ItemIndex]), "Delete_Card", "", 0, 0);
            Bind_Basket_Grd();
        }
        protected void ImageButton_FinalBuy_Click(object sender, ImageClickEventArgs e)
        {            Response.Redirect("~/Final.aspx");        }

  


    }
}