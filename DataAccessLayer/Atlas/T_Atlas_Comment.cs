using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Atlas
{
  public  class T_Atlas_Comment
    {
      DAL_ART dal = new DAL_ART();
        DataTable dt = new DataTable();

        public DataTable T_Atlas_Comment_SP(int Mode, int Id, int AtlasID, int Uid, string Comment)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);
            param[2] = dal.MakeParam("@AtlasID", SqlDbType.Int, AtlasID, null);

            param[3] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[4] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);
            dt = dal.ExecSpDt("T_Atlas_Comment_SP", param);
            return dt;

        }
        public DataTable T_Atlas_Comment_SP(int Mode, int Id, int AtlasID, int Uid, string Comment, int UserScore)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[6];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);
            param[2] = dal.MakeParam("@AtlasID", SqlDbType.Int, AtlasID, null);

            param[3] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[4] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);
            param[5] = dal.MakeParam("@UserScore", SqlDbType.Int, UserScore, null);


            dt = dal.ExecSpDt("T_Atlas_Comment_SP", param);

            return dt;

        }

        public DataTable T_Atlas_Comment_SP(int Mode, int Id)
        {
            DataTable dt;

            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);

            dt = dal.ExecSpDt("T_Atlas_Comment_SP", param);
            return dt;

        }
    }
}
