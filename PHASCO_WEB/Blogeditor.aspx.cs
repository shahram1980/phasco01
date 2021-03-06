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
using System.Globalization;
using phasco_webproject.BaseClass;
using Membership_Manage;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class Blogeditor : System.Web.UI.Page
    {
        #region DataSet
        User_Blog da_blg = new User_Blog();
        DataTable dt = new DataTable();

        Users_Blog_Links da = new Users_Blog_Links();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            LBL_Alarm_div.Visible = false;
            bind_Grd();
        }
        protected void Button_INs_Click(object sender, EventArgs e)
        {
            try
            {
                PersianCalendar psdate = new PersianCalendar();
                string datefa = psdate.GetYear(DateTime.Now) + "/" + psdate.GetMonth(DateTime.Now);
                int comm = 0;
                if (CheckBox_Comment.Checked) comm = 1;
                string id = da_blg.GetUsers_Blog_Tra_DT("Insert", 0, TextBox_Title.Text, UserOnline.id(), FCKeditor1.Value, comm, datefa).Rows[0]["id"].ToString();

                #region Insert Notification
                // Insert Notification
                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
           //     NotificationUsers.AddNewNotification(0, UserOnline.id(), 0, "http://phasco.com/Wblog.aspx?OBid=" + id.ToString() + "&swb=t", 1, 1, 1, TextBox_Title.Text);
                #endregion

                bind_Grd();
                LBL_Alarm.Text = "با موفقیت ثبت شد";
                LBL_Alarm_div.Visible = true;

            }
            catch (Exception events)
            {
                LBL_Alarm.Text = "بروز خطا هنگام اجرا";
                LBL_Alarm_div.Visible = true;

            }
        }
        void bind_Grd()
        {
            GridView_Blog.DataSource = da_blg.GetUsers_Blog_Tra_DT("Select_full", 0, "", UserOnline.id(), FCKeditor1.Value, 0, ""); ;
            GridView_Blog.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Button_Edit_Click1(object sender, EventArgs e)
        {
            try
            {
                LBL_Alarm_div.Visible = true;

                int comm = 0;
                if (CheckBox_Comment.Checked) comm = 1;
                da_blg.GetUsers_Blog_Tra_DT("Update", Convert.ToInt32(HiddenField_Id.Value), TextBox_Title.Text, 0, FCKeditor1.Value, comm, "");
                bind_Grd();
                LBL_Alarm.Text = "با موفقیت انجام شد";
            }
            catch (Exception) { LBL_Alarm.Text = "بروز خطلا هنگام اجرا"; }
        }
        protected void ImageButton_New_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            TextBox_Title.Text = "";
            FCKeditor1.Value = "<div style='direction:rtl;height:200px;;text-align:right'></div>";

            Button_Edit.Visible = false;
            Button_INs.Visible = true;
        }

        protected void ImageButton_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dt = da_blg.GetUsers_Blog_Tra_DT("Select_Item", id, "", 0, "", 0, "");
            TextBox_Title.Text = dt.Rows[0]["Title"].ToString();
            FCKeditor1.Value = dt.Rows[0]["Body"].ToString();
            if (dt.Rows[0]["Comment"].ToString() == "1") CheckBox_Comment.Checked = true;
            else CheckBox_Comment.Checked = false;
            HiddenField_Id.Value = dt.Rows[0]["Id"].ToString();
            Button_Edit.Visible = true;
            Button_INs.Visible = false;
            MultiView1.ActiveViewIndex = 0;
        }

        protected void ImageButton_Delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                LBL_Alarm_div.Visible = true;

                int id = Convert.ToInt32(e.CommandArgument.ToString());
                da_blg.GetUsers_Blog_Tra_DT("Delete", id, "", 0, "", 0, "");
                bind_Grd();

                LBL_Alarm.Text = "با موفقیت انجام شد";
            }
            catch (Exception) { LBL_Alarm.Text = "بروز خطلا هنگام اجرا"; }
        }


        #region Links

        void bind_Links()
        {
            DataTable dt = da.Users_Blog_Links_Tra("select_Uid", 0, UserOnline.id(), "", "");
            GridView_Links.DataSource = dt;
            GridView_Links.DataBind();
            MultiView1.ActiveViewIndex = 2;
            Button_Link_Edit.Visible = false;
            Button1.Visible = true;

        }
        protected void ImageButton_Link_Edit_Command1(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            DataTable dt = da.Users_Blog_Links_Tra("select_Item", id, 0, "", "");
            if (dt.Rows.Count > 0)
            {
                Button_Link_Edit.Visible = true;
                Button1.Visible = false;

                TextBox_Link_Title.Text = dt.Rows[0]["Title"].ToString();
                TextBox_Link_Url.Text = dt.Rows[0]["Url"].ToString();
                HiddenField_Id_Link.Value = dt.Rows[0]["id"].ToString();
            }
        }

        protected void ImageButton_Link_Delete_Command1(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            da.Users_Blog_Links_Tra("delete", id, 0, "", "");
            bind_Links();
        }

        protected void Button_Link_Insert_Click(object sender, EventArgs e)
        {
            da.Users_Blog_Links_Tra("insert", 0, UserOnline.id(), TextBox_Link_Url.Text, TextBox_Link_Title.Text);
            TextBox_Link_Title.Text = "";
            TextBox_Link_Url.Text = "Http://www.";
            bind_Links();
        }

        protected void Button_Link_Edit_Click(object sender, EventArgs e)
        {
            da.Users_Blog_Links_Tra("edit", int.Parse(HiddenField_Id_Link.Value.ToString()), 0, TextBox_Link_Url.Text, TextBox_Link_Title.Text);
            TextBox_Link_Title.Text = "";
            TextBox_Link_Url.Text = "Http://www.";
            bind_Links();
        }
        #endregion

        protected void Button_MyWEblog_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Wblog.aspx?Bid=" + UserOnline.id());
        }

        protected void ImageButton_Edit_Click(object sender, EventArgs e)
        {
            bind_Grd();
        }



        protected void Button3_Click1(object sender, EventArgs e)
        {
            bind_Links();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }





    }
}
