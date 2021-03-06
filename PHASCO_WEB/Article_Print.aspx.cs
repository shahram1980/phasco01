using System;
using System.Data;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class Article_Print : System.Web.UI.Page
    {
        Article_Main ArticleClass = new Article_Main();
        DataTable dt = new DataTable();
        User da_User = new User();

        protected void Page_Load(object sender, EventArgs e)
        {
            SetDetailsVeiw(int.Parse(Request.QueryString["id"].ToString()));
            try { }
            catch (Exception) { }
        }
        protected void SetDetailsVeiw(int Id)
        {

            DataTable dt;
            dt = ArticleClass.GetArticleList("Select_Text_Id", int.Parse(Request.QueryString["id"].ToString()), "");
            if (dt.Rows.Count > 0)
            {
                SubJect.Text = dt.Rows[0]["SubJect"].ToString();
                Writer.Text = dt.Rows[0]["Writer"].ToString();
                Translator.Text = dt.Rows[0]["Translator"].ToString();
                keyWork.Text = dt.Rows[0]["keyWork"].ToString();
                ShortText.Text = dt.Rows[0]["ShortText"].ToString();
                Ref.Text = dt.Rows[0]["Ref"].ToString();
                Text.Text = dt.Rows[0]["Text"].ToString();
                dt = da_User.GetUsers_Tra_DT("", int.Parse(Request.QueryString["id"].ToString()));
                if (dt.Rows.Count > 0)
                    LBL_UserSender.Text = dt.Rows[0]["Name"] + " " + dt.Rows[0]["Famil"] + "[" + dt.Rows[0]["Uid"] + "]";
                else LBL_UserSender.Text = "مدیر سایت";
            }
            else { }
        }
    }
}
