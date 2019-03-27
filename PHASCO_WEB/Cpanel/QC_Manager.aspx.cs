using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace PHASCO_WEB.Cpanel
{
    public partial class QC_Manager : System.Web.UI.Page
    {
        TBL_QC_BRANDS daBrand = new TBL_QC_BRANDS();
        TBL_QC_Products daProducts = new TBL_QC_Products();
        TBL_QC_Products_QuantitativeTst daQTst = new TBL_QC_Products_QuantitativeTst();
        TBL_QC_LotNOExpire daLotExpr = new TBL_QC_LotNOExpire();
        TBL_QC_Controls daQCC = new TBL_QC_Controls();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }
        #region Brand
        protected void Button_Brand_Click(object sender, EventArgs e)
        {
            daBrand.TBL_QC_BRANDS_SP(1, 0, TextBox_Brand.Text);
            GridView_Brand.DataBind();
        }

        protected void Button_Edit_Barnd_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField_Brand_ID.Value.ToString());
            daBrand.TBL_QC_BRANDS_SP(2, id, TextBox_Brand.Text);
            Button_Edit_Barnd.Visible = false;
            GridView_Brand.DataBind();
        }

        protected void LinkButton_Brand_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt = daBrand.TBL_QC_BRANDS_SP(5, id, "");
            TextBox_Brand.Text = dt.Rows[0]["Brand"].ToString();
            HiddenField_Brand_ID.Value = dt.Rows[0]["id"].ToString();
            Button_Edit_Barnd.Visible = true;
        }

        protected void LinkButton_Brand_Delete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            daBrand.TBL_QC_BRANDS_SP(3, id, "");
            GridView_Brand.DataBind();
        }

        protected void LinkButton_Brand_SubList_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            Label_BarandName.Text = daBrand.TBL_QC_BRANDS_SP(5, id, "").Rows[0]["Brand"].ToString();

            Bind_Grd_Product(id);
            HiddenField_BrandID.Value = id.ToString();

            Panel_LotExpr.Visible = Panel_Quantitative.Visible = Panel_QC_Controls.Visible = false;
        }
        #endregion
        #region Product
        void Bind_Grd_Product(int Brandid)
        {
            GridView_Product.DataSource = daProducts.TBL_QC_Products_SP(7, 0, Brandid, "", 0);
            GridView_Product.DataBind();
        }

        protected void Button_Product_Click(object sender, EventArgs e)
        {
            if (TextBox_ProductName.Text == "") return;
            if (RadioButtonList_TestStatus.SelectedValue == "0") return;

            int Brandid = int.Parse(HiddenField_BrandID.Value.ToString());
            int teststatus = int.Parse(RadioButtonList_TestStatus.SelectedValue.ToString());
            daProducts.TBL_QC_Products_SP(1, 0, Brandid, TextBox_ProductName.Text, teststatus);
            TextBox_ProductName.Text = "";

            Bind_Grd_Product(Brandid);
        }

        protected void Button_Edit_Product_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton_Product_Delete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            int Brandid = int.Parse(HiddenField_BrandID.Value.ToString());
            daProducts.TBL_QC_Products_SP(3, id, 0, "", 0);
            Bind_Grd_Product(Brandid);
        }

        protected void LinkButton_Product_EDIT_Command(object sender, CommandEventArgs e)
        {


        }

        protected void LinkButton_Product_standard_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt = daProducts.TBL_QC_Products_SP(5, id, 0, "", 0);
            Panel_LotExpr.GroupingText = Label_BarandName.Text + " / " + dt.Rows[0]["ProductName"].ToString();
            HiddenField_Product_ID_ForLotExrDateInsert.Value = dt.Rows[0]["id"].ToString();
            HiddenField_Product_TestStatus.Value = dt.Rows[0]["TestStatus"].ToString();
            bind_LotExpr();
        }
        public string SetstatusMode(string mode)
        {
            switch (mode)
            {
                case "1":
                    return "Quantitative";
                    break;
                case "2":
                    return "Qualitative ";
                    break;
                case "3":
                    return "QC Control ";
                    break;
            }

            return "unlimited";
        }
        #endregion
        #region Standard

        #endregion
        #region Quantitative
        protected void Button_Quantitative_Click(object sender, EventArgs e)
        {
            double standardRange = Convert.ToDouble(TextBox_StandardRange.Text);
            int LotExprID = int.Parse(HiddenField_ProductID.Value);
            string Standards = RadioButtonList_Standards.SelectedItem.ToString();

            daQTst.TBL_QC_Products_QuantitativeTst_SP(1, 0, LotExprID, Standards, standardRange, TextBox_UNIT.Text, TextBox_Formula.Text
                , TextBox_Specifications_Low.Text, TextBox_Specifications_High.Text, TextBox_Phasco_OD.Text, TextBox_CompanyOD.Text);

            TextBox_UNIT.Text = TextBox_Formula.Text =
            TextBox_Specifications_Low.Text = TextBox_Specifications_High.Text =
            TextBox_Phasco_OD.Text = TextBox_CompanyOD.Text = "";

            Bind_Grd_Quantitative();
        }

        void Bind_Grd_Quantitative()
        {
            int LotExprID = int.Parse(HiddenField_ProductID.Value);
            GridView_Quantitative.DataSource = daQTst.TBL_QC_Products_QuantitativeTst_SP(7, LotExprID);
            GridView_Quantitative.DataBind();
        }
        protected void LinkButton_Quantive_Delete_Delete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            daQTst.TBL_QC_Products_QuantitativeTst_SP(3, id);
            Bind_Grd_Quantitative();
        }

        protected void LinkButton_Quantive_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt = daQTst.TBL_QC_Products_QuantitativeTst_SP(5, id);


            TextBox_UNIT.Text = dt.Rows[0]["UNIT"].ToString();
            TextBox_Formula.Text = dt.Rows[0]["Formula"].ToString();
            TextBox_Specifications_Low.Text = dt.Rows[0]["Specifications_Low"].ToString();
            TextBox_Specifications_High.Text = dt.Rows[0]["Specifications_High"].ToString();
            TextBox_Phasco_OD.Text = dt.Rows[0]["Phasco_OD"].ToString();
            TextBox_CompanyOD.Text = dt.Rows[0]["Company_OD"].ToString();
            TextBox_StandardRange.Text = dt.Rows[0]["StandardRange"].ToString();
            RadioButtonList_Standards.SelectedValue = dt.Rows[0]["Standards"].ToString();

            HiddenField_Quntive_Id.Value = dt.Rows[0]["id"].ToString();
            Button_Quntive_Edit.Visible = true;
        }
        protected void Button_Quntive_Edit_Click(object sender, EventArgs e)
        {
            double standardRange = Convert.ToDouble(TextBox_StandardRange.Text);
            int id = int.Parse(HiddenField_Quntive_Id.Value);
            string Standards = RadioButtonList_Standards.SelectedItem.ToString();

            daQTst.TBL_QC_Products_QuantitativeTst_SP(2, id, 0, Standards, standardRange, TextBox_UNIT.Text, TextBox_Formula.Text
                , TextBox_Specifications_Low.Text, TextBox_Specifications_High.Text, TextBox_Phasco_OD.Text, TextBox_CompanyOD.Text);

            TextBox_UNIT.Text = TextBox_Formula.Text =
            TextBox_Specifications_Low.Text = TextBox_Specifications_High.Text =
            TextBox_Phasco_OD.Text = TextBox_CompanyOD.Text = "";
            Button_Quntive_Edit.Visible = false;
            Bind_Grd_Quantitative();
        }
        #endregion

        #region Lot No. Expr Date
        protected void Button_ExpireLot_Insert_Click(object sender, EventArgs e)
        {
            int productid = int.Parse(HiddenField_Product_ID_ForLotExrDateInsert.Value);
            DateTime Expr_ = Convert.ToDateTime(TextBox_Expire.Text.ToString());
            dt = daLotExpr.TBL_QC_LotNOExpire_SP(1, 0, productid, Expr_, TextBox_LotNO.Text);
            if (dt.Rows.Count > 0)
            {
                Label_LotExpt_Valid.Visible = true;
                return;
            }
            Label_LotExpt_Valid.Visible = false;
            bind_LotExpr();
        }
        protected void Calendar_ExprDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBox_Expire.Text = Calendar_ExprDate.SelectedDate.ToShortDateString();
            bind_LotExpr();
        }

        void bind_LotExpr()
        {
            int ProductID = int.Parse(HiddenField_Product_ID_ForLotExrDateInsert.Value);
            GridView_LOTEXPR.DataSource = daLotExpr.TBL_QC_LotNOExpire_SP(7, 0, ProductID, DateTime.Now, "");
            GridView_LOTEXPR.DataBind();
            Panel_LotExpr.Visible = true;
        }

        protected void LinkButton_LotExp_Delete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            daLotExpr.TBL_QC_LotNOExpire_SP(3, id, 0, DateTime.Now, "");
            bind_LotExpr();
        }

        protected void LinkButton_LotExp_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt = daLotExpr.TBL_QC_LotNOExpire_SP(5, id, 0, DateTime.Now, "");
            TextBox_LotNO.Text = dt.Rows[0]["LotNO"].ToString();
            TextBox_Expire.Text = dt.Rows[0]["Expire"].ToString();
            HiddenField_LotExprEditID.Value = dt.Rows[0]["id"].ToString();
            Button_Edit_LotExpr.Visible = true;
        }

        protected void Button_Edit_LotExpr_Click(object sender, EventArgs e)
        {
            int id = int.Parse(HiddenField_LotExprEditID.Value.ToString());
            DateTime Expr_ = Convert.ToDateTime(TextBox_Expire.Text.ToString());
            dt = daLotExpr.TBL_QC_LotNOExpire_SP(2, id, 0, Expr_, TextBox_LotNO.Text);
            bind_LotExpr();
            Button_Edit_LotExpr.Visible = false;
        }


        protected void LinkButton_LotExp_Edit_Standard(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt = daLotExpr.TBL_QC_LotNOExpire_SP(5, id, 0, DateTime.Now, "");

            switch (HiddenField_Product_TestStatus.Value.ToString())
            {
                case "1":
                    {
                        Panel_Quantitative.Visible = true;
                        Panel_QC_Controls.Visible = false;
                        Panel_Quantitative.GroupingText = Panel_LotExpr.GroupingText + "/" + Convert.ToDateTime(dt.Rows[0]["Expire"].ToString()).ToShortDateString() + " " + dt.Rows[0]["LotNO"].ToString();

                        HiddenField_ProductID.Value = id.ToString();
                        Bind_Grd_Quantitative();
                    }
                    break;
                case "2":
                    Panel_Quantitative.Visible = false;
                    break;
                case "3":
                    HiddenField_LotExprID_QCControls.Value = id.ToString();
                    Panel_Quantitative.Visible = false;
                    Panel_QC_Controls.Visible = true;
                    Panel_QC_Controls.GroupingText = Panel_LotExpr.GroupingText + "/" + Convert.ToDateTime(dt.Rows[0]["Expire"].ToString()).ToShortDateString() + " " + dt.Rows[0]["LotNO"].ToString();
                    dt = daQCC.TBL_QC_Controls_SP(7, id);
                    if (dt.Rows.Count > 0)
                        Setview_QCControls(dt);
                    else
                    {
                        Button_Edit_QcControl.Visible = false;
                        Button_Insert_QcControl.Visible = true;
                    }
                    break;
            }
        }

        #endregion


        #region Qc  Control
        protected void Button_Insert_QcControl_Click(object sender, EventArgs e)
        {
            int LotExprID = int.Parse(HiddenField_LotExprID_QCControls.Value);
            daQCC.TBL_QC_Controls_SP(1, 0, LotExprID, TextBox_level_1_Low.Text, TextBox_level_2_Low.Text, TextBox_level_3_Low.Text, "0",
                TextBox_level_1_High.Text, TextBox_level_2_High.Text, TextBox_level_3_High.Text, "0");
            Panel_QC_Controls.Visible = false;
        }
        protected void Button_Edit_QcControl_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(HiddenField_ID_QCControlsEdit.Value);
            daQCC.TBL_QC_Controls_SP(2, ID, 0, TextBox_level_1_Low.Text, TextBox_level_2_Low.Text, TextBox_level_3_Low.Text, "0",
                TextBox_level_1_High.Text, TextBox_level_2_High.Text, TextBox_level_3_High.Text, "0");
            Panel_QC_Controls.Visible = false;
        }
        void Setview_QCControls(DataTable DtQcc)
        {
            TextBox_level_1_Low.Text = DtQcc.Rows[0]["level_1_Low"].ToString();
            TextBox_level_2_Low.Text = DtQcc.Rows[0]["level_2_Low"].ToString();
            TextBox_level_3_Low.Text = DtQcc.Rows[0]["level_3_Low"].ToString();
            TextBox_level_1_High.Text = DtQcc.Rows[0]["level_1_High"].ToString();
            TextBox_level_2_High.Text = DtQcc.Rows[0]["level_1_High"].ToString();
            TextBox_level_3_High.Text = DtQcc.Rows[0]["level_1_High"].ToString();
            HiddenField_ID_QCControlsEdit.Value = DtQcc.Rows[0]["id"].ToString();
            Button_Edit_QcControl.Visible = true;
            Button_Insert_QcControl.Visible = false;
        }
        #endregion




    }
}