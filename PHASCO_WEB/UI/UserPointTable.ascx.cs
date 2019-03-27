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
using PHASCO_WEB.DAL;
namespace phasco_webproject.UI
{
    public partial class UserPointTable : System.Web.UI.UserControl
    {
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter da_User = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter();
        DS_MainPhasco.ScientifiLoginUserDataTable dt_User = new DS_MainPhasco.ScientifiLoginUserDataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            bind_grd();
        }
        void bind_grd()
        {
            dt_User = da_User.Select_Top_User();
            GridView_Total.DataSource = dt_User;
            GridView_Total.DataBind();
        }
    }
}