using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PHASCO_Shopping.BLL;
using System.Data;

namespace PHASCO_Shopping.UC
{
    public partial class AdverTop : System.Web.UI.UserControl
    {
        DataTable dt = new DataTable();
        TBL_Advertise advertise = new TBL_Advertise();
        public string title { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {

                    dt = advertise.Tbl_Advertise(9, null, DateTime.Now, null, 0, DateTime.Now, 0, 0, 0, null, null, null, "position='left' and pagename='" + this.Page.Title + "'", null);
                    DataList_adver.DataSource = dt;
                    DataList_adver.DataBind();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        if (dt.Rows[i]["mode"].ToString() == "0")
                        {
                            if (Convert.ToDateTime(dt.Rows[i]["endDate"]) < DateTime.Now)
                            {
                                DataList_adver.Visible = false;
                            }
                            else
                            {
                                DataList_adver.Visible = true;
                                DataTable dt_adver = new DataTable();
                                dt_adver = advertise.Tbl_Advertise(10, null, DateTime.Now, null, 0, DateTime.Now, 0, 0, 0, null, null, null, null, null);
                                DataList_adver.DataSource = dt_adver;
                                DataList_adver.DataBind();
                            }

                        }

                        else if (dt.Rows[i]["mode"].ToString() == "2")
                        {
                            int load = Convert.ToInt32(dt.Rows[i]["load"]);

                            if (load > Convert.ToInt32(dt.Rows[i]["hit"]))
                                DataList_adver.Visible = false;

                            else
                            {
                                DataList_adver.Visible = true;
                                load = load + 1;
                                advertise.Tbl_Advertise(8, null, DateTime.Now, null, 0, DateTime.Now, int.Parse(dt.Rows[i]["id"].ToString()), 0, load, null, null, null, null, null);
                            }
                        }
                        else if (dt.Rows[0]["mode"].ToString() == "1")
                        {
                            int click = Convert.ToInt32(dt.Rows[i]["load"]);
                            //click = click + 1;
                            if (click > Convert.ToInt32(dt.Rows[i]["hit"]))
                                DataList_adver.Visible = false;
                            else
                            { DataList_adver.Visible = true; }


                        }
                    }
                }
            }
            catch(Exception ex)
            {
            }
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            try
            {

                dt = advertise.Tbl_Advertise(9, null, DateTime.Now, null, 0, DateTime.Now, 0, 0, 0, null, null, null, "position='top' and pagename='" + this.Page.Title + "'" + " " + "and id=" + Convert.ToString(e.CommandArgument), null);
                if (dt.Rows[0]["mode"].ToString() == "1")
                {
                    int load = Convert.ToInt32(dt.Rows[0]["load"]);
                    load = load + 1;
                    advertise.Tbl_Advertise(8, null, DateTime.Now, null, 0, DateTime.Now, Convert.ToInt32(e.CommandArgument), 0, load, null, null, null, null, null);
                }
            }
            catch
            {
            }
        }

       
    }
}