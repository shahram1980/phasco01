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
using System.Globalization;
using System.Threading;

using BiztBiz.Component;
 

namespace BiztBiz
{
    public partial class _Default : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
       Response.Write("login : "+  Membership_Manage.UserOnline.Control_Status());
 
            
            if (!IsPostBack)
            {
                Bind_News();
            }
        }

        void Bind_News()
        {
            //TBL_News da = new TBL_News();
            //DataTable dt = da.News_Insert_Edit(0, "Select_title_5", "", "", "", Page.Culture.ToString(), "", 0, 0);
            //Repeater_Top_News.DataSource = dt;
            //Repeater_Top_News.DataBind();
            //Bind_Product();
        }

        void Bind_Product()
        {
            //Tbl_Products da = new Tbl_Products();
            //DataTable dt = da.Tbl_Products_Tra(0, "Select_top15", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString(),"",0);
            //Repeater_Featured_Product.DataSource = dt;
            //Repeater_Featured_Product.DataBind();
        }

        //protected void ImageButton_Search_Click(object sender, ImageClickEventArgs e)
        //{
        //}
    }
}
