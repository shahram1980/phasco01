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
using phasco.BaseClass;
using phasco_webproject.BaseClass;
using PHASCO_WEB.DAL;
using System.Web.Mail;
using Membership_Manage;
using phasco.Template;
using PHASCO_WEB.Template;
using DataAccessLayer;
namespace phasco_webproject.UI
{
    public partial class Membership : System.Web.UI.UserControl
    {
        Tbl_Message mss = new Tbl_Message();
        User da_User = new User();
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            RedirectUrl.Value = HttpContext.Current.Request.Url.PathAndQuery;
            if (UserOnline.User_Online_Valid())
            {
                Set_Office_Online();
                Label_phasny.Text = UserOnline.Credit();

            }
            else Set_Office_offline();
        }

        protected void ImageButton_Login_Click(object sender, EventArgs e)
        {

            if (UserOnline.CheckLogin2(TextBox_Uid.Text.ToString(), TextBox_Pass.Text.ToString()))
            {
                Set_Office_Online();
                if (string.IsNullOrEmpty(RedirectUrl.Value) || RedirectUrl.Value == "/Default.aspx")
                    Response.Redirect("~\\myhome.aspx");
                else
                    Response.Redirect(RedirectUrl.Value);

            }
            else
            {
                var master = (this.Page.Master as Master_Phasco);
                if (master != null)
                {
                    (this.Page.Master as Master_Phasco).PageMessageType = Master_Phasco.QLPageMessageType.Error;
                    (this.Page.Master as Master_Phasco).AddCustomMessage(Resources.Resource.Login_Msg_Invalid, "");

                }
            }
        }

        #region User Off On
        protected void Set_Office_Online()
        {
            MultiView1.ActiveViewIndex = 1;
            Image_User.ImageUrl = UserOnline.image();
            Label_Name.Text = UserOnline.name();
            Label_Sex.Text = UserOnline.sex();
            Label_Daily.Text = "7/" + "<b>" + UserOnline.Daily_Login() + "</b>";
            Label_Point.Text = UserOnline.Point();

            DataTable dt = mss.Message_Tra("select_count", 0, UserOnline.id(), 0, 0, "", "", 0, "", 0);
            if (dt.Rows.Count > 0)
            { HyperLink_MailNumber.Text = "(" + dt.Rows[0][0].ToString() + ")"; HyperLink_MailNumber.Visible = true; }
            else
                HyperLink_MailNumber.Visible = false;
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(DateTime.Now);
            Label_DAY.Text = sunDate.Weekday.ToString();
        }
        protected void Set_Office_offline()
        { MultiView1.ActiveViewIndex = 0; }
        #endregion

        protected void LinkButton_Logout_Click(object sender, EventArgs e)
        {
            UserOnline.Set_User_Logout();
            Set_Office_offline();
            Response.Redirect("~\\Default.aspx");
        }

        public string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            Random randNum = new Random((int)DateTime.Now.Ticks);
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;

            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }
            return new string(chars);
        }


        protected void ImageButton_ForgotPass_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }


    }
}