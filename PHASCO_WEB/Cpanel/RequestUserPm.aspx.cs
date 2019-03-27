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
using PHASCO_WEB.DAL;

namespace phasco.Cpanel
{
    public partial class RequestUserPm : System.Web.UI.Page
    {
        #region Dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SMS_TO_AdminTableAdapter da_sms = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SMS_TO_AdminTableAdapter();
        DS_MainPhasco.SMS_TO_AdminDataTable dt_sms = new DS_MainPhasco.SMS_TO_AdminDataTable();

        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SMS_TO_UserTableAdapter da_user = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.SMS_TO_UserTableAdapter();
        DS_MainPhasco.SMS_TO_UserDataTable dt_user = new DS_MainPhasco.SMS_TO_UserDataTable();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Bind_Grd();
        }

        void Bind_Grd()
        {
            dt_sms = da_sms.Select_All_Sms();
            Grid_Sms.DataSource = dt_sms;
            Grid_Sms.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton_delete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            da_sms.Delete_Item(id);
            Bind_Grd();
        }

        protected void LinkButton_Answer_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt_sms = da_sms.select_Item(id);
            TextBox_PM.Text = dt_sms[0].Message.ToString();
            HiddenField_Id.Value = dt_sms[0].UserId.ToString();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button_Send_Click(object sender, EventArgs e)
        {
            int hasfile = 0;
            if (BaseClass.MyFileUploader.IsHasFile(FileUpload_Attach))
                hasfile = 1;
            string ggid = Guid.NewGuid().ToString().Replace("-", "") + BaseClass.MyFileUploader.IsExtension(FileUpload_Attach).ToString();
            da_user.Insert_Single_sms(Convert.ToInt32(HiddenField_Id.Value), TextBox_PM.Text, hasfile, ggid);
            if (hasfile == 1)
                BaseClass.MyFileUploader.SaveFile_MyFileName(FileUpload_Attach, "~\\phascoupfile\\smsattach", ggid.ToString(), "*", "", "", this.Server);

            Bind_Grd();
        }
    }
}
