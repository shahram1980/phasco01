using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
   public class TBL_AdminUsers
    {
        public Boolean CheckLogin(string username, string password)
        {
            if (username.Trim() == string.Empty || password.Trim() == string.Empty)
            { return false; }

            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            dt = dauser.Check_login(6, username, password);
            if (dt.Rows.Count > 0)
            { Set_User_Online(dt); return true; }
            else return false;

            return false;
        }
        public Boolean UserValid()
        {
            try
            {
                if (HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["Admin_Login"]["Admin_OnlineValid"]) == "True1") return true;
                else return false;
            }
            catch (Exception)
            { return false; }

        }

        public string SP_AdminUsers(string Name, string Username, int Status, int id, string Lastname,
          string Password)
        {
            DAL_BIZ dal = new DAL_BIZ();
            string ID = string.Empty;
            SqlParameter[] param = new SqlParameter[7];

            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, 1, null);
            param[1] = dal.MakeParam("@Name", SqlDbType.NVarChar, Name, null);
            param[2] = dal.MakeParam("@Username", SqlDbType.NVarChar, Username, null);
            param[3] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            param[4] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[5] = dal.MakeParam("@Lastname", SqlDbType.NVarChar, Lastname, null);
            param[6] = dal.MakeParam("@Password", SqlDbType.NVarChar, Password, null);

            ID = dal.ExecSpReturnValue("SP_AdminUsers", param);
            return ID;
        }

        public void Set_User_Online(DataTable dt)
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

        public void Set_User_SignOut()
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

        public DataTable check_Page(int operationtype, int Admin_Id, string PageName, int id, string condition)
        {
            DAL_BIZ dal = new DAL_BIZ();
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

        public DataTable SP_AdminAccess(int operationtype, int Admin_Id)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, operationtype, null);
            param[1] = dal.MakeParam("@Admin_Id", SqlDbType.Int, Admin_Id, null);
            dt = dal.ExecSpDt("SP_AdminAccess", param);
            return dt;
        }

        public bool HasPermision(int operationtype, int AdminID, string Page)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dt = new DataTable();
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, operationtype, null);
            param[1] = dal.MakeParam("@Admin_Id", SqlDbType.Int, AdminID, null);
            param[2] = dal.MakeParam("@PageName", SqlDbType.NVarChar, Page, null);
            dt = dal.ExecSpDt("SP_AdminAccess", param);
            bool access = false;
            if (dt.Rows.Count > 0)
                access = true;
            return access;
        }
    }
}
