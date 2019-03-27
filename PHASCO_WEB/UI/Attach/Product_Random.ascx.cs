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
using System.Data.SqlClient;
using PHASCO_WEB.DAL;
using PHASCO_WEB.DAL.DS_MainPhascoTableAdapters;

namespace phasco_webproject.UI.Attach
{
    public partial class Product_Random : System.Web.UI.UserControl
    {
        #region dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TEuroTableAdapter da_Eu = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TEuroTableAdapter();
        DS_MainPhasco.TEuroDataTable dt_Eu = new DS_MainPhasco.TEuroDataTable();

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            TEuroTableAdapter Euro = new TEuroTableAdapter();
            DS_MainPhasco.TEuroDataTable ds = new DS_MainPhasco.TEuroDataTable();
            int Id_ = Convert.ToInt32(Request.QueryString["id"]);


            SqlConnection myConnection = null;
            SqlDataReader drAuthors;
            string connectionString = ConfigurationSettings.AppSettings["phasco.Properties.Settings.Phasco_NetConnectionString"];
            myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
            myConnection.Open();

            SqlCommand cmd = new SqlCommand("Producr_Get_Randomize", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            cmd.Parameters["@id"].Value = Id_;

            cmd.Parameters.Add(new SqlParameter("@Lang", SqlDbType.NVarChar));
            cmd.Parameters["@Lang"].Value = Page.Culture.ToString();

            drAuthors = cmd.ExecuteReader();
            DataList_Products.DataSource = drAuthors;
            DataList_Products.DataBind();
            try
            {

                if (Session["lang"].ToString() != null && Session["lang"].ToString() == "2")
                {
                    Euro.Update_Euro(ds, 3, 0, 1, null);

                    for (int i = 0; i < DataList_Products.Items.Count; i++)
                    {
                        float chane_to_Euro = float.Parse((DataList_Products.Items[i].FindControl("lbl_price") as Label).Text) / float.Parse(ds[0].Euro.ToString());
                        (DataList_Products.Items[i].FindControl("lbl_price") as Label).Text = chane_to_Euro.ToString("########.##");
                    }
                    //Session["lang"] = null;
                    //decimal chane_to_Euro = Convert.ToDecimal(float.Parse((DataList_Products.FindControl("lbl_price") as Label).Text) / float.Parse(Euro_table[0].Euro.ToString()));
                    //(DataList_Products.FindControl("lbl_price") as Label).Text = chane_to_Euro.ToString("########.##");
                }
            }
            catch (Exception Ex)
            {
                Session["lang"] = null;
            }
        }
    }
}