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
    public partial class Coding : System.Web.UI.Page
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

        int _CodingID;
        public int CodingID
        {
            get
            {
                return _CodingID;
            }
            set
            {
                _CodingID = value;
            }
        }

        TBL_Coding da_Coding = new TBL_Coding();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CodingID"]))
                CodingID = Utility.ConverToNullableInt(Request.QueryString["CodingID"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            BindCodingGroupList();
            muvCoding.ActiveViewIndex = PageView;
            switch (PageView)
            {
                case 0://for list
                    BindCodingList();
                    break;

                case 1://for detail
                    FillEditControls(CodingID);
                    break;
            }
        }

        protected void BindCodingList()
        {
            DataTable dtCoding = da_Coding.TBL_Coding_Tra(0, "select_all");
            grdCoding.DataSource = dtCoding;
            grdCoding.DataBind();
        }

        protected void BindCodingGroupList()
        {
            DataTable dtCodingGroup = da_Coding.TBL_CodingGroup_Tra(0, "select_all");
            ddlCodingGroup.DataValueField = "CodingGroupID";
            ddlCodingGroup.DataTextField = "CodingGroupName";
            ddlCodingGroup.DataSource = dtCodingGroup;
            ddlCodingGroup.DataBind();
        }

        protected void FillEditControls(int codingID)
        {
            DataTable dtCoding = da_Coding.TBL_Coding_Tra(codingID, "select_byID");
            if (dtCoding.Rows.Count > 0)
            {
                txtCodingName.Text = dtCoding.Rows[0]["CodingName"].ToString();
                txtCodingValue.Text = dtCoding.Rows[0]["CodingValue"].ToString();
                ddlCodingGroup.SelectedValue = Utility.ConverToNullableStringForDDL(dtCoding.Rows[0]["CodingGroupID"]);
            }
        }

        protected void lnkConfirm_Click(object sender, EventArgs e)
        {
            DataTable dtCoding = new DataTable();
            if (CodingID > 0)
                dtCoding = da_Coding.TBL_Coding_Tra(CodingID, "update", txtCodingName.Text, 0,
                    Utility.ConverToNullableInt(ddlCodingGroup.SelectedValue), Utility.ConverToNullableInt(txtCodingValue.Text));
            else
                dtCoding = da_Coding.TBL_Coding_Tra(0, "insert", txtCodingName.Text, 0,
                    Utility.ConverToNullableInt(ddlCodingGroup.SelectedValue), Utility.ConverToNullableInt(txtCodingValue.Text));


            if (dtCoding.Rows.Count > 0)
                if (CodingID > 0)
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
            CodingID = Utility.ConverToNullableInt(e.CommandArgument);
            Response.Redirect("~/bizpanel/Coding.aspx?PageView=1&CodingID=" + CodingID.ToString(), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            CodingID = Utility.ConverToNullableInt(e.CommandArgument);
            da_Coding.TBL_Coding_Tra(CodingID, "delete_item");
            BindCodingList();
        }

        protected void lnkNewCoding_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/Coding.aspx?PageView=1", true);
        }
    }
}