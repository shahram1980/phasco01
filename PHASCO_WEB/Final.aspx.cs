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
using System.Data.SqlClient;
using PHASCO_WEB.DAL.DS_MainPhascoTableAdapters;
using System.Threading;
using System.Globalization;
using phasco_webproject.BaseClass;
using PHASCO_WEB.BLL.Eshop;
using Membership_Manage;

namespace PHASCO_WEB
{
    public partial class Final : System.Web.UI.Page
    {
        TEuroTableAdapter Euro = new TEuroTableAdapter();
        PHASCO_WEB.DAL.DS_MainPhasco.TEuroDataTable Euro_table = new PHASCO_WEB.DAL.DS_MainPhasco.TEuroDataTable();

        User_Eshop da_shop = new User_Eshop();
        DataTable dt;
        protected override void InitializeCulture()
        {

            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string lang = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = lang;
                    Response.Cookies.Add(cookie);
                    Page.Culture = lang;
                    Page.UICulture = lang;
                    Response.Redirect("Default.aspx");
                    // ((DropDownList)Master.FindControl("Lang")).SelectedValue = lang;
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                    // Langu.SelectedValue = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    SqlConnection myConnection = null;
                    SqlDataReader drAuthors;
                    myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
                    myConnection.Open();

                    int User_Id = UserOnline.id();
                    SqlCommand cmd_Update = new SqlCommand("Producr_Eshop_Build_FinalBasket", myConnection);
                    cmd_Update.CommandType = CommandType.StoredProcedure;
                    cmd_Update.Parameters.Add(new SqlParameter("@id_", SqlDbType.Int));
                    cmd_Update.Parameters["@id_"].Value = User_Id;
                    cmd_Update.ExecuteNonQuery();

                    SqlCommand cmd_Grd = new SqlCommand("Product_Eshop_FInal_Basket", myConnection);
                    cmd_Grd.CommandType = CommandType.StoredProcedure;
                    cmd_Grd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
                    cmd_Grd.Parameters["@ID"].Value = User_Id;
                    drAuthors = cmd_Grd.ExecuteReader();
                    if (drAuthors.HasRows)
                    {
                        GRD_Final_Shop.DataSource = drAuthors;
                        GRD_Final_Shop.DataBind();
                        try
                        { 
                            lbl_Total_Price.Text = Product_Store.Call_Product_Shop_Insert_Edit(0, "Total_Price", "", 0, User_Id);
                            int phacny = int.Parse(lbl_Total_Price.Text.ToString()) / 50000;
                            lbl_Total_Phancy.Text = phacny.ToString();
                        }
                        catch (Exception Ex) { Session["lang"] = null; }
                    }
                }
                catch (Exception) { lbl_message.Text = "لطفا ابتدا login کنید "; }
            }
        }

        protected void Button_NextLevel_Click(object sender, EventArgs e)
        {

            if (!UserOnline.User_Online_Valid()) return;
            string en = DropDownList_Ebank.SelectedValue.ToString();
            SqlConnection myConnection = null;
            SqlDataReader drAuthors;
            string Merchantind = "";
            if (RadioButton1.Checked == true)
            {
                myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
                myConnection.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Ebank_Support Where BankName='" + DropDownList_Ebank.SelectedValue.ToString() + "'", myConnection);
                drAuthors = cmd.ExecuteReader();
                if (drAuthors.Read())
                    Merchantind = Convert.ToString(drAuthors["Merchantind"]);
                drAuthors.Close();
                myConnection.Close();

                Response.Redirect("sendpayment.aspx?enid=" + en + "&e=" + lbl_Total_Price.Text.ToString() + "&Mer=" + Merchantind);
            }
            else if (RadioButton2.Checked == true || RadioButton3.Checked == true)
            {
                int mode = 3;
                if (RadioButton2.Checked == true) mode = 0;
                int User_Id = UserOnline.id();
                dt = da_shop.Product_Finish_Order(User_Id, 0, "0", mode, Txt_Fishnumber.Text, "0");
                int orderid = int.Parse(dt.Rows[0]["OrderNo"].ToString());
                dt = da_shop.Set_ShopPoint();

                int point = int.Parse(dt.Rows[0]["piont"].ToString());
                int Price = int.Parse(lbl_Total_Price.Text.ToString()) / 50000;

                //if (Price > 0)
                //    Price = Price * point;

                UserOnline.Add_Pheny(UserOnline.id(), Price, "cre");

                
                Response.Redirect("SuccessShop.aspx?ordid=" + orderid.ToString());
            }

        }
        protected void ImageButton_FinalBuy_Click(object sender, ImageClickEventArgs e)
        {


            //SqlConnection myConnection = null;
            //SqlDataReader drAuthors;
            //string connectionString = ConfigurationSettings.AppSettings["ConnectionString"];
            //myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            //myConnection.Open();

            //int User_Id = Convert.ToInt32(Session["UId_Id"].ToString());


            //MultiView1.ActiveViewIndex = 1;
            //SqlCommand cmd_Grd1 = new SqlCommand("Product_Eshop_Basket", myConnection);
            //cmd_Grd1.CommandType = CommandType.StoredProcedure;
            //cmd_Grd1.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
            //cmd_Grd1.Parameters["@ID"].Value = User_Id;
            //drAuthors = cmd_Grd1.ExecuteReader();
            //if (drAuthors.HasRows)
            //{
            //       Label_Alarm.Text="کاربر گرامی موارد سفارشی ذيل موجود نمی باشد";
            //    Label_Alarm.Visible = true;

            //    DataGrid_Error_Shop.DataSource = drAuthors;
            //    DataGrid_Error_Shop.DataBind();
            //}
            //else
            //{
            //    Label_Alarm.Text = "کاربر گرامی با تشکر از شما مراحل خريد با موفقيت انجام شد";
            //    Label_Alarm.Visible = true;
            //}
        }
    }
}
