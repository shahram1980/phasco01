using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PHASCO_Shopping.C_p
{
    public partial class ImageShow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Image_View.ImageUrl = "~\\MyPHASCO_Shopping\\ProductGallery\\" + Request.QueryString["img"].ToString();
        }
    }
}