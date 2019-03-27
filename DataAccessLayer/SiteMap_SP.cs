using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class SiteMap_SP
    {

        DataTable dt = new DataTable();


        public DataTable GetSiteMapContent_News_MainDB(int Mode)
        {
            DAL_Main dal = new DAL_Main();
            dt = dal.Exec_Cmd("SELECT TOP 10000 [Id],[Title] FROM [dbo].[News] where [News_Mode] = 2 order by id desc");
            return dt;
        }

        public DataTable GetSiteMapContent_Users_MainDB(int Mode)
        {
            DAL_Main dal = new DAL_Main();
            dt = dal.Exec_Cmd("SELECT  TOP 10000 [Id],([Uid]+' '+[Name]+ ' '+[Famil]) as title FROM  [dbo].[Users]");
            return dt;
        }

        public DataTable GetSiteMapContent_FAQS_MainDB(int Mode)
        {
            DAL_Main dal = new DAL_Main();
            dt = dal.Exec_Cmd("SELECT  TOP 10000 [id],[subid],[ans_Id],[title] FROM  [dbo].[FAQ]  order by id desc");
            return dt;
        }



        public DataTable GetSiteMapContent_Users_Blog_MainDB(int Mode)
        {
            DAL_Main dal = new DAL_Main();
            dt = dal.Exec_Cmd(" SELECT  TOP 10000  [Id] ,[Title] FROM [dbo].[Users_Blog] order by id desc");
            return dt;
        }


        public DataTable GetSiteMapContent_Article_ArtDB(int Mode)
        {
            DAL_ART dal = new DAL_ART();

            dt = dal.Exec_Cmd("SELECT  TOP 5000  [Id] ,[SubJect] as Title  FROM [dbo].[Tractate_Text] order by id desc");
            return dt;
        }

        public DataTable GetSiteMapContent_Quiz_QuizDB(int Mode)
        {
            DAL_Quiz dal = new DAL_Quiz();
            dt = dal.Exec_Cmd("SELECT   TOP 1000  [id], [QuizTitle] as Title  FROM  [dbo].[TBL_Phasco_OnlineTest_Quiz] order by id desc");
            return dt;
        }

        public DataTable GetSiteMapContent_LabDirectory_QuizDB(int Mode)
        {
            BaseDAL_Dir dal = new BaseDAL_Dir();
            dt = dal.Exec_Cmd("SELECT   TOP 1000  [autoid] as id , [Name] as title   FROM [dbo].[T_Restaurant] where [AllowView] = 1 ");
            return dt;
        }

        public DataTable GetSiteMapContent_Company_QuizDB(int Mode)
        {
            BaseDAL_Dir dal = new BaseDAL_Dir();
            dt = dal.Exec_Cmd("SELECT   TOP 1000  [autoid] as id , [Name] as title   FROM [dbo].TBL_Co_Properties where [AllowView] = 1 ");
            return dt;
        }

        public DataTable GetSiteMapContent_VideoDB(int Mode)
        {
            DAL_Main dal = new DAL_Main();
            dt = dal.Exec_Cmd("SELECT   TOP 1000  [VideoID] ,[VideoName] FROM [dbo].[tblVideo] where [Status] = 1 order by [VideoID] desc ");
            return dt;
        }

        public DataTable GetSiteMapContent_AtlasDB(int Mode)
        {
            DAL_ART dal = new DAL_ART();
            dt = dal.Exec_Cmd("SELECT   TOP 1000   [ID]  ,[Title] FROM [dbo].[T_Atlas]  order by [ID] desc ");
            return dt;
        }
         

    }
}
