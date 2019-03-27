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

namespace BiztBiz.Component
{
    public class UserOnline
    {
        int ali;
        public int Ali
        {
            get { return ali; }
            set { ali = value; }
        }

        public static string Given_Name()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Given_Name"]));
        }

        public static string Family_Name()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Family_Name"]));
        }

        public static string User_Status()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["User_Status"]));
        }

        public static string Uid()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Uid"]));
        }

        public static int id_biz()
        {
            Control_Status();
            return Utility.ConverToNullableInt(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["id"])).ToString());
        }

        public static string sexid()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Sex"]));
        }

        public static string sex()
        {
            Control_Status();
            if (System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Sex"])) == "f")
                return Resources.Resource.Mss.ToString();
            if (System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Sex"])) == "m")
                return Resources.Resource.Mr.ToString();
            return "";
        }

        public static string User_Level()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["User_Level"]));
        }

        public static string Company()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Company"]));
        }

        public static string TelNo()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["TelNo"]));
        }


        public static int CompanyID()
        {
            Control_Status();
            return Utility.ConverToNullableInt(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["CompanyID"])).ToString());
        }

        public static int UsersRoleID()
        {
            Control_Status();
            return Utility.ConverToNullableInt(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["UsersRoleID"])).ToString());
        }

        public static string User_Online_Valid()
        {
            Control_Status();
            return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["Company"]));
        }

        public static string Control_Status()
        {
            if (!User_Is_Valid())
                HttpContext.Current.Response.Redirect("~\\Default.aspx"); return "";
        }

        public static bool User_Is_Valid()
        {

            try
            {
                if (System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Request.Cookies["Login_Biz"]["UserOnlineValid"])) == "true")
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
