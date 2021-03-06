using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using phasco.BaseClass;
using System.IO;
using PHASCO_WEB.DAL;
using phasco.Template;
namespace phasco_webproject.UI
{
    public partial class ProductDetail : System.Web.UI.UserControl
    {
        #region Datset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.productTableAdapter da_Product = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.productTableAdapter();
        DS_MainPhasco.productDataTable dt_Product = new DS_MainPhasco.productDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter da_Doc = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter();
        DS_MainPhasco.Product_DocDataTable dt_Doc = new DS_MainPhasco.Product_DocDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id_ = Convert.ToInt32(Request.QueryString["id"]);
            dt_Product = da_Product.Product_Detail(Id_);
            if (dt_Product.Rows.Count > 0)
            {

                Label_Name.Text = dt_Product[0]["Title"].ToString();
                Label_Comment.Text = dt_Product[0]["Full_Comment"].ToString();

                Label_Price.Text = dt_Product[0]["Price"].ToString();
                Label_Tax.Text = dt_Product[0]["Percent_Tax"].ToString();
                string Image_Valid = dt_Product[0]["Image_valid"].ToString();
                int Id_Image = Convert.ToInt32(dt_Product[0]["AutoId"]);
                string ext_ = dt_Product[0]["Image_Mode"].ToString();
                if (Image_Valid == "yes")
                    Image_.ImageUrl = MyFileUploader.GetImageName("~//phascoupfile//Product_Images", Id_Image, ext_);
                else if (Image_Valid == "no")
                    Image_.ImageUrl = "phascoupfile/Product_Images/NOpic/NoPic.jpg";
            }
            Bind_GridView_docs();
        }

        protected void Bind_GridView_docs()
        {
            int? offId = 0;
            int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            dt_Doc = da_Doc.Product_doc_Tra(id, "", "select", "", ref offId);
            DataList_DOC_Download.DataSource = dt_Doc;
            DataList_DOC_Download.DataBind();
        }

        protected void DOwn_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int? offId = 0;
                int id = Convert.ToInt32(e.CommandArgument);
                dt_Doc = da_Doc.Product_doc_Tra(id, "", "select1", "", ref offId);
                string filename = Server.MapPath(MyFileUploader.GetImageName("~/Product_Doc", id, dt_Doc[0].ex_.ToString()));
                FileStream myStream = new FileStream(filename, FileMode.Open, FileAccess.Read);
                byte[] buffer = new byte[(int)myStream.Length];
                myStream.Read(buffer, 0, (int)myStream.Length);
                myStream.Close();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Length", buffer.Length.ToString());
                Response.AddHeader("Content-Disposition", "attachment; filename=" + id.ToString() + dt_Doc[0].ex_.ToString());
                Response.BinaryWrite(buffer);
                Response.End();
            }
            catch (Exception)
            {
                (this.Page.Master as Phasco01).PageMessageType = phasco.Template.Phasco01.QLPageMessageType.Ok;
                (this.Page.Master as Phasco01).AddCustomMessage("بروز اشکال در زمان اجرا", (int)(4));
            }
        }
    }
}