using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Video
{
    public class tblVideo
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable tblVideo_SP(int Mode, int VideoID, int CategorieID, int UserID, string VideoFilename, string VideoPhotoname,
            string VideoName, string VideoDescription, string VideoTag, DateTime VideoUploadDate, int VideoVisit, int Status)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[12];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@VideoID", SqlDbType.Int, VideoID, null);
            param[2] = dal.MakeParam("@CategorieID", SqlDbType.Int, CategorieID, null);

            param[3] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            param[4] = dal.MakeParam("@VideoFilename", SqlDbType.NVarChar, VideoFilename, null);
            param[5] = dal.MakeParam("@VideoPhotoname", SqlDbType.NVarChar, VideoPhotoname, null);
            param[6] = dal.MakeParam("@VideoName", SqlDbType.NVarChar, VideoName, null);
            param[7] = dal.MakeParam("@VideoDescription", SqlDbType.NVarChar, VideoDescription, null);

            param[8] = dal.MakeParam("@VideoTag", SqlDbType.NVarChar, VideoTag, null);
            param[9] = dal.MakeParam("@VideoUploadDate", SqlDbType.DateTime, VideoUploadDate, null);

            param[10] = dal.MakeParam("@VideoVisit", SqlDbType.Int, VideoVisit, null);
            param[11] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            dt = dal.ExecSpDt("tblVideo_SP", param);
            return dt;
        }

        public DataTable tblVideo_SP(int Mode, int VideoID, int CategorieID, int UserID, string VideoFilename, string VideoPhotoname,
    string VideoName, string VideoDescription, string VideoTag, DateTime VideoUploadDate, int VideoVisit, int Status,int UserPoint)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[13];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@VideoID", SqlDbType.Int, VideoID, null);
            param[2] = dal.MakeParam("@CategorieID", SqlDbType.Int, CategorieID, null);

            param[3] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            param[4] = dal.MakeParam("@VideoFilename", SqlDbType.NVarChar, VideoFilename, null);
            param[5] = dal.MakeParam("@VideoPhotoname", SqlDbType.NVarChar, VideoPhotoname, null);
            param[6] = dal.MakeParam("@VideoName", SqlDbType.NVarChar, VideoName, null);
            param[7] = dal.MakeParam("@VideoDescription", SqlDbType.NVarChar, VideoDescription, null);

            param[8] = dal.MakeParam("@VideoTag", SqlDbType.NVarChar, VideoTag, null);
            param[9] = dal.MakeParam("@VideoUploadDate", SqlDbType.DateTime, VideoUploadDate, null);

            param[10] = dal.MakeParam("@VideoVisit", SqlDbType.Int, VideoVisit, null);
            param[11] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            param[12] = dal.MakeParam("@UserPoint", SqlDbType.Int, UserPoint, null);

            
            dt = dal.ExecSpDt("tblVideo_SP", param);
            return dt;
        }

        public DataTable tblVideo_SP(int Mode)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[1];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);

            dt = dal.ExecSpDt("tblVideo_SP", param);
            return dt;
        }

        public DataTable Video_Search_SP(int Mode, string String, int startPage, int endPage, int  pagesize)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@String", SqlDbType.NVarChar, String, null);
            param[2] = dal.MakeParam("@startPage", SqlDbType.Int, startPage, null);
            param[3] = dal.MakeParam("@endPage", SqlDbType.Int, endPage, null);
            param[4] = dal.MakeParam("@pagesize", SqlDbType.Int, pagesize, null);
            dt = dal.ExecSpDt("Video_Search_SP", param);
            return dt;
        }


        public DataTable Video_Paging_SP(int Mode,  int startPage, int endPage, int pagesize)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@startPage", SqlDbType.Int, startPage, null);
            param[2] = dal.MakeParam("@endPage", SqlDbType.Int, endPage, null);
            param[3] = dal.MakeParam("@pagesize", SqlDbType.Int, pagesize, null);

            dt = dal.ExecSpDt("Video_Paging_SP", param);
            return dt;
        }
    }
}
