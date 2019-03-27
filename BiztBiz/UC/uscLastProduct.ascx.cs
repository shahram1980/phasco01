using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using DataAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscLastProduct : BaseUserControl
    {
        Tbl_Products da_Product = new Tbl_Products();
        TBL_Request da_Request = new TBL_Request();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            BindLastProduct();
            BindLastRequest();
        }

        protected void BindLastProduct()
        {
            DataTable dtProduct = da_Product.Tbl_Products_Tra("Select_top10");
            int cou = dtProduct.Rows.Count;
            repLastProduct.DataSource = dtProduct;
            repLastProduct.DataBind();
        }

        protected void BindLastRequest()
        {
            DataTable dtRequest = da_Request.TBL_Request_Tra("Select_top10");
            repLastRequest.DataSource = dtRequest;
            repLastRequest.DataBind();
        }

        public string GetShamsiDate(string date)
        {
            string sdate = string.Empty;
            if(!string.IsNullOrEmpty(date))
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date,3);
            return sdate;
        }
    }
}