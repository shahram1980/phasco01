using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Quiz
{
    public class TBL_User_Daily
    {
        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TBL_User_Daily_SP(int OperationType, string QuizUId)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.NVarChar, OperationType, null);
            parm[1] = Dal.MakeParam("@QuizUId", SqlDbType.NVarChar, QuizUId, null);
            
            dt = Dal.ExecSpDt("TBL_User_Daily_SP", parm);
            return dt;
        }
    }
}
