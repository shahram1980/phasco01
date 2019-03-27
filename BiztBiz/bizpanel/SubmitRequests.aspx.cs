using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiztBiz.Component;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;

namespace BiztBiz.bizpanel
{
    public partial class SubmitRequests : System.Web.UI.Page
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
        Tbl_state da_State = new Tbl_state();
        TBL_Categories da_Categories = new TBL_Categories();
        TBL_Coding coding = new TBL_Coding();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["RequestID"]))
                RequestID = Utility.ConverToNullableInt(Request.QueryString["RequestID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            muvRequest.ActiveViewIndex = PageView;

            switch (PageView)
            {
                case 0://for list
                    BindRequests(StatusID);
                    break;

                case 1://for detail
                    FillEditControls(RequestID);
                    break;
            }
        }

        protected void BindRequests(int status)
        {
            DataTable dtRequest = da_request.TBL_Request_Tra("select_bystatus", status);
            grdRequest.DataSource = dtRequest;
            grdRequest.DataBind();
        }

        protected void FillEditControls(int requestID)
        {
            DataTable dtRequest = da_request.TBL_Request_Tra(requestID, "select_byid");
            if (dtRequest.Rows.Count > 0)
            {
                int codingid = Utility.ConverToNullableInt(dtRequest.Rows[0]["ExpireSchedule"]);
                DataTable dtCoding = coding.TBL_Coding_Tra(codingid, "select_byID");
                if (dtCoding.Rows.Count > 0)
                {
                    DataTable dtExpireSchedule = coding.TBL_Coding_Tra(Utility.ConverToNullableInt(dtCoding.Rows[0]["CodingGroupID"]));
                    ddlExpireSchedule.DataTextField = "CodingName";
                    ddlExpireSchedule.DataValueField = "CodingID";
                    ddlExpireSchedule.DataSource = dtExpireSchedule;
                    ddlExpireSchedule.DataBind();
                }

                string stateID = "0";
                DataTable dtState = da_State.TBL_State_Tra(Utility.ConverToNullableInt(dtRequest.Rows[0]["CityID"]), "select_byID");
                if (dtState.Rows.Count > 0)
                {
                    stateID = dtState.Rows[0]["ParentID"].ToString();
                }

                string mainCategoryID = "0";
                string subCategoryId = "0";
                DataTable dtCategory = da_Categories.TBL_Categories_Tra(Utility.ConverToNullableInt(dtRequest.Rows[0]["Group_id"]), "select_L3_fa");
                if (dtCategory.Rows.Count > 0)
                {
                    if (Utility.ConverToNullableInt(dtCategory.Rows[0]["LevelID"]) == 0)
                    {
                        mainCategoryID = dtCategory.Rows[0]["id"].ToString();
                        subCategoryId = dtRequest.Rows[0]["Group_id"].ToString();
                    }
                    else if (Utility.ConverToNullableInt(dtCategory.Rows[0]["LevelID"]) == 1)
                    {
                        mainCategoryID = dtCategory.Rows[0]["subid"].ToString();
                        subCategoryId = dtCategory.Rows[0]["id"].ToString();
                    }
                }

                txtCount.Text = dtRequest.Rows[0]["Count"].ToString();
                txtDetailsAndFeatures.Text = dtRequest.Rows[0]["DetailsAndFeatures"].ToString();
                txtModel.Text = dtRequest.Rows[0]["Model"].ToString();
                txtDescription.Text = dtRequest.Rows[0]["Description"].ToString();
                txtPrice.Text = dtRequest.Rows[0]["Price"].ToString();
                txtProductName.Text = dtRequest.Rows[0]["ProductName"].ToString();

                ddlExpireSchedule.SelectedValue = dtRequest.Rows[0]["ExpireSchedule"].ToString();

                cddState.SelectedValue = stateID;
                ccdCity.SelectedValue = Utility.ConverToNullableStringForDDL(dtRequest.Rows[0]["CityID"]);

                ccdCat1.SelectedValue = mainCategoryID;
                ccdCat2.SelectedValue = subCategoryId;
                ccdCat3.SelectedValue = Utility.ConverToNullableStringForDDL(dtRequest.Rows[0]["Group_id"]);

            }
        }

        protected void ImageButton_Create_Click(object sender, EventArgs e)
        {
            DataTable dtRequest = new DataTable();
            //if (RequestID > 0)
            //    dtRequest = da_request.TBL_Request_Tra(RequestID, "update", UserOnline.id(),
            //           Utility.ConvertintForDBForDDLNotDBNull(ccdCat3.SelectedValue.Split(new char[] { ':' })[0]).ToString()
            //           , txtProductName.Text, txtModel.Text, txtDetailsAndFeatures.Text, Utility.ConverToNullableInt(txtCount.Text)
            //         , Utility.ConvertintForDBForDDLNotDBNull(ccdCity.SelectedValue.Split(new char[] { ':' })[0]),
            //         Utility.ConverToNullableInt(txtPrice.Text), txtDescription.Text, 0, DateTime.Now);
            //else
            //    da_request.TBL_Request_Tra(0, "insert", UserOnline.id(),
            //           Utility.ConvertintForDBForDDLNotDBNull(ccdCat3.SelectedValue.Split(new char[] { ':' })[0]).ToString()
            //           , txtProductName.Text, txtModel.Text, txtDetailsAndFeatures.Text, Utility.ConverToNullableInt(txtCount.Text)
            //         , Utility.ConvertintForDBForDDLNotDBNull(ccdCity.SelectedValue.Split(new char[] { ':' })[0]),
            //         Utility.ConverToNullableInt(txtPrice.Text), txtDescription.Text, 0, DateTime.Now);

            if (dtRequest.Rows.Count > 0)
            {
                if (RequestID > 0)
                    ShowSuccessfulMessage(1);
                else
                    ShowSuccessfulMessage(2);
            }

            //BindRequests();
        }

        protected void lnkConfirm_Click(object sender, EventArgs e)
        {
            DataTable dtRequest = new DataTable();
            int expirecount = 0;
            DataTable dtcoding = coding.TBL_Coding_Tra(Utility.ConverToNullableInt(ddlExpireSchedule.SelectedValue), "select_byID");
            if (dtcoding.Rows.Count > 0)
                expirecount = Utility.ConverToNullableInt(dtcoding.Rows[0]["CodingValue"]);
            DateTime endDate = DateTime.Now.AddDays(expirecount);
            if (RequestID > 0)
                dtRequest = da_request.TBL_Request_Tra("updateStatus", RequestID, 1, endDate);

            if (dtRequest.Rows.Count > 0)
                if (RequestID > 0)
                    ShowSuccessfulMessage(1);
        }

        protected void lnkNotConfirm_Click(object sender, EventArgs e)
        {
            DataTable dtRequest = new DataTable();
            if (RequestID > 0)
                dtRequest = da_request.TBL_Request_Tra("updateStatus", RequestID, 2, DateTime.Now);

            if (dtRequest.Rows.Count > 0)
                if (RequestID > 0)
                    ShowSuccessfulMessage(1);
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
            RequestID = Utility.ConverToNullableInt(e.CommandArgument);
            Response.Redirect("~/bizpanel/SubmitRequests.aspx?PageView=1&RequestID=" + RequestID.ToString(), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            RequestID = Utility.ConverToNullableInt(e.CommandArgument);
            da_request.TBL_Request_Tra(RequestID, "delete");
            BindRequests(StatusID);
        }

        protected void lnkWaitRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitRequests.aspx?PageView=0&Status=0", true);
        }

        protected void lnkNotConfirmRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitRequests.aspx?PageView=0&Status=2", true);
        }

        protected void lnkConfirmRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitRequests.aspx?PageView=0&Status=1", true);
        }

        protected void lnkExpireRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/bizpanel/SubmitRequests.aspx?PageView=0&Status=3", true);
        }
    }
}