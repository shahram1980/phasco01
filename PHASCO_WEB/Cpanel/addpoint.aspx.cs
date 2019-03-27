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
using PHASCO_WEB.DAL;
using DataAccessLayer;

namespace PHASCO_WEB.Cpanel
{
    public partial class addpoint : System.Web.UI.Page
    {
        #region dataset
        User da_User = new User();
        DataTable dt = new DataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) set_Point();
        }
        void set_Point()
        {
            dt = da_User.GetUsers_Tra_DT("select_Item", Convert.ToInt32(Request.QueryString["id"].ToString()));
            Label_Current_Point.Text = dt.Rows[0]["Point"].ToString();
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            set_Point();
            da_User.GetUsers_Tra_DT("Up_Ponit", Convert.ToInt32(Request.QueryString["id"].ToString()), "", "", "", "", "", int.Parse(TextBox_Point.Text.ToString()), DateTime.Now, "", "", "", "", "", 0, 0, 0, 0);
        }
    }
}
