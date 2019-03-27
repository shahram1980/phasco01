using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using phasco_webproject.BaseClass;
using PHASCO_WEB.DAL;
using Membership_Manage;

namespace phasco.BaseClass
{
    public class ContentBase : System.Web.UI.UserControl
    {
        private string _paramColection;
        public virtual MasterPageColection MasterPageName
        { get { return MasterPageColection.Phasco01; } }
        public event MessageHanlder OnShowMessage;
        public event EventHandler OnHideMessage;
        public virtual string FormTitle
        {
            get { return "None"; }
        }
        public void ShowMessage(string message, phasco_webproject.BaseClass.Enum.MessageType msgType)
        {
            if (OnShowMessage != null)
                OnShowMessage(this, new MessageEventArgs(message, msgType));
        }
        public void GotoPage(phasco_webproject.BaseClass.Enum.PageName page)
        {

            if (page == phasco_webproject.BaseClass.Enum.PageName.Login)
                Session.Clear();

            string pgUrl = "default.aspx?page=" + GetPageName(page) + ParamColection;
            //   string pgUrl = "?generate=" + GetPageName(page);

            Response.Redirect(pgUrl, true);

        }
        private string GetPageName(phasco_webproject.BaseClass.Enum.PageName page)
        {
            string Res = page.ToString();
            return Res;
        }
        public virtual string ParamColection
        {
            get
            {
                if (_paramColection == null) _paramColection = "";
                return _paramColection;
            }
            set { _paramColection = value; }
        }

        UserProfile _currentuser = null;
        #region User Do
        public static bool Set_User_Online(bool mode)
        {
            if (mode == false)
            {
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
                ObjCookie2.Expires = DateTime.Now.AddDays(-1);// or For Example "2009/08/08";
                HttpContext.Current.Response.Cookies.Add(ObjCookie2);
                return true;
            }
            return false;
        }

        public Boolean User_Online_Valid()
        {
            try
            {
                if (HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["ValidUser"]) == "true") { return true; }
                else { return false; }
            }
            catch (Exception)
            {
                return false;
            }
            return false;
        }
        public void Logout()
        { Set_User_Online(false); }
        #endregion

        protected UserProfile Currentuser
        {
            get { return _currentuser; }
            set { _currentuser = value; }
        }

        public DS_MainPhasco.ScientificPropertiesRow RefreshUserInformation(int AccountId)
        {
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientificPropertiesTableAdapter taccount = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientificPropertiesTableAdapter();
            DS_MainPhasco.ScientificPropertiesRow dr = null;
            DS_MainPhasco.ScientificPropertiesDataTable dt = new DS_MainPhasco.ScientificPropertiesDataTable();

            if (dt != null && dt.Rows.Count > 0)
            {
                dr = dt[0];
                this.Currentuser = SetProfile(dr);
            }
            return dr;
        }

        public UserProfile SetProfile(DS_MainPhasco.ScientificPropertiesRow row)
        {
            Session[phasco_webproject.BaseClass.Enum.InternalSessionKey.UserProfileKey.ToString()] = new UserProfile(row);
            UserProfile up = new UserProfile(row);
            ManagerFunction.SetUserProfile(up);
            return up;
        }

        public Boolean CheckLogin(string username, string password)
        {
            if (username.Trim() == string.Empty || password.Trim() == string.Empty)
            { ShowMessage(Resources.Resource.Login_Msg_Invalid, phasco_webproject.BaseClass.Enum.MessageType.Warning); return false; }

            DS_MainPhasco.UsersDataTable ds_Login = new DS_MainPhasco.UsersDataTable();
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da_Login = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();

            int? getid = 0;
            ds_Login = da_Login.Users_Tra("Login", null, username, password, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ref getid);
            if (ds_Login == null || ds_Login.Rows.Count == 0)
            { ShowMessage(Resources.Resource.Login_Msg_Invalid, phasco_webproject.BaseClass.Enum.MessageType.Warning); }
            else
            {
                string name = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(ds_Login[0].Name));

                #region setuser data
                setUserOnlieInfo(ds_Login);
                #endregion


                PHASCO_WEB.BLL.Eshop.Product_Tbl da_pro = new PHASCO_WEB.BLL.Eshop.Product_Tbl();
                da_pro.Product_Eshop_Move_To_OrginBasket(ds_Login[0].Id, SamAuthentication.GetId());
                //SetProfile(ds_pro[0]);
              //  Set_User_Online(true);
                return true;
            }
            return false;
        }

        public static bool RefrshCurrenctUserInfo()
        {
            int? getid = 0;
            DS_MainPhasco.UsersDataTable ds_Login = new DS_MainPhasco.UsersDataTable();
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter da_Login = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.UsersTableAdapter();
            ds_Login = da_Login.Users_Tra("ref_Uid", null, UserOnline.Uid(), "", null, null, null, null, null, null, null, null, null, null, null, null, null, null, ref getid);
            setUserOnlieInfo(ds_Login);
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
            ObjCookie2.Expires = DateTime.Now.AddHours(3);
            HttpContext.Current.Response.Cookies.Add(ObjCookie2);
            return false;
        }

        public static bool UserInformation()
        { return false; }
    }
}
