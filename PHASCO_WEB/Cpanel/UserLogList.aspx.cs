using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace PHASCO_WEB.Cpanel
{
    public partial class UserLogList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users_Action_Log da_Log = new Users_Action_Log();
                int uid=int.Parse(Request.QueryString["id"].ToString());
                GridView_List.DataSource = da_Log.Users_Action_Log_SP(7, 0, uid, "", "");
                GridView_List.DataBind();
            }
        }
    }
}