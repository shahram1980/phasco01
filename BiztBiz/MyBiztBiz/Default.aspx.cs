using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using BiztBiz.Component;
using System.Threading;
using System.Globalization;

using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class Default : BasePage
    {
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
        //            Response.Redirect(Request.UrlReferrer.ToString());
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

        Tbl_Products daProduct = new Tbl_Products();
        TBL_Request daRequest = new TBL_Request();
        TBL_inquire da_Inquiry = new TBL_inquire();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                set_properies();
        }

        protected void SetLinkAndInq()
        {
            DataTable dtInquiry = da_Inquiry.TBL_inquire_Tra(UserOnline.id(), "SelectCountinquire");
            if (dtInquiry.Rows.Count > 0)
            {
                lnkProductInquiry.Text = dtInquiry.Rows[0]["Productinquire"].ToString() + " درخواست جدید! ";

                lnkRequestInquiry.Text = dtInquiry.Rows[0]["Requestinquire"].ToString() + " پاسخ جدید! ";

                lnkMessageInquiry.Text = dtInquiry.Rows[0]["Messageinquire"].ToString() + " پاسخ جدید! ";
            }
        }

        void set_properies()
        {
            try
            {
                companyProfileComplate.Visible = false;
                if (Request.QueryString["CCq009Pr9278"] != null)
                    if (Request.QueryString["CCq009Pr9278"].ToString() == "Tq9NNjo1pplnJE") { companyProfileComplate.Visible = true; }




                SetLinkAndInq();
                CheckProductRemind();
                CheckRequestRemind();

                pagetile.InnerText = "My IranProBiz " + UserOnline.Uid();

                int userID = UserOnline.id();


                DataTable dtProducts = daProduct.Tbl_Products_Tra("selectcount_byuid", userID, 0);
                if (dtProducts.Rows.Count > 0)
                {
                    lblConfirmProduct.Text = dtProducts.Rows[0]["ConfirmProductsCount"].ToString();
                    lblCountSendProduct.Text = dtProducts.Rows[0]["TotalProductsCount"].ToString() + " محصول ";
                    lblCountWaitProduct.Text = dtProducts.Rows[0]["WaitProductsCount"].ToString();
                    lblNotConfirmProduct.Text = dtProducts.Rows[0]["NotConfirmProductsCount"].ToString();
                }

                DataTable dtRequest = daRequest.TBL_Request_Tra(0, "selectcount_byuid", userID, "", "", "", "", "", 0, "", "", 0, DateTime.Now, DateTime.Now, DateTime.Now, 0);
                if (dtRequest.Rows.Count > 0)
                {
                    lblConfirmRequest.Text = dtRequest.Rows[0]["ConfirmRequestCount"].ToString();
                    lblCountSendRequest.Text = dtRequest.Rows[0]["TotalRequestCount"].ToString() + " درخواست ";
                    lblCountWaitRequest.Text = dtRequest.Rows[0]["WaitRequestCount"].ToString();
                    lblNotConfirmRequest.Text = dtRequest.Rows[0]["NotConfirmRequestCount"].ToString();
                }


                Users.CompanyProfileStatus status = Users.GetUserCompanyProfileStatus();
                switch (status)
                {
                    case Users.CompanyProfileStatus.NotSend:
                        lblCompanyProfile.Text = "پروفایل شرکت ارسال نشده است";
                        break;
                    case Users.CompanyProfileStatus.SendNotComplate:
                        lblCompanyProfile.Text = "پروفایل شرکت تکمیل نیست";
                        break;
                    case Users.CompanyProfileStatus.SendAndComplate:
                        lblCompanyProfile.Text = " ارسال شده است";
                        break;
                }
                TBL_Company_Profile da_com = new TBL_Company_Profile();
                DataTable dtCompanyGroup = da_com.TBL_Company_Profile_Tra(UserOnline.CompanyID(), "company_Groups");
                repCompanyGroup.DataSource = dtCompanyGroup;
                repCompanyGroup.DataBind();
            }
            catch
            {
            }

        }

        protected void CheckProductRemind()
        {
            DataTable dtProduct = daProduct.Tbl_Products_Tra("select_byidandexpire", UserOnline.id(), 5);
            if (dtProduct.Rows.Count > 0)
            {
                ProductRemind.Visible = true;
                lblProductRemind.Text = "تعداد " + dtProduct.Rows.Count + " محصول  منقضی شده است! برای فعال کردن مجدد محصولات، آنها را مجدد ویرایش نمائید.  ";
            }
        }

        protected void CheckRequestRemind()
        {
            DataTable dtRequest = daRequest.TBL_Request_Tra("select_byidandexpire", UserOnline.id(), 5);
            if (dtRequest.Rows.Count > 0)
            {
                RequestRemind.Visible = true;
                lblRequestRemind.Text = "تعداد " + dtRequest.Rows.Count + " درخواست منقضی شده است! برای فعال کردن مجدد درخواست ها، آنها را مجدد ویرایش نمائید.  ";
            }
        }
    }
}
