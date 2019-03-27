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
using Membership_Manage;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz
{
    public partial class Login : BasePage
    {
        public static ArrayList arQueryString = new ArrayList();

        string _Status;
        public string Status
        {
            get
            {
                return _Status;
            }
            set
            {
                _Status = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                Status = PHASCOUtility.ConverToNullableString(Request.QueryString["Status"]);//InvalidUserPass
            if (!IsPostBack)
            {
                if (Status == "InvalidUserPass")
                {
                    divMessage.Visible = true;
                    divMessage.Style.Add("background-color", "Red");
                    lblMessage.Text = "نام کاربری یا رمز عبور اشتباه می باشد";
                }
                else
                {
                    divMessage.Visible = false;
                }

                if (Request.QueryString["s"] != null)
                {
                    if (Request.QueryString["s"].ToString() == "forget")
                    { Panel_Fotget.Visible = true; }
                    else
                        Panel_Fotget.Visible = false;
                }
                else
                    Panel_Fotget.Visible = false;
            }

        }

        protected void ImageButton_Login_Click(object sender, ImageClickEventArgs e)
        {
            //if (Users.CheckLogin(TextBox_Uid.Text, TextBox_Pass.Text, chkRememberme.Checked))
            if (UserOnline.CheckLogin2(TextBox_Uid.Text.ToString(), TextBox_Pass.Text.ToString()))
            {
                Response.Redirect("\\MyBiztBiz");
            }
            else
            {
                divMessage.Visible = true;
                divMessage.Style.Add("background-color", "Red");
                lblMessage.Text = "نام کاربری یا رمز عبور اشتباه است یا ثبت نام شما تایید نشده است. ";
            }
        }

        protected void ImageButton_FORGET_Click(object sender, ImageClickEventArgs e)
        {
            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            dt = dauser.TBL_User_Tra("selectFORGET", TextBox_FotgetUId.Text, "");
            if (dt.Rows.Count > 0)
            {
                ClearQueryString();
                AddToQueryString("UID", dt.Rows[0]["id"].ToString());
                AddToQueryString("qid", dt.Rows[0]["res"].ToString());
                string URLfrg = QLink.Web.Helpers.QueryStringHelper.SetQueryString("http://biz.perisanweb.com/Pssfgt.aspx", arQueryString, true);

                string body = "<p>در صورت تما&#1740;ل به تعو&#1740;ض نام رمز بررو&#1740; ل&#1740;نک ز&#1740;ر کل&#1740;ک نمائ&#1740;د.</p>";
                body = body + "<p><a href='" + URLfrg + "'>" + URLfrg + "</a></p>";

                PMail.Send_Mail("BiztBiz web site forgot password confirm", TextBox_FotgetUId.Text, body);
                divMessage.Visible = true;
                divMessage.Style.Add("background-color", "Green");
                lblMessage.Text = "کاربر گرامی لطفا به آدرس ایمیل خود مراجعه و برروی لینک تائیده کلیک نمائید.";
                TextBox_FotgetUId.Text = "";
            }
            else
            {
                divMessage.Visible = true;
                divMessage.Style.Add("background-color", "Yellow");
                lblMessage.Text = "چنین نام کاربری موجود نیست";
            }

        }

        public static void AddToQueryString(string keys, string values)
        {
            object[] qrs = new object[2] { keys, values };
            arQueryString.Add(qrs);
        }

        public static void ClearQueryString()
        {
            arQueryString.Clear();
        }
    }
}
