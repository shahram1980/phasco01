using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PHASCO_Shopping
{
    public partial class imageview1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Image1.ImageUrl = "~//" + Request.QueryString["img"].ToString();
            }
            catch (Exception)
            {

            }

        }
    }
}