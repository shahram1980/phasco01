using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Globalization;
using System.Threading;
using PHASCO_Shopping.Component;
using System.Text;
using System.Data;
using System.Web.UI.HtmlControls;
using Membership_Manage;
 
namespace PHASCO_Shopping.MyPHASCO_Shopping
{
    public partial class Wait_Pro1 : System.Web.UI.Page
    {
        Tbl_Products da = new Tbl_Products();
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
            if (!IsPostBack) { bind_Product(); set_Satus(); }
        }
        void set_Satus()
        {
            if (Request.QueryString["status"] != null)
            {
                string status = Request.QueryString["status"].ToString();
                switch (status)
                {
                    case "1":
                        {
                            Label_Alaram.Text = "Delete Success";
                            bind_Product();
                            break;
                        }

                    case "2":
                        {
                            try
                            {
                                DataTable dt = da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "delete_Item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");
                                string file = Server.MapPath("~\\MyPHASCO_Shopping\\Pupload\\" + dt.Rows[0]["image_name"].ToString());
                                System.IO.File.Delete(file);
                                bind_Product();
                            }
                            catch (Exception) { }
                            break;
                        }
                    default:
                        break;
                }

            }
        }
        void bind_Product()
        {
            DataTable dt = da.Tbl_Products_Tra(0, "select_mode", UserOnline.id(), 0, 3, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");
            listItems.DataSource = dt;
            listItems.DataBind();
        }

        protected void listItems_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.dataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            bind_Product();
        }

        protected void Button_Delete_Click(object sender, EventArgs e)
        {
            string ss;
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < listItems.Items.Count; i++)
            {
                ListViewItem row = listItems.Items[i];
                bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
                string id_ = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Value.ToString();
                if (isChecked)
                {
                    ss = id_;
                    da.Tbl_Products_Tra(int.Parse(id_), "delete_Item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "");
                }
            }
            Response.Redirect("Wait_Pro.aspx?status=1");
        }

        protected void listItems_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}