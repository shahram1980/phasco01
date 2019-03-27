using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Video
{
  public  class tblVideo_Comment
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable tblVideo_Comment_SP(int Mode,  int Id,int VideoId,int Uid,string Comment)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);
            param[2] = dal.MakeParam("@VideoId", SqlDbType.Int, VideoId, null);

            param[3] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[4] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);
            dt = dal.ExecSpDt("tblVideo_Comment_SP", param);
            return dt;

        }
        public DataTable tblVideo_Comment_SP(int Mode, int Id, int VideoId, int Uid, string Comment, int UserScore)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[6];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);
            param[2] = dal.MakeParam("@VideoId", SqlDbType.Int, VideoId, null);

            param[3] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[4] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);
            param[5] = dal.MakeParam("@UserScore", SqlDbType.Int, UserScore, null);

            
            dt = dal.ExecSpDt("tblVideo_Comment_SP", param);

            return dt;

        }

        public DataTable tblVideo_Comment_SP(int Mode, int Id )
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);
    
            dt = dal.ExecSpDt("tblVideo_Comment_SP", param);
            return dt;

        }
    }
}
