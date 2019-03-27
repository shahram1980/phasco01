using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_WEB.BaseClass;

namespace PHASCO_WEB.Template
{
    public partial class Master_Phasco : System.Web.UI.MasterPage
    {

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
                    return "4";
                case QLPageMessageType.Info:
                    return "2";
                case QLPageMessageType.Ok:
                    return "3";
                case QLPageMessageType.Warning:
                    return "1";
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


        private string GetClass(QLPageMessageType pmt)
        {
            switch (pmt)
            {
                case QLPageMessageType.Warning:
                    return "alert-warning";
                case QLPageMessageType.Info:
                    return "alert-info";
                case QLPageMessageType.Ok:
                    return "alert-success";
                case QLPageMessageType.Error:
                    return "alert-error";
                default:
                    return "alert-default";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowMessages();

            
          
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
                this.imgMessageIcon.ImageUrl = "~/images/MSSIcon/" + getIcon(pageMessageType) + ".gif";
                PnlMessages.CssClass.Insert(1, GetClass(pageMessageType));
                //this.PnlMessages.BackColor = getColor(pageMessageType);
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
                    fullMessage += string.Format(fieldName, errorNo) + "<br>";
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

       
    }
}