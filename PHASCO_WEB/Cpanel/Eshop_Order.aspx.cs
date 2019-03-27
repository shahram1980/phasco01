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
using PHASCO_WEB.DAL;
using System.Data.SqlClient;
using PHASCO_WEB.BLL.Eshop;


namespace phasco_webproject.Cpanel
{
    public partial class Eshop_Order : System.Web.UI.Page
    {
        //#region Dataset
        //PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_EshopTableAdapter da_Ueshop = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_EshopTableAdapter();
        //DS_MainPhasco.User_EshopDataTable dt_Ueshop = new DS_MainPhasco.User_EshopDataTable();
        //#endregion
        User_Eshop dausershop = new User_Eshop();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

                if (Request.QueryString["mode"] != null)
                {
                    if (Request.QueryString["delid"] != null) delete_Comment();

                    if (Request.QueryString["mode"].ToString() == "detail")
                    { bind_DetailsList(); return; }
                }


            Bind_Grd_NewOrder();

        }
        #region New_List_Order's
        protected void Bind_Grd_NewOrder()
        {
            dt = dausershop.New_Order_List_For_Admin();
            GridView_New.DataSource = dt;
            GridView_New.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(System.Convert.ToInt32(e.CommandArgument));
            dausershop.Admin_Archice_Product_Order(id);
            Bind_Grd_NewOrder();
        }
        #endregion

        #region Order Detail's
        void delete_Comment()
        {
            dausershop.delete_Comment(int.Parse(Request.QueryString["delid"].ToString()));
        }
        void bind_DetailsList()
        {
            int User_Id = Convert.ToInt32(Request.QueryString["id"]);
            dt = dausershop.Admin_List_New_Products_Details(User_Id);
            GridView_List.DataSource = dt;
            GridView_List.DataBind();




            Binf();
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Binf()
        {
            int User_Id = Convert.ToInt32(Request.QueryString["id"]);
            dt = dausershop.Admin_List_Comment_Shop(User_Id);
            GridView_Comment.DataSource = dt;
            GridView_Comment.DataBind();
        }


        protected void Button_Ins_Comment_Click(object sender, EventArgs e)
        {
            int User_Id = Convert.ToInt32(Request.QueryString["id"]);
            dausershop.Admin_Insert_Comment_Shop(User_Id, TextBox_Comment.Text.ToString());
            bind_DetailsList();
        }
        #endregion
    }
}
