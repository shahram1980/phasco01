using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using PHASCO_Shopping.DAL;

namespace PHASCO_Shopping.BLL
{
    public class TBL_AdminUsers
    {

        public  Boolean CheckLogin(string username, string password)
        {
            if (username.Trim() == string.Empty || password.Trim() == string.Empty)
            { return false; }

            TBL_User dauser = new TBL_User();
            DataTable dt;
            dt = dauser.Check_login(6,username, password);
            if (dt.Rows.Count > 0)
            { Set_User_Online(dt); return true; }
            else return false;

            return false;
        }
        public  Boolean UserValid()
        {
            try
            {
                if (HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["UserOnlineValid"]) == "true") return true;
                else return false;
            }
            catch (Exception)
            { return false; }

        }
        public  void Set_User_Online(DataTable dt)
        {
            HttpCookie ObjCookie2 = new HttpCookie("Login");
            ObjCookie2.Values["id"] = dt.Rows[0]["id"].ToString();
            ObjCookie2.Values["Name"] = dt.Rows[0]["Name"].ToString();
            ObjCookie2.Values["Username"] = dt.Rows[0]["Username"].ToString();
            ObjCookie2.Values["Lastname"] = dt.Rows[0]["Lastname"].ToString();
            ObjCookie2.Values["Password"] = dt.Rows[0]["Password"].ToString();
            
            ObjCookie2.Values["UserOnlineValid"] = "true";
            ObjCookie2.Expires = DateTime.Now.AddDays(1);// or For Example "2009/08/08";
            //            ObjCookie2.Domain = "";
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);

        }

        public  void Set_User_SignOut()
        {
            HttpCookie ObjCookie2 = new HttpCookie("Login");
            ObjCookie2.Values["id"] = "";
            ObjCookie2.Values["Uid"] = "";
            ObjCookie2.Values["Given_Name"] = "";
            ObjCookie2.Values["Family_Name"] = "";
            ObjCookie2.Values["Sex"] = "";
            ObjCookie2.Values["User_Status"] = "";
            ObjCookie2.Values["User_Level"] = "";
            ObjCookie2.Values["Company"] = "";
            ObjCookie2.Values["UserOnlineValid"] = "false";
            ObjCookie2.Expires = DateTime.Now.AddDays(-1);// or For Example "2009/08/08";
            //            ObjCookie2.Domain = "";
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
        }

        public DataTable check_Page(int operationtype, int Admin_Id, string PageName,int id,string condition)
        {
            BaseDAL dal = new BaseDAL();
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, operationtype, null);
            param[1] = dal.MakeParam("@Admin_Id", SqlDbType.Int, Admin_Id, null);
            param[2] = dal.MakeParam("@PageName", SqlDbType.NVarChar, PageName, null);
            param[3] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[4] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);
            dt = dal.ExecSpDt("SP_AdminAccess", param);
            return dt;
        }
        
    }
}
