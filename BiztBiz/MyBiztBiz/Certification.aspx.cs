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
using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class Certification : BasePage
    {
        TBL_Certification da = new TBL_Certification();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.QueryString["status"] != null)
                {
                    if (Request.QueryString["status"].ToString() == "insert_9683ju9zok") Bind_Cer();
                    else if (Request.QueryString["status"].ToString() == "Insnew") MultiView1.ActiveViewIndex = 0;
                    else if (Request.QueryString["status"].ToString() == "edit") set_edit();
                    
                }
                else Bind_Cer();

        }

        void set_edit()
        {
            DataTable dt = da.TBL_Certification_Tra(int.Parse(Request.QueryString["id"].ToString()), "select_id");

            DropDownList_Name.SelectedValue=dt.Rows[0]["Name"].ToString();

            TextBox_NO.Text = dt.Rows[0]["NO"].ToString();
            TextBox_Issued_Date.Text = dt.Rows[0]["Issued_Date"].ToString();
            TextBox_Expired_Date.Text = dt.Rows[0]["Expired_Date"].ToString();
            TextBox_Valid_Area.Text = dt.Rows[0]["Valid_Area"].ToString();
            TextBox_Issued_Bureau.Text = dt.Rows[0]["Issued_Bureau"].ToString();

            if(dt.Rows[0]["Photo"].ToString()!="none.jpg")
                Image_Photo.ImageUrl = "~\\MyBiztBiz\\cepload\\sm_" + dt.Rows[0]["Photo"].ToString();

            MultiView1.ActiveViewIndex = 0;
        }

        protected void ImageButton_Insert_Click(object sender, ImageClickEventArgs e)
        {
            int id = 0;
            try
            {
                id = int.Parse(Request.QueryString["id"].ToString());
            }
            catch (Exception)
            {

            }
            DataTable dt = da.TBL_Certification_Tra(id, "insert", UserOnline.id(), DropDownList_Name.SelectedValue.ToString(), TextBox_NO.Text, TextBox_Issued_Date.Text, TextBox_Expired_Date.Text, TextBox_Valid_Area.Text, "none.jpg", TextBox_Issued_Bureau.Text);
            if (FileUpload_Photo.HasFile)
            {
                string filename = dt.Rows[0][0].ToString() + "_ce_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Photo);
                MyFileUploader.SaveFile_MyFileName(FileUpload_Photo, "~\\MyBiztBiz\\cepload\\", filename, "*", "*", "*", this.Server);

                string filenam_path = Server.MapPath("~\\MyBiztBiz\\cepload\\" + filename);
                string path = Server.MapPath("~//MyBiztBiz//cepload//");
                MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);

                da.TBL_Certification_Tra(int.Parse(dt.Rows[0][0].ToString()), "update_Img", 0, "", "", "", "", TextBox_Valid_Area.Text, filename, "");
                
            }
            Response.Redirect("Certification.aspx?status=insert_9683ju9zok");
        }

        void Bind_Cer()
        {
            try
            {
                DataTable dt = da.TBL_Certification_Tra(UserOnline.id(), "select_Uid");

                if (dt.Rows.Count <= 0) { MultiView1.ActiveViewIndex = 1; return; }
                listItems.DataSource = dt;
                listItems.DataBind();
                MultiView1.ActiveViewIndex = 1;
            }
            catch (Exception) { MultiView1.ActiveViewIndex = 0; }

        }
        protected void listItems_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.dataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            Bind_Cer();
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
                    da.TBL_Certification_Tra(int.Parse(id_), "delete");
                }
            }
            Response.Redirect("Certification.aspx");
      
        }

    }
}
