using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer.Users;

namespace PHASCO_Shopping.bizpanel
{
    public partial class Users : System.Web.UI.Page
    {
        TBL_User UserBll = new TBL_User();
        DataTable dt = new DataTable();
        TBL_AdminUsers adminUser = new TBL_AdminUsers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (adminUser.UserValid() == true)
            {
                DataTable dt = new DataTable();
                dt = adminUser.check_Page(6, Convert.ToInt32(HttpContext.Current.Server.HtmlEncode(HttpContext.Current.Request.Cookies["login"]["id"])), this.Title, 0, null);
                if (dt.Rows.Count > 0)
                {
                    string pageNumberQS = Request.QueryString[pager1.QueryStringParameterName] ?? string.Empty;
                    if (pageNumberQS != string.Empty && Convert.ToInt32(pageNumberQS) > 0)
                    {
                        pager1.CurrentIndex = Convert.ToInt32(pageNumberQS);
                        Bind_Grd_User();
                    }

                    if (!IsPostBack)
                    {
                        Bind_Grd_User();
                    }
                }
                else
                    Response.Redirect("AccessDenied.aspx");
            }
            else
                Response.Redirect("AccessDenied.aspx");
        }


 

        public void pager_Command(object sender, CommandEventArgs e)
        {
            int currnetPageIndx = Convert.ToInt32(e.CommandArgument);
            pager1.CurrentIndex = currnetPageIndx;
            Bind_Grd_User();
        }
        //protected void Bind_Grd_User()
        //{
        //    MultiView1.ActiveViewIndex = 0;
        //    dt = UserBll.TBL_User_Tra("selectAll");
        //    Gv_users.DataSource = dt;
        //    Gv_users.DataBind();

        private void Bind_Grd_User()
        {

            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(strConn);
            SqlCommand Cmd = new SqlCommand("dbo.GetPagedUserPaging", cn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr;

            int dd = pager1.CurrentIndex; ;
            Cmd.Parameters.Add("@PageSize", SqlDbType.Int, 4).Value =  pager1.PageSize;
            Cmd.Parameters.Add("@CurrentPage", SqlDbType.Int, 4).Value = pager1.CurrentIndex;
            Cmd.Parameters.Add("@ItemCount", SqlDbType.Int).Direction = ParameterDirection.Output;

            cn.Open();
            dr = Cmd.ExecuteReader();

            Gv_users.DataSource = dr;
            Gv_users.DataBind();

            dr.Close();
            cn.Close();

            Int32 _totalRecords = Convert.ToInt32(Cmd.Parameters["@ItemCount"].Value);
            pager1.ItemCount = _totalRecords;
        }


        protected void lnk_btn_UserSelect_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MultiView1.ActiveViewIndex = 1;
                dt = UserBll.TBL_User_Tra("selectById", int.Parse(e.CommandArgument.ToString()));
                txt_a_code.Text = dt.Rows[0]["Tel_A_Code"].ToString();
                txt_a_num.Text = dt.Rows[0]["Tel_A_Number"].ToString();
                txt_buss_Location.Text = dt.Rows[0]["Business_Location"].ToString();
                txt_c_code.Text = dt.Rows[0]["Tel_C_Code"].ToString();
                txt_company.Text = dt.Rows[0]["Company"].ToString();
                lbl_dateins.Text = dt.Rows[0]["DateIns"].ToString();
                txt_industry.Text = dt.Rows[0]["Industry"].ToString();
                lbl_LastLogin.Text = dt.Rows[0]["LastLogin"].ToString();
                txt_lastname.Text = dt.Rows[0]["Family_Name"].ToString();
                txt_mobile.Text = dt.Rows[0]["Mobile"].ToString();
                txt_name.Text = dt.Rows[0]["Given_Name"].ToString();
                drp_sex.SelectedValue = dt.Rows[0]["sex"].ToString();
                txt_Username.Text = dt.Rows[0]["Uid"].ToString();
                txt_pass.Text = dt.Rows[0]["Password"].ToString();
                drp_ActiveMode.SelectedValue = dt.Rows[0]["ActiveMode"].ToString();
                drp_userlevel.SelectedValue = dt.Rows[0]["User_Level"].ToString();
                drp_userstatus.SelectedValue = dt.Rows[0]["User_Status"].ToString();
                img_userLevel.ImageUrl = "~/images/star/" + dt.Rows[0]["User_Level"].ToString() + ".jpg";
                Session["id"] = e.CommandArgument;
            }
            catch
            { }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                UserBll.TBL_User_Tra(int.Parse(drp_ActiveMode.SelectedValue), int.Parse(Session["id"].ToString()), "Update", txt_Username.Text, txt_pass.Text, int.Parse(drp_userstatus.SelectedValue), txt_buss_Location.Text, txt_company.Text, txt_industry.Text, txt_name.Text, txt_lastname.Text, txt_c_code.Text, txt_a_code.Text, txt_a_num.Text, txt_mobile.Text, int.Parse(drp_userlevel.SelectedValue), int.Parse(drp_sex.SelectedValue));
                Clear();
                MultiView1.ActiveViewIndex = 0;
                lbl_msg.Text = "User Information Submited";
            }
            catch
            {
                lbl_msg.Text = "Error Occured During the JOb!";
            }

        }

        private void Clear()
        {
            txt_a_code.Text = "";
            txt_a_num.Text = "";
            txt_buss_Location.Text = "";
            txt_c_code.Text = "";
            txt_company.Text = "";
            txt_industry.Text = "";
            txt_lastname.Text = "";
            txt_mobile.Text = "";
            txt_name.Text = "";
            txt_pass.Text = "";
            txt_Username.Text = "";

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {

            dt = UserBll.TBL_User_Tra("search", txt_search_username.Text.Trim(), txt_search_lastname.Text.Trim());
            Gv_Search.DataSource = dt;
            Gv_Search.DataBind();
        }

        protected void lnk_btn_allUsers_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Bind_Grd_User();
            lbl_msg.Text = "";
        }

        protected void lnk_btn_search_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            lbl_msg.Text = "";
        }

        //void Gv_Search_SelectedIndexChanged(object sender, GridViewPageEventArgs e)
        //{

        //    myGridView.PageIndex = e.NewPageIndex;

        //    BindData();

        //}


       
    
 

    









    }
}
