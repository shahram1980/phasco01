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
using PHASCO_WEB.DAL;
using System.Globalization;
using System.Threading;
using System.Data.SqlClient;
using System.Collections.Generic;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB
{
    public partial class LabDirectory : System.Web.UI.Page
    {
        #region Datsset
        Tbl_state da = new Tbl_state();
        T_Restaurant da_T = new T_Restaurant();
        Lab_Gallery da_gallery = new Lab_Gallery();
        #endregion
        #region Values
        static int mode = 0;
        static int region = 0;
        static string state = "";
        static int star = 0;
        #endregion
        public DataTable dst;
        public DataTable dst_alpha;
        public DataTable dt_;
        DataTable dt;
        TBL_Lab_QC da_QC = new TBL_Lab_QC();
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "لیست کامل آزمایشگاه های پاتوبیولوژی و آسیب شناسی و تشخیص طبی و پزشکی و قارچ شناسی و ژنتیک و ویروس شناسی و پاتولوژی وب سایت جامع علوم آزمایشگاهی و پزشکی فاسکو";
            string keys = "آزمایشگاه,پاتوبیولوژی,آسیب شناسی,تشخیص,طبی,پزشکی,قارچ شناسی,ویروس شناسی,ژنتیک";

            if (Request.QueryString["lid"] != null)
            {
                Set_dataset_View(int.Parse(Request.QueryString["lid"].ToString()));


                keys = keys + Set_Rnd_Word(dt_.Rows[0]["Name"].ToString() + " " + dt_.Rows[0]["Address"].ToString() + " " + dt_.Rows[0]["Manager"].ToString() + " " + dt_.Rows[0]["Foods"].ToString());
                desc = desc + dt_.Rows[0]["Foods"].ToString();
            }

            if (Request.QueryString["alpha"] != null)
            {
                Set_dataset_alpha();
                int count = 25;
                if (dst_alpha.Rows.Count < 25) count = dst_alpha.Rows.Count;
                for (int i = 0; i < count; i++)
                { keys = keys + "," + dst_alpha.Rows[0]["Name"].ToString(); }
            }

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
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string lang = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = lang;
                    Response.Cookies.Add(cookie);
                    Page.Culture = lang;
                    Page.UICulture = lang;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["lid"] != null)
                { Set_View(); Bind_Gallery(); return; }
                if (Request.QueryString["alpha"] != null)
                { Bind_alpha(); MultiView1.ActiveViewIndex = 0; return; }
                Sup_Lab.Visible = true;
                MultiView1.ActiveViewIndex = 0;
                bind_drop_edit_2(); bind_drop_edit_2_2();
                set_dadaset_Rnd();
                Bind_Rnd();
                Bind_QC();
            }
        }

        private void Bind_QC()
        {
            DataList_QC.DataSource = da_QC.TBL_Lab_QC_SP("selectall", 0, "", "");
            DataList_QC.DataBind();
        }

        public string replaceSiteName(string url)
        {
            return url.Replace("http://www.phasco.com", "");
                 
        }

        #region Random set
        protected void set_dadaset_Rnd()
        {            dst = da_T.restaurant_Tra("select_rnd");        }
        protected void Bind_Rnd()
        {            data_RND.DataSource = dst;            data_RND.DataBind();        }
        #endregion

        #region Alpha set
        protected void Set_dataset_alpha()
        {
            string alpha = Request.QueryString["alpha"].ToString();
            dst_alpha = da_T.restaurant_Tra("select_alpha", alpha);
        }
        protected void Bind_alpha()
        {
            data_RND.DataSource = dst_alpha;
            data_RND.DataBind();
        }
        #endregion

        #region View Detiles
        void Set_dataset_View(int getid)
        { dt_ = da_T.restaurant_Tra("select1", getid, "", "", 0, "", "", "", "", "", "", "", 0, 0, 0); }
        void Set_View()
        {
 
            Image_star.ImageUrl = "~//images//star" + Convert.ToString(dt_.Rows[0]["star"]) + ".jpg";

            string Cultur = Page.Culture.ToString();
            if (Cultur == "Persian (Iran)" || Cultur == "Persian")
            {
                LBL_name.Text = dt_.Rows[0]["Name"].ToString();
                LBL_address.Text = dt_.Rows[0]["Address"].ToString();
                LBL_Manager.Text = dt_.Rows[0]["Manager"].ToString();
                LBL_Food.Text = dt_.Rows[0]["Foods"].ToString();
                LBL_TIme.Text = dt_.Rows[0]["Time"].ToString();
            }
            else if (Cultur == "English (United States)")
            {
                LBL_name.Text = dt_.Rows[0]["NameEn"].ToString();
                LBL_address.Text = dt_.Rows[0]["AddressEn"].ToString();
                LBL_Manager.Text = dt_.Rows[0]["ManagerEn"].ToString();
                LBL_Food.Text = dt_.Rows[0]["FoodsEn"].ToString();
                LBL_TIme.Text = dt_.Rows[0]["TimeEN"].ToString();
            }

            LBL_reserv.Text = dt_.Rows[0]["tel"].ToString();
            LBL_email.Text = dt_.Rows[0]["EMail"].ToString();
            LBL_Website.Text = dt_.Rows[0]["WebSite"].ToString();
            HyperLink_Web.NavigateUrl = "http://" + dt_.Rows[0]["WebSite"];

            Image_Res.ImageUrl = "~\\phascoupfile\\Dir_Images\\" + dt_.Rows[0]["Pic"];
            MultiView1.ActiveViewIndex = 2;
        }
        #endregion

        #region Get Random Word's of Sentence
        protected string Set_Rnd_Word(string str)
        {
            List<string> lstStr = new List<string>();
            List<KeyValuePair<string, int>> Collector = new List<KeyValuePair<string, int>>();
            lstStr.AddRange(str.Split(new string[] { " " }, StringSplitOptions.None));

            foreach (string tempStr in lstStr)
            {
                List<string> result = lstStr.FindAll(delegate(string compareString)
                { return compareString.Equals(tempStr); }
                                 );
                KeyValuePair<string, int> item = new KeyValuePair<string, int>(tempStr, result.Count);
                Collector.Add(item);
            }

            string ret = "";
            int maxloop = 25;
            if (Collector.Count < maxloop) maxloop = Collector.Count;
            for (int i = 0; i < maxloop; i++)
            {
                Thread.Sleep(20);
                ret = ret + "," + Collector[RandomNumber(1, Collector.Count)].Key.ToString();
            }

            return ret;
        }
        public static int RandomNumber(int min, int max)
        {
            Random random = new Random(unchecked((int)DateTime.Now.Ticks));
            return random.Next(min, max);
        }
        #endregion
        protected void Bind_Gallery()
        {
            int id = 0;
            try
            { id = int.Parse(Request.QueryString["lid"].ToString()); }
            catch (Exception)
            { return; }
            DataTable dt;
            dt = da_gallery.Lab_Gallery_Tra("Select_Uid", 0, id, "");
            int ss = dt.Rows.Count;
            DataList_Gallary.DataSource = dt;
            DataList_Gallary.DataBind();
        }

        protected void DropDownList_edit_Region_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind_drop_edit_2(); bind_drop_edit_2_2();
            Sup_Lab.Visible = false;
        }
        protected void bind_drop_edit_2()
        {
            try
            {
                dt = da.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList_edit_Region.SelectedValue), "");
                string Cultur = Page.Culture.ToString();
                if (Cultur == "Persian (Iran)")
                { DropDownList_edit_State.DataTextField = "Satate"; }
                else if (Cultur == "English (United States)")
                { DropDownList_edit_State.DataTextField = "StateEN"; }
                else
                { DropDownList_edit_State.DataTextField = "Satate"; }

                DropDownList_edit_State.DataValueField = "ID";
                DropDownList_edit_State.DataSource = dt;
                DropDownList_edit_State.DataBind();
                if (dt.Rows.Count != 0)
                    DropDownList_edit_State.Enabled = true;
                else
                    DropDownList_edit_State.Enabled = false;
            }
            catch (Exception) { }
        }
        protected void DropDownList_edit_State_SelectedIndexChanged(object sender, EventArgs e)
        { bind_drop_edit_2_2(); }
        protected void bind_drop_edit_2_2()
        {
            try
            {
                dt = da.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList_edit_State.SelectedValue), "");

                string Cultur = Page.Culture.ToString();
                if (Cultur == "Persian (Iran)" || Cultur == "Persian")
                { DropDownList_REGION_2.DataTextField = "Satate"; }
                else if (Cultur == "English (United States)")
                { DropDownList_REGION_2.DataTextField = "StateEN"; }
                else
                { DropDownList_REGION_2.DataTextField = "Satate"; }
                DropDownList_REGION_2.DataValueField = "ID";
                DropDownList_REGION_2.DataSource = dt;
                DropDownList_REGION_2.DataBind();

                if (dt.Rows.Count != 0)
                    DropDownList_REGION_2.Enabled = true;
                else
                    DropDownList_REGION_2.Enabled = false;
            }
            catch (Exception) { }
        }

        protected void dgrdTitles_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        { dgrdTitles.CurrentPageIndex = e.NewPageIndex; Bind_Grd(); }
        protected void Bind_Grd()
        {
            SqlConnection myConnection = null;
            string connectionString = ConfigurationSettings.AppSettings["phasco_webproject.Properties.Settings.Directory_phascoConnectionString"];
            myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco_webproject.Properties.Settings.Directory_phascoConnectionString"].ConnectionString);
            myConnection.Open();

            SqlCommand cmd = new SqlCommand("Search", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@Mode", SqlDbType.Int));
            cmd.Parameters["@Mode"].Value = mode;

            cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
            cmd.Parameters["@id"].Value = region;

            cmd.Parameters.Add(new SqlParameter("@region", SqlDbType.Int));
            cmd.Parameters["@region"].Value = region;

            cmd.Parameters.Add(new SqlParameter("@state", SqlDbType.NVarChar));
            cmd.Parameters["@state"].Value = state;

            cmd.Parameters.Add(new SqlParameter("@star", SqlDbType.Int));
            cmd.Parameters["@star"].Value = star;

            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar));
            cmd.Parameters["@name"].Value = Txt_Name.Text;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            dgrdTitles.DataSource = ds;
            dgrdTitles.DataBind();
            if (ds.Tables[0].Rows.Count == 0)
            { dgrdTitles.Visible = false; LBL_GRD.Text = "موردی یافت نشد"; }
            else
            { dgrdTitles.Visible = true; LBL_GRD.Text = "متناسب با کلمه " + Txt_Name.Text + " جستجوشده تعداد " + "&nbsp;<font color='#fb0206'><b>" + ds.Tables[0].Rows.Count.ToString() + "</b></font>&nbsp;" + " مورد پیدا شد."; }
        }
        protected void Button_Find_Click(object sender, EventArgs e)
        {
            //try
            //{
                if (DropDownList_edit_State.Enabled == false && DropDownList_Starts.SelectedValue == "0" && Txt_Name.Text == "")
                { return; }
                if (DropDownList_edit_Region.SelectedValue.ToString() == "0")
                {
                    mode = 0; star = 0;
                    Bind_Grd();
                    MultiView1.ActiveViewIndex = 1;
                    return;
                }

                if (DropDownList_REGION_2.Enabled != false)
                {
                    region = Convert.ToInt32(DropDownList_REGION_2.SelectedValue);
                    state = DropDownList_REGION_2.SelectedItem.ToString();

                    if (DropDownList_Starts.SelectedValue == "0" && Txt_Name.Text == "")
                    { mode = 1; star = 0; }
                    if (DropDownList_Starts.SelectedValue == "0" && Txt_Name.Text != "")
                    { mode = 2; star = 0; }
                    if (DropDownList_Starts.SelectedValue != "0" && Txt_Name.Text != "")
                    { mode = 3; star = Convert.ToInt32(DropDownList_Starts.SelectedValue); }
                    if (DropDownList_Starts.SelectedValue != "0" && Txt_Name.Text == "")
                    { mode = 4; star = Convert.ToInt32(DropDownList_Starts.SelectedValue); }

                    Bind_Grd();
                    MultiView1.ActiveViewIndex = 1;

                }
                else LBL_Alram.Text = "لطفا نام محل را انتخاب کنید";
            //}
            //catch (Exception)
            //{
            //    dgrdTitles.Visible = false; LBL_GRD.Text = "<font color='#fb0206'>" + "متاسفانه برابر با آیتم های درخواستی شما موردی  یافت نشد!" + "</font>";
            //}
        }

        protected void Link_Back_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 1; }
        protected void Link_View_Command(object sender, CommandEventArgs e)
        { }
        public string image_Check(string id_)
        {
            string ImageName =  MyFileUploader.GetImageSingleName(int.Parse(id_.ToString()), ".jpg").ToString();
            return ImageName;
        }

        public string clean_text(string text)
        {
            return text.ToString().Replace(".", "").Replace("-", "");
        }
    }
}
