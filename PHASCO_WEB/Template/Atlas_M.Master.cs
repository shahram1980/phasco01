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
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Collections.Generic;
using PHASCO_WEB.BaseClass;
using DataAccessLayer;

namespace PHASCO_WEB.Template
{
    public partial class Atlas_M : System.Web.UI.MasterPage
    {
        private QLPageMessageType pageMessageType;
        public QLPageMessageType PageMessageType
        {
            get { return pageMessageType; }
            set { pageMessageType = value; }
        }

        Article_Main ArticleClass = new Article_Main();


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

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowMessages();

            Bind_Atlas_List();
            searchType.Value = "5";
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {

            Response.Redirect("/Search.aspx?q=" + txtSearch.Value + "&s=" + searchType.Value + "&a=");

        }


        void Bind_Atlas_List()
        {
            DataList_Slides.DataSource = ArticleClass.AtlasTra("Select_All", 0, "", 0);
            DataList_Slides.DataBind();
        }



        #region Methods

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
        #endregion
    }
}
