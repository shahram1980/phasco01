using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using phasco.BaseClass;
using System.Data.SqlClient;

namespace phasco_webproject.UI
{
    public partial class ArticleList : System.Web.UI.UserControl, ICallbackEventHandler
    {
        string _SearchResult;
        public string _MasterCat;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cbref = Page.ClientScript.GetCallbackEventReference(this, "arg", "GetFromServer", "context");
            string cbScr = string.Format("function UseCallBack(arg, context) {{ {0}; }} ", cbref);
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "UseCallBack", cbScr, true);
            try
            {
                int RowCount = Bind_Exist_Categorys();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CountVar", "var CountRow=" + RowCount, true);
            }
            catch
            {
            }
        }
        public string GetCallbackResult()
        {
            System.Threading.Thread.Sleep(500);
            return _SearchResult;
        }
        public void RaiseCallbackEvent(string eventArgument)
        {
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Phasco_ArticleConString_RAD"].ConnectionString);
            try
            {
                string Align = "Right";

                SqlCommand Comm = new SqlCommand("select * from Tractate_List Where SubLevel=@ID", Con);
                Comm.Parameters.AddWithValue("@ID", eventArgument);
                Con.Open();
                SqlDataReader Reader = Comm.ExecuteReader();
                while (Reader.Read())
                {
                    _SearchResult += Reader[2] + "#" + Reader[0] + "#" + Align + "#" + "@";
                }
                Con.Close();
            }
            catch
            {
                Con.Close();
            }
        }
        private int Bind_Exist_Categorys()
        {
            string Align = "Right";

            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Phasco_ArticleConString_RAD"].ConnectionString);
            SqlCommand Comm = new SqlCommand("SELECT SubJect as SubJect , id FROM Tractate_List Where SubLevel=0 order by SubJect desc", Con);
            Con.Open();
            SqlDataReader Reader = Comm.ExecuteReader();
            int Count = 0;
            while (Reader.Read())
            {
                // javaScript Function GetData(Item , ID_Cat)
                Count++;
                _MasterCat += string.Format("<table  onclick='GetData({0} , {1})' border='0' cellpadding='0' cellspacing='0'  background='#e7e1c8'  style='width: 100%;cursor:pointer'>", Count, Reader["ID"]);
                _MasterCat += string.Format("<tr><td background='#e7e1c8' style='width: 22px; height: 26px;' valign='middle'><img src='Images/down.gif' id='Nav_IMG{0}' />", Count);

                _MasterCat += string.Format("</td><td  background='#e7e1c8' style='with=100% ;height: 26px; ' valign='middle'><strong> {0} </strong></td><td style='width:20px' background='#e7e1c8' > <img style='display:none' src='Images/Loading.gif' id='LoadingIMG_{1}' /> </td>", Reader["SubJect"], Count);

                _MasterCat += "</tr><tr><td background='#e7e1c8' style='height:3px'></td><td background='#e7e1c8' style='height:3px'></td><tr>";
                _MasterCat += "</table>";
                _MasterCat += string.Format("<div style='display:none' id='Nav_Dav_{0}'></div>", Count);
            }
            Con.Close();
            return Count;
        }
    }
}