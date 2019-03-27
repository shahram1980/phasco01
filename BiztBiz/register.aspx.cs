using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Threading;
using System.Globalization;
using DataAccessLayer.BIZ;


namespace BiztBiz
{
    public partial class register : BasePage
    {
        //protected override void InitializeCulture()
        //{
        //    try
        //    {
        //        if (Request.QueryString["mLang"] != null)
        //        {
        //            string name = Convert.ToString(Request.QueryString["mLang"]);
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(name);
        //            HttpCookie cookie = new HttpCookie("elang");
        //            cookie.Value = name;
        //            Response.Cookies.Add(cookie);
        //            this.Page.Culture = name;
        //            this.Page.UICulture = name;
        //            Response.Redirect("Default.aspx");
        //        }
        //        else
        //        {
        //            HttpCookie cookie2 = Request.Cookies["elang"];
        //            string str2 = cookie2.Value.ToString();
        //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(str2);
        //            this.Page.Culture = str2;
        //            this.Page.UICulture = str2;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        this.Page.Culture = "fa-IR";
        //        this.Page.UICulture = "fa-IR";
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }

            //Label_Success.Text = Resources.Resource.WelcomeMss;
            //           MultiView1.ActiveViewIndex = 1;

            // string ss = FormShield1.Value.ToString().ToUpper();
        }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {


        }

        protected void LinkButton_check_Click(object sender, EventArgs e)
        {
            if (TextBox_Uid_Email.Text.Length < 6)
            { Label_Check_Alarm.ForeColor = System.Drawing.Color.Red; Label_Check_Alarm.Text = Resources.Resource.Minimum_ID.ToString(); return; }

            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            dt = dauser.TBL_User_Tra(0, "Select_Uid", TextBox_Uid_Email.Text, "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            //
            if (dt.Rows.Count > 0)
            { Label_Check_Alarm.ForeColor = System.Drawing.Color.Red; Label_Check_Alarm.Text = Resources.Resource.This_ID_not_available.ToString(); return; }
            else if (dt.Rows.Count == 0)
            { Label_Check_Alarm.ForeColor = System.Drawing.Color.Green; Label_Check_Alarm.Text = Resources.Resource.ok.ToString(); return; }

        }

        protected void ImageButton_CreateAccount_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (CheckBox_Agr.Checked == false)
                {
                    lblMessage.Text = "لطفاً تیک مربوط به قوانین و مقررات را بزنید ";
                    return;
                }
                //if (TextBox_Sec_Code.Text.ToUpper() != FormShield1.Value.ToString().ToUpper())
                //{
                //    divMessage.Visible = true;
                //    divMessage.Style.Add("background-color", "Yellow");
                //    lblMessage.Text = "لطفاً کد امنیتی را صحیح وارد نمایید ";
                //    return;
                //}

                if (password.Value != TextBox_Password_Con.Text)
                {
                    divMessage.Visible = true;
                    divMessage.Style.Add("background-color", "Yellow");
                    lblMessage.Text = "لطفاً پسورد را صحیح وارد نمایید";
                    return;
                }


                TBL_User_Biz dauser = new TBL_User_Biz();
                DataTable dt;
                dt = dauser.TBL_User_Tra(0, "Select_Uid", TextBox_Uid_Email.Text, "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
                if (dt.Rows.Count > 0)
                {
                    divMessage.Visible = true;
                    divMessage.Style.Add("background-color", "Yellow");
                    lblMessage.Text = Resources.Resource.This_ID_not_available.ToString();
                    return;
                }


                int Status = 0;

                dauser.TBL_User_Tra(0, 0, "insert", TextBox_Uid_Email.Text, password.Value.ToString(), Status, "", "", "", "", "", "", "", "", "",0, 0, 0);
                Mailer.SendRegisterEmail(TextBox_Uid_Email.Text);
                Label_Success.Text = Resources.Resource.wellcomeandnotconfirm;
                MultiView1.ActiveViewIndex = 1;
            }

            catch
            {
                divMessage.Visible = true;
                divMessage.Style.Add("background-color", "Red");
                lblMessage.Text = " اشکال در ثبت اطلاعات";
            }
        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            Mailer.SendInviteEmail(txtEmail.Text);
        }
    }
}
