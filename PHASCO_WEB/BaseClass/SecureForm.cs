using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace phasco.BaseClass
{
    public class SecureForm : ContentBase
    {
        public int UserId
        {
            get { return int.Parse(Session["UserId"].ToString()); }
            set { Session["UserId"] = value; }
        }
        public int UserGroup
        {
            get { return int.Parse(Session["UserGroup"].ToString()); }
            set { Session["UserGroup"] = value; }
        }
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
        }
    }
}
