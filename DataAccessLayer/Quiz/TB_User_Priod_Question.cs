using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Quiz
{
   public class TB_User_Priod_Question
    {
        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TB_User_Priod_Question_SP(string Mode, int UserID, int QID, int Period)
        {
            SqlParameter[] parm = new SqlParameter[4];
            parm[0] = Dal.MakeParam("@Mode", SqlDbType.NVarChar, Mode, null);
            parm[1] = Dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            parm[2] = Dal.MakeParam("@QID", SqlDbType.Int, QID, null);
            parm[3] = Dal.MakeParam("@Period", SqlDbType.Int, Period, null);

            dt = Dal.ExecSpDt("TB_User_Priod_Question_SP", parm);
            return dt;
        }
    }
}
