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

namespace phasco_webproject
{
    public partial class ImageSHow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["mode"] != null)
                if (Request.QueryString["mode"].ToString() == "Page")
                {
                    Image_SHow.ImageUrl = "~//phascoupfile//imgtpme//b" + Request.QueryString["img"].ToString();
                    return;
                }
            try
            {
                Image_SHow.ImageUrl = "~//phascoupfile//Productgallery//" + Request.QueryString["img"].ToString();
            }
            catch (Exception)
            {

            }
        }
    }
}
