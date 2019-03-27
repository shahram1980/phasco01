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
using DataAccessLayer;

namespace PHASCO_WEB.Cpanel
{
    public partial class QC_Lnks : System.Web.UI.Page
    {
        TBL_Lab_QC da_QC = new TBL_Lab_QC();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGrd();
        }

        protected void Button_Send_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = da_QC.TBL_Lab_QC_SP("insert", 0, TextBox_Name.Text, TextBox_Url.Text);

            GridView1.DataBind();
            TextBox_Name.Text = TextBox_Url.Text = "";
        }

        private void BindGrd()
        {
            GridView1.DataSource = da_QC.TBL_Lab_QC_SP("selectall", 0, TextBox_Name.Text, TextBox_Url.Text);
            GridView1.DataBind();

        }

        protected void ImageButton_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            da_QC.TBL_Lab_QC_SP("delete", id, TextBox_Name.Text, TextBox_Url.Text);
            BindGrd();
        }

    }
}
