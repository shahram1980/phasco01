using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PHASCO_WEB.Template.UI
{
    public partial class SearchBox : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = Request.QueryString["q"];
            string st = Request.QueryString["s"];
            string author = Request.QueryString["a"];
			string sreachtext = "جستجو در تمامي موضوعات ";
            if (!IsPostBack)
            {

				txtSearch.Value = query;
				searchType.Value = st;

				if (Request.Url.LocalPath.Contains("news"))
				{
					searchType.Value = "4";
					sreachtext = "جستجو در اخبار";
				}
				if (Request.Url.LocalPath.Contains("atlas"))
				{
					searchType.Value = "5";
					sreachtext = "جستجو در اطلس ها";
				}
	
				if (Request.Url.LocalPath.Contains("LabDirectory"))
				{
					searchType.Value = "6";
					sreachtext = "جستجو در آزمایشگاه ها";

				}
				if (Request.Url.LocalPath.Contains("video"))
                {
                    searchType.Value = "3";
					sreachtext = "جستجو در ویدیوها";

				}
				if (Request.Url.LocalPath.ToLower().Contains("faq"))
                {
                    searchType.Value = "8";
					sreachtext = "جستجو در پرسش و پاسخ";


				}
				if (Request.Url.LocalPath.ToLower().Contains("job") || Request.Url.LocalPath.ToLower().Contains("employer"))
                {
                    searchType.Value = "9";
					sreachtext = "جستجو در كار و كاريابي";

				}
				if (Request.Url.LocalPath.ToLower().Contains("blog"))
                {
                    searchType.Value = "2";
					sreachtext = "جستجو در وب لاگ ها";

				}
				if (Request.Url.LocalPath.ToLower().Contains("question") || Request.Url.LocalPath.ToLower().Contains("makequiz") || Request.Url.LocalPath.ToLower().Contains("QuestionsBank"))
                {
                    searchType.Value = "10";
					sreachtext = "جستجو در بانک سوالات";

				}
				if (Request.Url.LocalPath.ToLower().Contains("article"))
                {
                    searchType.Value = "1";
					sreachtext = "جستجو در مقالات";

				}
				if (Request.Url.LocalPath.ToLower().Contains("user"))
                {
                    searchType.Value = "7";
					sreachtext = "جستجو در کاربران";

				}



				txtSearch.Attributes.Add("placeholder", sreachtext);

			}
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            Response.Redirect("/Search.aspx?q=" + txtSearch.Value + "&s=" + searchType.Value + "&a=");

        }
    }
}