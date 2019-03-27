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
namespace phasco_webproject.UI
{
    public partial class Product_Subjects : System.Web.UI.UserControl, ICallbackEventHandler
    {
        string background_Color_right = "green";
        string _SearchResult;
        public string _MasterCat;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cbref = Page.ClientScript.GetCallbackEventReference(this, "arg", "GetFromServer", "context");
            string cbScr = string.Format("function UseCallBack(arg, context) {{ {0}; }} ", cbref);
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "UseCallBack", cbScr, true);
            //try
            //{
                int RowCount = Bind_Exist_Categorys();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CountVar", "var CountRow=" + RowCount, true);
            //}
            //catch (Exception Ex) { }

        }
        public string GetCallbackResult()
        {
            System.Threading.Thread.Sleep(500);
            return _SearchResult;
        }

        public void RaiseCallbackEvent(string eventArgument)
        {

            string Subject_rec = "";
            string Align = "";
            string dir = "";
            if (Page.Culture == "Persian (Iran)")
            {
                Subject_rec = "SubJect";
                Align = "Right";
                dir = "rtl";
            }
            else if (Page.Culture == "English (United States)")
            {
                Subject_rec = "SubJect_Uk";
                Align = "Left";
                dir = "ltr";
            }

            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
            SqlCommand Comm = new SqlCommand("SELECT id ,subid, " + Subject_rec + " as SubJect  FROM SubJectS Where SubId=@ID Order By ID Desc ", Con);
            Comm.Parameters.AddWithValue("@ID", eventArgument);
            Con.Open();
            SqlDataReader Reader = Comm.ExecuteReader();
            while (Reader.Read())
            {
                _SearchResult += Reader[2] + "#" + Reader[0] + "#" + Align + "#" + "@";
            }
            Con.Close();

        }

        private int Bind_Exist_Categorys()
        {

            string Subject_rec = "";
            string Align = "";
            if (Page.Culture == "Persian (Iran)")
            {
                Subject_rec = "SubJect";
                Align = "right";
            }
            else if (Page.Culture == "English (United States)")
            {
                Subject_rec = "SubJect_Uk";
                Align = "Left";
            }
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString);
            SqlCommand Comm = new SqlCommand("SELECT " + Subject_rec + " as" + " SubJect , id FROM  SubJectS Where SubId=0 Order By ID Desc", Con);
            Con.Open();
            SqlDataReader Reader = Comm.ExecuteReader();
            int Count = 0;
            while (Reader.Read())
            {
                // javaScript Function GetData(Item , ID_Cat)
                Count++;
                _MasterCat += string.Format("<table  onclick='GetData({0} , {1})' border='0' cellpadding='0' cellspacing='0' style='width: 100%;cursor:pointer'>", Count, Reader["ID"]);
                _MasterCat += string.Format("<tr><td class='Subject_Level1_Background' style='width: 22px; height: 26px;' valign='middle'><img src='Images/down.gif' id='Nav_IMG{0}' />", Count);

                _MasterCat += string.Format("</td><td  class='Subject_Level1_Title_Background' style='with=100% ;height: 26px; ' valign='middle'><p align='" + Align + "'><strong> {0} </strong></td><td style='width:20px' > <img style='display:none' src='Images/Loading.gif' id='LoadingIMG_{1}' /> </td>", Reader["SubJect"], Count);

                _MasterCat += "</tr><tr><td class='Subject_Level1_SapceLine_Background' style='height:3px'></td><td class='Subject_Level1_SapceLine_Background' style='height:3px'></td><tr>";
                _MasterCat += "</table>";
                _MasterCat += string.Format("<div style='display:none' id='Nav_Dav_{0}'></div>", Count);
            }
            Con.Close();
            return Count;



        }
    }
}