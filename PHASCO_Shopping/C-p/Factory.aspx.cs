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
using PHASCO_Shopping.BLL;
using PHASCO_Shopping.Component;

namespace PHASCO_Shopping.C_p
{
    public partial class Factory : System.Web.UI.Page
    {
        TBL_Factory_Profile da = new TBL_Factory_Profile();
        DataTable dt;
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
        { if (!IsPostBack) Set_Form(); }

        void Set_Form()
        {
            try
            {
                dt = da.TBL_Factory_Profile_Tra(0, "select_Item", int.Parse(Request.QueryString["uid"].ToString()), "", "", "", "", "", "", "", "", "", "", "", "");


                Label_Area_Factory.Text = dt.Rows[0]["Area_Factory"].ToString();
                Label_production_staf.Text = dt.Rows[0]["production_staf"].ToString();
                Label_RD_staff.Text = dt.Rows[0]["RD_staff"].ToString();

                TextBox_Factory_Address.Text = dt.Rows[0]["Factory_Address"].ToString();
                TextBox_Year_built.Text = dt.Rows[0]["Year_built"].ToString();
                TextBox_Materials_Components.Text = dt.Rows[0]["Materials_Components"].ToString();
                TextBox_Machinery_Equipment.Text = dt.Rows[0]["Machinery_Equipment"].ToString();
                TextBox_Production_Process.Text = dt.Rows[0]["Production_Process"].ToString();


                if (dt.Rows[0]["Photo"].ToString() != "none.jpg")
                {
                    Image_Photo.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\sm_" + dt.Rows[0]["Photo"].ToString();
                    Image_Photo_java.HRef = "javascript:popUp('../imageview.aspx?img=MyPHASCO_Shopping/faqUpload/" + dt.Rows[0]["Photo"].ToString() + "')";
                }
                else
                    Image_Photo.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\None\\NONE.jpg";

                if (dt.Rows[0]["Materials_Components"].ToString() != "none.jpg")
                {
                    Image_photo_Materials_Components.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\sm_" + dt.Rows[0]["photo_Materials_Components"].ToString();
                    Image_photo_Materials_Components_java.HRef = "javascript:popUp('../imageview.aspx?img=MyPHASCO_Shopping/faqUpload/" + dt.Rows[0]["photo_Materials_Components"].ToString() + "')";
                }
                else
                    Image_photo_Materials_Components.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\None\\NONE.jpg";

                if (dt.Rows[0]["photo_Machinery_Equipment"].ToString() != "none.jpg")
                {
                    Image_photo_Machinery_Equipment.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\sm_" + dt.Rows[0]["photo_Machinery_Equipment"].ToString();
                    Image_photo_Machinery_Equipment_java.HRef = "javascript:popUp('../imageview.aspx?img=MyPHASCO_Shopping/faqUpload/" + dt.Rows[0]["photo_Machinery_Equipment"].ToString() + "')";
                }
                else
                    Image_photo_Machinery_Equipment.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\None\\NONE.jpg";

                if (dt.Rows[0]["photo_Production_Process"].ToString() != "none.jpg")
                {
                    Image_photo_Production_Process.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\sm_" + dt.Rows[0]["photo_Production_Process"].ToString();
                    Image_photo_Production_Process_java.HRef = "javascript:popUp('../imageview.aspx?img=MyPHASCO_Shopping/faqUpload/" + dt.Rows[0]["photo_Production_Process"].ToString() + "')";
                }
                else
                    Image_photo_Production_Process.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\None\\NONE.jpg";
            }
            catch (Exception)
            {
                Image_photo_Production_Process.ImageUrl = Image_Photo.ImageUrl = Image_photo_Materials_Components.ImageUrl = Image_photo_Machinery_Equipment.ImageUrl = "~\\MyPHASCO_Shopping\\faqUpload\\None\\NONE.jpg";
            }

        }
    }
}
