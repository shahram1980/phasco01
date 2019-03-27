using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Membership_Manage;
using PHASCO_Shopping.BLL;

namespace PHASCO_Shopping.UC
{
    public partial class ProductOffer : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (UserOnline.User_Online_Valid())
                {
                    Tbl_Products da = new Tbl_Products();
                    DataList_Offer.DataSource = da.Tbl_Products_Tra("product_offer", UserOnline.id());
                    DataList_Offer.DataBind();
                    Panel_Offer.Visible = true;
                }
                else Panel_Offer.Visible = false;
            }

        }
    }
}