using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using DataAccessLayer.BIZ;
namespace BiztBiz.UC
{
    public partial class LeftCat : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) bind_Cat();
        }

        void bind_Cat()
        { 
        
            TBL_Categories da=new TBL_Categories();
            Repeater_Cat.DataSource = da.TBL_Categories_Tra(int.Parse(Request.QueryString["qid"].ToString()), "select_idsubid", 0, "", "", "",0,0);
            Repeater_Cat.DataBind();
        }
    }
}