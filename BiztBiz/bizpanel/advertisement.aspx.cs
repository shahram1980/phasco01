using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiztBiz.BLL;
using BiztBiz.Component;
using System.IO;
using System.Data;

namespace BiztBiz.bizpanel
{
    public partial class advertisement : System.Web.UI.Page
    {
        string date;
        int? maxid;
        TBL_Advertise Advertise=new TBL_Advertise();
        DataTable dt = new DataTable();
        TBL_AdminUsers adminUser = new TBL_AdminUsers();
        protected void Page_Load(object sender, EventArgs e)
        {
              if (adminUser.UserValid() == true)
            {
                dt = adminUser.check_Page(6, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), this.Title, 0, null);
                if (dt.Rows.Count > 0)
                {
            if (!base.IsPostBack)
            {
                ViewState["edit"] = 0;
            }
                }
                else
                    Response.Redirect("AccessDenied.aspx");
            }
              else
                  Response.Redirect("AccessDenied.aspx");
        }

        protected void btn_ok_Click(object sender, EventArgs e)
        {
            int num = 0;
            int num2 = 0;

            if (txt_count.Text != "")
            {
                num2 = int.Parse(txt_count.Text);
            }
            if (txt_date.Text == "")
            {
                date = DateTime.Now.ToString();
            }
            else
            {
                date = txt_date.Text;
            }
            try
            {
                if (int.Parse(ViewState["edit"].ToString()) > 0)
                {
                    num = int.Parse(ViewState["edit"].ToString());
                }
            }
            catch
            {
                ViewState["edit"] = null;
            }
            DateTime startDate ;
            Advertise.Tbl_Advertise(maxid,6, null, DateTime.Now, null, 0, DateTime.Now, 0, 0, 0, null, null, null, null);
            MyFileUploader.SaveFile(FileUpload1, "~\\ADV\\", 0, ".jpg", ".gif", ".gif", base.Server);
            //MyFileUploader.SaveFile_MyFileName(FileUpload1, "~\\ADV\\", "00.jpg", "*", "*", "*", this.Server);
            string extension = Path.GetExtension(FileUpload1.FileName);
            string imageSingleName = MyFileUploader.GetImageSingleName(Convert.ToInt32(maxid), extension);
            string str3 = base.Server.MapPath("~//ADV");

            MyFileUploader.ResizeImage(str3 + "//" + imageSingleName, str3 + "\\" + imageSingleName, 180, 250, true);
            Advertise.Tbl_Advertise(1, extension,DateTime.Now, txt_url.Text, int.Parse(txt_count.Text),Convert.ToDateTime(date), 0,int.Parse(rd_btn_mode.SelectedValue), 1, imageSingleName, txt_desc.Text, ddl_position.SelectedValue, null,txt_pagename.Text);            DataList1.DataBind();
            Lbl_ALARM.Text = "Creation has been Don ";
        }

