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
using System.Data.SqlClient;
using System.Globalization;
using DataAccessLayer.Main;
using BusinessAccessLayer;

namespace phasco_webproject
{
    public partial class news : System.Web.UI.Page
    {
        TBL_News danews = new TBL_News();
        SqlConnection myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);

        SqlDataReader drAuthors;
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string lang = Convert.ToString(Request.QueryString["mLang"]);
                    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(lang);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = lang;
                    Response.Cookies.Add(cookie);
                    Page.Culture = lang;
                    Page.UICulture = lang;
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";

            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "جديدترين اخبار تخصصی رشته هاي علوم آزمایشگاهی و پزشكي، جامعه آزمايشگاهيان، آزمايشگاه هاي پاتولوژي، پاتوبيولوژي، پزشكي، تشخيص طبي سراسر ايران و جهان";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["News_Id"] != null)
                News_View();
            else
            {
                Now_News_List();
                MultiView1.ActiveViewIndex = 0;
            }
        }
        protected void Grd_Comment()
        {
            int id = Convert.ToInt32(Request.QueryString["News_Id"]);

            myConnection.Open();
            SqlCommand cmd = new SqlCommand("News_Insert_Edit", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Mode", SqlDbType.NVarChar));
            cmd.Parameters["@Mode"].Value = "Select_comm";
            cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
            cmd.Parameters["@ID"].Value = id;
            cmd.Parameters.Add(new SqlParameter("@Title", SqlDbType.NVarChar));
            cmd.Parameters["@Title"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@News", SqlDbType.NVarChar));
            cmd.Parameters["@News"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@Image", SqlDbType.NVarChar));
            cmd.Parameters["@Image"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@Comment", SqlDbType.Char));
            cmd.Parameters["@Comment"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@lang", SqlDbType.NVarChar));
            cmd.Parameters["@lang"].Value = Page.Culture.ToString();
            cmd.Parameters.Add(new SqlParameter("@f_month", SqlDbType.Int));
            cmd.Parameters["@f_month"].Value = 1;
            cmd.Parameters.Add(new SqlParameter("@f_Day", SqlDbType.Int));
            cmd.Parameters["@f_Day"].Value = 1;
            cmd.Parameters.Add(new SqlParameter("@Outid", SqlDbType.Int));
            cmd.Parameters["@Outid"].Direction = ParameterDirection.Output;



            Grd_Comm.DataSource = cmd.ExecuteReader();
            Grd_Comm.DataBind();
            myConnection.Close();
        }
        protected void Now_News_List()
        {

            //string Chekcer;
            //PersianCalendar prs = new PersianCalendar();

            //myConnection.Open();
            //SqlCommand cmd = new SqlCommand("News_Insert_Edit", myConnection);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add(new SqlParameter("@Mode", SqlDbType.NVarChar));
            //cmd.Parameters["@Mode"].Value = "Select_Archive_Da";
            //cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
            //cmd.Parameters["@ID"].Value = 0;
            //cmd.Parameters.Add(new SqlParameter("@Title", SqlDbType.NVarChar));
            //cmd.Parameters["@Title"].Value = "";
            //cmd.Parameters.Add(new SqlParameter("@News", SqlDbType.NVarChar));
            //cmd.Parameters["@News"].Value = "";
            //cmd.Parameters.Add(new SqlParameter("@Image", SqlDbType.NVarChar));
            //cmd.Parameters["@Image"].Value = "";
            //cmd.Parameters.Add(new SqlParameter("@Comment", SqlDbType.Char));
            //cmd.Parameters["@Comment"].Value = "";
            //cmd.Parameters.Add(new SqlParameter("@lang", SqlDbType.NVarChar));
            //cmd.Parameters["@lang"].Value = "Persian (Iran)";// Page.Culture.ToString();
            //cmd.Parameters.Add(new SqlParameter("@f_month", SqlDbType.Int));
            //cmd.Parameters["@f_month"].Value = 0;
            //cmd.Parameters.Add(new SqlParameter("@f_Day", SqlDbType.Int));
            //cmd.Parameters["@f_Day"].Value = 0;
            //cmd.Parameters.Add(new SqlParameter("@Outid", SqlDbType.Int));
            //cmd.Parameters["@Outid"].Direction = ParameterDirection.Output;

            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds, "news");
            //  myConnection.Close();

            Repeater_Spenews.DataSource = danews.News_Insert_Edit("Select_Mode", 0, "", "", "", "", "Persian (Iran)", "", 0, 0, 2, 1, 30);
            Repeater_Spenews.DataBind();


            Repeater_LastNews.DataSource = danews.News_Insert_Edit("Select_Special", 0, "", "", "", "", "Persian (Iran)", "", 0, 0, 0, 0, 50);
            Repeater_LastNews.DataBind();


            Repeater_Mosahebe.DataSource = danews.News_Insert_Edit("Select_Special", 0, "", "", "", "", "Persian (Iran)", "", 0, 0, 2, 1, 50);
            Repeater_Mosahebe.DataBind();


            Repeater_popular.DataSource = danews.News_Insert_Edit("Select_counter", 0, "", "", "", "", "Persian (Iran)", "", 0, 0, 2, 1, 50);
            Repeater_popular.DataBind();
        }

        protected void News_View()
        {
            string Chekcer;
            PersianCalendar prs = new PersianCalendar();
            myConnection.Open();

            SqlCommand cmd = new SqlCommand("News_Insert_Edit", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Mode", SqlDbType.NVarChar));
            cmd.Parameters["@Mode"].Value = "SeLect_Item";
            cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
            cmd.Parameters["@ID"].Value = Convert.ToInt32(Request.QueryString["News_Id"].ToString());
            cmd.Parameters.Add(new SqlParameter("@Title", SqlDbType.NVarChar));
            cmd.Parameters["@Title"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@News", SqlDbType.NVarChar));
            cmd.Parameters["@News"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@Image", SqlDbType.NVarChar));
            cmd.Parameters["@Image"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@Comment", SqlDbType.Char));
            cmd.Parameters["@Comment"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@lang", SqlDbType.NVarChar));
            cmd.Parameters["@lang"].Value = Page.Culture.ToString();
            cmd.Parameters.Add(new SqlParameter("@f_month", SqlDbType.Int));
            cmd.Parameters["@f_month"].Value = 1;
            cmd.Parameters.Add(new SqlParameter("@f_Day", SqlDbType.Int));
            cmd.Parameters["@f_Day"].Value = 1;
            cmd.Parameters.Add(new SqlParameter("@Outid", SqlDbType.Int));
            cmd.Parameters["@Outid"].Direction = ParameterDirection.Output;

            drAuthors = cmd.ExecuteReader();
            if (drAuthors.Read())
            {
                MultiView1.ActiveViewIndex = 1;
                news_view.Text = PHASCOUtility.cleanHtmlText(drAuthors["News"].ToString());
                short_News.Text = drAuthors["Title"].ToString();
               
                labelnews_keywords.Text = KeywordSpliter(drAuthors["keyword"].ToString(), drAuthors["id"].ToString(), drAuthors["Title"].ToString());

                //if (drAuthors["COmment"]?.ToString() == "True")
                //{ Button1.Disabled = false; }
                string SS = drAuthors["Image"].ToString();
                if (drAuthors["Image"].ToString() == "none.jpg") { Image_View.Visible = false; }
                else { Image_View.Visible = true; Image_View.ImageUrl = "~//imgnews//" + drAuthors["Image"].ToString(); }

                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(Convert.ToDateTime(drAuthors["Date_Ins"].ToString()));
                Label_date.Text = sunDate.Weekday.ToString();
            }
            drAuthors.Close();
            myConnection.Close();
            Grd_Comment();
        }

        public string KeywordSpliter(string Keyword, object id, object Name)
        {
            string s = Keyword.Replace("،", ",");
            string res_ = "<ul class='tag-widget-list'>";
            string[] words = s.Split(',');
            foreach (string word in words)
            {
                res_ = res_ + "<li><a href='News.aspx?News_Id=" + id.ToString() + "&t=" + word + "' title='" + Name.ToString() + "'>" + word + "</a></li>";// Console.WriteLine(word);


            }
            return res_ + "</ul>";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            PersianCalendar prs = new PersianCalendar();
            myConnection.Open();

            SqlCommand cmd = new SqlCommand("News_Insert_Edit", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Mode", SqlDbType.NVarChar));
            cmd.Parameters["@Mode"].Value = "Insert_comm";
            cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
            cmd.Parameters["@ID"].Value = Convert.ToInt32(Request.QueryString["News_Id"].ToString());
            cmd.Parameters.Add(new SqlParameter("@Title", SqlDbType.NVarChar));
            cmd.Parameters["@Title"].Value = Comment.Text.ToString();
            cmd.Parameters.Add(new SqlParameter("@News", SqlDbType.NVarChar));
            cmd.Parameters["@News"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@Image", SqlDbType.NVarChar));
            cmd.Parameters["@Image"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@Comment", SqlDbType.Char));
            cmd.Parameters["@Comment"].Value = "";
            cmd.Parameters.Add(new SqlParameter("@lang", SqlDbType.NVarChar));
            cmd.Parameters["@lang"].Value = Page.Culture.ToString();
            cmd.Parameters.Add(new SqlParameter("@f_month", SqlDbType.Int));
            cmd.Parameters["@f_month"].Value = 1;
            cmd.Parameters.Add(new SqlParameter("@f_Day", SqlDbType.Int));
            cmd.Parameters["@f_Day"].Value = 1;
            cmd.Parameters.Add(new SqlParameter("@Outid", SqlDbType.Int));
            cmd.Parameters["@Outid"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Comment.Text = "";
            Label2.Visible = true;
            successLabel.Visible = true;
            drAuthors.Close();
            myConnection.Close();
        }
        //protected void GRD_News_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GRD_News.PageIndex = e.NewPageIndex;
        //    HttpCookie cookie_get = Request.Cookies["elang"];
        //    string Lang_SEt = cookie_get.Value.ToString();
        //    Now_News_List();
        //}

        public string shamsi_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            return sunDate.Weekday.ToString();
        }
    }
}
