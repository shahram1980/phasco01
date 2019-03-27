using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_User_Rated_Archive
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_User_Rated_Archive_SP(int OperationType, int id, int uid, int Rated, int Period)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[5];

            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@uid", SqlDbType.Int, uid, null);
            param[3] = dal.MakeParam("@Rated", SqlDbType.Int, Rated, null);
            param[4] = dal.MakeParam("@Period", SqlDbType.Int, Period, null);
            dt = dal.ExecSpDt("TBL_User_Rated_Archive_SP", param);
            return dt;
        }
    }
}