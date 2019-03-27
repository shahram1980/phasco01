using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using BusinessAccessLayer;
using System.Globalization;
using System.Threading;

namespace PHASCO_WEB
{
    public partial class QC : System.Web.UI.Page
    {
        TBL_QC_Products daProducts = new TBL_QC_Products();
        TBL_QC_LotNOExpire daLotExpr = new TBL_QC_LotNOExpire();
        DataTable dt = new DataTable();
        protected override void InitializeCulture()
        {
            try
            {
                if (Request.QueryString["mLang"] != null)
                {
                    string lang = Convert.ToString(Request.QueryString["mLang"]);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                    HttpCookie cookie = new HttpCookie("elang");
                    cookie.Value = lang;
                    Response.Cookies.Add(cookie);
                    Page.Culture = lang;
                    Page.UICulture = lang;
                    Response.Redirect("Default.aspx");
                    // Langu.SelectedValue = lang;
                    // ((DropDownList)Master.FindControl("Lang")).SelectedValue = lang;
                }
                else
                {
                    HttpCookie cookie_get = Request.Cookies["elang"];
                    string Lang_SEt = cookie_get.Value.ToString();
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Lang_SEt);
                    Page.Culture = Lang_SEt;
                    Page.UICulture = Lang_SEt;
                    // Langu.SelectedValue = Lang_SEt;
                }
            }
            catch (Exception)
            {
                Page.Culture = "fa-IR";
                Page.UICulture = "fa-IR";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 

        protected void DropDownList_Brand_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind_Grd_Product(int.Parse(DropDownList_Brand.SelectedValue));
        }
        void Bind_Grd_Product(int Brandid)
        {
            try
            {
                DropDownList_Product.DataValueField = "ID";
                DropDownList_Product.DataTextField = "ProductName";
                DropDownList_Product.DataSource = daProducts.TBL_QC_Products_SP(7, 0, Brandid, "", 0);

                DropDownList_Product.DataBind();
                DropDownList_Product.Enabled = true;
                Bind_LotExpr();
            }
            catch (Exception)
            {
                DropDownList_Product.Enabled = false;
                Panel_Quntitative.Visible = false;
            }

        }
        void Bind_LotExpr()
        {
            try
            {
                DropDownList_LotExpr.DataValueField = "ID";
                DropDownList_LotExpr.DataTextField = "LotNO";
                dt = daLotExpr.TBL_QC_LotNOExpire_SP(7, 0, int.Parse(DropDownList_Product.SelectedValue), DateTime.Now, "");
                DropDownList_LotExpr.DataSource = dt;
                DropDownList_LotExpr.DataBind();
            }
            catch (Exception)
            {
                DropDownList_LotExpr.Enabled = false;
                Panel_Quntitative.Visible = false;
            }


            if (dt.Rows.Count > 0)
            {
                DropDownList_LotExpr.Enabled = true;
                Panel_Quntitative.Visible = true;
            }
        }
        protected void DropDownList_Product_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind_LotExpr();
        }
        protected void DropDownList_LotExpr_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel_Quntitative.Visible = true;
        }



        protected void DropDownList_Brand2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind_Grd_Product2(int.Parse(DropDownList_BranDQC.SelectedValue));
        }
        void Bind_Grd_Product2(int Brandid)
        {
            try
            {
                DropDownList_Product2.DataValueField = "ID";
                DropDownList_Product2.DataTextField = "ProductName";
                DropDownList_Product2.DataSource = daProducts.TBL_QC_Products_SP(7, 0, Brandid, "", 0);

                DropDownList_Product2.DataBind();
                DropDownList_Product2.Enabled = true;
                Bind_LotExpr2();
            }
            catch (Exception)
            {
                DropDownList_Product2.Enabled = false;
            }

        }
        void Bind_LotExpr2()
        {
            try
            {
                DropDownList_LotExpr2.DataValueField = "ID";
                DropDownList_LotExpr2.DataTextField = "LotNO";
                dt = daLotExpr.TBL_QC_LotNOExpire_SP(7, 0, int.Parse(DropDownList_Product2.SelectedValue), DateTime.Now, "");
                DropDownList_LotExpr2.DataSource = dt;
                DropDownList_LotExpr2.DataBind();
            }
            catch (Exception)
            {
                DropDownList_LotExpr2.Enabled = false;
            }

            if (dt.Rows.Count > 0)
            {
                DropDownList_LotExpr2.Enabled = true;
            }
        }
        protected void DropDownList_Product2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind_LotExpr2();
        }
        protected void DropDownList_LotExpr2_SelectedIndexChanged(object sender, EventArgs e)
        {
         
        }

        protected void Button_Process_Click(object sender, EventArgs e)
        {

            string sss = Quantitative_Test();

        }

        private string Quantitative_Test()
        { 
                    string RES_ = "";
            if (TextBoxA.Text.IndexOf("|") == -1)
            {
                RES_ += QCOperations.LevelProc(TextBoxA.Text, 1);
            }
            if (TextBoxB.Text.IndexOf("|") == -1)
            {
                RES_ += QCOperations.LevelProc(TextBoxA.Text, 1);
            }
            if (TextBoxC.Text.IndexOf("|") == -1)
            {
                RES_ += QCOperations.LevelProc(TextBoxA.Text, 1);
            }
            if (TextBoxD.Text.IndexOf("|") == -1)
            {
                RES_ += QCOperations.LevelProc(TextBoxA.Text, 1);
            }
            if (TextBoxE.Text.IndexOf("|") == -1)
            {
                RES_ += QCOperations.LevelProc(TextBoxA.Text, 1);
            }
            if (TextBoxF.Text.IndexOf("|") == -1)
            {
                RES_ += QCOperations.LevelProc(TextBoxA.Text, 1);
            }
            if (TextBoxG.Text.IndexOf("|") == -1)
            {
                RES_ += QCOperations.LevelProc(TextBoxA.Text, 1);
            }
            return RES_;
        }

    }
}