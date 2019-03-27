using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
  public  class TBL_User_News
    {
        DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();

        public DataTable TBL_User_News_Tra(int id, string mode, int Uid, string Title, string news, bool IsActive, int status)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[7];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[4] = dal.MakeParam("@news", SqlDbType.NVarChar, news, null);
            param[5] = dal.MakeParam("@IsActive", SqlDbType.Bit, IsActive, null);
            param[6] = dal.MakeParam("@Status", SqlDbType.Int, status, null);

            dt = dal.ExecSpDt("TBL_User_News_Tra", param);
            return dt;
        }

        public DataTable TBL_User_News_Tra(string mode, int Uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, Uid, null);

            dt = dal.ExecSpDt("TBL_User_News_Tra", param);
            return dt;
        }

        public DataTable TBL_User_News_Tra(int id)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_id", null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("TBL_User_News_Tra", param);
            return dt;
        }
    }
}
