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
using System.Resources;
using Resources;
using PHASCO_WEB.DAL;
using DataAccessLayer;

namespace phasco.UI
{
    public partial class DirHome : System.Web.UI.UserControl
    {
        static int mode = 0;
        static int region = 0;
        static string state = "";
        static int star = 0;
        T_Restaurant da_R = new T_Restaurant();
        DataTable dt = new DataTable();
        Tbl_state da_s = new Tbl_state();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                bind_drop_edit_2(); bind_drop_edit_2_2();
            }
        }
        protected void DropDownList_edit_Region_SelectedIndexChanged(object sender, EventArgs e)
        { bind_drop_edit_2(); bind_drop_edit_2_2(); }
        protected void bind_drop_edit_2()
        {
            try
            {
                dt = da_s.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList_edit_Region.SelectedValue), "");

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
            catch (Exception) { }
        }
        protected void DropDownList_edit_State_SelectedIndexChanged(object sender, EventArgs e)
        { bind_drop_edit_2_2(); }
        protected void bind_drop_edit_2_2()
        {
            try
            {
                dt = da_s.T_state_Tra("select", 0, "", Convert.ToInt32(DropDownList_edit_State.SelectedValue), "");
                string Cultur = Page.Culture.ToString();
                if (Cultur == "Persian (Iran)") { DropDownList_REGION_2.DataTextField = "Satate"; }
                else if (Cultur == "English (United States)") { DropDownList_REGION_2.DataTextField = "StateEN"; }
                DropDownList_REGION_2.DataValueField = "ID";
                DropDownList_REGION_2.DataSource = dt;
                DropDownList_REGION_2.DataBind();
                if (dt.Rows.Count != 0) DropDownList_REGION_2.Enabled = true;
                else DropDownList_REGION_2.Enabled = false;
            }
            catch (Exception) { }
        }

        protected void dgrdTitles_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        { dgrdTitles.CurrentPageIndex = e.NewPageIndex; Bind_Grd(); }
        protected void Bind_Grd()
        {
            dt = da_R.Search_sp(mode, region, region, state, star, Txt_Name.Text);
            dgrdTitles.DataSource = dt;
            dgrdTitles.DataBind();
            if (dt.Rows.Count == 0) { dgrdTitles.Visible = false; LBL_GRD.Text = "موردی يافت نشد"; }
            else { dgrdTitles.Visible = true; LBL_GRD.Text = "&nbsp;<font color='#fb0206'><b>" + dt.Rows.Count.ToString() + "</b></font>&nbsp;"; }
        }
        protected void Button_Find_Click(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList_REGION_2.Enabled != false)
                {
                    region = Convert.ToInt32(DropDownList_REGION_2.SelectedValue);
                    state = DropDownList_REGION_2.SelectedItem.ToString();
                    if (RadComboBox2.SelectedValue == "0" && Txt_Name.Text == "")
                    { mode = 1; star = 0; }
                    if (RadComboBox2.SelectedValue == "0" && Txt_Name.Text != "")
                    { mode = 2; star = 0; }
                    if (RadComboBox2.SelectedValue != "0" && Txt_Name.Text != "")
                    { mode = 3; star = Convert.ToInt32(RadComboBox2.SelectedValue); }
                    if (RadComboBox2.SelectedValue != "0" && Txt_Name.Text == "")
                    { mode = 4; star = Convert.ToInt32(RadComboBox2.SelectedValue); }
                    Bind_Grd();
                    MultiView1.ActiveViewIndex = 1;
                }
                else LBL_Alram.Text = "لطفا نام محل را انتخاب کنيد";
            }
            catch (Exception) { dgrdTitles.Visible = false; LBL_GRD.Text = "<font color='#fb0206'>" + "متاسفانه برابر با آیتم های درخواستی شما موردی  یافت نشد!" + "</font>"; }
        }

        protected void Link_Back_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 1; }

        protected void Link_View_Command(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            int? id = 0;
            dt = da_R.restaurant_Tra("select1",getid,"","",0,"","","","","","","",0,0,0);
            Image_star.ImageUrl = "~//images//star" + Convert.ToString(dt.Rows[0]["star"]) + ".jpg";
            string Cultur = Page.Culture.ToString();
            if (Cultur == "Persian (Iran)")
            {
                LBL_name.Text = dt.Rows[0]["Name"].ToString();
                LBL_address.Text = dt.Rows[0]["Address"].ToString();
                LBL_Manager.Text = dt.Rows[0]["Manager"].ToString();
                LBL_Food.Text = dt.Rows[0]["Foods"].ToString();
                LBL_TIme.Text = dt.Rows[0]["Time"].ToString();
            }
            else if (Cultur == "English (United States)")
            {
                LBL_name.Text = dt.Rows[0]["NameEn"].ToString();
                LBL_address.Text = dt.Rows[0]["AddressEn"].ToString();
                LBL_Manager.Text = dt.Rows[0]["ManagerEn"].ToString();
                LBL_Food.Text = dt.Rows[0]["FoodsEn"].ToString();
                LBL_TIme.Text = dt.Rows[0]["TimeEN"].ToString();
            }

            LBL_reserv.Text = dt.Rows[0]["tel"].ToString();
            LBL_email.Text = dt.Rows[0]["EMail"].ToString();
            LBL_Website.Text = dt.Rows[0]["WebSite"].ToString();
            HyperLink_Web.NavigateUrl = "http://" + dt.Rows[0]["WebSite"].ToString();

            Image_Res.ImageUrl = "~\\Resimg\\" + dt.Rows[0]["Pic"];
            MultiView1.ActiveViewIndex = 2;
        }
    }
}