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
using DataAccessLayer;

namespace phasco.Cpanel
{
    public partial class ArticleMain : System.Web.UI.Page
    {
        DataAccessLayer.Tractate_List da_t = new DataAccessLayer.Tractate_List();
        DataTable ds_t;
        protected void Page_Load(object sender, EventArgs e)
        { if (!IsPostBack)   Bind_grd(); }

        #region Level 1 Editing
        protected void Bind_grd()
        {
            ds_t = da_t.article_SubJect("Level1", 0, "");
            GRD_LIST.DataSource = ds_t;
            GRD_LIST.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        { da_t.article_SubJect("Insert1", 0, Txt_Title.Text); Bind_grd(); }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        { da_t.article_SubJect("Delete", Convert.ToInt32(e.CommandArgument), ""); Bind_grd(); }

        protected void GRD_LIST_RowEditing(object sender, GridViewEditEventArgs e)
        { GRD_LIST.EditIndex = (int)e.NewEditIndex; Bind_grd(); }

        protected void GRD_LIST_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        { GRD_LIST.EditIndex = -1; Bind_grd(); }

        protected void GRD_LIST_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GRD_LIST.Rows[e.RowIndex];
            TextBox id = (TextBox)row.Cells[0].Controls[0];
            TextBox title = (TextBox)row.Cells[1].Controls[0];
            da_t.article_SubJect("UpDate2", Convert.ToInt32(id.Text.ToString()), title.Text);
            GRD_LIST.EditIndex = -1; Bind_grd();
        }

        protected void LinkButton_Subject_Command(object sender, CommandEventArgs e)
        { HiddenField_Subject_Id.Value = e.CommandArgument.ToString(); Bind_Grd2(); }
        #endregion


        #region Leve @ Editing


        protected void Bind_Grd2()
        {
            ds_t = da_t.article_SubJect("Level2", Convert.ToInt32(HiddenField_Subject_Id.Value), "");
            GridView_Level2.DataSource = ds_t;
            GridView_Level2.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void LinkButton_Delete_Level2_Command(object sender, CommandEventArgs e)
        { da_t.article_SubJect("Delete", Convert.ToInt32(e.CommandArgument), ""); Bind_Grd2(); }
        protected void GridView_Level2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        { GridView_Level2.EditIndex = -1; Bind_Grd2(); }
        protected void GridView_Level2_RowEditing(object sender, GridViewEditEventArgs e)
        { GridView_Level2.EditIndex = (int)e.NewEditIndex; Bind_Grd2(); }
        protected void GridView_Level2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView_Level2.Rows[e.RowIndex];
            TextBox id = (TextBox)row.Cells[0].Controls[0];
            TextBox title = (TextBox)row.Cells[1].Controls[0];
            da_t.article_SubJect("UpDate2", Convert.ToInt32(id.Text.ToString()), title.Text);
            GridView_Level2.EditIndex = -1;
            Bind_Grd2();
        }
        protected void Button_Insert_Level2_Click(object sender, EventArgs e)
        { da_t.article_SubJect("Insert2", Convert.ToInt32(HiddenField_Subject_Id.Value), TextBox_title_Level2.Text); Bind_Grd2(); }
        protected void LinkButton_Back_TO_Level1_Click(object sender, EventArgs e)
        { Bind_grd(); }
        protected void LinkButton_New_article_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Level2_ID.Value = e.CommandArgument.ToString();
            MultiView1.ActiveViewIndex = 2;
            Button_Insert_Article.Visible = true;
            Button_Edit_Article.Visible = false;
        }
        protected void LinkButton_List_article_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Article_List.Value = e.CommandArgument.ToString();
            Bind_Article_List();
        }
        protected void Bind_Article_List()
        {
            ds_t = da_t.article_SubJect("Select_Text", Convert.ToInt32(HiddenField_Article_List.Value), "");
            GridView_Article.DataSource = ds_t;
            GridView_Article.DataBind();
            MultiView1.ActiveViewIndex = 3;
        }
        #endregion

        protected void Button_Insert_Article_Click(object sender, EventArgs e)
        {
            string manelmi = "خير";
            if (yes.Checked == true) manelmi = "بله";
            da_t.article_Text_Insert(Convert.ToInt32(HiddenField_Level2_ID.Value), SubJect.Text.ToString(), Writer.Text.ToString(), Ref.Text.ToString(),
                                     ShortText.Text.ToString(), ShortTextOtherLan.Text.ToString(), Translator.Text.ToString(), manelmi, keyWork.Text.ToString(), keyWorkOtherLan.Text.ToString(),
                                     RadEditor1.Html.ToString(), "yes", "", "", "0", "Insert_Admin", Convert.ToInt32(HiddenField_Level2_ID.Value));
        }

        protected void Button_Edit_Article_Click(object sender, EventArgs e)
        {
            string manelmi = "خير";
            if (yes.Checked == true) manelmi = "بله";
            da_t.article_Text_Insert(Convert.ToInt32(HiddenField_Article_Edit.Value), SubJect.Text, Writer.Text, Ref.Text, ShortText.Text,
                                     ShortTextOtherLan.Text, Translator.Text, manelmi, keyWork.Text, keyWorkOtherLan.Text, RadEditor1.Html
                                     , "yes", "", "", "0", "Edit_Admin", Convert.ToInt32(HiddenField_Article_Edit.Value));
            Bind_Article_List();
        }

        #region Edit Article
        protected void LinkButton_Delete_Article_Command(object sender, CommandEventArgs e)
        {
            da_t.article_SubJect("Del_Text", Convert.ToInt32(e.CommandArgument), "");
            Bind_Article_List();
        }

        protected void LinkButton_Edit_Article_Command(object sender, CommandEventArgs e)
        {
            HiddenField_Article_Edit.Value = e.CommandArgument.ToString();

            ds_t = da_t.article_SubJect("Select_Text_Id", Convert.ToInt32(HiddenField_Article_Edit.Value), "");

            SubJect.Text = ds_t.Rows[0]["SubJect"].ToString();
            Writer.Text = ds_t.Rows[0]["Writer"].ToString();
            Ref.Text = ds_t.Rows[0]["Ref"].ToString();
            ShortText.Text = ds_t.Rows[0]["ShortText"].ToString();
            ShortTextOtherLan.Text = ds_t.Rows[0]["ShortTextOtherLan"].ToString();
            Translator.Text = ds_t.Rows[0]["Translator"].ToString();
            keyWork.Text = ds_t.Rows[0]["keyWork"].ToString();
            keyWorkOtherLan.Text = ds_t.Rows[0]["keyWorkOtherLan"].ToString();
            RadEditor1.Html = ds_t.Rows[0]["Text"].ToString();
            MultiView1.ActiveViewIndex = 2;
            Button_Insert_Article.Visible = false;
            Button_Edit_Article.Visible = true;
        }
        #endregion

        protected void LinkButton_Back_to_Level2_Command(object sender, CommandEventArgs e)
        { Bind_Grd2(); }







    }
}
