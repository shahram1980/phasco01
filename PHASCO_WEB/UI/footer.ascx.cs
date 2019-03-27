using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer.Main;

namespace PHASCO_WEB.UI
{
    public partial class footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                TBL_TAGs dat_tags = new TBL_TAGs();
                rpt_Keyword.DataSource = dat_tags.TBL_TAGs_SP(7, 0, "", "");
                rpt_Keyword.DataBind();
            }
        }
    }
}