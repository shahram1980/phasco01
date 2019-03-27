using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer;

namespace PHASCO_WEB.UI
{
    public partial class Freindlist : System.Web.UI.UserControl
    {
        TBL_User_Friends da_fr = new TBL_User_Friends();

        DataTable dt = new DataTable();
        DataTable dt_data = new DataTable();
        DataRow dr = null;
        const int Pagesize_ = 24;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetInitialRow();
            }
        }

        private void SetInitialRow()
        {
            int id = 0;
            try
            { id = int.Parse(Request.QueryString["id"].ToString()); }
            catch (Exception) { }

            try
            {
                if (Request.QueryString["freid"] != null)
                {
                    int fid_ = int.Parse(Request.QueryString["freid"].ToString());
                    int uid_ = int.Parse(Request.QueryString["id"].ToString());
                    da_fr.Insert_del_update(15, uid_, fid_);
                }
            }
            catch (Exception) { }

            int page_ = int.Parse(da_fr.Insert_del_update(13, id).Rows[0][0].ToString());
            if (page_ > 24)
            { HiddenFieldCount.Value = (page_ / 24).ToString(); HiddenFieldCurrentpage.Value = "1"; btt_MoreView.Visible = true; }
            else
				btt_MoreView.Visible = false;
            dt_data = da_fr.Insert_del_update(14, id, "1", Pagesize_.ToString(), Pagesize_.ToString());

            dt.Columns.Add(new DataColumn("smp", typeof(string)));

            for (int i = 0; i < dt_data.Rows.Count; i++)
            {
                dr = dt.NewRow();
                dr["smp"] = FrameSet(dt_data.Rows[i]["id"].ToString(), dt_data.Rows[i]["uid"].ToString(),
                    dt_data.Rows[i]["Image"].ToString(), dt_data.Rows[i]["sex"].ToString(),
                    dt_data.Rows[i]["name"].ToString() + "  " + dt_data.Rows[i]["Famil"].ToString());
                dt.Rows.Add(dr);
            }

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected string FrameSet(string id, string Uid, string Image, string sex, string name)
        {


            string body = "<div class='col-md-2 col-xs-6'><div class='staff-post'><div class='staff-post-content'><h5>";
            body += "<a class='menu' href='UserProfile.aspx?id=" + id + "'>" + Uid + "</a></h5>";
            body += "<span><a class='menu' href='UserProfile.aspx?id=" + id + "'>" + name + "</a></span></div>";

            body += "<div class='staff-post-gal'>";
            body += "<ul class='staf-social'>";
            body += "<li>" + addfriend(id) + "<li></ul>";
            body += "<a href='UserProfile.aspx?id=" + id + "' ><img src='" + Images(int.Parse(Image), int.Parse(id), int.Parse(sex)) + "' /></a></div></div></div>";
            //  body += "<div style='color:silver'>" + name + "</div> " +  + "</td>";

            return body;
        }

        protected void ImageButtonOtherRow_Click(object sender, ImageClickEventArgs e)
        {
            //int totalpage = int.Parse(HiddenFieldCount.Value);
            //int Currentpage = int.Parse(HiddenFieldCurrentpage.Value);
            //int id = 0;
            //try
            //{ id = int.Parse(Request.QueryString["id"].ToString()); }
            //catch (Exception) { }

            //if (totalpage > Currentpage)
            //{

            //    TBL_User_Friends da_fr = new TBL_User_Friends();
            //    DataTable dt_data = new DataTable();
            //    // add page counter
            //    Currentpage += 1;
            //    HiddenFieldCurrentpage.Value = Currentpage.ToString();
            //    int endpage = Currentpage * Pagesize_;
            //    int startpage = endpage - Pagesize_;
            //    dt_data = da_fr.Insert_del_update(14, id, startpage.ToString(), endpage.ToString(), Pagesize_.ToString());

            //    var previousRows = DataList1.Items.Cast<RepeaterItem>().Select(a => new
            //    {
            //        smp = ((Literal)a.FindControl("Literial_Ids")).Text
            //    }).ToList();
            //    for (int i = 0; i < dt_data.Rows.Count; i++)
            //    {
            //        //Add blank row  
            //        previousRows.Add(new
            //        {
            //            smp = FrameSet(dt_data.Rows[i]["id"].ToString(), dt_data.Rows[i]["uid"].ToString(),
            //                dt_data.Rows[i]["Image"].ToString(), dt_data.Rows[i]["sex"].ToString(),
            //                  dt_data.Rows[i]["name"].ToString() + "  " + dt_data.Rows[i]["Famil"].ToString())
            //        });
            //    }
            //    DataList1.DataSource = previousRows;
            //    DataList1.DataBind();
            //}
            //else ImageButtonOtherRow.Visible = false;


        }

        public string addfriend(string id)
        {
            if (System.IO.Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath) == "myhome")

                return "<a class='DeleteLink dislike-color' title='حذف دوست' href='myhome.aspx?&mode=all-cat&id=" + Request.QueryString["id"].ToString() + "&freid=" + id + "' onclick=\"return confirm('آیا برای حذف اطمینان دارید');\"><i class='fa fa-times'></i></a>";

            if (Membership_Manage.UserOnline.User_Online_Valid() == true)
            {
                if (Request.QueryString["mode"] != null)
                    return "<a class='like-color'  href='UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=" + Request.QueryString["mode"].ToString() + "&userid=" + id + "'><i class='fa fa-times text-plus'></i></a>";
                else
                    return "<a class='like-color' href='UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&userid=" + id + "'><i class='fa fa-times text-plus'></i></a>";
            }
            else return "<img src='images/addtolist_offline.png'  />";

        }

        public string Images(int Image, int id, int sex)
        {
            if (Image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + id.ToString() + ".jpg";
            if (sex == 0) return "/images/Nopic_male.png";
            else if (sex == 1) return "/images/Nopic_female.png";
            return "/images/Nopic_female.png";
        }
 

		protected void btt_MoreView_Click(object sender, EventArgs e)
		{
			int totalpage = int.Parse(HiddenFieldCount.Value);
			int Currentpage = int.Parse(HiddenFieldCurrentpage.Value);
			int id = 0;
			try
			{ id = int.Parse(Request.QueryString["id"].ToString()); }
			catch (Exception) { }

			if (totalpage > Currentpage)
			{

				TBL_User_Friends da_fr = new TBL_User_Friends();
				DataTable dt_data = new DataTable();
				// add page counter
				Currentpage += 1;
				HiddenFieldCurrentpage.Value = Currentpage.ToString();
				int endpage = Currentpage * Pagesize_;
				int startpage = endpage - Pagesize_;
				dt_data = da_fr.Insert_del_update(14, id, startpage.ToString(), endpage.ToString(), Pagesize_.ToString());

				var previousRows = DataList1.Items.Cast<RepeaterItem>().Select(a => new
				{
					smp = ((Literal)a.FindControl("Literial_Ids")).Text
				}).ToList();
				for (int i = 0; i < dt_data.Rows.Count; i++)
				{
					//Add blank row  
					previousRows.Add(new
					{
						smp = FrameSet(dt_data.Rows[i]["id"].ToString(), dt_data.Rows[i]["uid"].ToString(),
							dt_data.Rows[i]["Image"].ToString(), dt_data.Rows[i]["sex"].ToString(),
							  dt_data.Rows[i]["name"].ToString() + "  " + dt_data.Rows[i]["Famil"].ToString())
					});
				}
				DataList1.DataSource = previousRows;
				DataList1.DataBind();
			}
			else btt_MoreView.Visible = false;

		}
	}
}