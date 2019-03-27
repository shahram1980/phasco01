using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer.Main;
using System.Data;

namespace PHASCO_WEB.Cpanel
{
    public partial class TagsManage : System.Web.UI.Page
    {
        TBL_TAGs dat_tags = new TBL_TAGs();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindData();
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            if (panel_Checklist.Visible == false)
                dat_tags.TBL_TAGs_SP(1, 0, TextBox_Tag.Text, TextBox_Url.Text);
            else
            {
                for (int i = 0; i < CheckBoxList_Words.Items.Count; i++)
                    if (CheckBoxList_Words.Items[i].Selected)
                        dat_tags.TBL_TAGs_SP(1, 0, CheckBoxList_Words.Items[i].Value, TextBox_Url.Text);  
            }
            TextBox_Tag.Text = TextBox_Url.Text = "";
            BindData();
            panel_Checklist.Visible = false;
            CheckBoxList_Words.Items.Clear();
        }

        void BindData()
        {
            dt = dat_tags.TBL_TAGs_SP(4, 0, "", "");
            Label_Count.Text = dt.Rows.Count.ToString();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindData();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            dat_tags.TBL_TAGs_SP(3, id, "", "");
            BindData();
        }

        protected void Button_split_Click(object sender, EventArgs e)
        {
            string str = TextBox_Tag.Text.ToString().Replace(":", " ");
            str = str.ToString().Replace(":", " ");
            str = str.ToString().Replace("\n", " ");
            str = str.ToString().Replace("\r", " ");
            str = str.ToString().Replace("\n", " ");
            str = str.ToString().Replace("\r", " ");

            ListItem li = new ListItem();
            string[] split = str.Split(new Char[] { ' ', ',', '.', ':', '\t' });

            foreach (string s in split)
            { if (s.Trim() != "")   CheckBoxList_Words.Items.Add(s); }

            panel_Checklist.Visible = true;
        }

    }
}