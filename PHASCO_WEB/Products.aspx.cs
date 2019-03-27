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
using PHASCO_WEB.BLL.Eshop;
using phasco.BaseClass;
using System.IO;
using phasco_webproject.BaseClass;
using Membership_Manage;

namespace PHASCO_WEB
{
    public partial class Products : System.Web.UI.Page
    {
        Product_Tbl da = new Product_Tbl();
        DataTable dt;
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string lang = Convert.ToString(Request.QueryString["mLang"]);
                    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(lang);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = lang;
                    Response.Cookies.Add(cookie);
                    Page.Culture = lang;
                    Page.UICulture = lang;
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["SubId"] != null)
                {
                    Bind_Product(); bind_Rnd_Pro();
                }
                if (Request.QueryString["Deid"] != null)
                {
                    SetView_Product();
                }
                if (Request.QueryString["DownId"] != null)
                {
                    Download_File();
                }
                

            }
        }

        void bind_Rnd_Pro()
        {
            dt=da.Product_RND();
            Repeater_Pro_Rnd.DataSource = dt;
            Repeater_Pro_Rnd.DataBind();
        }
            
        void Bind_Product()
        {
            MultiView1.ActiveViewIndex = 0;
            dt = da.Product_SubjectList_cat(int.Parse(Request.QueryString["SubId"].ToString()));

            DataList_Product.DataSource = dt;
            DataList_Product.DataBind();
        }

        void SetView_Product()
        {
            MultiView1.ActiveViewIndex = 1;
            dt = da.Product_Detail(int.Parse(Request.QueryString["Deid"].ToString()));
            if (dt.Rows.Count > 0)
            {
                Label_Name.Text = dt.Rows[0]["Title"].ToString();
                Label_des.Text = dt.Rows[0]["Full_Comment"].ToString();
                Label_Price.Text = dt.Rows[0]["Price"].ToString();
                string Image_Valid = dt.Rows[0]["Image_valid"].ToString();
                string ext_ = dt.Rows[0]["Image_Mode"].ToString();
                if (Image_Valid == "yes")
                    Image_Product.ImageUrl = MyFileUploader.GetImageName("phascoupfile/Product_Images", int.Parse(dt.Rows[0]["AutoId"].ToString()), ext_);
                else if (Image_Valid == "no")
                    Image_Product.ImageUrl = "phascoupfile/Product_Images/NOpic/NoPic.jpg";
                Bind_GridView_docs();
                Bind_Product_Randomize();
            }
        }
        protected void Bind_GridView_docs()
        {
            int id = Convert.ToInt32(Request.QueryString["Deid"].ToString());
            dt = da.Product_doc_Tra(id, "select", "", "");
            DataList_DOC_Download.DataSource = dt;
            DataList_DOC_Download.DataBind();
        }
        //protected void DOwn_Command(object sender, CommandEventArgs e)
        //{
        //    PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter da_doc = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter();
        //    PHASCO_WEB.DAL.DS_MainPhasco.Product_DocDataTable dt_doc = new PHASCO_WEB.DAL.DS_MainPhasco.Product_DocDataTable();
        //    try
        //    {
        //        int? offId = 0;
        //        int id = Convert.ToInt32(e.CommandArgument);
        //        dt_doc = da_doc.Product_doc_Tra(id, "", "select1", "", ref offId);
        //        string filename = Server.MapPath(MyFileUploader.GetImageName("~/phascoupfile/Product_Doc", id, dt_doc[0].ex_.ToString()));

        //        FileStream myStream = new FileStream(filename, FileMode.Open, FileAccess.Read);
        //        byte[] buffer = new byte[(int)myStream.Length];
        //        myStream.Read(buffer, 0, (int)myStream.Length);
        //        myStream.Close();
        //        Response.Clear();
        //        Response.ContentType = "application/octet-stream";
        //        Response.AddHeader("Content-Length", buffer.Length.ToString());
        //        Response.AddHeader("Content-Disposition", "attachment; filename=PFile" + dt_doc[0].ex_.ToString());
        //        Response.BinaryWrite(buffer);
        //        Response.End();
        //    }
        //    catch (Exception) { }
        //}
        void Download_File()
        {
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter da_doc = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Product_DocTableAdapter();
            PHASCO_WEB.DAL.DS_MainPhasco.Product_DocDataTable dt_doc = new PHASCO_WEB.DAL.DS_MainPhasco.Product_DocDataTable();
            try
            {
                int? offId = 0;
                int id = Convert.ToInt32(Request.QueryString["DownId"].ToString());
                dt_doc = da_doc.Product_doc_Tra(id, "", "select1", "", ref offId);
                string filename = Server.MapPath(MyFileUploader.GetImageName("~/phascoupfile/Product_Doc", id, dt_doc[0].ex_.ToString()));

                FileStream myStream = new FileStream(filename, FileMode.Open, FileAccess.Read);
                byte[] buffer = new byte[(int)myStream.Length];
                myStream.Read(buffer, 0, (int)myStream.Length);
                myStream.Close();
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Length", buffer.Length.ToString());
                Response.AddHeader("Content-Disposition", "attachment; filename=PFile" + dt_doc[0].ex_.ToString());
                Response.BinaryWrite(buffer);
                Response.End();
            }
            catch (Exception) { }
        }

        void Bind_Product_Randomize()
        {
            dt = da.Producr_Get_Randomize(int.Parse(Request.QueryString["Deid"].ToString()), Page.Culture.ToString());

            DataList_Family_Ptoduct.DataSource = dt;
            DataList_Family_Ptoduct.DataBind();
        }

        protected void ImageButton_Buy_Click(object sender, ImageClickEventArgs e)
        {
            int Id_ = Convert.ToInt32(Request.QueryString["Deid"]);
            try
            {
                int User_Id = UserOnline.id();
                Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", Convert.ToInt32(Eshop_Q.Text.ToString()), User_Id);

            }
            catch (Exception)
            {
                Product_Store.Call_Product_Shop_Insert_Edit(Id_, "new_Shop", "", Convert.ToInt32(Eshop_Q.Text.ToString()), 0);
            }
            Response.Redirect(Request.Url.ToString(), false);
        }
    }
}
