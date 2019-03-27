using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using PHASCO_WEB.DAL;
using PHASCO_WEB.DAL.DS_MainPhascoTableAdapters;
using OnlineTest.BLL;

namespace PHASCO_WEB
{
    public partial class Search : System.Web.UI.Page
    {

        public class SearchResult
        {
            public string Title { get; set; }
            public string Url { get; set; }
            public string Image { get; set; }
            public string Date { get; set; }

            public int Id { get; set; }

            public string UserName { get; set; }
            public int U_ID { get; set; }
            public string UserFirstName { get; set; }
            public string UserLastName { get; set; }

        }


        public string clean_text(string text)
        {
            return text.ToString().Replace(".", "").Replace("-", "");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack) return;
            string query = Request.QueryString["q"] ?? "";
            string searchType = Request.QueryString["s"];
            string author = Request.QueryString["a"];

            query = query.ToLower();
			try
			{
				var _articles = new ArticlesEntities();

				var articles = _articles.Tractate_Text
					.Where(c => (c.SubJect.ToLower().Contains(query)) && (searchType == "1" || searchType == "0"))
					.ToList()
					.Select(c => new SearchResult
					{
						Id = c.Id,
						Title = c.SubJect,
						Url = "/Article.aspx?Detailsid=" + c.Id.ToString(),
						Image = "",
						Date = Mss_Date(c.DateIns),
						U_ID = c.UID_ID == 0 ? 49164 : c.UID_ID.GetValueOrDefault()


					});

				DS_MainPhasco mainDs = new DS_MainPhasco();

				foreach (var article in articles)
				{
					var user = mainDs.Users.FirstOrDefault(c => c.Id == article.U_ID);
					if (user != null)
					{
						article.UserName = user.Uid;
						article.UserFirstName = user.Name;
						article.UserLastName = user.Famil;
					}
				}
				if (!string.IsNullOrEmpty(author))
				{
					articles = articles.Where(c => c.UserFirstName.ToLower().Contains(author) || c.UserLastName.ToLower().Contains(author) || (c.UserFirstName + " " + c.UserLastName).ToLower().Contains(author));
				}

				Article_RPT.DataSource = articles;
				Article_RPT.DataBind();

				Users_BlogTableAdapter blogTableAdaptor = new Users_BlogTableAdapter();
				DS_MainPhasco.Users_BlogDataTable usdt = new DS_MainPhasco.Users_BlogDataTable();

				blogTableAdaptor.Fill(usdt);

				var blogs = usdt.Where(c => (c.Title.ToLower().Contains(query))
				&& (searchType == "2" || searchType == "0"))
					 .Select(c => new SearchResult
					 {
						 Title = c.Title,
						 Id = c.Id,
						 Url = "/Wblog.aspx?OBid=" + c.Id,
						 Image = "",
						 Date = Mss_Date(c.DateIns),
						 U_ID = c.Uid,
						 UserName = c.Username,
						 UserFirstName = c.Name,
						 UserLastName = c.Famil,

					 });
				Blog_RPT.DataSource = blogs;
				Blog_RPT.DataBind();


				VideoTableAdapter videoTableAdaptor = new VideoTableAdapter();
				DS_MainPhasco.VideoDataTable vdt = new DS_MainPhasco.VideoDataTable();
				videoTableAdaptor.Fill(vdt);


				var videos = vdt.Where(c => (c.VideoName.ToLower().Contains(query) || c.VideoDescription.ToLower().Contains(query) || string.IsNullOrEmpty(query))
				&& (searchType == "3" || searchType == "0"))
					 .Select(c => new
					 {
						 Title = c.VideoName,
						 Id = c.VideoID,
						 Url = "/video/watch.aspx?Vid=" + c.VideoID,
						 Image = c.VideoPhotoname,
						 Date = Mss_Date(c.VideoUploadDate),
						 U_ID = c.UserID,
						 UserName = c.Uid,
						 UserFirstName = c.Name,
						 UserLastName = c.Famil,
						 VideoVisit = c.VideoVisit,
						 UserPoint = c.UserPoint

					 });

				DataList_Video.DataSource = videos;
				DataList_Video.DataBind();

				NewsTableAdapter newsTableAdaptor = new NewsTableAdapter();
				DS_MainPhasco.NewsDataTable ndt = new DS_MainPhasco.NewsDataTable();
				newsTableAdaptor.Fill(ndt);

				var news = ndt.Where(c => (c.Title.ToLower().Contains(query) || c.News.ToLower().Contains(query) || string.IsNullOrEmpty(query))
					&& (searchType == "4" || searchType == "0"))
					 .Select(c => new
					 {
						 Title = c.Title,
						 Id = c.Id,
						 //Url = "/News.aspx?News_Id=" + c.Id + "&t=" + clean_text(Eval("Title").ToString()),
						 Image = c.Image,
						 Date = Mss_Date(c.Date_Ins),
						 News = c.News,


					 })
					  .OrderByDescending(c => c.Date);




				Repeater_Spenews.DataSource = news;
				Repeater_Spenews.DataBind();





				var atlases = (from t in _articles.T_Atlas
							   join t1 in _articles.T_Atlas_Comment on t.ID equals t1.AtlasID
							   where (t.Title.ToLower().Contains(query) || t1.Comment.ToLower().Contains(query))
							   && (searchType == "5" || searchType == "0")


							   select new
							   {
								   t,
								   t1

							   }).ToList();

				var atl = atlases.Select(a => new
				{
					Title = a.t.Title,
					Id = a.t.ID,
					Date = Mss_Date(a.t.Date_Ins),
					a.t.Comment

				});


				DataList_Rand.DataSource = atl;
				DataList_Rand.DataBind();




				T_Lab_FormTableAdapter labTableAdaptor = new T_Lab_FormTableAdapter();
				DS_MainPhasco.T_Lab_FormDataTable ldt = new DS_MainPhasco.T_Lab_FormDataTable();

				labTableAdaptor.Fill(ldt);

				var labs = ldt.Where(c => (c.Name.ToLower().Contains(query) || c.tel.ToLower().Contains(query) || c.Website.ToLower().Contains(query) || c.Address.ToLower().Contains(query) || c.Manager.ToLower().Contains(query) || string.IsNullOrEmpty(query))
					&& (searchType == "6" || searchType == "0"))
					 .Select(c => new
					 {
						 Title = c.Name,
						 Id = c.id,
						 Address = c.Address,
						 Tel = c.tel,

					 });

				lab_Repeater.DataSource = labs;
				lab_Repeater.DataBind();

				UsersTableAdapter usersAdaptor = new UsersTableAdapter();

				DS_MainPhasco.UsersDataTable udt = new DS_MainPhasco.UsersDataTable();

				usersAdaptor.Fill(udt);

				var users = udt.Where(c => (c.Name.ToLower().Contains(query) || c.Uid.ToLower().Contains(query) || c.Famil.ToLower().Contains(query) || (c.Name + " " + c.Famil).ToLower().Contains(query))
				&& (searchType == "7" || searchType == "0"))
				 .Select(c => new
				 {
					 Id = c.Id,
					 UserName = c.Uid,
					 Name = c.Name,
					 LastName = c.Famil,
					 Image = c.Image,
					 Sex = c.Sex,
					 Point = c.Point,
				 });
				DataList_User.DataSource = users;
				DataList_User.DataBind();



				FAQTableAdapter faqDataAdaptor = new FAQTableAdapter();

				DS_MainPhasco.FAQDataTable fdt = new DS_MainPhasco.FAQDataTable();
				faqDataAdaptor.Fill(fdt);

				var faqs = fdt.Where(c => (c.text.ToLower().Contains(query) || c.title.ToLower().Contains(query))
				&& (searchType == "8" || searchType == "0"))
				 .Select(c => new
				 {

					 Count = c.ans_Count,
					 Title = c.title,
					 Date = Mss_Date(c.date),
					 Id = c.id,
					 c.sender_Id,
					 Text = c.text,
					 Ans_Id = c.ans_Id



				 });

				Repeater_FAQ.DataSource = faqs;
				Repeater_FAQ.DataBind();


				EmploymentTableAdapter employmentTableAdapter = new EmploymentTableAdapter();

				DS_MainPhasco.EmploymentDataTable edt = new DS_MainPhasco.EmploymentDataTable();
				employmentTableAdapter.Fill(edt);

				var employments = edt.Where(c => (c.Company_name.ToLower().Contains(query) || c.Description.ToLower().Contains(query) || c.explenation.ToLower().Contains(query)
				|| c.CategoryName1.ToLower().Contains(query) || c.CategoryName.ToLower().Contains(query))
				&& (searchType == "9" || searchType == "0"));



				Repeater_employmen.DataSource = employments;
				Repeater_employmen.DataBind();




				QuestionsTableAdapter questionsTableAdapter = new QuestionsTableAdapter();
				DS_MainPhasco.QuestionsDataTable qdt = new DS_MainPhasco.QuestionsDataTable();

				questionsTableAdapter.Fill(qdt);

				var questions = qdt.Where(c => (c.QuestionBody.ToLower().Contains(query) || c.LessonName.ToLower().Contains(query) || c.DegreeName.ToLower().Contains(query))
									  && (searchType == "10" || searchType == "0"));

				repQuestions.DataSource = questions;
				repQuestions.DataBind();


				isResult = videos.Count() > 0 || blogs.Count() > 0 || articles.Count() > 0 || news.Count() > 0 || atl.Count() > 0
					|| labs.Count() > 0 || users.Count() > 0 || faqs.Count() > 0 || employments.Count() > 0 || questions.Count() > 0;


				if (!isResult)
				{
					divresult.Visible = false;
				}
            }
            catch
            {

				divresult.Visible = false;
				isResult = false;
            }




        }
        public bool isResult { get; set; }
        public string Mss_Date(DateTime? date)
        {
            if (date.HasValue)
            {

                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(date.Value);

                return sunDate.Weekday.ToString();
            }
            return "";

        }
        public string Set_Url(string text, int id, string subid)
        {
            string ur = "<a class='read-more' href='faq.aspx?subid=" + subid + "&mode=quview&id=" + id.ToString() + "'> <i class='fa fa-reply'></i> پاسخ   </a>";

            return ur;
        }
        public string Set_User(int uid)
        {
            DataAccessLayer.User da = new DataAccessLayer.User();
            System.Data.DataTable dt;
            dt = da.GetUsers_Tra_DT("select_Item", uid);
            if (dt.Rows.Count > 0) { return "<a href='UserProfile.aspx?id=" + dt.Rows[0]["Id"].ToString() + "'>" + dt.Rows[0]["UID"].ToString() + "</a>"; }

            return "مدیر سایت";
        }
        public string shamsi_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            return sunDate.Weekday.ToString();
        }

        public string Images(int Image, int id, int sex)
        {
            if (Image == 1) return "phascoupfile/Userphoto/" + id.ToString() + ".jpg";
            if (sex == 0) return "phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "phascoupfile/Userphoto/Nopic_female.jpg";
            return "~/phascoupfile/Userphoto/Nopic_female.jpg";
        }
        public string get_category_name(object id)
        {
            if (int.Parse(id.ToString()) == 0) return "";
            DataAccessLayer.TBL_Job_Category getName = new DataAccessLayer.TBL_Job_Category();
            DataTable dt = getName.Select_categories("Get_category_name", int.Parse(id.ToString()));
            return dt.Rows[0]["CategoryName"].ToString();
        }
        public string GetfarsiDate(object eng_date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(eng_date.ToString());
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
    }


}