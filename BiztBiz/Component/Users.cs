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

using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz.Component
{
    public class Users
    {
        public static Boolean CheckLogin(string username, string password, bool isRemember)
        {
            if (username.Trim() == string.Empty || password.Trim() == string.Empty)
                return false;

            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            dt = dauser.TBL_User_Tra(0, "Login", username.Trim(), password.Trim(), 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);

            if (dt.Rows.Count > 0)
            {
                Set_User_Online(dt, isRemember);
                return true;
            }
            else
                return false;
        }

        public static bool CheckUserValidatePassword(string password)
        {
            bool check = false;

            if (Users.UserValid())
            {
                TBL_User_Biz dauser = new TBL_User_Biz();
                DataTable dt;
                dt = dauser.TBL_User_Tra(0, "Login", UserOnline.Uid(), password.Trim(), 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);

                if (dt.Rows.Count > 0)
                    check = true;
            }
            return check;
        }

        public static Boolean UserValid()
        {
            return UserOnline.User_Is_Valid();
        }
        public static void Set_User_Online(DataTable dt, bool isRemember)
        {
            TBL_Company_Profile da_prof = new TBL_Company_Profile();
            HttpCookie ObjCookie2 = new HttpCookie("Login");

            try
            {
                DataTable dtCompany = da_prof.TBL_Company_Profile_Tra(0, "select_item", Utility.ConverToNullableInt(dt.Rows[0]["id"].ToString()), "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");
                string CompanyID = dtCompany.Rows[0]["id"].ToString();

                ObjCookie2.Values["id"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["id"].ToString()));
                ObjCookie2.Values["Uid"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Uid"].ToString()));
                ObjCookie2.Values["Given_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Given_Name"].ToString()));
                ObjCookie2.Values["Family_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Family_Name"].ToString()));
                ObjCookie2.Values["Sex"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Sex"].ToString()));
                ObjCookie2.Values["User_Status"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["User_Status"].ToString()));
                ObjCookie2.Values["User_Level"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["User_Level"].ToString()));
                ObjCookie2.Values["Company"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Company"].ToString()));
                ObjCookie2.Values["CompanyID"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(CompanyID));
                ObjCookie2.Values["UsersRoleID"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["UsersRoleID"].ToString()));
                ObjCookie2.Values["UserOnlineValid"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes("true"));
                ObjCookie2.Values["TelNo"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Tel_A_Number"].ToString()));
             
            }
            catch (Exception)
            { }

            if (isRemember)
                ObjCookie2.Expires = DateTime.Now.AddDays(30);
            else
                ObjCookie2.Expires = DateTime.Now.AddHours(2);

            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
        }

        public static void Set_User_SignOut()
        {
            if (HttpContext.Current.Request.Cookies["Login"] != null)
            {
                HttpCookie UserLogin = new HttpCookie("Login");
                UserLogin.Expires = DateTime.Now.AddDays(-1d);
                HttpContext.Current.Response.Cookies.Add(UserLogin);
            }
        }

        public static CompanyProfileStatus GetUserCompanyProfileStatus()
        {
            CompanyProfileStatus status = CompanyProfileStatus.NotSend;

            TBL_Company_Profile daCompany = new TBL_Company_Profile();
            DataTable dtCompany = daCompany.TBL_Company_Profile_Tra("select_item", UserOnline.id());
            if (dtCompany.Rows.Count > 0)
            {
                status = CompanyProfileStatus.SendNotComplate;
                if (!string.IsNullOrEmpty(dtCompany.Rows[0]["Company_Name"].ToString()) && !string.IsNullOrEmpty(dtCompany.Rows[0]["Company_Address"].ToString())
                    && !string.IsNullOrEmpty(dtCompany.Rows[0]["City"].ToString()) && !string.IsNullOrEmpty(dtCompany.Rows[0]["Zip"].ToString())
                    && !string.IsNullOrEmpty(dtCompany.Rows[0]["BusinessType"].ToString()) && !string.IsNullOrEmpty(dtCompany.Rows[0]["Group_ID"].ToString())
                    && !string.IsNullOrEmpty(dtCompany.Rows[0]["UsageType"].ToString()))
                    status = CompanyProfileStatus.SendAndComplate;
            }

            return status;
        }

        public enum CompanyProfileStatus
        {
            NotSend = 0,
            SendNotComplate = 1,
            SendAndComplate = 2
        }

    }
}
