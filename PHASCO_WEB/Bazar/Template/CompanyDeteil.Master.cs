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

using System.Web.Mail;
using DataAccessLayer.BIZ;
using BusinessAccessLayer.BIZ;
namespace BiztBiz.Template
{
    public partial class CompanyDeteil : BaseMasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetUser();
                //css.Href = "../css/mainfa.css";
                //if (Page.Culture.ToString() == "English (United States)")
                //    css.Href = "../css/main.css";
                //if (Page.Culture.ToString() == "Persian (Iran)")
                //    css.Href = "../css/mainfa.css";
                //if (Page.Culture.ToString() == "Chinese (People's Republic of China)")
                //    css.Href = "../css/mainch.css";
                //Set_Url();
                //Bind_News(); 
                //Set_Page();
               
                
            }
        }
        void Set_Page()
        {
            //Tbl_Products da = new Tbl_Products();
            //DataTable dt;
            //int id = int.Parse(Request.QueryString["pid"].ToString());
            //dt = da.Tbl_Products_Tra(id, "Select_item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", Page.Culture.ToString(), "","", DateTime.Now, DateTime.Now, 0, "");
            //key_.Content = dt.Rows[0]["Produc_Name"].ToString() + "," + dt.Rows[0]["Product_Keywords"].ToString();
            //desc.Content = dt.Rows[0]["Description"].ToString();
            //Page.Title = "Biztbiz - " + dt.Rows[0]["Produc_Name"].ToString();
            //Label_Bookmark.Text = "<a href=\"javascript:bookmarksite('" + "Biztbiz - " + dt.Rows[0]["Produc_Name"].ToString() + "', '" + Request.Url.ToString() + "')\">" + Resources.Resource.Bookmark + "</a>";
        }
        void Set_Url()
        {
            try
            {
                
                int id = int.Parse(Request.QueryString["pid"].ToString());
                Tbl_Products da = new Tbl_Products();
                DataTable dt = da.Tbl_Products_Tra(id, "Select_uid_p", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", DateTime.Now, DateTime.Now, 0, "");

                //products.HRef = "../C-p/Products.aspx?pid=" + Request.QueryString["pid"].ToString() + "&uid=" + dt.Rows[0][0].ToString();
                //Home.HRef = "../C-p/Home.aspx?pid=" + Request.QueryString["pid"].ToString() + "&uid=" + dt.Rows[0][0].ToString();
                //Why_Us.HRef = "../C-p/Whyus.aspx?pid=" + Request.QueryString["pid"].ToString() + "&uid=" + dt.Rows[0][0].ToString();
                //About_Us.HRef = "../C-p/About.aspx?pid=" + Request.QueryString["pid"].ToString() + "&uid=" + dt.Rows[0][0].ToString();

                //Fac.HRef= "../C-p/Factory.aspx?pid=" + Request.QueryString["pid"].ToString() + "&uid=" + dt.Rows[0][0].ToString();
                
            }
            catch (Exception) { }
        }
        void Bind_News()
        { 
        TBL_User_News da_News=new TBL_User_News();
            int id=int.Parse(Request.QueryString["uid"].ToString());
            DataTable dt = da_News.TBL_User_News_Tra("select_Uidtop10", id);
            //Repeater_LastNews.DataSource = dt;
            //Repeater_LastNews.DataBind();
        }
        protected void Button_Email_Click(object sender, EventArgs e)
        {
            try 
            { 
                //SendMail(TextBox_email.Text, "", ""); 
            }
            catch (Exception) { }
        }


        //public string MetaDescription
        //{
        //    set
        //    {
        //        HtmlMeta meta = new HtmlMeta();
        //        meta.Name = "description";
        //        meta.Content = value;
        //        head.Controls.Add(meta);
        //    }
        //}

        //public string MetaKeywords
        //{
        //    set
        //    {
        //        HtmlMeta meta = new HtmlMeta();
        //        meta.Name = "keywords";
        //        meta.Content = value;
        //        head.Controls.Add(meta);
        //    }
        //}
    }
}
