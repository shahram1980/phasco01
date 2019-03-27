using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class TBL_PasTime_Theme_Rate
    {
          DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_PasTime_Theme_Rate_SP(int operationType, int UserID, string RateType, int ThemeID)
        {
            SqlParameter[] parm = new SqlParameter[4];
            parm[0] = dal.MakeParam("@operationType", SqlDbType.Int,operationType , null);
            parm[1] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            parm[2] = dal.MakeParam("@RateType", SqlDbType.VarChar,RateType , null);
            parm[3] = dal.MakeParam("@ThemeID", SqlDbType.Int, ThemeID, null);

            dt = dal.ExecSpDt("TBL_PasTime_Theme_Rate_SP", parm);
            return dt;
        }
    }
}
