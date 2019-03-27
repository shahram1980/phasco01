using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_WEB.BaseClass;
using BusinessAccessLayer;


namespace PHASCO_WEB.UI
{
    public partial class EmailtoFriends : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack) 
                //Page.ClientScript.RegisterStartupScript(this.GetType(),
                //       "", "hidediv();", true);

        }

        protected void Button_sendemail_Click(object sender, EventArgs e)
        {
            if (TextBox_email.Text == "" && TextBox_Title.Text == "")
            { Label_alarm.Text = Resources.Resource.FileEmpty; return; }

            char[] delimiterChars = { '?' };
            //string[] words = Request.Url.ToString().Split(delimiterChars);

            PMail.MailUrlToFRN(TextBox_email.Text, Request.Url.ToString(), TextBox_Title.Text);
            TextBox_email.Text = TextBox_Title.Text = "";
            Label_alarm.Text = Resources.Resource.SuccessSent;
        }
    }
}