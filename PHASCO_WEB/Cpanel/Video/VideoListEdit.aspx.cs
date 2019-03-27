using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using System.IO;
using DataAccessLayer.Video;

namespace NewFifa.Admin.VideoManage
{
    public partial class VideoListEdit : System.Web.UI.Page
    {
        tblVideoCategorie daCategorie = new tblVideoCategorie();
        tblVideo da_Video = new tblVideo();
        DataTable dt = new DataTable();
        int ID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initialize();
            }
        }

        private void Initialize()
        {
            Bind_Cat();
            Bind_VedioList();

        }
        void Bind_VedioList()
        {
            if (Request.QueryString["Status"] != null)
            {
 
                DataList_Video.DataSource = da_Video.tblVideo_SP(20, 0, 0, 0, "", "", "", "", "", DateTime.Now, 0, 0);
                DataList_Video.DataBind();
            }

            
            if (Request.QueryString["CATID"] != null)
            {
                int CATID = int.Parse(Request.QueryString["CATID"].ToString());
                DataList_Video.DataSource = da_Video.tblVideo_SP(8, 0, CATID, 0, "", "", "", "", "", DateTime.Now, 0, 0);
                DataList_Video.DataBind();
            }
        }
        void Bind_Cat()
        {
            Repeater_CAT.DataSource = daCategorie.tblVideoCategorie_SP(2, 0, "");
            Repeater_CAT.DataBind();
        }

        public string SetStatus(string Status)
        {
            switch (Status)
            {
                case "0":
                    return "غیر فعال";
                    break;
                case "1":
                    return "در حال نمایش";
                    break;
                case "2":
                    return "";
                    break;
            }
            return "";
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("formdatavideo.aspx?s=edit&vid=" + ID.ToString());
        }

        protected void btndelete_Command(object sender, CommandEventArgs e)
        {
            ID = Convert.ToInt32(e.CommandArgument);

            dt = da_Video.tblVideo_SP(4, ID, 0, 0,"","","","","",DateTime.Now,0,0);
            string VideoFilename = dt.Rows[0]["VideoFilename"].ToString();
            string VideoPhotoname = dt.Rows[0]["VideoPhotoname"].ToString();

            FileInfo TheFile = new FileInfo(Server.MapPath("~\\phascoupfile\\Video\\file\\")  + VideoFilename);
            if (TheFile.Exists)
            {
                File.Delete(Server.MapPath("~\\phascoupfile\\Video\\file\\")  + VideoFilename);
                File.Delete(Server.MapPath("~\\phascoupfile\\Video\\thumbnail\\Orginal\\")  + VideoPhotoname);
                File.Delete(Server.MapPath("~\\phascoupfile\\Video\\thumbnail\\Small\\")  + VideoPhotoname);
            }
            da_Video.tblVideo_SP(3, ID,0, 0,"","","","","",DateTime.Now,0,0);

            Bind_VedioList();
        }
    }
}