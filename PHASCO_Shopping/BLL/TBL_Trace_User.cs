using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using PHASCO_Shopping.DAL;
using System.Data.SqlClient;

namespace PHASCO_Shopping.BLL
{
    public class TBL_Trace_User
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();
        public DataTable TBL_Trace_User_SP(int id, string mode, int Uid, int Pid)
        {
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@Pid", SqlDbType.Int, Pid, null);
 
            dt = dal.ExecSpDt("TBL_Trace_User_SP", param);
            return dt;
        }

    }
}