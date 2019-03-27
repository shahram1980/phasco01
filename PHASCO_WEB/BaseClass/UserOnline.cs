using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using phasco.BaseClass;

namespace phasco_webproject.BaseClass
{
    public class UserOnline
    {
        public static string name()
        {
            try { return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["login"]["Current_User_name"])) + " " + System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["login"]["Current_User_Famil"])); }
            catch (Exception) {}// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string Credit()
        {
            try { return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["login"]["Current_User_Credit"])); }
            catch (Exception) {}// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string email()
        {
            try { return HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_Email "].ToString()); }
            catch (Exception) {}// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string role()
        {
            try { return HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_Role"].ToString()); }
            catch (Exception) {}// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string Uid()
        {
            try { return HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_Uid"].ToString()); }
            catch (Exception) {}// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static int id()
        {
            try { return Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_Id"].ToString())); }
            catch (Exception) { }//ContentBase.Set_User_Online(false); }
            return 0;

        }
        public static string sexid()
        {
            try { return HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_sex"].ToString()); }
            catch (Exception) {}// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string sex()
        {
            try
            {
                if (HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_sex"].ToString()).ToString() == "f")
                    return Resources.Resource.Mss.ToString();
                if (HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_sex"].ToString()).ToString() == "m")
                    return Resources.Resource.Mr.ToString();
            }
            catch (Exception)
            {}// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string Point()
        {
            try { return HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_Point"].ToString()); }
            catch (Exception) {}// ContentBase.Set_User_Online(false); }
            return "";

        }
        public static string Daily_Login()
        {
            try { return HttpContext.Current.Request.Cookies["login"]["Current_User_Daily_Login"].ToString(); }
            catch (Exception) { }//ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string image()
        {
            string ret = "";
            if (image_Valid()) ret = "~//phascoupfile//Userphoto//" + id().ToString() + ".jpg";
            else ret = "~//phascoupfile//Userphoto//Nopic.jpg";
            return ret.ToString();
        }
        public static Boolean image_Valid()
        {
            try
            {
                if (HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["Current_User_Image"].ToString()) == "1") { return true; }
                else { return false; }
            }
            catch (Exception) { return false; }
        }
        public static Boolean User_Online_Valid()
        {
            try
            {
                if (HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["ValidUser"].ToString()) == "true") 
                { return true; }
                else { return false; }
            }
            catch (Exception)
            { return false; }
        }

        public static Boolean Set_Logout()
        {
            try
            {
                HttpCookie ObjCookie2 = new HttpCookie("login");
                ObjCookie2.Values["Current_User_name"] = "";
                ObjCookie2.Values["Current_User_Email "] = "";
                ObjCookie2.Values["Current_User_Role"] = "";
                ObjCookie2.Values["Current_User_Famil"] = "";
                ObjCookie2.Values["Current_User_Uid"] = "";
                ObjCookie2.Values["Current_User_Id"] = "";
                ObjCookie2.Values["Current_User_sex"] = "";
                HttpContext.Current.Session.Clear();
                ObjCookie2.Values["ValidUser"] = "";
                ObjCookie2.Expires = DateTime.Now.AddDays(-1);// or For Example "2009/08/08";
                HttpContext.Current.Response.Cookies.Add(ObjCookie2);
                return true;
            }
            catch (Exception) { return false; }
            return false;
        }

        public static void Add_Point(int id, int point, string mode)
        {
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();
            da.Set_User_Point(mode, id, point);
        }

        public static void Add_Pheny(int id, int point, string mode)
        {
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();
            da.Set_User_Point(mode, id, point);

            ContentBase.RefrshCurrenctUserInfo();
        }
    }
}
