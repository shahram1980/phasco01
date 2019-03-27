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

namespace PerisanCMS.UI
{
    public partial class Menu : System.Web.UI.UserControl
    {
        private void bind_Menu()
        {
            DataSet dataSet = new DataSet();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["perisCMS.Properties.Settings.PerisnetCMSConnectionString"].ConnectionString))
            {
                string selectCommandText = "Select MenuID, Text, Description, ParentID from Menu where lang='" + Page.Culture.ToString() + "'  and View_Allow =0 order by Text ";
                if (PerisanCMS.BaseClass.UserLogin.User_Online_Valid())
                {
                    selectCommandText = "SELECT  TOP 100 PERCENT dbo.Menu.MenuID, dbo.Menu.Text, dbo.Menu.ParentID, dbo.Menu.View_Allow, dbo.Menu_Users.Uid, ";
                    string str3 = selectCommandText + " dbo.Menu_Users.MenuID AS Menuid2, dbo.Menu.Description FROM   dbo.Menu LEFT OUTER JOIN dbo.Menu_Users ON dbo.Menu.MenuID = dbo.Menu_Users.MenuID";
                    selectCommandText = str3 + " WHERE  ((dbo.Menu.View_Allow = 0) AND ((dbo.Menu.Lang = '" + Page.Culture.ToString() + "')) OR (dbo.Menu.View_Allow = 1) AND (dbo.Menu_Users.Uid = " + PerisanCMS.BaseClass.UserOnline.id().ToString() + ") AND (dbo.Menu.Lang = '" + Page.Culture.ToString() + "')) ORDER BY dbo.Menu.MenuID";
                }
                SqlDataAdapter adapter = new SqlDataAdapter(selectCommandText, connection);
                adapter.Fill(dataSet);
                adapter.Dispose();
                if (dataSet.Tables[0].Rows.Count <= 0)
                { Menu1.Visible = false; }
                else
                { Menu1.Visible = true; }
            }
            dataSet.DataSetName = "Menus";
            dataSet.Tables[0].TableName = "Menu";
            DataRelation relation = new DataRelation("ParentChild", dataSet.Tables["Menu"].Columns["MenuID"], dataSet.Tables["Menu"].Columns["ParentID"], true);
            relation.Nested = true;
            dataSet.Relations.Add(relation);
            xmlDataSource.Data = dataSet.GetXml();
            if (base.Request.Params["Sel"] != null)
            { Page.Controls.Add(new LiteralControl("You selected " + base.Request.Params["Sel"])); }
        }
        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) bind_Menu(); }
    }
}