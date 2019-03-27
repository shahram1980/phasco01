using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using PHASCO_Shopping.Component;
using System.Threading;
using System.Globalization;
using System.Data;
using Membership_Manage;
namespace PHASCO_Shopping.MyPHASCO_Shopping
{
    public partial class company_profile1 : System.Web.UI.Page
    {
        TBL_Company_Profile da_prof = new TBL_Company_Profile();
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
            if (!IsPostBack) Set_Form();
        }
        void Set_Form()
        {
            try
            {
                DataTable dt = da_prof.TBL_Company_Profile_Tra(0, "select_item", UserOnline.id(), "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "");
                TextBox_Company_Name.Text = dt.Rows[0]["Company_Name"].ToString();
                TextBox_Company_Address.Text = dt.Rows[0]["Company_Address"].ToString();
                TextBox_State_Province.Text = dt.Rows[0]["State_Province"].ToString();
                TextBox_City.Text = dt.Rows[0]["City"].ToString();
                TextBox_Zip.Text = dt.Rows[0]["Zip"].ToString();
                DropDownList_Reg.SelectedValue = dt.Rows[0]["registered_capital"].ToString();
                DropDownList_Total_Staff.SelectedValue = dt.Rows[0]["Total_Staff"].ToString();
                TextBox_year_Established.Text = dt.Rows[0]["year_Established"].ToString();
                TextBox_Company_Website.Text = dt.Rows[0]["Company_Website"].ToString();
                TextBox_Services.Text = dt.Rows[0]["Services"].ToString(); ;
                TextBox_Company_Introduction.Text = dt.Rows[0]["Company_Introduction"].ToString();
                DropDownList_annual_sales.SelectedValue = dt.Rows[0]["annual_sales"].ToString();
                TextBox_exports.Text = dt.Rows[0]["exports"].ToString();
                TextBox_Advertisementdress.Text = dt.Rows[0]["Advertisement"].ToString();


                if (dt.Rows[0]["image"].ToString() != "none.jpg")
                    Image_Logo.ImageUrl = "~\\MyPHASCO_Shopping\\Coupload\\sm_" + dt.Rows[0]["image"].ToString();
                else
                    Image_Logo.ImageUrl = "~\\MyPHASCO_Shopping\\Coupload\\None\\none.jpg";

                string Business_Type = dt.Rows[0]["Business_Type"].ToString();
                string[] arInfo = new string[9];
                char[] splitter = { ',' };
                arInfo = Business_Type.Split(splitter);
                string checkarr = "";
                string check = "";

                for (int x = 0; x < arInfo.Length; x++)
                {
                    for (int i = 0; i < CheckBoxList_Business_Typent.Items.Count; i++)
                    {
                        check = CheckBoxList_Business_Typent.Items[i].Value.ToString();
                        checkarr = arInfo[x].ToString();
                        if (check == checkarr) CheckBoxList_Business_Typent.Items[i].Selected = true;
                    }
                }

                Business_Type = dt.Rows[0]["Main_Markets"].ToString();
                checkarr = "";
                check = "";
                arInfo = Business_Type.Split(splitter);

                for (int x = 0; x < arInfo.Length; x++)
                {
                    for (int i = 0; i < CheckBoxList_Main_Marketsnt.Items.Count; i++)
                    {
                        check = CheckBoxList_Main_Marketsnt.Items[i].Value.ToString();
                        checkarr = arInfo[x].ToString();
                        if (check == checkarr) CheckBoxList_Main_Marketsnt.Items[i].Selected = true;
                    }
                }

            }
            catch (Exception) { }

        }
        protected void ImageButton_Create_Click(object sender, ImageClickEventArgs e)
        {
            string Main_Marketsnt = "";
            string image = "none.jpg";

            string Business_Typent = "";
            if (CheckBoxList_Business_Typent.Items[0].Selected) Business_Typent = CheckBoxList_Business_Typent.Items[0].Value.ToString();
            if (CheckBoxList_Business_Typent.Items[1].Selected) Business_Typent = Business_Typent + "," + CheckBoxList_Business_Typent.Items[1].Value.ToString();
            if (CheckBoxList_Business_Typent.Items[2].Selected) Business_Typent = Business_Typent + "," + CheckBoxList_Business_Typent.Items[2].Value.ToString();
            if (CheckBoxList_Business_Typent.Items[3].Selected) Business_Typent = Business_Typent + "," + CheckBoxList_Business_Typent.Items[3].Value.ToString();
            if (CheckBoxList_Business_Typent.Items[4].Selected) Business_Typent = Business_Typent + "," + CheckBoxList_Business_Typent.Items[4].Value.ToString();
            if (CheckBoxList_Business_Typent.Items[5].Selected) Business_Typent = Business_Typent + "," + CheckBoxList_Business_Typent.Items[5].Value.ToString();
            if (CheckBoxList_Business_Typent.Items[6].Selected) Business_Typent = Business_Typent + "," + CheckBoxList_Business_Typent.Items[6].Value.ToString();
            if (CheckBoxList_Business_Typent.Items[7].Selected) Business_Typent = Business_Typent + "," + CheckBoxList_Business_Typent.Items[7].Value.ToString();


            if (CheckBoxList_Main_Marketsnt.Items[0].Selected) Main_Marketsnt = CheckBoxList_Main_Marketsnt.Items[0].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[1].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[1].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[2].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[2].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[3].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[3].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[4].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[4].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[5].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[5].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[6].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[6].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[7].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[7].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[8].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[8].Value.ToString();
            if (CheckBoxList_Main_Marketsnt.Items[9].Selected) Main_Marketsnt = Main_Marketsnt + "," + CheckBoxList_Main_Marketsnt.Items[9].Value.ToString();

            DataTable dt = da_prof.TBL_Company_Profile_Tra(0, "Insert", UserOnline.id(), image, TextBox_Company_Name.Text, "Image", TextBox_Company_Address.Text,
                   TextBox_State_Province.Text, TextBox_City.Text, TextBox_Zip.Text, DropDownList_Total_Staff.SelectedValue, DropDownList_Reg.SelectedValue, TextBox_year_Established.Text,
                   TextBox_Company_Website.Text, Business_Typent, TextBox_Services.Text, TextBox_Company_Introduction.Text, Main_Marketsnt, DropDownList_annual_sales.SelectedValue,
                   int.Parse(TextBox_exports.Text.ToString()), TextBox_Advertisementdress.Text);

            if (FileUpload_Logo.HasFile)
            {
                string filename = dt.Rows[0][0].ToString() + "_co_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Logo);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Logo, "~\\MyPHASCO_Shopping\\Coupload\\", filename, "*", "*", "*", this.Server);



                string filenam_path = Server.MapPath("~\\MyPHASCO_Shopping\\Coupload\\" + filename);
                string path = Server.MapPath("~//MyPHASCO_Shopping//Coupload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                da_prof.TBL_Company_Profile_Tra(int.Parse(dt.Rows[0][0].ToString()), "Update_Image", 0, filename, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "");
                Response.Redirect("company_profile.aspx?status=insert_983ju9zok");
            }

        }
    }
}