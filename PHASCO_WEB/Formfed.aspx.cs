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
using phasco_webproject.BaseClass;
using Membership_Manage;

namespace PHASCO_WEB
{
    public partial class Formfed : System.Web.UI.Page
    {
        #region Dataset
        DAL.DS_MainPhascoTableAdapters.OD_Err_TblTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.OD_Err_TblTableAdapter();
        DAL.DS_MainPhasco.OD_Err_TblDataTable dt_od = new PHASCO_WEB.DAL.DS_MainPhasco.OD_Err_TblDataTable();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "سایت تخصصی علوم آزمایشگاهی مقالات اطلس ها وبلاگ ها پرسش و پاسخ علمی اخبار لیست کامل آزمایشگاه ها شرکت های تجهیزات و پزشکی با جوایز ارزشمند .";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                try
                {
                    if (Request.QueryString["mode"] == "err") RadioButtonList_MOde.SelectedValue = "1";
                    if (Request.QueryString["mode"] == "od") RadioButtonList_MOde.SelectedValue = "0";
                }
                catch (Exception) { }

            if (UserOnline.User_Online_Valid())
            {
                MultiView1.ActiveViewIndex = 0;
                Button_Insert.Enabled = true;
                Button_Insert.Text = "ثبت شود";
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                Button_Insert.Enabled = false;
                Button_Insert.Text = "کاربر گرامی لطفا ابتدا لاگین کنید";
            }
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {

            da.Insert_New(UserOnline.id(), int.Parse(RadioButtonList_MOde.SelectedValue.ToString()), TextBox_Az_Name.Text, TextBox_Mas_Test.Text, TextBox_Mas_Fani.Text, TextBox_Dafe_Estefade.Text
                        , TextBox_Tel.Text, TextBox_Tarikh.Text, TextBox_Test_mored.Text, TextBox_Mark.Text, TextBox_Tozih.Text, TextBox_A1.Text, TextBox_A2.Text, TextBox_A3.Text, TextBox_A4.Text
                        , TextBox_A5.Text, TextBox_A6.Text, TextBox_A7.Text, TextBox_A8.Text, TextBox_A9.Text, TextBox_A10.Text, TextBox_A11.Text, TextBox_A12.Text
                        , TextBox_B1.Text, TextBox_B2.Text, TextBox_B3.Text, TextBox_B4.Text, TextBox_B5.Text, TextBox_B6.Text, TextBox_B7.Text, TextBox_B8.Text, TextBox_B9.Text, TextBox_B10.Text, TextBox_B11.Text, TextBox_B12.Text
                        , TextBox_C1.Text, TextBox_C2.Text, TextBox_C3.Text, TextBox_C4.Text, TextBox_C5.Text, TextBox_C6.Text, TextBox_C7.Text, TextBox_C8.Text, TextBox_C9.Text, TextBox_C10.Text, TextBox_C11.Text, TextBox_C12.Text
                        , TextBox_D1.Text, TextBox_D2.Text, TextBox_D3.Text, TextBox_D4.Text, TextBox_D5.Text, TextBox_D6.Text, TextBox_D7.Text, TextBox_D8.Text, TextBox_D9.Text, TextBox_D10.Text, TextBox_D11.Text, TextBox_D12.Text
                        , TextBox_E1.Text, TextBox_E2.Text, TextBox_E3.Text, TextBox_E4.Text, TextBox_E5.Text, TextBox_E6.Text, TextBox_E7.Text, TextBox_E8.Text, TextBox_E9.Text, TextBox_E10.Text, TextBox_E11.Text, TextBox_E12.Text
                        , TextBox_F1.Text, TextBox_F2.Text, TextBox_F3.Text, TextBox_F4.Text, TextBox_F5.Text, TextBox_F6.Text, TextBox_F7.Text, TextBox_F8.Text, TextBox_F9.Text, TextBox_F10.Text, TextBox_F11.Text, TextBox_F12.Text
                        , TextBox_G1.Text, TextBox_G2.Text, TextBox_G3.Text, TextBox_G4.Text, TextBox_G5.Text, TextBox_G6.Text, TextBox_G7.Text, TextBox_G8.Text, TextBox_G9.Text, TextBox_G10.Text, TextBox_G11.Text, TextBox_G12.Text
                        , TextBox_H1.Text, TextBox_H2.Text, TextBox_H3.Text, TextBox_H4.Text, TextBox_H5.Text, TextBox_H6.Text, TextBox_H7.Text, TextBox_H8.Text, TextBox_H9.Text, TextBox_H10.Text, TextBox_H11.Text, TextBox_H12.Text
                        , TextBox_Engeza_Tarikh.Text, TextBox_Seri_Sakht.Text);
            MultiView1.ActiveViewIndex = 1;
        }
    }
}
