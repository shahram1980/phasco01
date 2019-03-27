using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BusinessAccessLayer;

namespace phasco_webproject.BaseClass
{
    public class BaseMessageBox : System.Web.UI.UserControl
    {
        virtual protected Label Message
        { get { return null; } }

        virtual protected Image Icon
        { get { return null; } }


        public void SetMessage(string Msg, Enum_.MessageType msgType)
        {
            this.Icon.ImageUrl = GetUrl(msgType);
            this.Message.Text = Msg;
            SetColor(msgType);
        }

        private void SetColor(Enum_.MessageType msgType)
        {
            switch (msgType)
            {
                case Enum_.MessageType.Error:
                    Message.ForeColor = System.Drawing.Color.Red;
                    break;
                case Enum_.MessageType.Warning:
                    Message.ForeColor = System.Drawing.Color.DarkOrange;
                    break;
                case Enum_.MessageType.FinalAction:
                    Message.ForeColor = System.Drawing.Color.Blue;
                    break;
            }
        }

        private string GetUrl(Enum_.MessageType msgType)
        {
            //throw new Exception("The method or operation is not implemented.");
            string Url = "/images2/";
            switch (msgType)
            {
                case Enum_.MessageType.Error:
                    Url += "msg1.gif";
                    break;
                case Enum_.MessageType.Warning:
                    Url += "msg2.gif";
                    break;
                case Enum_.MessageType.FinalAction:
                    Url += "msg3.gif";
                    break;
            }
            return Url;
        }
    }
}
