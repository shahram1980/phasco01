using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace phasco_webproject.BaseClass
{
    public class Enum
    {
        public enum MessageType
        {
            Error, Warning, FinalAction
        }
        internal enum InternalSessionKey : short
        {
            UserProfileKey, Limit
        }
        public enum PageName : short
        {
            Home, Login
        }
  
    }
}
