using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using DataAccessLayer;

namespace Rahbina.Administrator.Job
{
    public partial class View_delete_newsPaperADs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["status"] == null)
            {
                GetAll_NewsPaperAds();
                MultiView1.ActiveViewIndex = 0;
            }
            else if (Request["status"] != null)
            {
                   MultiView1.ActiveViewIndex =1;
                   if (Request["status"] == "delete")
                   {
                       int id = int.Parse(Request["id"].ToString());
                       TBL_Job_NewsPaper_AD delete_AD = new TBL_Job_NewsPaper_AD();
                       DataTable dt = delete_AD.TBL_Job_NewsPaper_AD_SP("delete_AD", id);
                       //deleting related picture file
                       string filePath = "~/job/newsPaperAd_images/" + dt.Rows[0]["_FileName"].ToString();
                       File.Delete(MapPath(filePath));

                       Label_report.Text = "آگهي مورد نظر و مشاغل زيرگروه آن حذف شد";
                       MultiView1.ActiveViewIndex = 1;
                       HyperLink_return.Text = "بازگشت";
                       HyperLink_return.NavigateUrl = "View_delete_newsPaperADs.aspx";
                   }
            }
        }
        protected void GetAll_NewsPaperAds()
        {
            TBL_Job_NewsPaper_AD GetAllAds = new TBL_Job_NewsPaper_AD();
            DataTable dt = GetAllAds.TBL_Job_NewsPaper_AD_SP("GetAllAds");
            GridView_NewsPaperAds.DataSource = dt;
            GridView_NewsPaperAds.DataBind();
        }
        public string Set_OptionsUrl(object id)
        {
            return "<a href=../job/View_delete_newsPaperADs.aspx?status=delete&id=" + id.ToString() + " onclick='return deleteConfirm()' >حذف<a/>" + " | " + "<a href=../job/insertNewspaperAD.aspx?from=viewing&Ad_ID=" + id.ToString() + " >مشاغل زير گروه<a/>"; ;
        }
        public string GetfarsiDate(object date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
    }
}
