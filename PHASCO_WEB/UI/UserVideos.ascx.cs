using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer.Video;
using System.Data;
using System.IO;
using Membership_Manage;

namespace PHASCO_WEB.UI
{
    public partial class UserVideos : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Bind_VedioList();
        }

        void Bind_VedioList()
        {
            tblVideo da_Video = new tblVideo();
            int UID_ = 0;
            try
            {
                UID_ = UID_ = int.Parse(Request.QueryString["id"].ToString());
            }
            catch (Exception)
            { }

            DataTable dt = da_Video.tblVideo_SP(22, 0, 0, UID_, "", "", "", "", "", DateTime.Now, 0, 0);

            DataList_Video.DataSource = dt;
            DataList_Video.DataBind();

        }
    }
}