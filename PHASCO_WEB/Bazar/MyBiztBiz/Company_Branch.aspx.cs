using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using Membership_Manage;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class Company_Branch : BasePage
    {

        int _CompanyBranchID;
        public int CompanyBranchID
        {
            get
            {
                return _CompanyBranchID;
            }
            set
            {
                _CompanyBranchID = value;
            }
        }

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


        TBL_Company_Profile da_prof = new TBL_Company_Profile();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            //if (!string.IsNullOrEmpty(Request.QueryString["CompanyID"]))
            //    CompanyID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CompanyID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CompanyBranchID"]))
                CompanyBranchID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CompanyBranchID"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            CompanyID = UserOnline.CompanyID();
            if (CompanyID > 0)
            {
                muvCompanyBranch.ActiveViewIndex = PageView;

                switch (PageView)
                {
                    case 0://for list
                        BindCopmanyBranch(CompanyID);
                        break;

                    case 1://for detail
                        FillEditControls(CompanyBranchID);
                        break;
                }
            }
            else
                muvCompanyBranch.ActiveViewIndex = 2;
        }

        protected void BindCopmanyBranch(int companyID)
        {
            DataTable dtCopmanyBranch = da_prof.TBL_Company_Branch_Tra(companyID);
            repCompanyBranch.DataSource = dtCopmanyBranch;
            repCompanyBranch.DataBind();
        }

        protected void FillEditControls(int companyBranchID)
        {
            DataTable dtCopmanyBranch = da_prof.TBL_Company_Branch_Tra(companyBranchID, "select_byid");
            if (dtCopmanyBranch.Rows.Count > 0)
            {
                lnkNewBranch.Text = "ویرایش شعبه";
                txtBranchAdress.Text = dtCopmanyBranch.Rows[0]["BranchAdress"].ToString();
                //txtBranchCode.Text = dtCopmanyBranch.Rows[0]["BranchCode"].ToString();
                txtBranchName.Text = dtCopmanyBranch.Rows[0]["BranchName"].ToString();
                txtBranchTel.Text = dtCopmanyBranch.Rows[0]["BranchTel"].ToString();
                txtDescription.Text = dtCopmanyBranch.Rows[0]["Description"].ToString();
            }
        }

        protected void ImageButton_Create_Click(object sender, EventArgs e)
        {
            CompanyID = UserOnline.CompanyID();

            DataTable dtCompany_Branch = new DataTable();
            if (CompanyBranchID > 0)
                dtCompany_Branch = da_prof.TBL_Company_Branch_Tra(CompanyBranchID, "update", CompanyID, txtBranchName.Text, ""
                     , txtBranchAdress.Text, txtBranchTel.Text, txtDescription.Text);
            else
                dtCompany_Branch = da_prof.TBL_Company_Branch_Tra(0, "insert", CompanyID, txtBranchName.Text, ""
                     , txtBranchAdress.Text, txtBranchTel.Text, txtDescription.Text);
            if (dtCompany_Branch.Rows.Count > 0)
            {
                if (CompanyBranchID > 0)
                    ShowSuccessfulMessage(1);
                else
                    ShowSuccessfulMessage(2);
            }

            BindCopmanyBranch(CompanyID);
        }

        protected void ShowSuccessfulMessage(int messageType)
        {
            divMessage.Visible = true;
            divMessage.Style.Add("background-color", "Green");
            if (messageType == 1)
                lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";
            else
                lblMessage.Text = "عملیات ثبت اطلاعات با موفقیت انجام شد";
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            CompanyBranchID = PHASCOUtility.ConverToNullableInt(e.CommandArgument);
            Response.Redirect("~/bazar/MyBiztBiz/Company_Branch.aspx?PageView=1&CompanyBranchID=" + CompanyBranchID.ToString(), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            CompanyID = UserOnline.CompanyID();

            CompanyBranchID = PHASCOUtility.ConverToNullableInt(e.CommandArgument);
            da_prof.TBL_Company_Branch_Tra(CompanyBranchID, "delete");
            BindCopmanyBranch(CompanyID);
        }

        protected void lnkCompanyBranch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Bazar/MyBiztBiz/Company_Branch.aspx?PageView=1", true);
        }


    }
}