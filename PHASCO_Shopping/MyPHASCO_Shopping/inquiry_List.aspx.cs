using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Web.UI.HtmlControls;
using PHASCO_Shopping.BLL;
using System.Threading;
using System.Globalization;
using PHASCO_Shopping.Component;
using Membership_Manage;

namespace PHASCO_Shopping.MyPHASCO_Shopping
{
    public partial class inquiry_List1 : System.Web.UI.Page
    {
        TBL_inquire da = new TBL_inquire();
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string name = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = name;
                    Response.Cookies.Add(cookie);
                    this.Page.Culture = name;
                    this.Page.UICulture = name;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    HttpCookie cookie2 = Request.Cookies["elang"];
                    string str2 = cookie2.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
                    this.Page.Culture = str2;
                    this.Page.UICulture = str2;
                }
            }
            catch (Exception)
            {
                this.Page.Culture = "en-US";
                this.Page.UICulture = "en-US";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["vid"] != null)
                    set_Detail();
                else if (Request.QueryString["reid"] != null)
                    set_replay();
                else
                    Bind_Inquiry();
            }

        }

        void Bind_Inquiry()
        {
            try
            {

                DataTable dt = da.TBL_inquire_Tra_select_Uid_rec(UserOnline.id(), "select_Uid_rec");

                if (dt.Rows.Count <= 0) { MultiView1.ActiveViewIndex = 2; return; }
                listItems.DataSource = dt;
                listItems.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
            catch (Exception) { MultiView1.ActiveViewIndex = 2; }

        }
        protected void listItems_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.dataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            Bind_Inquiry();
        }
        void set_Detail()
        {
            int id = int.Parse(Request.QueryString["vid"].ToString());
            DataTable dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Uid_rec_item");
            
            Label_Topic.Text = dt.Rows[0]["topic"].ToString();
            Label_Send_Date.Text = Set_Date(dt.Rows[0]["Send_date"].ToString());
            Label_Message.Text = dt.Rows[0]["Message"].ToString();
            //Label_Company_Name.Text = dt.Rows[0]["Company_Name"].ToString();
            Label_Company_address.Text = dt.Rows[0]["Company_Address"].ToString();
            HyperLink_Reply.NavigateUrl = "http://www.phasco.com/SendMss.aspx?id=" + dt.Rows[0]["id"].ToString();

            dt = UserOnline.Get_UserProperties(int.Parse(dt.Rows[0]["Uid"].ToString()));

            if (dt.Rows.Count > 0)
            {
                Label_Email.Text = dt.Rows[0]["Email"].ToString();
                Label_UId.Text = dt.Rows[0]["uid"].ToString();
                Label_Name.Text = dt.Rows[0]["name"].ToString() + " " + dt.Rows[0]["famil"].ToString();
            }
 

            MultiView1.ActiveViewIndex = 1;
        }

        protected string Set_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);

            if (Page.Culture.ToString() == "English (United States)")
                return dtm.ToString();
            if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
            {
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
                return sunDate.Weekday.ToString() + "&nbsp;&nbsp;[" + dtm.Hour + ":" + dtm.Minute + "]";
            }

            return dtm.ToString();
        }

        protected void Button_Delete_Click(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < listItems.Items.Count; i++)
            {
                ListViewItem row = listItems.Items[i];
                bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
                string id_ = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Value.ToString();
                if (isChecked)
                {
                    da.TBL_inquire_Tra_select_Uid_rec(int.Parse(id_), "delete_Id");
                }
            }
            Response.Redirect("inquiry_List.aspx");
        }
        void set_replay()
        {
            int id = int.Parse(Request.QueryString["reid"].ToString());
            DataTable dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Uid_rec_item");

            MultiView1.ActiveViewIndex = 2;

            dt = UserOnline.Get_UserProperties(int.Parse(dt.Rows[0]["Uid"].ToString()));

            if (dt.Rows.Count > 0)
            {
                Label_Email_send.Text = dt.Rows[0]["Email"].ToString();
                Label_Mss.Text = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Uid_rec_item").Rows[0]["Message"].ToString();
            }
        }
        protected void ImageButton_Insert_Click(object sender, ImageClickEventArgs e)
        {        }
    }
}