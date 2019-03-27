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
using System.Threading;
using System.Globalization;
using BiztBiz.Component;
using System.Text;
using BiztBiz.BLL;

namespace BiztBiz.MyBiztBiz
{
    public partial class ListProduct : BasePage
    {
        int _PageView;
        public int PageView
        {
            get
            {
                return _PageView;
            }
            set
            {
                _PageView = value;
            }
        }

        int _ProductID;
        public int ProductID
        {
            get
            {
                return _ProductID;
            }
            set
            {
                _ProductID = value;
            }
        }

        int _StatusID;
        public int StatusID
        {
            get
            {
                return _StatusID;
            }
            set
            {
                _StatusID = value;
            }
        }

        Tbl_Products da = new Tbl_Products();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = Utility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ProductID"]))
                ProductID = Utility.ConverToNullableInt(Request.QueryString["ProductID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = Utility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!Page.IsPostBack)
                Initialize();

            if (!IsPostBack)
            {
                //set_Satus();
            }
        }

        protected void Initialize()
        {
            bind_Product();
        }

        //void set_Satus()
        //{
        //    if (Request.QueryString["PageView"] != null)
        //    {
        //        string status = Request.QueryString["PageView"].ToString();
        //        switch (status)
        //        {
        //            case "1":
        //                {
        //                    Label_Alaram.Text = "Delete Success";
        //                    bind_Product();
        //                    break;
        //                }

        //            case "2":
        //                {
        //                    try
        //                    {
        //                        DataTable dt = da.Tbl_Products_Tra(int.Parse(Request.QueryString["id"].ToString()), "delete_Item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "");
        //                        string file = Server.MapPath("~\\MyBiztBiz\\Pupload\\" + dt.Rows[0]["image_name"].ToString());
        //                        System.IO.File.Delete(file);
        //                        bind_Product();
        //                    }
        //                    catch (Exception) { }
        //                    break;
        //                }
        //            default:
        //                break;
        //        }

        //    }
        //}

        void bind_Product()
        {
            DataTable dt = da.Tbl_Products_Tra(0, "select_mode", UserOnline.id(), 0, 3, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "");
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
                    da.Tbl_Products_Tra(int.Parse(id_), "delete_Item", 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "");
                }
            }
            bind_Product();
            //Response.Redirect("Wait_Pro.aspx?status=1");
        }

        protected void listItems_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public string image_view(int Mode, string imagename)
        {
            if (Mode == 1) return "<img src='Pupload/sm_" + imagename + "' width='40'  style='border: 1px #818181 solid;'/>";
            if (Mode == 0) return "<img src='Pupload/none.jpg'  width='40' style='border: 1px #818181 solid;' />";
            return "نامشخص";
        }


        public string Set_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);

            if (Page.Culture.ToString() == "English (United States)")
                return dtm.ToString();
            if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
            {
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
                return sunDate.Weekday.ToString() + "&nbsp;&nbsp; ساعت" + dtm.Hour + ":" + dtm.Minute;
            }

            return dtm.ToString();
        }
    }
}
