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
using phasco_webproject.BaseClass;
using Membership_Manage;
using DataAccessLayer;

namespace phasco.Cpanel
{
    public partial class ProblemsMaker : System.Web.UI.Page
    {
        #region
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_SolutionTableAdapter da_s = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.T_SolutionTableAdapter();
        DataAccessLayer.DS_MainPhasco.T_SolutionDataTable ds_s = new DataAccessLayer.DS_MainPhasco.T_SolutionDataTable();
        #endregion
        T_Solution_Answer da_ans = new T_Solution_Answer();
        protected void Page_Load(object sender, EventArgs e)
        { }
        protected void LinkButton_qu_Click(object sender, EventArgs e)
        { MultiView1.ActiveViewIndex = 0; }

        protected void LinkButton_Ans_Click(object sender, EventArgs e)
        { Bind_NewAns_Grd(); }
        protected void Button_Send_Click(object sender, EventArgs e)
        {
            //try
            //{
                da_s.T_Solution_Tra("insert", 0, txt_Sulotion.Text.ToString(), 0);
                MultiView1.ActiveViewIndex = 1;
            //}
            //catch (Exception)
            //{
            //}

        }


        #region Answer
        void Bind_NewAns_Grd()
        {
            DataTable dt = da_ans.T_Solution_Answer_Tra("Select_NEW", 0, 0, "");
            GridView_Ans.DataSource = dt;
            GridView_Ans.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }

        protected void LinkButton_Archive_Command(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            DataTable dt = da_ans.T_Solution_Answer_Tra("Select_Item", id, 0, "");
            UserOnline.Add_Point(int.Parse(dt.Rows[0]["uid"].ToString()), 9, "auto");
            da_ans.T_Solution_Answer_Tra("Archive", id, 0, ""); 
            Bind_NewAns_Grd();
        }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString()); da_ans.T_Solution_Answer_Tra("delete", id, 0, ""); Bind_NewAns_Grd();
        }
        #endregion



    }
}