        protected void link_btn_Insert_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Clear();

        }

        private void Clear()
        {
            txt_count.Text = "1";
            txt_date.Text = string.Empty;
            txt_desc.Text = string.Empty;
            txt_url.Text = "http://www.";
            rd_btn_mode.SelectedValue = "3";
        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            try
            {
                DateTime? startDate = null;
                dt = Advertise.Tbl_Advertise(3, null, DateTime.Now, null, 0, DateTime.Now, Convert.ToInt32(e.CommandArgument), 0, 0, null, null, null, null,txt_pagename.Text);
                txt_date.Text = dt.Rows[0]["EndDate"].ToString();
                txt_desc.Text =  dt.Rows[0]["text"].ToString();
                txt_url.Text =  dt.Rows[0]["Url"].ToString();
                txt_count.Text = dt.Rows[0]["Hit"].ToString();
                //ddl_language.SelectedValue = advertise_table[0].Language.ToString();
                rd_btn_mode.SelectedValue = dt.Rows[0]["Mode"].ToString();
                txt_pagename.Text = dt.Rows[0]["PageName"].ToString();
                ViewState["Name"] = dt.Rows[0]["Name"].ToString();
                ViewState["edit"] = num;
                btn_edit.Visible = true;
                btn_ok.Visible = false;
                MultiView1.ActiveViewIndex = 0;
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "Error in Editing";
            }
        }

       

        protected void link_btn_show_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Clear();
        }

        protected void rd_btn_mode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = rd_btn_mode.SelectedValue.ToString();
            if (str != null)
            {
                if (!(str == "0"))
                {
                    if (str == "1")
                    {
                        Calendar_Date.Enabled = false;
                        txt_count.Enabled = true;
                    }
                    else if (str == "3")
                    {
                        Calendar_Date.Enabled = false;
                        txt_count.Enabled = true;
                    }
                }
                else
                {
                    Calendar_Date.Enabled = true;
                    txt_count.Enabled = false;
                }
            }
        }

        protected void Calendar_Date_SelectionChanged(object sender, EventArgs e)
        {
            txt_date.Text = Calendar_Date.SelectedDate.ToString();
        }

        protected void link_btn_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int num = Convert.ToInt32(e.CommandArgument);
                DateTime? startDate = null;
                Advertise.Tbl_Advertise(2, null, DateTime.Now, null, 0, DateTime.Now, Convert.ToInt32(e.CommandArgument), 0, 0, null, null, null, null,null);
                DataList1.DataBind();
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "Error in Deleting";
            }
        }

        protected void IMG1_Command(object sender, CommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            DateTime? startDate = null;
            startDate = null;
            dt = Advertise.Tbl_Advertise(3, null, DateTime.Now, null, 0, DateTime.Now, Convert.ToInt32(e.CommandArgument),0, 0, null, null, null, null,null);
            startDate = null;
            dt = Advertise.Tbl_Advertise(3, null, DateTime.Now, null, 0, DateTime.Now, Convert.ToInt32(e.CommandArgument), 0, 0, null, null, null, "(mode=0 and EndDate<=Getdate()) or (mode=1 and [load]>0 and [load]<=hit) or (mode=2 and [load]>0 and [load]<=hit)",null);
            //dt = Advertise.Tbl_Advertise(5, null, startDate, null, 0, null, new int?(num), 0, 0, null, null, ref maxid, "", "(mode=0 and EndDate<=Getdate()) or (mode=1 and [load]>0 and [load]<=hit) or (mode=2 and [load]>0 and [load]<=hit)");
            if (dt.Rows[0]["Url"].ToString() != null)
            {
                string url = dt.Rows[0]["Url"].ToString();
                base.Response.Redirect(url);
            }
           
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            try
            {
                int num = 0;
                int num2 = 0;

                if (txt_count.Text != "")
                {
                    num2 = int.Parse(txt_count.Text);
                }
                if (txt_date.Text == "")
                {
                    date = DateTime.Now.ToString();
                }
                else
                {
                    date = txt_date.Text;
                }
                try
                {
                    if (int.Parse(ViewState["edit"].ToString()) > 0)
                    {
                        num = int.Parse(ViewState["edit"].ToString());
                    }
                }
                catch
                {
                    ViewState["edit"] = null;
                }
                DateTime startDate;
                Advertise.Tbl_Advertise(maxid, 6, null, DateTime.Now, null, 0, DateTime.Now, 0, 0, 0, null, null, null, null);
                MyFileUploader.SaveFile(FileUpload1, "~\\ADV\\", 0, ".jpg", ".gif", ".gif", base.Server);
                //MyFileUploader.SaveFile_MyFileName(FileUpload1, "~\\ADV\\", "00.jpg", "*", "*", "*", this.Server);
                string extension = Path.GetExtension(ViewState["Name"].ToString());
                string imageSingleName = MyFileUploader.GetImageSingleName(Convert.ToInt32(maxid), extension);
                string str3 = base.Server.MapPath("~//ADV");

                MyFileUploader.ResizeImage(str3 + "//" + imageSingleName, str3 + "\\" + imageSingleName, 180, 250, true);
                Advertise.Tbl_Advertise(1, extension, DateTime.Now, txt_url.Text, int.Parse(txt_count.Text), Convert.ToDateTime(date), num, int.Parse(rd_btn_mode.SelectedValue), 1, imageSingleName, txt_desc.Text, ddl_position.SelectedValue, null, txt_pagename.Text); DataList1.DataBind();
                Lbl_ALARM.Text = "Edit has been Don ";
                btn_ok.Visible = true;
                btn_edit.Visible = false;
            }
            catch (Exception)
            {
                Lbl_ALARM.Text = "Error in Editing";
            }
        }

        protected void IMG1_Command1(object sender, CommandEventArgs e)
        {

        }
        }
    }

