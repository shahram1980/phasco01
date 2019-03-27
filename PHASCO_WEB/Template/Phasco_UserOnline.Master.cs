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
using System.Collections.Generic;
using DataAccessLayer.Users;
using DataAccessLayer;
using Membership_Manage;
using PHASCO_WEB.BaseClass;
using BusinessAccessLayer;

namespace PHASCO_WEB.Template
{
    public partial class Phasco_UserOnline : System.Web.UI.MasterPage
    {
        TBL_User_Profile User_P = new TBL_User_Profile();
        TBL_User_Friends da_fr = new TBL_User_Friends();
        public string _id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowMessages();
            if (!IsPostBack)
            {
                if (UserOnline.User_Online_Valid())
                {  set_UserProfile(); }
                else
                { return; }
            }
        }

        void set_UserProfile()
        {
            DataTable dtt;
            int id = UserOnline.id();

            _id = UserOnline.id().ToString();
            dtt = User_P.Users_Profile_Tra_DT("Select_Item", id, "", "", "", "", "", "", "", DateTime.Now);
            if (dtt.Rows.Count > 0)
            {
                Label_Citty.Text = dtt.Rows[0]["City"].ToString();
                Label_Job.Text = dtt.Rows[0]["job"].ToString();
                Label_Maghata.Text = dtt.Rows[0]["Maghata"].ToString();
                Label_OfficeName.Text = dtt.Rows[0]["OfficeName"].ToString();
                Label_Reshte.Text = dtt.Rows[0]["Reshte"].ToString();
                Label_Takhasos.Text = dtt.Rows[0]["Takhasos"].ToString();
                Label_Point.Text = dtt.Rows[0]["Point"].ToString();
                Image_PhascoRate.ImageUrl = "~//images//star" + dtt.Rows[0]["UserRole"].ToString() + ".gif";

                if (dtt.Rows[0]["Sex"].ToString() == "1") Label_Sex.Text = "زن";
                if (dtt.Rows[0]["Sex"].ToString() == "0") Label_Sex.Text = "مرد";

                Label_Uid.Text = dtt.Rows[0]["Uid"].ToString();
                Label_Name.Text = dtt.Rows[0]["name"].ToString();
                DateTime dtm;
                dtm = Convert.ToDateTime(dtt.Rows[0]["BirthDay"].ToString());
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

                Label_Birth.Text = sunDate.Weekday.ToString();
                DataList_User.DataSource = da_fr.Insert_del_update(6, id);
                DataList_User.DataBind();
            }
        }


 
        private QLPageMessageType pageMessageType;
        public QLPageMessageType PageMessageType
        {
            get { return pageMessageType; }
            set { pageMessageType = value; }
        }

        public List<QLError> ArPageMessages
        {
            get { return arPageMessages; }
            set
            {
                arPageMessages = value;
                ShowMessages();
            }
        }
        private List<QLError> arPageMessages;

        public enum QLPageMessageType { Warning = 1, Info = 2, Ok = 3, Error = 4 };
        private string getIcon(QLPageMessageType pmt)
        {
            switch (pmt)
            {
                case QLPageMessageType.Error:
                    return "error_32";
                case QLPageMessageType.Info:
                    return "info_32";
                case QLPageMessageType.Ok:
                    return "ok_32";
                case QLPageMessageType.Warning:
                    return "warning_32";
                default:
                    return "";
            }
        }

        private System.Drawing.Color getColor(QLPageMessageType pmt)
        {
            switch (pmt)
            {
                case QLPageMessageType.Warning:
                    return System.Drawing.Color.LightYellow;
                case QLPageMessageType.Info:
                    return System.Drawing.Color.LightGray;
                case QLPageMessageType.Ok:
                    return System.Drawing.Color.LightGreen;
                case QLPageMessageType.Error:
                    return System.Drawing.Color.Orange;
                default:
                    return System.Drawing.Color.Yellow;
            }
        }
 

        public void ShowMessages()
        {
            string fieldName = null;
            string errorNo = null;
            string fullMessage = null;
            //
            this.PnlMessages.Visible = false;
            //
            if (this.pageMessageType == 0)
                this.pageMessageType = QLPageMessageType.Warning;
            if (this.arPageMessages == null)
            {
                this.lblMessages.Text = null;
                return;
            }
            else if (this.arPageMessages.Count > 0)
            {

                this.PnlMessages.Visible = true;
                this.imgMessageIcon.ImageUrl = "/site/images/icon/" + getIcon(pageMessageType) + ".gif";
                this.PnlMessages.BackColor = getColor(pageMessageType);
                this.lblMessages.Text = null;
                for (int i = 0; i < arPageMessages.Count; i++)
                {
                    errorNo = "";// Resources.PageMessages.ResourceManager.GetString(arPageMessages[i].ErrorNo.Replace('-', 'm'));
                    if (string.IsNullOrEmpty(errorNo))
                        errorNo = arPageMessages[i].ErrorNo;
                    fieldName = "";// Resources.Items.ResourceManager.GetString(arPageMessages[i].FieldName);
                    if (string.IsNullOrEmpty(fieldName))
                        fieldName = arPageMessages[i].FieldName;
                    //
                    fullMessage += string.Format(errorNo, fieldName) + "<br>";
                }
                this.lblMessages.Text = fullMessage;
            }
        }

        public void AddCustomMessage(object fieldName, object errorNo)
        {
            List<QLError> lst = new List<QLError>();
            QLError objError = new QLError();
            //
            objError.FieldName = fieldName.ToString();
            objError.ErrorNo = errorNo.ToString();
            lst.Add(objError);
            //
            ArPageMessages = lst;
        }

        public string image_Check(string id_)
        {
            string ImageName =  MyFileUploader.GetImageSingleName(int.Parse(id_.ToString()), ".jpg").ToString();
            return ImageName;
        }

        public string addfriend(string id)
        {
            if (Membership_Manage.UserOnline.User_Online_Valid() == true)
                return "<a href='/UserSearch.aspx?userid=" + id + "'><img src='/images/addtolist.png'  /></a>";
            else return "<img src='/images/addtolist_offline.png'  />";
            return "<img src='/images/addtolist_offline.png'  />";

        }

        public string Images(int Image, int id, int sex)
        {

            if (Image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + id.ToString() + ".jpg";

            if (sex == 0) return "http://phasco.com/phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg";
            return "http://phasco.com/phascoupfile/Userphoto/Nopic_female.jpg";

        }
    }
}
