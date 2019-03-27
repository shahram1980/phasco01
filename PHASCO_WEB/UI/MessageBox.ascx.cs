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

namespace phasco_webproject.UI
{
    public partial class MessageBox : phasco_webproject.BaseClass.BaseMessageBox
    {
        protected override Image Icon
        { get { return Img_Msg; } }

        protected override Label Message
        { get { return lbl_msg; } }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}