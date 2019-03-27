using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.Component;

using System.Data;
using DataAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class ProductPicture : BasePage
    {
        Tbl_Products da = new Tbl_Products();

        int _ProductID;
        public int ProductID
        {
            get
            { return _ProductID; }
            set
            { _ProductID = value; }
        }

        int _ProductPictureID;
        public int ProductPictureID
        {
            get
            { return _ProductPictureID; }
            set
            { _ProductPictureID = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductPictureID", true)))
                ProductPictureID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductPictureID", true));

            if (!IsPostBack) Initialize();
        }

        protected void Initialize()
        {
            if (ProductID > 0)
                bind_Product_Picture(ProductID);
            //lnkNew.NavigateUrl = "~/MyBiztBiz/ProductPicture.aspx?Product_Id="+ProductID;
            if (ProductPictureID > 0)
                FillEditControls(ProductPictureID);
        }

        protected void bind_Product_Picture(int productID)
        {
            DataTable dt = da.Tbl_Product_Gallery_Tra(0, "Select_forProduct", productID, "", "");
            dtlProductPicture.DataSource = dt;
            dtlProductPicture.DataBind();
        }

        protected void lnkNewPicture_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));
            Utility.ClearQueryString();
            Utility.AddToQueryString("ProductID", ProductID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/ProductPicture.aspx", Utility.arQueryString, true), true);
        }

        private void FillEditControls(int id)
        {
            try
            {
                DataTable dt = da.Tbl_Product_Gallery_Tra(id, "Select_item", 0, "", "");
                if (dt.Rows.Count > 0)
                {
                    txtImageName.Text = dt.Rows[0]["image_name"].ToString();

                    if (!string.IsNullOrEmpty(dt.Rows[0]["image_Address"].ToString()))
                    {
                        imgImageView.Visible = true;
                        imgImageView.ImageUrl = "~/images/Product/small/" + dt.Rows[0]["image_Address"].ToString();
                        imgImageView.ToolTip = dt.Rows[0]["image_Address"].ToString();
                    }
                    else imgImageView.Visible = false;
                }
            }
            catch { }
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            ProductPictureID = Utility.ConverToNullableInt(e.CommandArgument);

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            Utility.ClearQueryString();
            Utility.AddToQueryString("ProductID", ProductID.ToString());
            Utility.AddToQueryString("ProductPictureID", ProductPictureID.ToString());
            Response.Redirect(QLink.Web.Helpers.QueryStringHelper.SetQueryString("~/MyBiztBiz/ProductPicture.aspx", Utility.arQueryString, true), true);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            ProductPictureID = Utility.ConverToNullableInt(e.CommandArgument);
            try { da.Tbl_Product_Gallery_Tra(ProductPictureID, "delete_Item", 0, "", ""); }
            catch { }
            bind_Product_Picture(ProductID);
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductPictureID", true)))
                ProductPictureID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductPictureID", true));


            if (ProductPictureID > 0) { EditProductPicture(ProductPictureID); }
            else InsertNewProductPicture();

            bind_Product_Picture(ProductID);

        }

        protected void EditProductPicture(int pictureID)
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            string imagepath = string.Empty;
            try
            {
                imagepath = imgImageView.ToolTip;
                if (fluProductImage.PostedFile != null && !string.IsNullOrEmpty(fluProductImage.FileName))
                {
                    HttpPostedFile Pic = fluProductImage.PostedFile;
                    string imagefilename = fluProductImage.FileName;
                    imagepath = ImageHelper.UploadAndResizeImage(imagefilename, Pic, Server.MapPath("~/images/Product/"));
                }

                da.Tbl_Product_Gallery_Tra(pictureID, "Update", ProductID, txtImageName.Text, imagepath);
            }
            catch
            {
            }
        }

        protected void InsertNewProductPicture()
        {
            if (!string.IsNullOrEmpty(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true)))
                ProductID = Utility.ConverToNullableInt(QLink.Web.Helpers.QueryStringHelper.GetQueryString("ProductID", true));

            string imagepath = string.Empty;
            try
            {
                if (fluProductImage.PostedFile != null && !string.IsNullOrEmpty(fluProductImage.FileName))
                {
                    HttpPostedFile Pic = fluProductImage.PostedFile;
                    string imagefilename = fluProductImage.FileName;
                    imagepath = ImageHelper.UploadAndResizeImage(imagefilename, Pic, Server.MapPath("~/images/Product/"));
                }
                da.Tbl_Product_Gallery_Tra(0, "insert", ProductID, txtImageName.Text, imagepath);
            }
            catch { }
        }

        protected void dtlProductPicture_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
    }
}