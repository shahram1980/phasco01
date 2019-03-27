using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Data;

namespace PHASCO_Shopping.bizpanel
{
    public partial class CreateAdminUser : System.Web.UI.Page
    {
        TBL_AdminUsers adminUser = new TBL_AdminUsers();
        //TBL_User users = new TBL_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (adminUser.UserValid() == true)
            //{
            //    DataTable dt = new DataTable();
            //    int adminid=Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"]));
            //    dt = adminUser.check_Page(6, adminid, this.Title, 0, null);
            //    if (dt.Rows.Count > 0)
            //    {
            //        MultiView1.ActiveViewIndex = 0;
            //    }
            //    else
            //        Response.Redirect("AccessDenied.aspx");
            //}
            //else
            //    Response.Redirect("AccessDenied.aspx");
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                int chk_items = chk_list_pages.Items.Count;
                for (int i = 0;i<chk_items ; i++)
                {
                    if (chk_list_pages.Items[i].Selected == true)
                        adminUser.check_Page(1, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), chk_list_pages.Items[i].Text, 0, null);
                }
                txt_lastname.Text = "";
                txt_name.Text = "";
                txt_pass.Text = "";
                txt_username.Text = "";
                lbl_msg.Text = "New Admin User Created";
            }
            catch
            {
                lbl_msg.Text = "Error Occured During Ceation!";
            }
        }

        protected void lnk_btn_Select_Command(object sender, CommandEventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                DataTable dt_users = new DataTable();
                ViewState["UserId"] = e.CommandArgument;
                dt = adminUser.check_Page(7, Convert.ToInt32(e.CommandArgument), null, 0, null);
                dt_users = users.Check_login(3, null, null, Convert.ToInt32(e.CommandArgument));
                for (int i = 0; i < dt.Rows.Count;i++ )
                {
                    for (int j = 0; j < chk_list_pages.Items.Count; j++)
                    {
                        if (dt.Rows[i]["PageName"].ToString() == chk_list_pages.Items[j].Text)
                            chk_list_pages.Items[j].Selected = true;

                    }
                }

                txt_lastname.Text = dt_users.Rows[0]["Lastname"].ToString();
                txt_name.Text = dt_users.Rows[0]["name"].ToString();
                txt_username.Text = dt_users.Rows[0]["username"].ToString();
                txt_pass.Text = dt_users.Rows[0]["password"].ToString();
                btn_submit.Visible = false;
                btn_edit.Visible = true;
            }
            catch
            {
            }
        }

        protected void lnk_btn_showUser_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            DataTable dt = new DataTable();
            
            dt = users.Check_login(4, null, null);
           Gv_adminusers.DataSource = dt;
           Gv_adminusers.DataBind();
        }

        protected void lnk_btn_createUser_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            btn_submit.Visible =true;
            btn_edit.Visible = false;
            txt_lastname.Text = "";
            txt_name.Text = "";
            txt_pass.Text = "";
            txt_username.Text = "";
            chk_list_pages.ClearSelection();
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            try
            {
                int chk_items = chk_list_pages.Items.Count;
                adminUser.check_Page(8, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), null, 0, null);
                for (int i = 0; i < chk_items; i++)
                {
                    if (chk_list_pages.Items[i].Selected == true)
                        adminUser.check_Page(1, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), chk_list_pages.Items[i].Text,Convert.ToInt32(ViewState["UserId"]), null);
                }
                txt_lastname.Text = "";
                txt_name.Text = "";
                txt_pass.Text = "";
                txt_username.Text = "";
                chk_list_pages.ClearSelection();
                lbl_msg.Text = "User Information Updated";
            }
            catch
            {
                lbl_msg.Text = "Error Occured During Updating!";
            }
        }
    }
}
