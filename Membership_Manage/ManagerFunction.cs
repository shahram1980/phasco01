using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BusinessAccessLayer;

namespace Membership_Manage
{
    public class ManagerFunction
    {
        public static string GetURL(string PageName)
        {
            string res = "~/UI/" + PageName + ".ascx";
            return res;
        }


        public static UserProfile GetUserProfile()
        {
            return HttpContext.Current.Session[Enum_.InternalSessionKey.UserProfileKey.ToString()] as UserProfile;
        }
        public static void SetUserProfile(UserProfile user)
        {

            HttpContext.Current.Session[Enum_.InternalSessionKey.UserProfileKey.ToString()] = user;
        }
    }
}
