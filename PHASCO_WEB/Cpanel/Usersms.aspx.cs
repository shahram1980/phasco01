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
using System.Text;
using PHASCO_WEB.DAL;
using BusinessAccessLayer;

namespace phasco.Cpanel
{
    public partial class Usersms : System.Web.UI.Page
    {
        #region Dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SMS_TO_UserTableAdapter da_sms = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SMS_TO_UserTableAdapter();
        DS_MainPhasco.SMS_TO_UserDataTable dt_sms = new DS_MainPhasco.SMS_TO_UserDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter da_user = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.ScientifiLoginUserTableAdapter();
        DS_MainPhasco.ScientifiLoginUserDataTable dt_user = new DS_MainPhasco.ScientifiLoginUserDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_GroupsTableAdapter da_Group = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.User_GroupsTableAdapter();
        DS_MainPhasco.User_GroupsDataTable dt_Group = new DS_MainPhasco.User_GroupsDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        #region Menu
        protected void LinkButton_Send_To_All_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 0; }

        protected void LinkButton_Hand_Click(object sender, EventArgs e)
        {
            bind_Member_Group();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void LinkButton_Choise_User_Click(object sender, EventArgs e)
        {
            dt_user = da_user.select_all();
            GRD_User.DataSource = dt_user;
            GRD_User.DataBind();

            MultiView1.ActiveViewIndex = 2;
        }
        #endregion

        void bind_Member_Group()
        {
            dt_Group = da_Group.Select_All();
            DropDownList_Member_Group.DataTextField = "GroupName";
            DropDownList_Member_Group.DataValueField = "autoid";

            DropDownList_Member_Group.DataSource = dt_Group;
            DropDownList_Member_Group.DataBind();
        }
        protected void Button_Send_Click(object sender, EventArgs e)
        {
            int hasfile = 0;
            if (MyFileUploader.IsHasFile(FileUpload_Attach))
                hasfile = 1;
            string ggid = Guid.NewGuid().ToString().Replace("-", "") + MyFileUploader.IsExtension(FileUpload_Attach).ToString();
            da_sms.user_sms_sendtoall_tra(TextBox_PM.Text.ToString(), hasfile, ggid);

            if (hasfile == 1)
                MyFileUploader.SaveFile_MyFileName(FileUpload_Attach, "~\\phascoupfile\\smsattach", ggid.ToString(), "*", "", "", this.Server);

        }

        protected void Button_Send2_Click(object sender, EventArgs e)
        {

            int hasfile = 0;
            if (MyFileUploader.IsHasFile(FileUpload_Attach2))
                hasfile = 1;
            string ggid = Guid.NewGuid().ToString().Replace("-", "") + MyFileUploader.IsExtension(FileUpload_Attach2).ToString();


            da_user.user_sms_sendtogroup_tra(TextBox_PM2.Text, hasfile, ggid, Convert.ToInt32(DropDownList_Member_Group.SelectedValue));
            //StringBuilder str = new StringBuilder();
            //for (int i = 0; i < GRD_User.Rows.Count; i++)
            //{
            //    GridViewRow row = GRD_User.Rows[i];
            //    bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
            //    if (isChecked)
            //    {
            //        da_sms.Insert_Single_sms(Convert.ToInt32(GRD_User.Rows[i].Cells[0].Text), TextBox_PM2.Text, hasfile, ggid);
            //    }
            //}
            if (hasfile == 1)
                MyFileUploader.SaveFile_MyFileName(FileUpload_Attach2, "~\\phascoupfile\\smsattach", ggid.ToString(), "*", "", "", this.Server);
        }

        protected void Button_Send3_Click(object sender, EventArgs e)
        {
            int hasfile = 0;
            if (MyFileUploader.IsHasFile(FileUpload_Attach3))
                hasfile = 1;
            string ggid = Guid.NewGuid().ToString().Replace("-", "") + MyFileUploader.IsExtension(FileUpload_Attach3).ToString();

            StringBuilder str = new StringBuilder();
            for (int i = 0; i < GRD_User.Rows.Count; i++)
            {
                GridViewRow row = GRD_User.Rows[i];
                bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
                if (isChecked)
                {
                    da_sms.Insert_Single_sms(Convert.ToInt32(GRD_User.Rows[i].Cells[0].Text), TextBox_PM3.Text, hasfile, ggid);
                }
            }
            if (hasfile == 1)
                MyFileUploader.SaveFile_MyFileName(FileUpload_Attach3, "~\\phascoupfile\\smsattach", ggid.ToString(), "*", "", "", this.Server);
        }



    }
}
