using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using DataAccessLayer;
using DataAccessLayer.BIZ;
using DataAccessLayer.Users;
using BusinessAccessLayer;
namespace Membership_Manage
{
    public class UserOnline
    {


        #region User Phasco Base Info
        public static string name()
        {
            try { return HttpContext.Current.Session["Login_Current_User_name"] + " " + HttpContext.Current.Session["Login_Current_User_Famil"]; }
            catch (Exception) { }// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string Credit()
        {
            try { return HttpContext.Current.Session["Login_Current_User_Credit"].ToString(); }
            catch (Exception) { }// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string email()
        {
            try { return HttpContext.Current.Session["Login_User_Email"].ToString(); }
            catch (Exception) { }// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static int role()
        {
            try { return int.Parse(HttpContext.Current.Session["Login_Current_User_Role"].ToString()); }
            catch (Exception) { }// ContentBase.Set_User_Online(false); }
            return 0;
        }
        public static string Uid()
        {
            try { return HttpContext.Current.Session["Login_Current_User_Uid"].ToString(); }
            catch (Exception) { }// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static int id()
        {
            try { return Convert.ToInt32(HttpContext.Current.Session["Login_Current_User_Id"].ToString()); }
            catch (Exception) { }//ContentBase.Set_User_Online(false); }
            return 0;

        }
        public static string sexid()
        {
            try { return HttpContext.Current.Session["Login_Current_User_sex"].ToString(); }
            catch (Exception) { }// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string sex()
        {
            try
            {
                if (HttpContext.Current.Session["Login_Current_User_sex"].ToString() == "f")
                    return Resources.Resource.Mss.ToString();
                if (HttpContext.Current.Session["Login_Current_User_sex"].ToString() == "m")
                    return Resources.Resource.Mr.ToString();
            }
            catch (Exception)
            { }// ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string Point()
        {
            try { return HttpContext.Current.Session["Login_User_Point"].ToString(); }
            catch (Exception) { }// ContentBase.Set_User_Online(false); }
            return "";

        }
        public static string Daily_Login()
        {
            try { return HttpContext.Current.Session["Login_Current_User_Daily_Login"].ToString(); }
            catch (Exception) { }//ContentBase.Set_User_Online(false); }
            return "";
        }
        public static string image()
        {
            string ret = "";
            if (image_Valid()) ret = "http:////phasco.com//phascoupfile//Userphoto//" + id().ToString() + ".jpg";
            else ret = "http:////phasco.com//phascoupfile//Userphoto//Nopic.jpg";
            return ret.ToString();
        }
        #endregion

        #region User Phasco BIZ Info
        public static string Given_Name()
        {
            try
            {
                return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_Given_Name"].ToString()));
            }
            catch (Exception)
            { return ""; }
            return "";
        }
        public static string Family_Name()
        {
            try
            {
                return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_Family_Name"].ToString()));
            }
            catch (Exception)
            { return ""; }
            return "";
        }
        public static string User_Status()
        {
            try
            {
                return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_User_Status"].ToString()));
            }
            catch (Exception)
            { return ""; }
            return "";
        }
        public static string User_Level()
        {
            try
            {
                return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_User_Level"].ToString()));
            }
            catch (Exception)
            { return ""; }
            return "";
        }
        public static string Company()
        {
            try
            {
                return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_Company"].ToString()));
            }
            catch (Exception)
            { return ""; }
            return "";
        }
        public static string TelNo()
        {
            try
            {
                return System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_TelNo"].ToString()));
            }
            catch (Exception)
            { return ""; }
            return "";
        }
        public static int CompanyID()
        {
            try
            {
                return Convert.ToInt32(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_CompanyID"].ToString())).ToString());
            }
            catch (Exception)
            { return 0; }
            return 0;

        }
        public static int UsersRoleID()
        {
            try
            {
                return Convert.ToInt32(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(HttpContext.Current.Session["Biz_UsersRoleID"].ToString())).ToString());
            }
            catch (Exception)
            { return 0; }
            return 0;
        }

        #endregion

        #region User Bool Data
        public static Boolean image_Valid()
        {
            try
            {
                if (HttpContext.Current.Session["Login_Current_User_Image"].ToString() == "1") { return true; }
                else { return false; }
            }
            catch (Exception) { return false; }
        }
        public static Boolean User_Online_Valid()
        {
            try
            {
                if (HttpContext.Current.Session["ValidUser"].ToString() == "true")
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
                HttpContext.Current.Session["Login_Current_User_name"] = "";
                HttpContext.Current.Session["Login_User_Email"] = "";
                HttpContext.Current.Session["Login_Current_User_Role"] = "";
                HttpContext.Current.Session["Login_Current_User_Famil"] = "";
                HttpContext.Current.Session["Login_Current_User_Uid"] = "";
                HttpContext.Current.Session["Login_Current_User_Id"] = "";
                HttpContext.Current.Session["Login_Current_User_sex"] = "";
                HttpContext.Current.Session["Login_User_Point"] = "";
                HttpContext.Current.Session["Login_Current_User_Credit"] = "";
                HttpContext.Current.Session["Login_Current_User_Daily_Login"] = "";
                HttpContext.Current.Session["Login_Current_User_Image"] = "";
                HttpContext.Current.Session["ValidUser"] = "";
                return true;
            }
            catch (Exception) { return false; }
            return false;

        }
        #endregion

        #region User Add Point Phacny
        public static void Add_Point(int id, int point, string mode)
        {
            TBL_User da = new TBL_User();
            da.Set_User_Point(mode, id, point);
        }
        public static void Add_Pheny(int id, int point, string mode)
        {
            DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter da = new DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter();
            da.Set_User_Point(mode, id, point);

            RefrshCurrenctUserInfo();
        }
        #endregion

        public static bool RefrshCurrenctUserInfo()
        {
            int? getid = 0;
            DS_MainPhasco.UsersDataTable ds_Login = new DS_MainPhasco.UsersDataTable();
            DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter da_Login = new DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter();
            ds_Login = da_Login.Users_Tra("ref_Uid", null, UserOnline.Uid(), "", null, null, null, null, null, null, null, null, null, null, null, null, null, null, ref getid);
            if (ds_Login.Rows.Count > 0)
                setUserOnlieInfo(ds_Login);
            else return false;
            return true;
        }
        public static bool setUserOnlieInfo(DS_MainPhasco.UsersDataTable ds_Login)
        {
            HttpCookie ObjCookie2 = new HttpCookie("login");
            ObjCookie2.Values["Current_User_name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(ds_Login[0].Name));// HttpContext.Current.Server.HtmlEncode(ds_Login[0].Name);
            ObjCookie2.Values["Current_User_Email "] = ds_Login[0].Email;
            ObjCookie2.Values["Current_User_Role"] = ds_Login[0].UserRole.ToString();
            ObjCookie2.Values["Current_User_Famil"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(ds_Login[0].Famil));// HttpContext.Current.Server.HtmlEncode(ds_Login[0].Famil);
            ObjCookie2.Values["Current_User_Uid"] = ds_Login[0].Uid;
            ObjCookie2.Values["Current_User_Id"] = ds_Login[0].Id.ToString();
            ObjCookie2.Values["Current_User_sex"] = ds_Login[0]["sex"].ToString();
            ObjCookie2.Values["Current_User_Point"] = ds_Login[0].Point.ToString();
            ObjCookie2.Values["Current_User_Credit"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(ds_Login[0].Credit.ToString()));
            ObjCookie2.Values["Current_User_Daily_Login"] = ds_Login[0].Daily_Login.ToString();
            ObjCookie2.Values["Current_User_Image"] = ds_Login[0].Image.ToString();
            ObjCookie2.Values["ValidUser"] = "true";
            ObjCookie2.Domain = "phasco.com";

            ObjCookie2.Expires = DateTime.Now.AddHours(3);
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
            return false;
        }
        public static bool CheckLogin2(string username, string password)
        {
            if (username.Trim() == string.Empty || password.Trim() == string.Empty) { return false; }
            TBL_User da = new TBL_User();
            DataTable dt = da.Users_Tra("Login", 0, username, password);

            if (dt == null || dt.Rows.Count == 0) { return false; }
            else
            {
                try
                {
  #region setuser data
                setUserOnlieInfo_withSession(dt);
                #endregion
                }
                catch (Exception)
                {   }
              
                return true;
            }
            return true;
        }
        public static void RefreshUserData()
        {
            TBL_User da = new TBL_User();
            DataTable dt = da.Users_Tra("select_id", id());

            if (dt == null || dt.Rows.Count == 0) { return; }
            else
            {
                #region setuser data
                setUserOnlieInfo_withSession(dt);
                #endregion
            }
        }
        public static bool setUserOnlieInfo_withSession(DataTable ds_Login)
        {
            DataAccessLayer.BIZ.TBL_Company_Profile da_prof = new DataAccessLayer.BIZ.TBL_Company_Profile();
            DataAccessLayer.BIZ.TBL_BIZ_User dauser = new DataAccessLayer.BIZ.TBL_BIZ_User();
            DataTable dt;
            dt = dauser.TBL_User_Tra(0, "Select_Uid", ds_Login.Rows[0]["Uid"].ToString(), "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            //try { Id_Biz = dt.Rows[0]["id"].ToString(); }
            //catch (Exception) { }
            HttpContext.Current.Session["Login_Current_User_name"] = ds_Login.Rows[0]["Name"].ToString();
            HttpContext.Current.Session["Login_User_Email"] = ds_Login.Rows[0]["Email"].ToString();
            HttpContext.Current.Session["Login_Current_User_Role"] = ds_Login.Rows[0]["UserRole"].ToString();
            HttpContext.Current.Session["Login_Current_User_Famil"] = ds_Login.Rows[0]["Famil"].ToString();
            HttpContext.Current.Session["Login_Current_User_Uid"] = ds_Login.Rows[0]["Uid"].ToString();
            HttpContext.Current.Session["Login_Current_User_Id"] = ds_Login.Rows[0]["Id"].ToString();
            HttpContext.Current.Session["Login_Current_User_sex"] = ds_Login.Rows[0]["sex"].ToString();
            HttpContext.Current.Session["Login_User_Point"] = ds_Login.Rows[0]["Point"].ToString();
            HttpContext.Current.Session["Login_Current_User_Credit"] = ds_Login.Rows[0]["Credit"].ToString();
            HttpContext.Current.Session["Login_Current_User_Daily_Login"] = ds_Login.Rows[0]["Daily_Login"].ToString();
            HttpContext.Current.Session["Login_Current_User_Image"] = ds_Login.Rows[0]["Image"].ToString();
            HttpContext.Current.Session["ValidUser"] = "true";
            HttpContext.Current.Session["UserQuizSumbit"] = "false";

            //   Set Biz Properties
            //HttpContext.Current.Session["Biz_id"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(Id_Biz.ToString()));
            HttpContext.Current.Session["Biz_Uid"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(ds_Login.Rows[0]["Uid"].ToString().ToString()));
            //HttpContext.Current.Session["Biz_email"] = ds_Login.Rows[0]["Email"].ToString(); ;
            HttpContext.Current.Session["ValidUser"] = "true";
            //try
            //{
            DataTable dtCompany = da_prof.TBL_Company_Profile_Tra(0, "select_allde", Convert.ToInt32(dt.Rows[0]["id"].ToString()), "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");
            if (dtCompany.Rows.Count > 0)
            {
                if (dtCompany.Rows.Count > 0)
                {
                    string CompanyID = dtCompany.Rows[0]["id"].ToString();
                    HttpContext.Current.Session["Biz_Given_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["Given_Name"].ToString()));
                    HttpContext.Current.Session["Biz_Family_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["Family_Name"].ToString()));
                    HttpContext.Current.Session["Biz_Sex"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["Sex"].ToString()));
                    HttpContext.Current.Session["Biz_User_Status"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["User_Status"].ToString()));
                    HttpContext.Current.Session["Biz_User_Level"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["User_Level"].ToString()));
                    HttpContext.Current.Session["Biz_Company"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["Company"].ToString()));
                    HttpContext.Current.Session["Biz_CompanyID"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(CompanyID));
                    HttpContext.Current.Session["Biz_UsersRoleID"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["UsersRoleID"].ToString()));
                    HttpContext.Current.Session["Biz_TelNo"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dtCompany.Rows[0]["Tel_A_Number"].ToString()));
                    HttpContext.Current.Session["Biz_Deteils"] = "True";
                }
                else
                    HttpContext.Current.Session["Biz_Deteils"] = "False";
            }
            //}
            //catch (Exception) { }
            //  Set Biz Properties
            HttpContext.Current.Session["Biz_Deteils"] = "False";
            return false;
        }

        public static string Control_Status()
        {
            if (User_Online_Valid())
            {
                int ID_ = id();
                //DataAccessLayer.BIZ.TBL_Company_Profile da_prof = new DataAccessLayer.BIZ.TBL_Company_Profile();
                //DataTable dtCompany = da_prof.TBL_Company_Profile_Tra(0, "select_item", ID_, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");

                DataAccessLayer.BIZ.TBL_User_Biz da_prof = new DataAccessLayer.BIZ.TBL_User_Biz();
                DataTable dtCompany = da_prof.TBL_User_Tra("selectById", ID_);

                if (!User_Biz_Valid_Deteils())
                {
                    if (dtCompany.Rows.Count > 0)
                    {
                        if (dtCompany.Rows[0]["ActiveMode"].ToString() == "0")
                        HttpContext.Current.Response.Redirect("~\\bazar\\RegisterComplate.aspx?uid=" + Uid());
                    }
                }
              //  else    HttpContext.Current.Response.Redirect("~\\bazar");
            }
            return "";
        }
        public static bool Set_User_Logout()
        {
            HttpContext.Current.Session["Login_Current_User_name"] = "";
            HttpContext.Current.Session["Login_User_Email"] = "";
            HttpContext.Current.Session["Login_Current_User_Role"] = "";
            HttpContext.Current.Session["Login_Current_User_Famil"] = "";
            HttpContext.Current.Session["Login_Current_User_Uid"] = "";
            HttpContext.Current.Session["Login_Current_User_Id"] = "";
            HttpContext.Current.Session["Login_Current_User_sex"] = "";
            HttpContext.Current.Session["Login_User_Point"] = "";
            HttpContext.Current.Session["Login_Current_User_Credit"] = "";
            HttpContext.Current.Session["Login_Current_User_Daily_Login"] = "";
            HttpContext.Current.Session["Login_Current_User_Image"] = "";
            HttpContext.Current.Session["ValidUser"] = "";
            HttpContext.Current.Session["UserQuizSumbit"] = "";
            HttpCookie ObjCookie2 = new HttpCookie("login");
            ObjCookie2.Values["Current_User_name"] = "";
            ObjCookie2.Values["Current_User_Email "] = "";
            ObjCookie2.Values["Current_User_Role"] = "";
            ObjCookie2.Values["Current_User_Famil"] = "";
            ObjCookie2.Values["Current_User_Uid"] = "";
            ObjCookie2.Values["Current_User_Id"] = "";
            ObjCookie2.Values["Current_User_sex"] = "";
            ObjCookie2.Values["Current_User_Credit"] = "";
            HttpContext.Current.Session.Clear();
            ObjCookie2.Values["ValidUser"] = "";
            ///  ObjCookie2.Domain = ".phasco.com";
            ObjCookie2.Expires = DateTime.Now.AddDays(-1d);// or For Example "2009/08/08";
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);

            return true;
        }
        public static DataTable Get_UserProperties(int id)
        {
            DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter da_Login = new DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter();
            //  int? getid = 0;
            // DataTable dt = da_Login.Users_Tra("select_Item", id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ref getid);
            TBL_User da = new TBL_User();
            DataTable dt = da.Users_Tra("select_Item", id, "", "");
            return dt;

        }
        public static void Set_User_Online(string UID, string id)
        {
            DataAccessLayer.BIZ.TBL_Company_Profile da_prof = new DataAccessLayer.BIZ.TBL_Company_Profile();
            DataAccessLayer.BIZ.TBL_BIZ_User dauser = new DataAccessLayer.BIZ.TBL_BIZ_User();
            HttpCookie ObjCookie2 = new HttpCookie("Login_Biz");
            string Id_Biz = "0";
            DataTable dt;
            dt = dauser.TBL_User_Tra(0, "Select_Uid", UID, "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            try
            {
                Id_Biz = dt.Rows[0]["id"].ToString();
            }
            catch (Exception) { }

            ObjCookie2.Values["Biz_id"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(Id_Biz.ToString()));
            ObjCookie2.Values["Biz_Uid"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(UID.ToString()));
            ObjCookie2.Values["Biz_UserOnlineValid"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes("true"));

            try
            {
                DataTable dtCompany = da_prof.TBL_Company_Profile_Tra(0, "select_item", Convert.ToInt32(dt.Rows[0]["id"].ToString()), "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");
                string CompanyID = dtCompany.Rows[0]["id"].ToString();

                ObjCookie2.Values["Biz_Given_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Given_Name"].ToString()));
                ObjCookie2.Values["Biz_Family_Name"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Family_Name"].ToString()));
                ObjCookie2.Values["Biz_Sex"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Sex"].ToString()));
                ObjCookie2.Values["Biz_User_Status"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["User_Status"].ToString()));
                ObjCookie2.Values["Biz_User_Level"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["User_Level"].ToString()));
                ObjCookie2.Values["Biz_Company"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Company"].ToString()));
                ObjCookie2.Values["Biz_CompanyID"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(CompanyID));
                ObjCookie2.Values["Biz_UsersRoleID"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["UsersRoleID"].ToString()));
                ObjCookie2.Values["Biz_TelNo"] = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(dt.Rows[0]["Tel_A_Number"].ToString()));
            }
            catch (Exception) { }
            //if (isRemember)  ObjCookie2.Expires = DateTime.Now.AddDays(30);
            ObjCookie2.Domain = ".phasco.com";
            ObjCookie2.Expires = DateTime.Now.AddHours(2);
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
        }
        public static Boolean User_Biz_Valid_Deteils()
        {
            try
            {
                if (HttpContext.Current.Session["Biz_Deteils"].ToString() == "True") { return true; }
                else { return false; }
            }
            catch (Exception) { return false; }
        }
    }

}