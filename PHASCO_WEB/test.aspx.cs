using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class test : System.Web.UI.Page
    {
        TBL_User_Friends da_fr = new TBL_User_Friends();

            DataTable dt = new DataTable();
            DataTable dt_data = new DataTable();
            DataRow dr = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetInitialRow();
            }
        }

        private void SetInitialRow()
        {
    

            int page_ = int.Parse(da_fr.Insert_del_update(13, 49164).Rows[0][0].ToString());
            if (page_ > 20)
            { HiddenFieldCount.Value = (page_ / 20).ToString(); HiddenFieldCurrentpage.Value = "1"; btnAddOtherRow.Visible = true; }
            else
                btnAddOtherRow.Visible = false;
            dt_data = da_fr.Insert_del_update(14, 49164, "1", "20", "20");

            dt.Columns.Add(new DataColumn("smp", typeof(string)));

            for (int i = 0; i < dt_data.Rows.Count; i++)
            {
                dr = dt.NewRow();
                dr["smp"] = FrameSet(dt_data.Rows[i]["id"].ToString(), dt_data.Rows[i]["uid"].ToString(),
                    dt_data.Rows[i]["Image"].ToString(), dt_data.Rows[i]["sex"].ToString(),
                    dt_data.Rows[i]["name"].ToString() + "  " + dt_data.Rows[i]["Famil"].ToString());
                dt.Rows.Add(dr);
            }
            //GridView2.DataSource = dt;
            //GridView2.DataBind();

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected string FrameSet(string id, string Uid, string Image, string sex, string name)
        {
            //string body = "<table id='table18' border='2' bordercolor='#CCC1A7' onmouseout='this.style.backgroundColor='#f3e5ca';' ";
            //body += "onmouseover='this.style.backgroundColor='#CCC1A7';' style='border-collapse: collapse'";
            //body += "width='66'><tr><td><table id='table19' border='0' style='border-collapse: collapse; height: 80px;'width='100%'><tr><td align='center' style='height: 40px' valign='middle'> ";
            //body += "<a href='UserProfile.aspx?id=" + id + "'>";
            //body += "<img src='" + Images(int.Parse(Image), int.Parse(id), int.Parse(sex)) + "' style='width: 50px;' /></a></td></tr><tr><td style='text-align: center; height: 15px; background-color: #e3d6bd;' valign='top'> ";
            //body += "<div style='word-wrap: break-word; width: 80px;'> ";
            //body += "<a class='menu' href='UserProfile.aspx?id=" + id + "'>";
            //body += Uid;
            //body += "</a> ";
            //body += "</div></td></tr><tr><td style='text-align: center; height: 10px' valign='top'> ";
            //body += addfriend(id);
            //body += "</td></tr></table></td></tr></table>";



string body = "<table style='' class='UserFreindListTable'>";
body += "<tr><td class='UserFreindListPic'><div style='word-wrap: break-word; width: 125px;'><a href='UserProfile.aspx?id=" + id + "'>" + Uid + "</a></div>";
body += "<div style='color:silver'>" + name + "</div> "+addfriend(id)+"</td>";
body += "<td class='UserFreindListPic'><img src='"+Images(int.Parse(Image), int.Parse(id), int.Parse(sex))+"' height='145' width='127'/></td></tr></table>";

            return body;
        }

        protected void btnAddOtherRow_Click(object sender, EventArgs e)
        {
            int totalpage = int.Parse(HiddenFieldCount.Value);
            int Currentpage = int.Parse(HiddenFieldCurrentpage.Value);


            if (totalpage > Currentpage)
            {

                TBL_User_Friends da_fr = new TBL_User_Friends();
                DataTable dt_data = new DataTable();
                // add page counter
                Currentpage += 1;
                HiddenFieldCurrentpage.Value = Currentpage.ToString();
                int endpage = Currentpage * 20;
                int startpage = endpage - 20;
                dt_data = da_fr.Insert_del_update(14, 49164, startpage.ToString(), endpage.ToString(), "20");

                var previousRows = DataList1.Items.Cast<DataListItem>().Select(a => new
                {
                    smp = ((Literal)a.FindControl("Literial_Ids")).Text
                }).ToList();
                for (int i = 11; i < dt_data.Rows.Count; i++)
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
            else btnAddOtherRow.Visible = false;


            //var previousRows = GridView2.Rows.Cast<GridViewRow>().Select(a => new
            //{

            //    smp = ((Literal)a.FindControl("Literial_Id")).Text
            //}).ToList();
            //for (int i = 11; i < 20; i++)
            //{
            //    //Add blank row  
            //    previousRows.Add(new { smp = "test***" + i.ToString() });
            //}
            //GridView2.DataSource = previousRows;
            //GridView2.DataBind();

        }

        public string addfriend(string id)
        {
            if (Membership_Manage.UserOnline.User_Online_Valid() == true)
            {
                if (Request.QueryString["mode"] != null)
                    return "<a href='UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=" + Request.QueryString["mode"].ToString() + "&userid=" + id + "'><img src='images/addtolist.png'  /></a>";
                else
                    return "<a href='UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&userid=" + id + "'><img src='images/addtolist.png'  /></a>";
            }
            else return "<img src='images/addtolist_offline.png'  />";
            return "<img src='images/addtolist_offline.png'  />";
        }

        public string Images(int Image, int id, int sex)
        {

            if (Image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + id.ToString() + ".jpg";
            if (sex == 0) return "/images/Nopic_male.png";
            else if (sex == 1) return "/images/Nopic_female.jpg";
            return "/images/Nopic_female.jpg";

        }

    }
}