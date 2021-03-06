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
using System.Globalization;
using System.Text;
using  PHASCO_WEB.DAL;
using PHASCO_WEB.DAL.DS_MainPhascoTableAdapters;
namespace phasco_webproject.Cpanel
{
    public partial class Orders : System.Web.UI.Page
    {
        #region DataSet
        E_Shop_Table_ListTableAdapter da_List = new E_Shop_Table_ListTableAdapter();
        DS_MainPhasco.E_Shop_Table_ListDataTable dt_list = new DS_MainPhasco.E_Shop_Table_ListDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.E_SHop_Table_ProcessTableAdapter da_procc = new E_SHop_Table_ProcessTableAdapter();
        DS_MainPhasco.E_SHop_Table_ProcessDataTable dt_procc = new DS_MainPhasco.E_SHop_Table_ProcessDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SMS_TO_UserTableAdapter da_sms = new SMS_TO_UserTableAdapter();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack) Bind_Grd_New_Order(); }

        #region New Orders
        void Bind_Grd_New_Order()
        {
            dt_list = da_List.Select_New_Order();
            GridView_Orders.DataSource = dt_list;
            GridView_Orders.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_View_Item_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Visit_Id.Value = e.CommandArgument.ToString();
            dt_list = da_List.Select_Item(Convert.ToInt32(HiddenField_Visit_Id.Value.ToString()));
            DateTime date = Convert.ToDateTime(dt_list[0].date_Shop.ToString());
            string time = dt_list[0].Time_Shop.ToString();
            HiddenField_Time.Value = dt_list[0].Time_Shop.ToString();
            HiddenField_Date.Value = dt_list[0].date_Shop.ToString();
            HiddenField_Uid.Value = dt_list[0].User_Id.ToString();


            dt_list = da_List.Select_One_Order(Convert.ToInt32(HiddenField_Visit_Id.Value.ToString()), date, time);

            Label_Address.Text = dt_list[0]["address"].ToString();
            Label_Markaz.Text = dt_list[0]["OrgName"].ToString();
            Label_Tel.Text = dt_list[0]["tel"].ToString();

            System.Globalization.PersianCalendar pc = new System.Globalization.PersianCalendar();
            DateTime Gettime = Convert.ToDateTime(dt_list[0]["date_Shop"]);
            Label_Order_date.Text = pc.GetYear(Gettime).ToString() + "/" + pc.GetMonth(Gettime).ToString() + "/" + pc.GetDayOfMonth(Gettime).ToString();


            GridView_Order_List.DataSource = dt_list;
            GridView_Order_List.DataBind();
            Bind_Dolidt();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void LinkButton_Archive_Click(object sender, EventArgs e)
        {
            da_List.Update_Archive(HiddenField_Time.Value, Convert.ToInt32(HiddenField_Visit_Id.Value), Convert.ToDateTime(HiddenField_Date.Value));
            Bind_Grd_New_Order();
        }

        protected void Button_Check_Uncheck_Click(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < GridView_Order_List.Rows.Count; i++)
            {
                GridViewRow row = GridView_Order_List.Rows[i];
                HtmlInputCheckBox milChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail"));
                milChecked.Checked = true;
            }
        }

        #endregion




        protected void Button_Insert_Order_Properties_Click(object sender, EventArgs e)
        {

        }

        protected void Button_Insert_Order_Click(object sender, EventArgs e)
        {
            string content = "";
            if (RadioButton1.Checked) content = DropDownList1.SelectedValue.ToString();
            if (RadioButton2.Checked) content = DropDownList2.SelectedValue.ToString();
            if (RadioButton3.Checked) content = TextBox_Tahvil.Text.ToString();
            if (RadioButton4.Checked) content = DropDownList3.SelectedValue.ToString() + " [" + TextBox_4_Content.Text + "  ساعت:" + DropDownList_H.SelectedValue.ToString() + " : " + DropDownList_M.SelectedValue.ToString() + " ]";
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < GridView_Order_List.Rows.Count; i++)
            {
                GridViewRow row = GridView_Order_List.Rows[i];
                HtmlInputCheckBox isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail"));
                if (isChecked.Checked) da_procc.Insert_New_Item(Convert.ToInt32(isChecked.Value), Convert.ToInt32(HiddenField_Uid.Value), DateTime.Now, Convert.ToDateTime(HiddenField_Date.Value), HiddenField_Time.Value.ToString(), content);
            }

            if (RadioButton4.Checked)
            {
                string mss = "&#1705;&#1575;&#1585;&#1576;&#1585; &#1711;&#1585;&#1575;&#1605;&#1610; &#1587;&#1601;&#1575;&#1585;&#1588; &#1588;&#1605;&#1575; &#1578;&#1607;&#1610;&#1607; &#1608; &#1575;&#1585;&#1587;&#1575;&#1604; &#1711;&#1585;&#1583;&#1610;&#1583;. &#1604;&#1591;&#1601;&#1575; &#1580;&#1607;&#1578; &#1662;&#1610;&#1711;&#1610;&#1585;&#1740; &#1585;&#1608;&#1606;&#1583; &#1575;&#1585;&#1587;&#1575;&#1604; &#1587;&#1601;&#1575;&#1585;&#1588; &#1582;&#1608;&#1583; &#1576;&#1607; &#1576;&#1582;&#1588; &#1662;&#1610;&#1711;&#1610;&#1585;&#1740; &#1587;&#1601;&#1575;&#1585;&#1588;&#1575;&#1578; &#1608;&#1575;&#1585;&#1583; &#1588;&#1608;&#1610;&#1583; .";
                da_sms.Insert_New(Convert.ToInt32(HiddenField_Uid.Value), mss, DateTime.Now, DateTime.Now, "t", "f", "", 0, "");
            }
            Bind_Dolidt();
        }
        void Bind_Dolidt()
        {
            dt_procc = da_procc.Select_do_List(Convert.ToInt32(HiddenField_Uid.Value), Convert.ToDateTime(HiddenField_Date.Value), HiddenField_Time.Value.ToString());
            GridView_Do.DataSource = dt_procc;
            GridView_Do.DataBind();
        }

        protected void LinkButton_Back_To_List_Click(object sender, EventArgs e)
        { Bind_Grd_New_Order(); }





    }
}
