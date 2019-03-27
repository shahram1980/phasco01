using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading;
using System.Globalization;
using Membership_Manage;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz
{
    public partial class RegisterComplate : BasePage
    {
        string _Email;
        public string UID_
        {
            get
            {
                return _Email;
            }
            set
            {
                _Email = value;
            }
        }

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
 
            //if (!string.IsNullOrEmpty(Request.QueryString[EncryptionHelper.Encrypt("ActiveCode", true)]))
            //    Email = EncryptionHelper.Decrypt(PHASCOUtility.ConverToNullableString(Request.QueryString[EncryptionHelper.Encrypt("ActiveCode", true)]), true);
            //   FillControls("1@1.com"); return;

            if (!IsPostBack)
            {
                try
                {
                    string absoulutepath = Request.Url.PathAndQuery;
                    if (absoulutepath.Contains("?"))
                    {
                        string querystring = absoulutepath.Substring(absoulutepath.IndexOf("?"));
                        querystring = querystring.Replace(EncryptionHelper.Encrypt("ActiveCode", true), "");
                        UID_ = Request.QueryString["uid"].ToString();// EncryptionHelper.Decrypt(querystring.Replace("?=", ""), true);
                    }

                    if (!string.IsNullOrEmpty(UID_)) FillControls(UID_);
                    else Response.Redirect("~/Default.aspx");
                }
                catch { Response.Redirect("~/Default.aspx"); }
            }

            //Label_Success.Text = Resources.Resource.WelcomeMss;
            //           MultiView1.ActiveViewIndex = 1;

            // string ss = FormShield1.Value.ToString().ToUpper();
        }

        protected void FillControls(string email)
        {

            int userID = 0;
            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            dt = dauser.TBL_User_Tra(0, "Select_Email", email, "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            if (dt.Rows.Count > 0)
            {
                if (PHASCOUtility.ConverToNullableInt(dt.Rows[0]["ActiveMode"]) == 0)
                {
                    userID = PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Id"]);
                    TextBox_Uid_Email.Text = UserOnline.email();
                    //lbl_alarm.Text = Resources.Resource.This_ID_not_available.ToString(); 
                    //return; 
                    MultiView1.ActiveViewIndex = 0;
                    Bind_indust();
                }
                else
                    MultiView1.ActiveViewIndex = 2;
            }
            else
                MultiView1.ActiveViewIndex = 2;

        }

        protected void Bind_indust()
        {
            DropDownList_Indus.DataTextField = "";
            DropDownList_Indus.DataValueField = "";
            TBL_Categories dacat = new TBL_Categories();
            DataTable dtcat = dacat.TBL_Categories_Tra(0, Resources.Resource.select_L1.ToString());


            DropDownList_Indus.DataSource = dtcat;
            DropDownList_Indus.DataTextField = Resources.Resource.F_Subject;
            DropDownList_Indus.DataValueField = "id";
            DropDownList_Indus.DataBind();

            //DropDownList_Indus.Items.Insert(0,new ListItem("انتخاب کنید","0"));

        }
        protected void Button_Submit_Click(object sender, EventArgs e)
        {


        }

        protected void LinkButton_check_Click(object sender, EventArgs e)
        {
            //if (TextBox_Uid_Email.Text.Length < 6)
            //{ Label_Check_Alarm.ForeColor = System.Drawing.Color.Red; Label_Check_Alarm.Text = Resources.Resource.Minimum_ID.ToString(); return; }

            //TBL_User dauser = new TBL_User();
            //DataTable dt;
            //dt = dauser.TBL_User_Tra(0, "Select_Uid", TextBox_Uid_Email.Text, "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            ////
            //if (dt.Rows.Count > 0)
            //{ Label_Check_Alarm.ForeColor = System.Drawing.Color.Red; Label_Check_Alarm.Text = Resources.Resource.This_ID_not_available.ToString(); return; }
            //else if (dt.Rows.Count == 0)
            //{ Label_Check_Alarm.ForeColor = System.Drawing.Color.Green; Label_Check_Alarm.Text = Resources.Resource.ok.ToString(); return; }

        }

        protected void ImageButton_CreateAccount_Click(object sender, EventArgs e)
        {
            //try
            //{
            //if (TextBox_Sec_Code.Text.ToUpper() != FormShield1.Value.ToString().ToUpper())
            //{
            //    divMessage.Visible = true;
            //    divMessage.Style.Add("background-color", "Yellow");
            //    lblMessage.Text = "لطفاً کد امنیتی را صحیح وارد نمایید. ";
            //    return;
            //}

            //if (password.Value != TextBox_Password_Con.Text)
            //{ lbl_alarm.Text = "Please enter a valid password"; return; }
            if (!CheckBox1.Checked) { lblMessage.Text = " تیک قبول توافقنامه را نزده اید"; return; }
            int city = PHASCOUtility.ConverToNullableInt(ccdCity.SelectedValue.Split(new char[] { ':' })[0]);
            if (city <= 0)
            {
                city = PHASCOUtility.ConverToNullableInt(cddState.SelectedValue.Split(new char[] { ':' })[0]);
            }

            int userID = 0;
            TBL_User_Biz dauser = new TBL_User_Biz();
            //  DataTable dt;
            //string uid_ = UserOnline.Uid();
            //dt = dauser.TBL_User_Tra(0, "Select_Uid",uid_, "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            //if (dt.Rows.Count > 0)
            //{
            userID = UserOnline.id();// PHASCOUtility.ConverToNullableInt(dt.Rows[0]["Id"]);
            //lbl_alarm.Text = Resources.Resource.This_ID_not_available.ToString(); 
            //return; 
            int sex = 1;
            //if (RadioButtonList_sex1.Checked) sex = 1;
            //if (RadioButtonList_sex2.Checked) sex = 2;
            int Status = PHASCOUtility.ConverToNullableInt(rdbListUserTypes.SelectedValue);

            //if (RadioButton1.Checked) Status = 1;
            //else if (RadioButton2.Checked) Status = 2;
            //else if (RadioButton3.Checked) Status = 3;

            DataTable dtuser = dauser.TBL_User_Tra(1, userID, "updateRegister", UserOnline.Uid(), "", Status, city.ToString(), "",
                    DropDownList_Indus.SelectedValue.ToString(), TextBox_Name.Text, TextBox_Family.Text, "", "", TextBox_Tel_A_Number.Text,
                    TextBox_Mobile.Text, 0, sex, 2, TextBox_Uid_Email.Text,TextBox_Fax.Text);
            if (dtuser.Rows.Count > 0)
            {
                TBL_Company_Profile Companybl = new TBL_Company_Profile();
                Companybl.TBL_Company_Profile_Tra(0, "Insert", userID, "", "", "", "", "", "", "", "", "", "", "", "0", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");

                // Mailer.SendConfirmEmail(TextBox_Uid_Email.Text);

                //Label_Success.Text = "<p align=\"center\"><font face=\"Tahoma\" size=\"2\"><b>با تشکر<br><br></b>&nbsp;ثبت نام شما با موفقیت انجام شد<br>خواهشمند است با <a href=\"\bazar\\MyBiztBiz\">ورود به دفتر کار </a>اطلاعات خود را کاملتر نمائید.</p></font>";
                MultiView1.ActiveViewIndex = 1;

                UserOnline.RefreshUserData();
                //if (Users.CheckLogin(dt.Rows[0]["Uid"].ToString(), dt.Rows[0]["Password"].ToString(), false))
                //{
                //    Response.Redirect("\\MyBiztBiz\\?CCq009Pr9278=Tq9NNjo1pplnJE");
                //}
            }
            else
            {
                divMessage.Visible = true;
                divMessage.Style.Add("background-color", "Red");
                lblMessage.Text = " اشکال در ثبت اطلاعات";
            }
            //}
            //else
            //{
            //    divMessage.Visible = true;
            //    divMessage.Style.Add("background-color", "Red");
            //    lblMessage.Text = " اشکال در ثبت اطلاعات";
            //}
            //}

            //catch
            //{
            //    divMessage.Visible = true;
            //    divMessage.Style.Add("background-color", "Red");
            //    lblMessage.Text = " اشکال در ثبت اطلاعات";
            //}
        }
    }
}