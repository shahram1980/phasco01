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
using phasco.BaseClass;
using System.Data.SqlClient;
using BusinessAccessLayer;

namespace phasco_webproject.Cpanel
{
    public partial class c_Images_SubJect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["delid"] != null)
                {
                    int id = Convert.ToInt32(System.Convert.ToInt32(Request.QueryString["delid"]));
                    SqlConnection myConnection = null;
                    SqlDataReader drAuthors;
                    myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
                    myConnection.Open();

                    SqlCommand cmd = new SqlCommand("SubJect_Images", myConnection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
                    cmd.Parameters["@id"].Value = id;

                    cmd.Parameters.Add(new SqlParameter("@Exc", SqlDbType.NVarChar));
                    cmd.Parameters["@Exc"].Value = "np";

                    cmd.Parameters.Add(new SqlParameter("@Image_Mode", SqlDbType.Int));
                    cmd.Parameters["@Image_Mode"].Value = 1;

                    cmd.ExecuteNonQuery();

                    Response.Redirect("Eshop_Subject.aspx");
                }
                if (Request.QueryString["chanid"] != null)
                {
                    MultiView1.ActiveViewIndex = 1;

                    Image1.ImageUrl = "~/" + MyFileUploader.GetImageName("phascoupfile/BrandImage", Convert.ToInt32(Request.QueryString["chanid"]), Convert.ToString(Request.QueryString["img"]));

                }
                if (Request.QueryString["insid"] != null)
                {
                    MultiView1.ActiveViewIndex = 0;
                }

                if (Request.QueryString["Modid"] != null)
                {
                    int mode_ = Convert.ToInt32(Request.QueryString["now"].ToString());
                    if (mode_ == 1)
                        mode_ = 0;
                    else if (mode_ == 0)
                        mode_ = 1;

                    int id = Convert.ToInt32(System.Convert.ToInt32(Request.QueryString["Modid"]));
                    SqlConnection myConnection = null;
                    SqlDataReader drAuthors;
                    myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
                    myConnection.Open();

                    SqlCommand cmd = new SqlCommand("SubJect_Change_Mode", myConnection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
                    cmd.Parameters["@id"].Value = id;

                    cmd.Parameters.Add(new SqlParameter("@Image_Mode", SqlDbType.Int));
                    cmd.Parameters["@Image_Mode"].Value = mode_;

                    cmd.ExecuteNonQuery();
                    Response.Redirect("Eshop_Subject.aspx");
                }

            }
        }

        protected void Button_Ins_Click(object sender, EventArgs e)
        {
            string ext;
            int id = Convert.ToInt32(System.Convert.ToInt32(Request.QueryString["insid"]));
            int Mode_;
            if (CheckBox_Ins.Checked == true)
                Mode_ = 1;
            else
                Mode_ = 0;
            if (FileUpload_Ins.HasFile)
                ext = MyFileUploader.IsExtension(FileUpload_Ins);
            else
                ext = "np";

            MyFileUploader.SaveFile(FileUpload_Ins, "phascoupfile\\BrandImage", id, ".jpg", ".jpeg", ".gif", this.Server);

            string filename = MyFileUploader.GetImageSingleName(id, ".jpg");
            string filepath = Server.MapPath("~//phascoupfile//BrandImage//" + filename).ToString();
            MyFileUploader.ResizeImage(filepath, filepath, 120, 120, true);

            SqlConnection myConnection = null;
            SqlDataReader drAuthors;
            myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
            myConnection.Open();

            SqlCommand cmd = new SqlCommand("SubJect_Images", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            cmd.Parameters["@id"].Value = id;

            cmd.Parameters.Add(new SqlParameter("@Exc", SqlDbType.NVarChar));
            cmd.Parameters["@Exc"].Value = ext;

            cmd.Parameters.Add(new SqlParameter("@Image_Mode", SqlDbType.Int));
            cmd.Parameters["@Image_Mode"].Value = Mode_;

            cmd.ExecuteNonQuery();

            Response.Redirect("Eshop_Subject.aspx");

        }

        protected void Button_Change_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(System.Convert.ToInt32(Request.QueryString["chanid"]));
            int Mode_;
            if (CheckBox_Change.Checked == true)
                Mode_ = 1;
            else
                Mode_ = 0;
            string ext = MyFileUploader.IsExtension(FileUpload1_Change);
            MyFileUploader.SaveFile(FileUpload1_Change, "phascoupfile\\BrandImage", id, ".jpg", ".jpeg", ".gif", this.Server);
            string filename = MyFileUploader.GetImageSingleName(id, ".jpg");
            string filepath = Server.MapPath("~//phascoupfile//BrandImage//" + filename).ToString();
            MyFileUploader.ResizeImage(filepath, filepath, 120, 120, true);


            SqlConnection myConnection = null;
            SqlDataReader drAuthors;
            myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
            myConnection.Open();

            SqlCommand cmd = new SqlCommand("SubJect_Images", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            cmd.Parameters["@id"].Value = id;

            cmd.Parameters.Add(new SqlParameter("@Exc", SqlDbType.NVarChar));
            cmd.Parameters["@Exc"].Value = ext;

            cmd.Parameters.Add(new SqlParameter("@Image_Mode", SqlDbType.Int));
            cmd.Parameters["@Image_Mode"].Value = Mode_;

            cmd.ExecuteNonQuery();

            Response.Redirect("Eshop_Subject.aspx");
        }
    }
}
