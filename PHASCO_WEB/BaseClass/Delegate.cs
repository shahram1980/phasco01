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
    #region Delegate

    public delegate void MessageHanlder(object sender, MessageEventArgs e);

    #endregion


    #region [ DelegeteClass ]

    public class MessageEventArgs : EventArgs
    {

        public MessageEventArgs(string msg, Enum_.MessageType msgType)
        {
            this._msgType = msgType;
            this._message = msg;
        }

        private Enum_.MessageType _msgType;

        public Enum_.MessageType CurrentMessageType
        { get { return _msgType; } }

        private string _message;
        public string Message
        { get { return _message; } }
    }
    #endregion
}
