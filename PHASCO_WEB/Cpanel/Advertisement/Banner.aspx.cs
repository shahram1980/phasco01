using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLink.Web.Helpers;
using System.Data;
using QLCommon.AdvertisementManagement.Data;
using QLAdvertisementManagementValidation;
using phasco.BaseClass;
using BusinessAccessLayer;

namespace AdvertisementManagement.Admin
{
    public partial class Banner : BasePage
    {
        #region Properties

        int _userID;
        public int UserID
        {
            get
            {
                return _userID;
            }
            set
            {
                _userID = value;
            }
        }

        int _advertiserID;
        public int AdvertiserID
        {
            get
            {
                return _advertiserID;
            }
            set
            {
                _advertiserID = value;
            }
        }

        int _bannerID;
        public int BannerID
        {
            get
            {
                return _bannerID;
            }
            set
            {
                _bannerID = value;
            }
        }

        public AdvertisementManagementBusinessLogics.BannerMethod BannerMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.BannerMethod blTemp = new AdvertisementManagementBusinessLogics.BannerMethod();
                return blTemp;
            }
        }

        public AdvertisementManagementBusinessLogics.AdvertiserMethod AdvertiserMethod
        {
            get
            {
                AdvertisementManagementBusinessLogics.AdvertiserMethod blTemp = new AdvertisementManagementBusinessLogics.AdvertiserMethod();
                return blTemp;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true)) == false)//False --> True For Encode
                BannerID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true));

            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true)) == false)//False --> True For Encode
                AdvertiserID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.AdvertiserID, true));

            if (!Page.IsPostBack)
                Initialize();
        }

        private void Initialize()
        {
            imgBannerImage.Visible = false;
            pnlText.Visible = true;
            pnlImage.Visible = false;
            pnlFlash.Visible = false;
            rdbBannerType.SelectedValue = "1";
            BindBannerList();
            BindAdvertiserList();
            if (BannerID > 0)
                FillEditControls(BannerID);
        }

        private void BindBannerList()
        {
            //int advertiserID = Utilities.ConverToNullableInt(SessionData.ActiveInstance.UserID);
            DataTable dtAdvertiser = BannerMethod.GetBanner().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    grdBanner, dtAdvertiser
              );
        }

        private void BindAdvertiserList()
        {
            DataTable dtAdvertiser = AdvertiserMethod.GetAdvertiser().Tables[0];
            QLink.Web.Helpers.PublicFunctions.Binder
              (
                    ddlAdvertiser, dtAdvertiser, tblAdvertiserTable.ADVERTISERID_FIELD, tblAdvertiserTable.ADVERTISERNAME_FIELD, "انتخاب کنید"
              );
        }

        private void FillEditControls(int bannerID)
        {
            DataSet dtsBanner = new DataSet();
            try
            {
                dtsBanner = BannerMethod.GetBannerByID(bannerID);
                DataRow dtrBanner;
                if (dtsBanner.Tables[0].Rows.Count > 0)
                {
                    dtrBanner = dtsBanner.Tables[0].Rows[0];
                    txtBannerName.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.BANNERNAME_FIELD]);
                    txtDescription.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.DESCRIPTION_FIELD]);
                    ddlAdvertiser.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.ADVERTISERID_FIELD]);
                    chkActive.Checked = Utilities.ConverToBoolean(dtrBanner[tblBannerTable.ACTIVE_FIELD]);
                    chkIsShowImage.Checked = Utilities.ConverToBoolean(dtrBanner[tblBannerTable.ISSHOWIMAGE_FIELD]);
                    txtAltText.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.ALTTEXT_FIELD]);
                    txtBorderColor.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.BORDERCOLOR_FIELD]);
                    ddlBorderWidth.SelectedValue = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.BORDERWIDTH_FIELD]);
                    ddlBorderColor.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.BORDERCOLOR_FIELD]);
                    ddlBorderStyle.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.BORDERSTYLE_FIELD]);
                    txtDisplayURL.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.DISPLAYURL_FIELD]);
                    txtFontColor.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.FONTCOLOR_FIELD]);
                    ddlFontColor.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.FONTCOLOR_FIELD]);
                    ddlFontName.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.FONTNAME_FIELD]);
                    ddlFontSize.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.FONTSIZE_FIELD]);
                    txtHeadlineText.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.HEADLINETEXT_FIELD]);
                    txtHeight.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.HEIGHT_FIELD]);
                    txtLinkText.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.LINKTEXT_FIELD]);
                    txtNotes.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.NOTES_FIELD]);
                    txtTargetUrl.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.TARGETURL_FIELD]);
                    txtWidth.Text = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.WIDTH_FIELD]);
                    ddlTatgetWindows.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.TARGETWINDOW_FIELD]);
                    ddlAlignment.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.ALIGNMENT_FIELD]);

                    rdbBannerType.SelectedValue = Utilities.ConverToNullableStringForDDL(dtrBanner[tblBannerTable.BANNERTYPE_FIELD]);

                    ChangeBanerType();
                    if (!string.IsNullOrEmpty(dtrBanner[tblBannerTable.FLASHURL_FIELD].ToString()))
                    {
                        hdfFlashUrl.Value = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.FLASHURL_FIELD]);
                    }

                    if (!string.IsNullOrEmpty(dtrBanner[tblBannerTable.IMAGEURL_FIELD].ToString()))
                    {
                        imgBannerImage.Visible = true;
                        imgBannerImage.ImageUrl = "~/images/banner/" + dtrBanner[tblBannerTable.IMAGEURL_FIELD].ToString();
                        imgBannerImage.ToolTip = Utilities.ConverToNullableString(dtrBanner[tblBannerTable.IMAGEURL_FIELD]);
                    }
                    else
                        imgBannerImage.Visible = false;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true)) == false)
            {
                BannerID = Utilities.ConverToNullableInt(QueryStringHelper.GetQueryString(Resources.QueryString.BannerID, true));
                EditBanner(BannerID);
            }
            else
                InsertNewBanner();
        }
                public string GetRandomPasswordUsingGUID(int length)
        {
            string guidResult = System.Guid.NewGuid().ToString();
            guidResult = guidResult.Replace("-", string.Empty);
            string date_ = DateTime.Now.ToShortDateString().Replace("/", "");
            return date_ + guidResult.Substring(0, length);
        }
        protected void InsertNewBanner()
        {
            string imagepath = string.Empty;
            string flashpath = string.Empty;
            List<QLError> lstError = null;
            int? InsertResult = null;
            //try
            //{
                if (fluImageURL.PostedFile != null && !string.IsNullOrEmpty(fluImageURL.FileName))
                {
                    HttpPostedFile Pic = fluImageURL.PostedFile;
                    string imagefilename = GetRandomPasswordUsingGUID(30)+ MyFileUploader.IsExtension(fluImageURL);// fluImageURL.FileName;
                    imagepath = ImageHelper.UploadAndResizeImage(imagefilename, Pic, Server.MapPath("~/phascoupfile/Adv/"),
                        Utilities.ConverToNullableInt(txtWidth.Text), Utilities.ConverToNullableInt(txtHeight.Text));
                }

                if (fluFlashUrl.PostedFile != null && !string.IsNullOrEmpty(fluFlashUrl.FileName))
                {
                    HttpPostedFile Pic = fluFlashUrl.PostedFile;
                    string imagefilename = GetRandomPasswordUsingGUID(30) + MyFileUploader.IsExtension(fluFlashUrl);// fluFlashUrl.FileName;
                    flashpath = ImageHelper.UploadAndResizeFlash(imagefilename, Pic, Server.MapPath("~/phascoupfile/Adv/"));
                }

                InsertResult = BannerMethod.InsertNewBanner(
                      Utilities.ConvertStringForDBForDDL(ddlAdvertiser.SelectedValue)
                    , Utilities.ConvertStringForDB(txtBannerName.Text)
                    , Utilities.ConvertStringForDB(txtDescription.Text)
                    , Utilities.ConvertBooleanForDB(chkActive.Checked)
                    , Utilities.ConvertStringForDB(txtNotes.Text)
                    , Utilities.ConvertStringForDB(imagepath)
                    , Utilities.ConvertStringForDB(txtTargetUrl.Text)
                    , Utilities.ConvertStringForDB(txtWidth.Text)
                    , Utilities.ConvertStringForDB(txtHeight.Text)
                    , Utilities.ConvertStringForDB(txtAltText.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlBorderStyle.SelectedValue)
                    , Utilities.ConvertStringForDBForDDL(ddlBorderWidth.SelectedValue)
                    , Utilities.ConvertStringForDBForDDL(ddlBorderColor.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlAlignment.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlTatgetWindows.Text)
                    , Utilities.ConvertStringForDB(txtLinkText.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlFontName.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlFontSize.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlFontColor.Text)
                    , Utilities.ConvertStringForDB(txtHeadlineText.Text)
                    , Utilities.ConvertStringForDB(txtDisplayURL.Text)
                    , Utilities.ConvertStringForDB(flashpath)
                    , Utilities.ConvertBooleanForDB(chkIsShowImage.Checked)
                    , 0
                    , Utilities.ConvertStringForDBForDDL(rdbBannerType.SelectedValue)
                    , out lstError);
                //if (InsertResult.HasValue)
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Ok;
                //    (this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding, (int)(Enumerations.enumValidationMessage.Insert));
                //}

                //else
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).ArPageMessages = lstError;
                //}
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
            BindBannerList();
        }

        protected void EditBanner(int bannerID)
        {
            string imagepath = string.Empty;
            string flashpath = string.Empty;
            List<QLError> lstError = null;
            int? EditResult = null;
            try
            {
                imagepath = imgBannerImage.ToolTip;
                if (fluImageURL.PostedFile != null && !string.IsNullOrEmpty(fluImageURL.FileName))
                {
                    HttpPostedFile Pic = fluImageURL.PostedFile;
                    string imagefilename = fluImageURL.FileName;
                    imagepath = ImageHelper.UploadAndResizeImage(imagefilename, Pic, Server.MapPath("~/phascoupfile/Adv/"),
                        Utilities.ConverToNullableInt(txtWidth.Text), Utilities.ConverToNullableInt(txtHeight.Text));
                }

                flashpath = hdfFlashUrl.Value;
                if (fluFlashUrl.PostedFile != null && !string.IsNullOrEmpty(fluFlashUrl.FileName))
                {
                    HttpPostedFile Pic = fluFlashUrl.PostedFile;
                    string imagefilename = fluFlashUrl.FileName;
                    flashpath = ImageHelper.UploadAndResizeFlash(imagefilename, Pic, Server.MapPath("~/phascoupfile/Adv/"));
                }

                EditResult = BannerMethod.EditBanner(
                      bannerID
                    , Utilities.ConvertStringForDBForDDL(ddlAdvertiser.SelectedValue)
                    , Utilities.ConvertStringForDB(txtBannerName.Text)
                    , Utilities.ConvertStringForDB(txtDescription.Text)
                    , Utilities.ConvertBooleanForDB(chkActive.Checked)
                    , Utilities.ConvertStringForDB(txtNotes.Text)
                    , Utilities.ConvertStringForDB(imagepath)
                    , Utilities.ConvertStringForDB(txtTargetUrl.Text)
                    , Utilities.ConvertStringForDB(txtWidth.Text)
                    , Utilities.ConvertStringForDB(txtHeight.Text)
                    , Utilities.ConvertStringForDB(txtAltText.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlBorderStyle.SelectedValue)
                    , Utilities.ConvertStringForDBForDDL(ddlBorderWidth.SelectedValue)
                    , Utilities.ConvertStringForDBForDDL(ddlBorderColor.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlAlignment.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlTatgetWindows.Text)
                    , Utilities.ConvertStringForDB(txtLinkText.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlFontName.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlFontSize.Text)
                    , Utilities.ConvertStringForDBForDDL(ddlFontColor.Text)
                    , Utilities.ConvertStringForDB(txtHeadlineText.Text)
                    , Utilities.ConvertStringForDB(txtDisplayURL.Text)
                    , Utilities.ConvertStringForDB(flashpath)
                    , Utilities.ConvertBooleanForDB(chkIsShowImage.Checked)
                    , 0
                    , Utilities.ConvertStringForDBForDDL(rdbBannerType.SelectedValue)
                    , out lstError);
                //if (EditResult.HasValue)
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Ok;
                //    (this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding, (int)(Enumerations.enumValidationMessage.Edit));
                //}
                //else
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).ArPageMessages = lstError;
                //}
            }
            catch (Exception ex)
            {

                throw ex;
            }
            BindBannerList();
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            BannerID = Utilities.ConverToNullableInt(e.CommandArgument);
            Utilities.ClearQueryString();
            Utilities.AddToQueryString(Resources.QueryString.BannerID, BannerID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString(Resources.Pages.Banner, Utilities.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            bool deleteBanner = false;
            List<QLError> arError = new List<QLError>();
            try
            {
                BannerID = Utilities.ConverToNullableInt(e.CommandArgument);
                deleteBanner = BannerMethod.DeleteBanner(BannerID, out arError);
                //if (deleteNews)
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Ok;
                //    (this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding, (int)(Enumerations.enumValidationMessage.Delete));
                //}
                //else
                //{
                //    (this.Page.Master as Rahbina.Template.Rahbina).ArPageMessages = arError;
                //}
            }
            catch (System.Data.SqlClient.SqlException sqx)
            {
                //(this.Page.Master as Rahbina.Template.Rahbina).PageMessageType = Rahbina.Template.Rahbina.QLPageMessageType.Error;
                //(this.Page.Master as Rahbina.Template.Rahbina).AddCustomMessage(Resources.Items.Coding,
                //    sqx.ErrorCode);

            }
            catch (Exception ex)
            {
                throw (ex);
            }
            BindBannerList();
        }

        protected void grdBanner_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdBanner.PageIndex = e.NewPageIndex;
            BindBannerList();
        }

        protected void grdBanner_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string BannerName = "";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                BannerName = e.Row.Cells[0].Text;
                ((LinkButton)e.Row.FindControl("lnkDelete")).OnClientClick =
                    "return confirm(' برای حذف" + "«" + BannerName + "»" + " مطمئنید؟ ')";
            }
        }

        protected void chkIsShowImage_CheckedChanged(object sender, EventArgs e)
        {
            if (chkIsShowImage.Checked)
                pnlImage.Visible = true;
            else
                pnlImage.Visible = false;
        }

        protected void rdbBannerType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeBanerType();
        }

        protected void ChangeBanerType()
        {
            switch (Utilities.ConverToNullableInt(rdbBannerType.SelectedValue))
            {
                case 1://text
                    pnlText.Visible = true;
                    pnlImage.Visible = false;
                    pnlFlash.Visible = false;
                    break;
                case 2://image
                    pnlText.Visible = false;
                    pnlImage.Visible = true;
                    pnlFlash.Visible = false;
                    break;
                case 3://flash
                    txtAltText.Text = string.Empty;
                    chkIsShowImage.Checked = false;
                    pnlText.Visible = false;
                    pnlImage.Visible = false;
                    pnlFlash.Visible = true;
                    break;
            }
        }
    }
}