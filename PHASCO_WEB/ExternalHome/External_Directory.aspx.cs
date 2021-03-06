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
using System.Threading;
using System.Globalization;
using System.Data.SqlClient;
using Resources;
using PHASCO_WEB.DAL;
using PHASCO_WEB.BLL.Dir;

namespace phasco_webproject.ExternalHome
{
    public partial class External_Directory : System.Web.UI.Page
    {
        #region Datsset
 
        DataTable dt = new DataTable();
        Tbl_state da = new Tbl_state();
        T_Restaurant da_T = new T_Restaurant();


        #endregion
        #region Values
        static int mode = 0;
        static int region = 0;
        static string state = "";
        static int star = 0;
        #endregion
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
                    //Home_Txt();
                    // Langu.SelectedValue = lang;
                    // ((DropDownList)Master.FindControl("Lang")).SelectedValue = lang;
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                    //Home_Txt();
                    // Langu.SelectedValue = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";
                //Home_Txt();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                bind_drop_edit_2(); bind_drop_edit_2_2();
            }
        }
        protected void DropDownList_edit_Region_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind_drop_edit_2(); bind_drop_edit_2_2();
        }
        protected void bind_drop_edit_2()
        {
            try
            {


                dt = da.T_state_Tra("select",0,"", Convert.ToInt32(DropDownList_edit_Region.SelectedValue), "");

                string Cultur = Page.Culture.ToString();
                if (Cultur == "Persian (Iran)")
                { DropDownList_edit_State.DataTextField = "Satate"; }
                else if (Cultur == "English (United States)")
                { DropDownList_edit_State.DataTextField = "StateEN"; }

                DropDownList_edit_State.DataValueField = "ID";
                DropDownList_edit_State.DataSource = dt;
                DropDownList_edit_State.DataBind();
                if (dt.Rows.Count != 0)
                    DropDownList_edit_State.Enabled = true;
                else
                    DropDownList_edit_State.Enabled = false;
            }
            catch (Exception)
            {
            }

        }
        protected void DropDownList_edit_State_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind_drop_edit_2_2();
        }
        protected void bind_drop_edit_2_2()
        {
            try
            {
                dt = da.T_state_Tra("select",0,"", Convert.ToInt32(DropDownList_edit_State.SelectedValue), "");
                string Cultur = Page.Culture.ToString();
                if (Cultur == "Persian (Iran)")
                { DropDownList_REGION_2.DataTextField = "Satate"; }
                else if (Cultur == "English (United States)")
                { DropDownList_REGION_2.DataTextField = "StateEN"; }

                DropDownList_REGION_2.DataValueField = "ID";
                DropDownList_REGION_2.DataSource = dt;
                DropDownList_REGION_2.DataBind();

                if (dt.Rows.Count != 0)
                    DropDownList_REGION_2.Enabled = true;
                else
                    DropDownList_REGION_2.Enabled = false;
            }
            catch (Exception)
            { }
        }

        protected void dgrdTitles_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgrdTitles.CurrentPageIndex = e.NewPageIndex;
            Bind_Grd();
        }
        protected void Bind_Grd()
        {
            //Search ------------------------
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
            { dgrdTitles.Visible = false; LBL_GRD.Text = "موردی يافت نشد"; }
            else
            { dgrdTitles.Visible = true; LBL_GRD.Text = "&nbsp;<font color='#fb0206'><b>" + ds.Tables[0].Rows.Count.ToString() + "</b></font>&nbsp;"; }

            //Search ************************
        }
        protected void Button_Find_Click(object sender, EventArgs e)
        {
            try
            {
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
                else
                    LBL_Alram.Text = "لطفا نام محل را انتخاب کنيد";

            }
            catch (Exception)
            {
                dgrdTitles.Visible = false; LBL_GRD.Text = "<font color='#fb0206'>" + "متاسفانه برابر با آیتم های درخواستی شما موردی  یافت نشد!" + "</font>";

            }


        }

        protected void Link_Back_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }


    }
}
