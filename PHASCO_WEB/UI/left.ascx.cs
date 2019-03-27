using System;
using DataAccessLayer.BIZ;
using DataAccessLayer;
using BusinessAccessLayer;
using System.Web.UI;

namespace phasco_webproject.UI
{
    public partial class left : System.Web.UI.UserControl
    {
        Article_Main ArticleClass = new Article_Main();
        User da_User = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 

                bind_Top_User();
                //if (UserOnline.User_Online_Valid()) Panel_REgisterfree.Visible = false;
                //else Panel_REgisterfree.Visible = true;
            }
        }
        void bind_Top_User()
        {
            //Repeater_Top_User.DataSource = da_User.GetUsers_Tra_DT("select_TopUserP");;
            //Repeater_Top_User.DataBind();
        }

        //void Bind_RNd()
        //{
        //    DataTable dts = ArticleClass.GetHomeArticles("RNd_SubJect", 0, "");
        //    int ro = dts.Rows.Count;
        //    RTP_RND.DataSource = dts;
        //    RTP_RND.DataBind();
        //}

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (txt_name.Text != "")
                Response.Redirect(@"~\UserSearch.aspx?UidNma91okp=" + txt_name.Text);// + "&SdkieBop9=" + drp_gender.SelectedValue.ToString());
        }

        protected void SendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                PMail.SendInviteEmailForAllPhascoWebsite(txtEmail.Text);
                TBL_InviteEmails da = new TBL_InviteEmails();
                da.TBL_InviteEmails_Tra(txtEmail.Text, "insert");
                txtEmail.Text = string.Empty;
                lbl_Alaram.Text = "ایمیل با موفقیت ارسال شد";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "$(function () { alert('اشکال در ارسال ایمیل'); });", true);

            }
            catch (Exception)
            { lbl_Alaram.Text = "اشکال در ارسال ایمیل"; }
        }
    }
}