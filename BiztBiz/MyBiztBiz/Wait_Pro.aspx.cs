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
using BiztBiz.BLL;
using System.Globalization;
using System.Threading;
using BiztBiz.Component;
using System.Text;

namespace BiztBiz.MyBiztBiz
{
    public partial class Wait_Pro : BasePage
    {
        Tbl_Products da = new Tbl_Products();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) 
            { 
                bind_Product(); 
                set_Satus(); 
            }
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
                                DataTable dt = da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "delete_Item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "","");
                                string file = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + dt.Rows[0]["image_name"].ToString());
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
            DataTable dt = da.Tbl_Products_Tra(0, "select_mode", UserOnline.id(), 0, 3, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "","");
            if (dt.Rows.Count <= 0)
            { MultiView_Grd.ActiveViewIndex = 1; return; }
            else { MultiView_Grd.ActiveViewIndex = 0; }
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
                    da.Tbl_Products_Tra(int.Parse(id_), "delete_Item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "","");
                }
            }
            Response.Redirect("Wait_Pro.aspx?status=1");
        }

        protected void listItems_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
