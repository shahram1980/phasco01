using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using PHASCO_WEB.DAL;
using Membership_Manage;
namespace phasco_webproject.BaseClass
{
    public class Product_Store
    {

        public static string Call_Product_Shop_Insert_Edit(int id, string mode, string Mode_Price, int Order_No, int uid)
        {
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_EshopTableAdapter da_eshop = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_EshopTableAdapter();
            DS_MainPhasco.User_EshopDataTable dt_eshop = new DS_MainPhasco.User_EshopDataTable();

            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_Eshop_TemporaryTableAdapter da_temp = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_Eshop_TemporaryTableAdapter();
            DS_MainPhasco.User_Eshop_TemporaryDataTable dt_temp = new DS_MainPhasco.User_Eshop_TemporaryDataTable();


            if (UserOnline.User_Online_Valid())
            {
                dt_eshop = da_eshop.Product_Shop_Insert_Edit(uid, id, mode, Mode_Price, Order_No);
                if (dt_eshop.Rows.Count > 0) return dt_eshop[0]["Out_Res"].ToString();
                else return "0";
            }
            else
            {
                string Uid_Temporary =  SamAuthentication.GetId();
                dt_temp = da_temp.Product_Shop_Temporary_Insert_Edit(Uid_Temporary, id, mode, Order_No);
                return "0";
            }
            return "";
        }
    }
}
