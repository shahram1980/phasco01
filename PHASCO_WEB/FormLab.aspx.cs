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
using PHASCO_WEB.DAL;
using phasco.BaseClass;
using phasco_webproject.BaseClass;
using Membership_Manage;
using DataAccessLayer;
using BusinessAccessLayer;

namespace PHASCO_WEB
{
    public partial class FormLab : System.Web.UI.Page
    {
        #region DataSet
        T_Restaurant da_R = new T_Restaurant();
        Tbl_state da_S = new Tbl_state();
        DataTable dt = new DataTable();
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
        { if (!IsPostBack) { MultiView1.ActiveViewIndex = 0; } }
        #region Darop 1
        protected void Drop_Dataentry_SelectedIndexChanged(object sender, EventArgs e)
        { dropdown_State_Bind(); dropdown_region_State_Bind(); }
        protected void dropdown_State_Bind()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(Drop_Dataentry.SelectedValue), "");
            if (dt.Rows.Count > 0)
            {
                Drop_state.DataTextField = "Satate";
                Drop_state.DataValueField = "Id";
                Drop_state.DataSource = dt;
                Drop_state.DataBind();
                Drop_state.Enabled = true;
            }
            else Drop_state.Enabled = false;
        }
        #endregion
        #region Darop 2
        protected void Drop_down_ChangeList(object sender, EventArgs e)
        { dropdown_region_State_Bind(); }
        protected void dropdown_region_State_Bind()
        {
            dt = da_S.T_state_Tra("select", 0, "", Convert.ToInt32(Drop_state.SelectedValue), "");
            if (dt.Rows.Count > 0 && Drop_state.Enabled == true)
            {
                DropDownList_Region_newINsert.DataTextField = "Satate";
                DropDownList_Region_newINsert.DataValueField = "Id";
                DropDownList_Region_newINsert.DataSource = dt;
                DropDownList_Region_newINsert.DataBind();
                DropDownList_Region_newINsert.Enabled = true;
                Button1.Enabled = true;
            }
            else
            {
                DropDownList_Region_newINsert.Enabled = false;
                Button1.Enabled = false;
            }
        }
        #endregion
        protected void Button1_Click(object sender, EventArgs e)
        {
            string FileName;
            if (DropDownList_Region_newINsert.Enabled = true)
            {
                if (File_Image.HasFile) FileName = MyFileUploader.IsExtension(File_Image);
                else FileName = "None.jpg";
                int id = 0;
                DataTable dt_;
                dt_ = da_R.restaurant_Tra("insert", Convert.ToInt32(DropDownList_Region_newINsert.SelectedValue), txt_name.Text, "", 0, txt_Address.Text, txt_manager.Text, "", Txt_foods.Text, TXT_website.Text, Txt_tel.Text,
                      FileName, 1, UserOnline.id(), 0);

                id = int.Parse(dt_.Rows[0][0].ToString());
                MyFileUploader.SaveFile(File_Image, "phascoupfile\\Dir_Images", Convert.ToInt32(id), ".jpg", ".jpeg", ".jpg", this.Server);
                Lbl_success.Visible = true;
                Lbl_success.Text = "  رکورد با موفقيت درج شد";
            }
            else Lbl_success.Text = "بروز خطا ! منطقه تعيين نشده";
        }

    }
}
