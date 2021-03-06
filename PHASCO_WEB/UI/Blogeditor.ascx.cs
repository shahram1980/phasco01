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
using phasco_webproject.BaseClass;
using System.Globalization;
using PHASCO_WEB.DAL;
namespace phasco_webproject.UI
{
    public partial class Blogeditor : UnSecureForm
    {
        #region DataSet
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_BlogTableAdapter da_blg = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_BlogTableAdapter();
        DS_MainPhasco.Users_BlogDataTable dt_blg = new DS_MainPhasco.Users_BlogDataTable();
        #endregion
        #region SetPage
        public override string FormTitle
        { get { return "وب لاگ"; } }

        public override MasterPageColection MasterPageName
        { get { return MasterPageColection.Phasco01; } }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton_New_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            TextBox_Title.Text = "";
            RadEditor_Body.Html = "";

            CheckBox_Comment.Checked = false;
            Button_Edit.Visible = false;
            Button_INs.Visible = true;
        }

        protected void LinkButton_Edit_Click(object sender, EventArgs e)
        {
            bind_Grd();
        }
        protected void Button_INs_Click(object sender, EventArgs e)
        {
            try
            {
                PersianCalendar psdate = new PersianCalendar();
                string datefa = psdate.GetYear(DateTime.Now) + "/" + psdate.GetMonth(DateTime.Now) + "/" + psdate.GetDayOfMonth(DateTime.Now);
                int comm = 0;
                if (CheckBox_Comment.Checked) comm = 1;
                da_blg.Users_Blog_Tra(null, "Insert", UserOnline.id(), TextBox_Title.Text, RadEditor_Body.Html, comm, datefa);
                bind_Grd();
                ShowMessage(Resources.Resource.Blog_Succcess_Inser, BaseClass.Enum.MessageType.FinalAction);
            }
            catch (Exception)
            { ShowMessage(Resources.Resource.Error_ShowMss, BaseClass.Enum.MessageType.Error); }

        }

        void bind_Grd()
        {
            dt_blg = da_blg.Users_Blog_Tra(null, "Select_full", UserOnline.id(), null, null, null, null);
            GridView_Blog.DataSource = dt_blg;
            GridView_Blog.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }



        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                da_blg.Users_Blog_Tra(id, "Delete", null, null, null, null, null);
                bind_Grd();
                ShowMessage(Resources.Resource.Success_Tra, BaseClass.Enum.MessageType.FinalAction);
            }
            catch (Exception)
            { ShowMessage(Resources.Resource.Error_ShowMss, BaseClass.Enum.MessageType.Error); }

        }

        protected void LinkButton_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt_blg = da_blg.Users_Blog_Tra(id, "Select_Item", null, null, null, null, null);

            TextBox_Title.Text = dt_blg[0].Title;
            RadEditor_Body.Html = dt_blg[0].Body;

            if (dt_blg[0].Comment == 1) CheckBox_Comment.Checked = true;
            else CheckBox_Comment.Checked = false;
            HiddenField_Id.Value = dt_blg[0].Id.ToString();
            Button_Edit.Visible = true;
            Button_INs.Visible = false;
            MultiView1.ActiveViewIndex = 0;
        }


        protected void Button_Edit_Click1(object sender, EventArgs e)
        {
            try
            {
                int comm = 0;
                if (CheckBox_Comment.Checked) comm = 1;
                da_blg.Users_Blog_Tra(Convert.ToInt32(HiddenField_Id.Value), "Update", null, TextBox_Title.Text, RadEditor_Body.Html, comm, null);
                bind_Grd();
                ShowMessage(Resources.Resource.Success_Tra, BaseClass.Enum.MessageType.FinalAction);
            }
            catch (Exception)
            { ShowMessage(Resources.Resource.Error_ShowMss, BaseClass.Enum.MessageType.Error); }

        }
    }
}