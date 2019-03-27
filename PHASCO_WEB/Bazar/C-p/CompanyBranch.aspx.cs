using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;

namespace BiztBiz.C_p
{
    public partial class CompanyBranch : System.Web.UI.Page
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

        TBL_Company_Profile da_Company = new TBL_Company_Profile();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CompanyBranchID"]))
                CompanyBranchID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CompanyBranchID"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            if (CompanyBranchID > 0)
                BindCompanyBranchDetails(CompanyBranchID);
        }

        protected void BindCompanyBranchDetails(int companyBranchID)
        {
            DataTable dtCompanyBranch = da_Company.TBL_Company_Branch_Tra(companyBranchID, "select_byid");
            repCompanyBranchDetails.DataSource = dtCompanyBranch;
            repCompanyBranchDetails.DataBind();
            if (dtCompanyBranch.Rows.Count > 0)
                BindRelationCompanyBranch(companyBranchID, PHASCOUtility.ConverToNullableInt(dtCompanyBranch.Rows[0]["CompanyID"]));
        }

        protected void BindRelationCompanyBranch(int companyBranchID,int companyID)
        {
            DataTable dtRelationCompanyBranch = da_Company.TBL_Company_Branch_Tra(companyBranchID, "select_byCompanyIDAndNotID", companyID);
            repCompanyBranchList.DataSource = dtRelationCompanyBranch;
            repCompanyBranchList.DataBind();
        }
    }
}