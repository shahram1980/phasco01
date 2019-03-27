using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace phasco_webproject.BaseClass
{
    public class SamAuthentication
    {
        public static bool UserValid()
        {
            if (HttpContext.Current.Session["Login_Acc"] != null)
            {
                if (HttpContext.Current.Session["Login_Acc"].ToString() == "true")
                { return true; }
            }
            else return false;
            return false;
        }

        public static string GetId()
        {
            int res = 0;
            if (HttpContext.Current.Session["OwnerCart"] == null)
            {
                HttpContext.Current.Session.Add("OwnerCart", "UnAuthentication");
                HttpContext.Current.Session.Add("OwnerId", HttpContext.Current.Session.SessionID.ToString());
            }
            return HttpContext.Current.Session["OwnerId"].ToString(); ;// 
        }

        public static Boolean killId()
        {
            try
            {
                HttpContext.Current.Session.Remove("OwnerCart");
                HttpContext.Current.Session.Remove("OwnerId");
                return true;
            }
            catch (Exception)
            { return false; }

        }
        public static string CurrentOwner()
        { return HttpContext.Current.Session["OwnerCart"].ToString(); }

        public static string CurrentOwner_ID()
        { return HttpContext.Current.Session["OwnerId"].ToString(); }
    }
}
