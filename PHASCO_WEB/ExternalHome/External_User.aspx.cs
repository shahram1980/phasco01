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
using PHASCO_WEB.BLL;

namespace PHASCO_WEB.ExternalHome
{
    public partial class External_User : System.Web.UI.Page
    {
        User_Blog User_Blog_class = new User_Blog();
        User User_class = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {Top_Blog_User(); Top_Reg_User();}

        }
        void Top_Blog_User()
        {
            GridView_Top_Blog_User.DataSource = User_Blog_class.GetUsers_Blog_Tra_DT("Select_Top_10", 0, "", 0, "", 0, "");
            GridView_Top_Blog_User.DataBind();
        }

        void Top_Reg_User()
        {
            GridView_TopUser.DataSource =User_class.GetUsers_Tra_DT("select_top_reg",0,"","","","","",0,DateTime.Now,"","","","","",0,0,0,0);
            GridView_TopUser.DataBind();
        }


    }
}
