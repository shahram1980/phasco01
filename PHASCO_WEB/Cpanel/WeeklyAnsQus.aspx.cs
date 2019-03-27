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
using PHASCO_WEB.DAL;
namespace phasco.Cpanel
{
    public partial class WeeklyAnsQus : System.Web.UI.Page
    {
        #region Dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Qu_WeeklyTableAdapter da_q = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Qu_WeeklyTableAdapter();
        DS_MainPhasco.Qu_WeeklyDataTable dt_q = new DS_MainPhasco.Qu_WeeklyDataTable();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            try
            {

                PersianCalendar pers = new PersianCalendar();
                da_q.Update_Archive1();
                da_q.Insert_New_Item(Convert.ToInt32(DropDownList_Point.SelectedValue.ToString()), TextBox_Qu.Text, TextBox_q1.Text.ToString(), TextBox_q2.Text.ToString(),
                                     TextBox_q3.Text.ToString(), TextBox_q4.Text.ToString(), Convert.ToInt32(DropDownList_Ans_Ques.SelectedValue.ToString()), 0, DateTime.Now,
                                     Convert.ToInt32(pers.GetDayOfMonth(DateTime.Now)), Convert.ToInt32(pers.GetMonth(DateTime.Now)));
                MultiView1.ActiveViewIndex = 1;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
