using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Threading;
using System.Globalization;

namespace DEMO_PagerControlV2_8netFx3_5_CS
{
    public partial class DEMO__HiddenHyperlinks : System.Web.UI.Page
    {
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
                    Response.Redirect(Request.UrlReferrer.ToString());
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
                this.Page.Culture = "fa-IR";
                this.Page.UICulture = "fa-IR";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            string pageNumberQS = Request.QueryString[pager1.QueryStringParameterName] ?? string.Empty;
            if (pageNumberQS != string.Empty && Convert.ToInt32(pageNumberQS) > 0)
            {
                pager1.CurrentIndex = Convert.ToInt32(pageNumberQS);
                BindRepeater();
            }

            if (!Page.IsPostBack)
            {
                BindRepeater();
            }

        }


        public void pager_Command(object sender, CommandEventArgs e)
        {
            int currnetPageIndx = Convert.ToInt32(e.CommandArgument);
            pager1.CurrentIndex = currnetPageIndx;
            BindRepeater();
        }

        private void BindRepeater()
        {

            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(strConn);

            SqlCommand Cmd = new SqlCommand("dbo.GetPagedUserPaging", cn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr;

            int dd = pager1.CurrentIndex; ;
            Cmd.Parameters.Add("@PageSize", SqlDbType.Int, 4).Value = 5;// pager1.PageSize;
            Cmd.Parameters.Add("@CurrentPage", SqlDbType.Int, 4).Value = pager1.CurrentIndex;
            Cmd.Parameters.Add("@ItemCount", SqlDbType.Int).Direction = ParameterDirection.Output;

            cn.Open();
            dr = Cmd.ExecuteReader();

            rptProducts.DataSource = dr;
            rptProducts.DataBind();

            dr.Close();
            cn.Close();

            Int32 _totalRecords = Convert.ToInt32(Cmd.Parameters["@ItemCount"].Value);
            pager1.ItemCount = _totalRecords;


        }

        //protected void btnTest_click(object s, EventArgs e)
        //{
        //    Button btnSender = s as Button;
        //    if (btnSender.CommandName == "postback")
        //    {
        //        Response.Write("postBack occured.");
        //        BindRepeater();
        //    }
        //    else if (btnSender.CommandName == "ps70")
        //    {
        //        pager1.PageSize = 70;
        //        BindRepeater();
        //    }
        //    else
        //    {
        //        pager1.PageSize = 15;
        //        BindRepeater();
        //    }


        //}
    }
}
