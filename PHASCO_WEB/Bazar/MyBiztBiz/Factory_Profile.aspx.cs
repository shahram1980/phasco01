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
using Membership_Manage;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class Factory_Profile : BasePage
    {
        TBL_Factory_Profile da = new TBL_Factory_Profile();
        DataTable dt;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
                Set_Form();
        }

        void Set_Form()
        {
            try
            {
                dt = da.TBL_Factory_Profile_Tra(0, "select_Item", UserOnline.id(), "", "", "", "", "", "", "", "", "", "", "", "");


                DropDownList_Area_Factory.SelectedValue = dt.Rows[0]["Area_Factory"].ToString();
                DropDownList_production_staf.SelectedValue = dt.Rows[0]["production_staf"].ToString();
                DropDownList_RD_staff.SelectedValue = dt.Rows[0]["RD_staff"].ToString();

                TextBox_Factory_Address.Text = dt.Rows[0]["Factory_Address"].ToString();
                TextBox_Year_built.Text = dt.Rows[0]["Year_built"].ToString();
                TextBox_Materials_Components.Text = dt.Rows[0]["Materials_Components"].ToString();
                TextBox_Machinery_Equipment.Text = dt.Rows[0]["Machinery_Equipment"].ToString();
                TextBox_Production_Process.Text = dt.Rows[0]["Production_Process"].ToString();


                if (dt.Rows[0]["Photo"].ToString() != "none.jpg")
                    Image_Photo.ImageUrl = "~\\MyBiztBiz\\faqUpload\\sm_" + dt.Rows[0]["Photo"].ToString();
                else
                    Image_Photo.ImageUrl = "~\\MyBiztBiz\\faqUpload\\None\\NONE.jpg";

                if (dt.Rows[0]["Materials_Components"].ToString() != "none.jpg")
                    Image_photo_Materials_Components.ImageUrl = "~\\MyBiztBiz\\faqUpload\\sm_" + dt.Rows[0]["photo_Materials_Components"].ToString();
                else
                    Image_photo_Materials_Components.ImageUrl = "~\\MyBiztBiz\\faqUpload\\None\\NONE.jpg";

                if (dt.Rows[0]["photo_Machinery_Equipment"].ToString() != "none.jpg")
                    Image_photo_Machinery_Equipment.ImageUrl = "~\\MyBiztBiz\\faqUpload\\sm_" + dt.Rows[0]["photo_Machinery_Equipment"].ToString();
                else
                    Image_photo_Machinery_Equipment.ImageUrl = "~\\MyBiztBiz\\faqUpload\\None\\NONE.jpg";

                if (dt.Rows[0]["photo_Production_Process"].ToString() != "none.jpg")
                    Image_photo_Production_Process.ImageUrl = "~\\MyBiztBiz\\faqUpload\\sm_" + dt.Rows[0]["photo_Production_Process"].ToString();
                else
                    Image_photo_Production_Process.ImageUrl = "~\\MyBiztBiz\\faqUpload\\None\\NONE.jpg";
            }
            catch (Exception)
            {
                Image_photo_Production_Process.ImageUrl = Image_Photo.ImageUrl = Image_photo_Materials_Components.ImageUrl = Image_photo_Machinery_Equipment.ImageUrl = "~\\MyBiztBiz\\faqUpload\\None\\NONE.jpg";
            }

        }
 
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            // string photo, photo_Materials_Components, photo_Machinery_Equipment, photo_Production_Process;
            //photo= photo_Materials_Components= photo_Machinery_Equipment= photo_Production_Process= ;


            dt = da.TBL_Factory_Profile_Tra(0, "insert", UserOnline.id(), DropDownList_Area_Factory.SelectedValue, TextBox_Factory_Address.Text, TextBox_Year_built.Text,
                DropDownList_production_staf.SelectedValue.ToString(), DropDownList_RD_staff.SelectedValue.ToString(), "none.jpg", TextBox_Materials_Components.Text, "none.jpg",
                TextBox_Machinery_Equipment.Text, "none.jpg", TextBox_Production_Process.Text, "none.jpg");


            int id = int.Parse(dt.Rows[0][0].ToString());

            string filenam_path = "";
            string path = "";
            if (FileUpload_Photo.HasFile)
            {
                string filename = dt.Rows[0][0].ToString() + "p_faq_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\faqUpload\\", filename, "*", "*", "*", this.Server);
                da.TBL_Factory_Profile_Tra(id, "update_photo", 0, "", "", "", "", "", filename, "", "", "", "", "", "");

                filenam_path = Server.MapPath("~\\MyBiztBiz\\faqUpload\\" + filename);
                path = Server.MapPath("~//MyBiztBiz//faqUpload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
            }


            if (FileUpload_photo_Materials_Components.HasFile)
            {
                string filename = dt.Rows[0][0].ToString() + "mc_faq_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_photo_Materials_Components);
                MyFileUploader.SaveFile_MyFileName(FileUpload_photo_Materials_Components, "~\\MyBiztBiz\\faqUpload\\", filename, "*", "*", "*", this.Server);
                da.TBL_Factory_Profile_Tra(id, "update_photo_Mat", 0, "", "", "", "", "", "", "", filename, "", "", "", "");

                filenam_path = Server.MapPath("~\\MyBiztBiz\\faqUpload\\" + filename);
                path = Server.MapPath("~//MyBiztBiz//faqUpload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
            }


            if (FileUpload_photo_Machinery_Equipment.HasFile)
            {
                string filename = dt.Rows[0][0].ToString() + "me_faq_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_photo_Machinery_Equipment);
                MyFileUploader.SaveFile_MyFileName(FileUpload_photo_Machinery_Equipment, "~\\MyBiztBiz\\faqUpload\\", filename, "*", "*", "*", this.Server);
                da.TBL_Factory_Profile_Tra(id, "update_photo_M_E", 0, "", "", "", "", "", "", "", "", "", filename, "", "");

                filenam_path = Server.MapPath("~\\MyBiztBiz\\faqUpload\\" + filename);
                path = Server.MapPath("~//MyBiztBiz//faqUpload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
            }




            if (FileUpload_photo_Production_Process.HasFile)
            {
                string filename = dt.Rows[0][0].ToString() + "mpp_faq_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_photo_Production_Process);
                MyFileUploader.SaveFile_MyFileName(FileUpload_photo_Production_Process, "~\\MyBiztBiz\\faqUpload\\", filename, "*", "*", "*", this.Server);
                da.TBL_Factory_Profile_Tra(id, "update_photo_P_P", 0, "", "", "", "", "", "", "", "", "", "", "", filename);

                filenam_path = Server.MapPath("~\\MyBiztBiz\\faqUpload\\" + filename);
                path = Server.MapPath("~//MyBiztBiz//faqUpload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
            }
        }
    }
}