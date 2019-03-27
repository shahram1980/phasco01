using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer
{
    public class Tbl_state
    {
        BaseDAL_Dir dal = new BaseDAL_Dir();
        DataTable dt = new DataTable();

        public DataTable T_state_Tra(string Mode, int id, string Satate, int region, string StateEN)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@region", SqlDbType.Int, region, null);
            param[3] = dal.MakeParam("@Satate", SqlDbType.NVarChar, Satate, null);
            param[4] = dal.MakeParam("@StateEN", SqlDbType.NVarChar, StateEN, null);
            return dal.ExecSpDt("T_state_Tra", param);
        }
    }
}