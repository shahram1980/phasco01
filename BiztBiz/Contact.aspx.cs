using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BiztBiz.Component;
using System.Text;
using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz
{
    public partial class Contact : System.Web.UI.Page
    {
        int _PageView;
        public int PageView
        {
            get
            {
                return _PageView;
            }
            set
            {
                _PageView = value;
            }
        }

        int _RequestID;
        public int RequestID
        {
            get
            {
                return _RequestID;
            }
            set
            {
                _RequestID = value;
            }
        }

        int _ProductID;
        public int ProductID
        {
            get
            {
                return _ProductID;
            }
            set
            {
                _ProductID = value;
            }
        }

        int _CompanyID;
        public int CompanyID
        {
            get
            {
                return _CompanyID;
            }
            set
            {
                _CompanyID = value;
            }
        }

        int _TypeID;
        public int TypeID
        {
            get
            {
                return _TypeID;
            }
            set
            {
                _TypeID = value;
            }
        }

        int _ReciverID;
        public int ReciverID
        {
            get
            {
                return _ReciverID;
            }
            set
            {
                _ReciverID = value;
            }
        }

        int _StatusID;
        public int StatusID
        {
            get
            {
                return _StatusID;
            }
            set
            {
                _StatusID = value;
            }
        }

        TBL_Request da_request = new TBL_Request();
        Tbl_Products da_Products = new Tbl_Products();
        TBL_Company_Profile da_Company = new TBL_Company_Profile();
        TBL_inquire da_inquire = new TBL_inquire();
        TBL_User_Biz da_User = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {
            FeildComplate.Visible = false;
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["RequestID"]))
                RequestID = Utility.ConverToNullableInt(Request.QueryString["RequestID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ProductID"]))
                ProductID = Utility.ConverToNullableInt(Request.QueryString["ProductID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CompanyID"]))
                CompanyID = Utility.ConverToNullableInt(Request.QueryString["CompanyID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["TypeID"]))
                TypeID = Utility.ConverToNullableInt(Request.QueryString["TypeID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ReciverID"]))
                ReciverID = Utility.ConverToNullableInt(Request.QueryString["ReciverID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            try
            {
                FillEditCtl();
                muvContact.ActiveViewIndex = PageView;
                if (PageView == 1)
                {
                    lblMessage.Text = "پیام شما با موفقیت ارسال شد . ";
                }
                switch (TypeID)
                {
                    case 1: // For Product
                        lblTitle.Text = "ارسال پیغام برای فروشنده";
                        txtSubject.Text = "ارسال درخواست برای محصول " + da_Products.Tbl_Products_Tra("Select_item", ProductID).Rows[0]["Produc_Name"].ToString();
                        break;

                    case 2:
                        lblTitle.Text = "ارسال پیغام برای درخواست کننده";
                        txtSubject.Text = "ارسال پاسخ برای  " + da_request.TBL_Request_Tra(RequestID, "select_byid").Rows[0]["ProductName"].ToString();
                        break; // For Request

                    case 3:
                        lblTitle.Text = "ارسال پیغام برای فروشنده";
                        txtSubject.Text = " ارسال پیغام برای شرکت " + da_Company.TBL_Company_Profile_Tra(CompanyID, "select_itemByID").Rows[0]["Company_Name"].ToString();
                        break; // For Companu
                }

                lblReciverName.Text = da_User.TBL_User_Tra("selectById", ReciverID).Rows[0]["FullName"].ToString(); ;

            }
            catch
            {
            }
        }

        protected void FillEditCtl()
        {
            if (Users.UserValid())
            {
                txtFirstName.Text = UserOnline.Given_Name();
                txtLastName.Text = UserOnline.Family_Name();
                txtSenderEmail.Text = UserOnline.Uid();
                txtTelNum.Text = UserOnline.TelNo();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
           
            if (txtMessages.Text == string.Empty || txtSenderEmail.Text == string.Empty || txtTelNum.Text == string.Empty)
            { FeildComplate.Visible = true; return; }
            try
            {
                int userID = 0;
                int productID = 0;
                if (!string.IsNullOrEmpty(Request.QueryString["RequestID"]))
                    RequestID = Utility.ConverToNullableInt(Request.QueryString["RequestID"]);

                if (!string.IsNullOrEmpty(Request.QueryString["ProductID"]))
                    ProductID = Utility.ConverToNullableInt(Request.QueryString["ProductID"]);

                if (!string.IsNullOrEmpty(Request.QueryString["CompanyID"]))
                    CompanyID = Utility.ConverToNullableInt(Request.QueryString["CompanyID"]);

                if (!string.IsNullOrEmpty(Request.QueryString["TypeID"]))
                    TypeID = Utility.ConverToNullableInt(Request.QueryString["TypeID"]);

                if (!string.IsNullOrEmpty(Request.QueryString["ReciverID"]))
                    ReciverID = Utility.ConverToNullableInt(Request.QueryString["ReciverID"]);

                if (Users.UserValid())
                    userID = UserOnline.id();

                switch (TypeID)
                {
                    case 1: // For Product
                        productID = ProductID;
                        break;

                    case 2:
                        productID = RequestID;
                        break; // For Request

                    case 3:
                        productID = CompanyID;
                        break; // For Companu

                }

                if (TypeID > 0 && (RequestID > 0 || CompanyID > 0 || ProductID > 0))
                {
                    da_inquire.TBL_inquire_Tra(0, "insert", userID, ReciverID, productID, txtSubject.Text, txtMessages.Text
                        , "", 0, TypeID, txtFirstName.Text + " " + txtLastName.Text, txtSenderEmail.Text, txtTelNum.Text);
                }

                //StringBuilder strScript = new StringBuilder();
                //strScript.Append("<script type=\"text/javascript\">");
                //strScript.Append(" $(document).ready(function () {");
                //strScript.Append(" if (parent.closeColorBox)");
                //strScript.Append(" parent.closeColorBox();");
                //strScript.Append("return false;");
                //strScript.Append(" });");
                //strScript.Append("</script>");

                //ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", strScript.ToString());
                muvContact.ActiveViewIndex = 1;
                lblMessage.Text = "پیام شما با موفقیت ارسال شد . ";
                //Response.Redirect(Request.UrlReferrer.OriginalString, true);

                //Response.Redirect("Contact.aspx?PageView=1", true);
            }
            catch
            {
                //StringBuilder strScript = new StringBuilder();
                //strScript.Append("<script type=\"text/javascript\">");
                //strScript.Append(" $(document).ready(function () {");
                //strScript.Append(" parent.closeColorBox();");
                //strScript.Append("return false;");
                //strScript.Append(" });");
                //strScript.Append("</script>");

                //ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", strScript.ToString());
                Response.Redirect(Request.UrlReferrer.OriginalString, true);

            }

        }
    }
}