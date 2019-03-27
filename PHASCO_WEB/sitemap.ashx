<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using SitemapLib;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        SitemapLib.Sitemap sitemap = new SitemapLib.Sitemap();
        DataAccessLayer.SiteMap_SP daSitemap = new DataAccessLayer.SiteMap_SP();
        System.Data.DataTable dt = new System.Data.DataTable();
        // News url //
        dt = daSitemap.GetSiteMapContent_News_MainDB(1);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/News.aspx?News_Id=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily); 
        }
        // News url //

        // FAQ url //
        dt = daSitemap.GetSiteMapContent_FAQS_MainDB(1);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://phasco.com/faq.aspx?subid=" + dt.Rows[i]["subid"].ToString() + "&mode=quview&id=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
        // FAQ url //
        
        // weblog url //
        dt = daSitemap.GetSiteMapContent_Users_Blog_MainDB(2);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/Wblog.aspx?Bid=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
        // weblog url //    

        // Article url //
        dt = daSitemap.GetSiteMapContent_Article_ArtDB(3);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/Article.aspx?Detailsid=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
        // Article url //     

        // Question url //
        dt = daSitemap.GetSiteMapContent_Quiz_QuizDB(3);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/QuestionsBank.aspx?mode=QuestionsDetails&QuestionID=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
       // Question url //    


        // LabDirectory url //
        dt = daSitemap.GetSiteMapContent_LabDirectory_QuizDB(3);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/LabDirectory.aspx?lid=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
        // LabDirectory url //    



        // CoDirectory url //
        dt = daSitemap.GetSiteMapContent_Company_QuizDB(3);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/CoDirectory.aspx?lid=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
        // CoDirectory url //    



        // Atlas url //
        dt = daSitemap.GetSiteMapContent_AtlasDB(3);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/SlideShow.aspx?img=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
        // Atlas url //   
        
        
        

        // UserProfile url //
        dt = daSitemap.GetSiteMapContent_Users_MainDB(3);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/UserProfile.aspx?id=" + dt.Rows[i]["id"].ToString() + "&t=" + dt.Rows[i]["Title"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily);
        }
        // UserProfile url //  
   
        
         // video url //
        dt = daSitemap.GetSiteMapContent_VideoDB(1);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sitemap.AddLocation("http://www.phasco.com/video/watch.aspx?Vid=" + dt.Rows[i]["VideoID"].ToString() + "&t=" + dt.Rows[i]["VideoName"].ToString(), DateTime.Today, "1.0", ChangeFrequency.Daily); 
        }
        // video url //
        
        
        sitemap.AddLocation("http://www.phasco.com/Default.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/Article.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/LabDirectory.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/news.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/atlas.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/quiz/makequiz.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/jobs.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/QuestionsBank.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/CoDirectory.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://www.phasco.com/webloglist.aspx", DateTime.Today, "1.0", ChangeFrequency.Daily);
        sitemap.AddLocation("http://phasco.com/QuestionsBank.aspx?mode=QuestionsDetails&QuestionID=1658", DateTime.Today, "1.0", ChangeFrequency.Daily);
        
        
        context.Response.ContentType = "text/xml";
        context.Response.Write(sitemap.GenerateSitemapXML());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
}