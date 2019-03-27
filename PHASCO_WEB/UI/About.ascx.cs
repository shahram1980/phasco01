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
namespace phasco.UI
{
    public partial class About : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) MultiView1.ActiveViewIndex = 0; }

        protected void ImageButton_Bazargani_Click(object sender, ImageClickEventArgs e)
        { MultiView1.ActiveViewIndex = 1; }

        protected void ImageButton_Tolid_Click(object sender, ImageClickEventArgs e)
        { MultiView1.ActiveViewIndex = 2; }

        protected void ImageButton_Tahghigh_Click(object sender, ImageClickEventArgs e)
        { MultiView1.ActiveViewIndex = 3; }

        protected void ImageButton_Control_Click(object sender, ImageClickEventArgs e)
        { MultiView1.ActiveViewIndex = 4; }

        protected void ImageButton_Post_Click(object sender, ImageClickEventArgs e)
        { MultiView1.ActiveViewIndex = 5; }

        protected void ImageButton_Foroosh_Click(object sender, ImageClickEventArgs e)
        { MultiView1.ActiveViewIndex =6; }

        protected void ImageButton_Omomi_Click(object sender, ImageClickEventArgs e)
        { MultiView1.ActiveViewIndex = 6; }


    }
}