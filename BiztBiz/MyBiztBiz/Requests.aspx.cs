﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.Component;

using System.Data;
using Membership_Manage;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;

namespace BiztBiz.MyBiztBiz
{
    public partial class Requests : BasePage
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
        TBL_User_Biz da_User = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("PageView", true)))
                PageView = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("PageView", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("RequestID", true)))
                RequestID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("RequestID", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true)))
                StatusID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true));

            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            CheckButtonVisible();
            muvRequest.ActiveViewIndex = PageView;

            BindExpireSchedule();

            //Utility.ClearQueryString();//5061676556696577=30&537461747573=32
            //Utility.AddToQueryString("PageView", "0");
            //Utility.AddToQueryString("Status", "2");
            //lnkWaitRequest.NavigateUrl =QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/Requests.aspx", Utility.arQueryString, true);


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

        protected void CheckButtonVisible()
        {
            if (Users.UserValid())
            {
                DataTable dtCountRequest = da_request.TBL_RequestByUid("select_validbyuserid", UserOnline.id(), UserOnline.UsersRoleID());

                if (dtCountRequest.Rows.Count > 0)
                {
                    if (dtCountRequest.Rows[0][0].ToString() == "1")
                        ImageButton_Create.Visible = true;
                    else
                        ImageButton_Create.Visible = false;
                }
                else
                    ImageButton_Create.Visible = false;
            }
            else
                ImageButton_Create.Visible = false;

        }

        protected void BindRequests(int status)
        {
            DataTable dtRequest = da_request.TBL_Request_Tra(UserOnline.id(), status);
            repRequest.DataSource = dtRequest;
            repRequest.DataBind();
        }

        protected void BindExpireSchedule()
        {
            if (Users.UserValid())
            {
                if (UserOnline.UsersRoleID() == 3) // ForGoldenUser
                    coding.BindExpireScheduleRequestForGoldenUserDropDown(ddlExpireSchedule);
                else
                    coding.BindExpireScheduleRequestForNormalUserDropDown(ddlExpireSchedule);
            }
        }


        protected void FillEditControls(int requestID)
        {
            DataTable dtRequest = da_request.TBL_Request_Tra(requestID, "select_byid");
            if (dtRequest.Rows.Count > 0)
            {
                lnkNewRequest.Text = "ویرایش درخواست";
                if (Utility.ConverToNullableInt(dtRequest.Rows[0]["Uid_id"]) == UserOnline.id())
                {

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

                    DataTable dtState = da_State.TBL_State_Tra(Utility.ConverToNullableInt(dtRequest.Rows[0]["CityID"]), "select_byID");
                    if (dtState.Rows.Count > 0)
                    {
                        if (Utility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 2) // ostan
                        {
                            cddState.SelectedValue = Utility.ConverToNullableStringForDDL(dtRequest.Rows[0]["CityID"]);
                        }
                        else if (Utility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 3) // city
                        {
                            cddState.SelectedValue = dtState.Rows[0]["ParentID"].ToString();
                            ccdCity.SelectedValue = Utility.ConverToNullableStringForDDL(dtRequest.Rows[0]["CityID"]);
                        }
                    }

                    ccdCat1.SelectedValue = mainCategoryID;
                    ccdCat2.SelectedValue = subCategoryId;
                    ccdCat3.SelectedValue = Utility.ConverToNullableStringForDDL(dtRequest.Rows[0]["Group_id"]);
                }
            }
        }

        protected void ImageButton_Create_Click(object sender, EventArgs e)
        {
            divMessage.Visible = true;
            lblMessage.Text = string.Empty;
            int groupID = Utility.ConvertintForDBForDDLNotDBNull(ccdCat3.SelectedValue.Split(new char[] { ':' })[0]);
            if (groupID <= 0)
            {
                groupID = Utility.ConvertintForDBForDDLNotDBNull(ccdCat2.SelectedValue.Split(new char[] { ':' })[0]);
            }

            int city = Utility.ConverToNullableInt(ccdCity.SelectedValue.Split(new char[] { ':' })[0]);
            if (city <= 0)
            {
                city = Utility.ConverToNullableInt(cddState.SelectedValue.Split(new char[] { ':' })[0]);
            }

            if (groupID > 0)
            {
                DataTable dtRequest = new DataTable();
                if (RequestID > 0)
                {
                    dtRequest = da_request.TBL_Request_Tra(RequestID, "select_byid");
                    if (Utility.ConverToNullableInt(dtRequest.Rows[0]["Uid_id"]) == UserOnline.id())
                    {
                        dtRequest = da_request.TBL_Request_Tra(RequestID, "update", UserOnline.id(),
                               groupID.ToString()
                               , txtProductName.Text, txtModel.Text, txtDetailsAndFeatures.Text, Utility.ConverToNullableString(txtCount.Text)
                             , city, Utility.ConverToNullableString(txtPrice.Text), txtDescription.Text, 0, DateTime.Now,
                             DateTime.Now, DateTime.Now, Utility.ConverToNullableInt(ddlExpireSchedule.SelectedValue));
                    }
                    else
                        return;
                }
                else
                    dtRequest = da_request.TBL_Request_Tra(0, "insert", UserOnline.id(),
                             groupID.ToString()
                            , txtProductName.Text, txtModel.Text, txtDetailsAndFeatures.Text, Utility.ConverToNullableString(txtCount.Text)
                          , city, Utility.ConverToNullableString(txtPrice.Text), txtDescription.Text, 0, DateTime.Now,
                          DateTime.Now, DateTime.Now, Utility.ConverToNullableInt(ddlExpireSchedule.SelectedValue));

                if (dtRequest.Rows.Count > 0)
                {
                    if (RequestID > 0)
                        ShowSuccessfulMessage(1);
                    else
                        ShowSuccessfulMessage(2);

                    Utility.ClearQueryString();
                    Utility.AddToQueryString("PageView", "0");
                    Utility.AddToQueryString("Status", "0");
                    Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/Requests.aspx", Utility.arQueryString, true), true);
                }
                else
                {
                    //lblMessage.ForeColor = System.Drawing.Color.Red;
                    divMessage.Style.Add("background-color", "Red");
                    if (RequestID > 0)
                        lblMessage.Text = "اشکال در ویرایش اطلاعات";
                    else
                        lblMessage.Text = "اشکال در ثبت اطلاعات";
                }
            }
            else
            {
                //lblMessage.ForeColor = System.Drawing.Color.Red;
                divMessage.Style.Add("background-color", "Yellow");
                if (RequestID > 0)
                    lblMessage.Text = "دسته بندی را انتخاب کنید";
                else
                    lblMessage.Text = "دسته بندی را انتخاب کنید";
            }
        }

        public string Set_Date(string date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date))
            {
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 3);
            }
            return sdate;
        }

        protected void ShowSuccessfulMessage(int messageType)
        {
            divMessage.Visible = true;
            //lblMessage.ForeColor = System.Drawing.Color.Green;
            divMessage.Style.Add("background-color", "Green");
            if (messageType == 1)
                lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";
            else
                lblMessage.Text = "عملیات ثبت اطلاعات با موفقیت انجام شد";
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            RequestID = Utility.ConverToNullableInt(e.CommandArgument);
            Utility.ClearQueryString();
            Utility.AddToQueryString("PageView", "1");
            Utility.AddToQueryString("RequestID", RequestID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/Requests.aspx", Utility.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true)))
                StatusID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true));

            RequestID = Utility.ConverToNullableInt(e.CommandArgument);
            da_request.TBL_Request_Tra(RequestID, "delete");
            BindRequests(StatusID);
        }


        protected void lnkNewRequest_Click(object sender, EventArgs e)
        {
            Utility.ClearQueryString();
            Utility.AddToQueryString("PageView", "1");
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/Requests.aspx", Utility.arQueryString, true), true);
        }

        protected void grdRequest_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string RequestName = "";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RequestName = e.Row.Cells[0].Text;
                ((LinkButton)e.Row.FindControl("lnkDelete")).OnClientClick =
                    "return confirm(' برای حذف" + "«" + RequestName + "»" + " مطمئنید؟ ')";
            }
        }

        protected void grdRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true)))
                StatusID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("Status", true));

            //grdRequest.PageIndex = e.NewPageIndex;
            BindRequests(StatusID);
        }
    }
}