using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Threading;
using System.Globalization;
using DataAccessLayer.BIZ;
using BusinessAccessLayer.BIZ;

namespace BiztBiz
{
    public partial class Pssfgt : BasePage
    {
        public static ArrayList arQueryString = new ArrayList();
        TBL_User_Biz dauser = new TBL_User_Biz();
        DataTable dt;
        //protected override void InitializeCulture()
        //{
        //    try
        //    {
        //        if (Request.QueryString["mLang"] != null)
        //        {
        //            string name = Convert.ToString(Request.QueryString["mLang"]);
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
        //            HttpCookie cookie = new HttpCookie("elang");
        //            cookie.Value = name;
        //            Response.Cookies.Add(cookie);
        //            this.Page.Culture = name;
        //            this.Page.UICulture = name;
        //            Response.Redirect("Default.aspx");
        //        }
        //        else
        //        {
        //            HttpCookie cookie2 = Request.Cookies["elang"];
        //            string str2 = cookie2.Value.ToString();
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
        //            this.Page.Culture = str2;
        //            this.Page.UICulture = str2;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        this.Page.Culture = "fa-IR";
        //        this.Page.UICulture = "fa-IR";
        //    }
        //}
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack) Set_Password();
        //}

        //void Set_Password()
        //{
        //    string uid, Guid = "";
        //    try
        //    {
        //        if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString("UID", true)) == false && string.IsNullOrEmpty(QueryStringHelper.GetQueryString("qid", true)) == false)
        //        {

        //            uid = QueryStringHelper.GetQueryString("UID", true);
        //            Guid = QueryStringHelper.GetQueryString("qid", true);
        //            dt = dauser.TBL_User_Tra("changepassFORGET", int.Parse(uid), Guid);
        //            if (dt.Rows[0]["res"].ToString() != "0")
        //            {
        //                string body = "<p> نام کاربری  : </p> <p>" + dt.Rows[0]["uID"].ToString() + " </p>";
        //                body = body + "<p> رمز عبور جدید :  </p> <p>" + dt.Rows[0]["res"].ToString() + " </p> ;";
        //                body = body + "<p> Password :  </p> <p>" + dt.Rows[0]["res"].ToString() + " </p> ;";
        //                Mailer.Send_Mail("BiztBiz web site new pssword", dt.Rows[0]["uID"].ToString(), body);
        //                lblMessage.Text = Resources.Resource.forgot_Succ_sendmail;
        //                divMessage.Style.Add("background-color", "Green");
        //            }
        //            else
        //            {
        //                lblMessage.Text = Resources.Resource.forgot_Notvalid_User;
        //                divMessage.Style.Add("background-color", "Yellow");
        //            }

        //        }
        //        else
        //        {
        //            lblMessage.Text = Resources.Resource.forgot_Notvalid_User;
        //            divMessage.Style.Add("background-color", "Yellow");
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        lblMessage.Text = Resources.Resource.forgot_Notvalid_User;
        //        divMessage.Style.Add("background-color", "Red");
        //    }

        //}

        public static void AddToQueryString(string keys, string values)
        {
            object[] qrs = new object[2] { keys, values };
            arQueryString.Add(qrs);
        }

        public static void ClearQueryString()
        {
            arQueryString.Clear();
        }



    }
}