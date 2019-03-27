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
using phasco_webproject.BaseClass;
using Membership_Manage;
using DataAccessLayer;

namespace PHASCO_WEB.BaseClass
{
    public class Friends
    {
        public static string Add_tolist(int id)
        {
            TBL_User_Friends friends = new TBL_User_Friends();
            if (UserOnline.User_Online_Valid() == true)
            {
                
                int Current_User_Id = UserOnline.id();
                DataTable dt = friends.Insert_del_update(1, Current_User_Id, "0", 0, id, null);
                if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() == "0") { return "این کاربر قبلا به لیست شما اضافه شده است"; }
                else { return "کاربر انتخابی به لیست شما اضافه شد"; }
            }
            else return "کاربر محترم لطفا ابتدا در سایت لاگین کنید";
            return "";
        }


        public static bool Freind_Valid( int friendid)
        {
            if (!UserOnline.User_Online_Valid() == true) return false;
            if (UserOnline.id() == friendid) return false;    
            TBL_User_Friends friends = new TBL_User_Friends();
            if (friends.Insert_del_update(12, UserOnline.id(), friendid).Rows.Count > 0) return false;
            else                return true;
            return false;
        }


    }
}
