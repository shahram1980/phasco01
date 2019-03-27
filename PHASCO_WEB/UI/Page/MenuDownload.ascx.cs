using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.DAL.MenuPageTableAdapters;
using System.IO;
using BusinessAccessLayer;

namespace PHASCO_WEB.UI.Page
{
    public partial class MenuDownload : System.Web.UI.UserControl
    {
        #region dataset
        Menu_DocTableAdapter da_Doc = new Menu_DocTableAdapter();
        BiztBiz.DAL.MenuPage.Menu_DocDataTable ds_Doc = new BiztBiz.DAL.MenuPage.Menu_DocDataTable();
        #endregion
        protected void Bind_GridView_docs()
        {
            try
            {
                int num = Convert.ToInt32(base.Request.QueryString["id"].ToString());
                int? idoffer = 0;
                ds_Doc = da_Doc.Menu_doc_Tra(new int?(num), "", "select", "", 0, ref idoffer);

                if (ds_Doc.Rows.Count > 0) Panel1.Visible = true;
                else Panel1.Visible = false;


                Datalist_Doc.DataSource = ds_Doc;
                Datalist_Doc.DataBind();
            }
            catch (Exception) { }
        }

        protected void DOwn_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int? idoffer = 0;
                int num = Convert.ToInt32(e.CommandArgument);
                ds_Doc = da_Doc.Menu_doc_Tra(new int?(num), "", "select1", "", 0, ref idoffer);
                FileStream stream = new FileStream(base.Server.MapPath(MyFileUploader.GetImageName("~/phascoupfile/DownFile", num, ds_Doc[0].ex_.ToString())), FileMode.Open, FileAccess.Read);
                byte[] buffer = new byte[(int)stream.Length];
                stream.Read(buffer, 0, (int)stream.Length);
                stream.Close();
                base.Response.Clear();
                base.Response.ContentType = "application/octet-stream";
                int length = buffer.Length;
                base.Response.AddHeader("Content-Length", length.ToString());
                base.Response.AddHeader("Content-Disposition", "attachment; filename=PFile" + ds_Doc[0].ex_.ToString());
                base.Response.BinaryWrite(buffer);
                base.Response.End();
            }
            catch (Exception) { }
        }

        protected void Page_Load(object sender, EventArgs e)
        { if (!base.IsPostBack) { Bind_GridView_docs(); } }
    }
}