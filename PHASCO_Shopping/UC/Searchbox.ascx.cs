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
using PHASCO_Shopping.BLL;

namespace PHASCO_Shopping.Template
{
    public partial class Searchbox : System.Web.UI.UserControl
    {
        TBL_Categories da = new TBL_Categories();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack) Bind_Cat1();
        }

        void Bind_Cat1()
        {
             dt = da.TBL_Categories_Tra(0, "select", 0, "", "", "", 0);

            DropDownList_Cat1.DataValueField = "id";
            DropDownList_Cat1.DataTextField = Resources.Resource.F_Subject.ToString();

            DropDownList_Cat1.Items.Add(new ListItem("P l e a s e   S e l e c t ", "0"));

            DropDownList_Cat1.DataSource = dt;
            DropDownList_Cat1.DataBind();
            BindCat2();
        }
        void BindCat2()
        {
            int id = int.Parse(DropDownList_Cat1.SelectedValue.ToString());
          
             dt = da.TBL_Categories_Tra(0, "select", id, "", "", "", 0);
            if (dt.Rows.Count > 0)
            {
                DropDownList_Cat2.Visible = true;
                DropDownList_Cat2.DataValueField = "id";
                DropDownList_Cat2.DataTextField = Resources.Resource.F_Subject.ToString();

                DropDownList_Cat2.DataSource = dt;
                DropDownList_Cat2.DataBind();
                BindCat3();
            }
            else
            {
                DropDownList_Cat2.Items.Clear();
                DropDownList_Cat2.Visible = false;
            }
        }
        void BindCat3()
        {
            int id = int.Parse(DropDownList_Cat2.SelectedValue.ToString());
             dt = da.TBL_Categories_Tra(0, "select", id, "", "", "", 0);
            if (dt.Rows.Count > 0)
            {
                DropDownList_Cat3.Visible = true;
                DropDownList_Cat3.DataValueField = "id";
                DropDownList_Cat3.DataTextField = Resources.Resource.F_Subject.ToString();

                DropDownList_Cat3.DataSource = dt;
                DropDownList_Cat3.DataBind();
            }
            else
            {
                DropDownList_Cat3.Items.Clear();
                DropDownList_Cat3.Visible = false;
            }
        }

        protected void DropDownList_Cat1_SelectedIndexChanged(object sender, EventArgs e)
        {            BindCat2();        }

        protected void DropDownList_Cat2_SelectedIndexChanged(object sender, EventArgs e)
        {            BindCat3();        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (TXT_Find.Value != "")
                if (TXT_Find.Value.Length < 200)
                    Response.Redirect("~\\S_p.aspx?w=" + TXT_Find.Value);
        }
    }
}