using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DataAccessLayer.BIZ;

namespace BiztBiz.bizpanel
{
    public partial class UserLimitation : System.Web.UI.Page
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

        int _UserRoleID;
        public int UserRoleID
        {
            get
            {
                return _UserRoleID;
            }
            set
            {
                _UserRoleID = value;
            }
        }

        TBL_User_Biz da_User = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["UserRoleID"]))
                UserRoleID = Utility.ConverToNullableInt(Request.QueryString["UserRoleID"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            muvUserRole.ActiveViewIndex = PageView;

            switch (PageView)
            {
                case 0://for list
                    BindUserRoleList();
                    break;

                case 1://for detail
                    FillEditControls(UserRoleID);
                    break;
            }
        }

        protected void BindUserRoleList()
        {
            DataTable dtUserRole = da_User.TBL_User_Limitation_Tra(0, "select_all");
            grdUserRole.DataSource = dtUserRole;
            grdUserRole.DataBind();
        }

        protected void FillEditControls(int userRoleID)
        {
            DataTable dtUserRole = da_User.TBL_User_Limitation_Tra(userRoleID, "select_byID");
            if (dtUserRole.Rows.Count > 0)
            {
                txtCompanyLimitedCount.Text = dtUserRole.Rows[0]["CompanyLimitedCount"].ToString();
                txtProductLimitedCount.Text = dtUserRole.Rows[0]["ProductLimitedCount"].ToString();
                txtProductLimitedDate.Text = dtUserRole.Rows[0]["ProductLimitedDate"].ToString();
                txtRequestLimitedCount.Text = dtUserRole.Rows[0]["RequestLimitedCount"].ToString();
                txtRequestLimitedDate.Text = dtUserRole.Rows[0]["RequestLimitedDate"].ToString();
                txtRoleName.Text = dtUserRole.Rows[0]["RoleName"].ToString();
            }
        }

        protected void lnkConfirm_Click(object sender, EventArgs e)
        {
            DataTable dtUserRole = new DataTable();
            if (UserRoleID > 0)
                dtUserRole = da_User.TBL_User_Limitation_Tra(UserRoleID, "update", txtRoleName.Text, Utility.ConverToNullableInt(txtProductLimitedCount.Text),
                    Utility.ConverToNullableInt(txtProductLimitedDate.Text), Utility.ConverToNullableInt(txtRequestLimitedCount.Text),
                    Utility.ConverToNullableInt(txtRequestLimitedDate.Text), Utility.ConverToNullableInt(txtCompanyLimitedCount.Text), 0);
            else
                dtUserRole = da_User.TBL_User_Limitation_Tra(0, "insert", txtRoleName.Text, Utility.ConverToNullableInt(txtProductLimitedCount.Text),
                    Utility.ConverToNullableInt(txtProductLimitedDate.Text), Utility.ConverToNullableInt(txtRequestLimitedCount.Text),
                    Utility.ConverToNullableInt(txtRequestLimitedDate.Text), Utility.ConverToNullableInt(txtCompanyLimitedCount.Text), 0);


            if (dtUserRole.Rows.Count > 0)
                if (UserRoleID > 0)
                    ShowSuccessfulMessage(1);
                else
                    ShowSuccessfulMessage(0);

        }

        protected void ShowSuccessfulMessage(int messageType)
        {
            lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Green;
            if (messageType == 1)
                lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";
            else
                lblMessage.Text = "عملیات ثبت اطلاعات با موفقیت انجام شد";
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            UserRoleID = Utility.ConverToNullableInt(e.CommandArgument);
            Response.Redirect("~/bizpanel/UserLimitation.aspx?PageView=1&UserRoleID=" + UserRoleID.ToString(), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            UserRoleID = Utility.ConverToNullableInt(e.CommandArgument);
            da_User.TBL_User_Limitation_Tra(UserRoleID, "delete_item");
            BindUserRoleList();
        }

        protected void lnkNewUserLimitations_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/UserLimitation.aspx?PageView=1", true);
        }
    }
}