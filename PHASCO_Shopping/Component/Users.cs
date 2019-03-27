using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using PHASCO_Shopping.BLL;

namespace PHASCO_Shopping.Component
{
    public class Users
    {
        public static Boolean CheckLogin(string username, string password)
        {
            if (username.Trim() == string.Empty || password.Trim() == string.Empty)
            { return false; }

            DataTable dt;
            dt = dauser.TBL_User_Tra(0, "Login", username.Trim(), password.Trim(), 0, "", "", "", "", "", "", "", "", "", 0, 0);
            if (dt.Rows.Count > 0)
            { Set_User_Online(dt); return true; }
            else return false;

            return false;
        }
        public static Boolean UserValid()
        {
            try
            {
                if (System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["login"]["UserOnlineValid"])) == "true" && System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["login"]["Uid"])) != null && System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["login"]["id"]))    != null) return true;
                else return false;
            }
            catch (Exception)
            { return false; }

        }
        public static void Set_User_Online(DataTable dt)
        {
            HttpCookie ObjCookie2 = new HttpCookie("Login");


            ObjCookie2.Values["id"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["id"].ToString()));
            ObjCookie2.Values["Uid"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Uid"].ToString()));
            ObjCookie2.Values["Given_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Given_Name"].ToString()));
            ObjCookie2.Values["Family_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Family_Name"].ToString()));
            ObjCookie2.Values["Sex"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Sex"].ToString()));
            ObjCookie2.Values["User_Status"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["User_Status"].ToString()));
            ObjCookie2.Values["User_Level"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["User_Level"].ToString()));
            ObjCookie2.Values["Company"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Company"].ToString()));
            ObjCookie2.Values["UserOnlineValid"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes("true"));
            ObjCookie2.Expires = DateTime.Now.AddDays(3);// or For Example "2009/08/08";
            //            ObjCookie2.Domain = "";
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
        }

        public static void Set_User_SignOut()
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

    }
}
