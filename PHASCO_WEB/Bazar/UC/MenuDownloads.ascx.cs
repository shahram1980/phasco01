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
using System.IO;
using PHASCO_WEB.DAL.BIZ.MenuPageTableAdapters;
using BusinessAccessLayer;

namespace PerisanCMS.UI
{
    public partial class MenuDownloads : System.Web.UI.UserControl
    {
        #region dataset
        Menu_DocTableAdapter da_Doc = new Menu_DocTableAdapter();
        PHASCO_WEB.DAL.BIZ.MenuPage.Menu_DocDataTable ds_Doc = new PHASCO_WEB.DAL.BIZ.MenuPage.Menu_DocDataTable();
        #endregion
        protected void Bind_GridView_docs()
        {
            try
            {
                int num = Convert.ToInt32(base.Request.QueryString["id"].ToString());
                int? idoffer = 0;
                ds_Doc = da_Doc.Menu_doc_Tra(new int?(num), "", "select", "", 0, ref idoffer);
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
                FileStream stream = new FileStream(base.Server.MapPath(MyFileUploader.GetImageName("~/upf/DownFile", num, ds_Doc[0].ex_.ToString())), FileMode.Open, FileAccess.Read);
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