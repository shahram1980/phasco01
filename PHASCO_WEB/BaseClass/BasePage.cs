using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using phasco_webproject.BaseClass;

namespace phasco.BaseClass
{
    public class BasePage : WebBase
    {
        ContentBase loadform = null;
        private void AddControl(ContentBase loadform)
        { placeHolder.Controls.Add(loadform); }

        virtual protected PlaceHolder placeHolder
        { get { return null; } }

        private string GetUrl()
        {
            if (Request.QueryString["Page"] == null) { return "UI/home.ascx"; }
            else { return "UI/" + Request.QueryString["Page"] + ".ascx"; }
        }

        protected override void OnPreInit(EventArgs e)
        {
            string pth = GetUrl();
            loadform = Page.LoadControl(pth) as ContentBase;
            this.MasterPageFile = "~\\Template\\" + loadform.MasterPageName.ToString() + ".Master";
            base.OnPreInit(e);
        }

        protected override void OnInit(EventArgs e)
        {
            AddControl(loadform);
            loadform.OnHideMessage += new EventHandler(loadform_OnHideMessage);
            loadform.OnShowMessage += new MessageHanlder(loadform_OnShowMessage);

            this.TitleplaceHolder.Text =  loadform.FormTitle;
            base.OnInit(e);
        }

        virtual protected Label TitleplaceHolder
        { get { return null; } }

        void loadform_OnShowMessage(object sender, MessageEventArgs e)
        {
            messageHolder.Visible = true;
            this.messageHolder.SetMessage(e.Message, e.CurrentMessageType);
        }

        void loadform_OnHideMessage(object sender, EventArgs e)
        { messageHolder.Visible = false; }

        virtual protected phasco_webproject.BaseClass.BaseMessageBox messageHolder
        { get { return null; } }

        private void fillPlace()
        {
            try
            {
                UserControl uc = (UserControl)Page.LoadControl("~/UI/" + Request.QueryString["Page"] + ".ascx");
                placeHolder.Controls.Add(uc);
            }
            catch
            {
            }
        }


    }
}
