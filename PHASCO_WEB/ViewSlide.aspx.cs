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
using phasco_webproject.DAL.DS_ArticleTableAdapters;

namespace phasco_webproject
{
    public partial class ViewSlide : System.Web.UI.Page
    {
        T_AtlasTableAdapter da = new T_AtlasTableAdapter();
        phasco_webproject.DAL.DS_Article.T_AtlasDataTable dt = new phasco_webproject.DAL.DS_Article.T_AtlasDataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            int? Id_ = 0;
            dt = da.Atlas_Tra("Visit+", int.Parse(Request.QueryString["id"].ToString()), null, null, null, null, ref Id_);
            Lbl_Title.Text = dt[0].Title;
            Lbl_Coment.Text = dt[0].Comment;
            Image_View.ImageUrl = "~/phascoupfile/Slides/b_" + dt[0].ID.ToString() + ".jpg";

        }
    }
}
