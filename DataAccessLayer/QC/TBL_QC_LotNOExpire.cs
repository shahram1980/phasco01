using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;
namespace DAL
{
    public class TBL_QC_LotNOExpire
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_QC_LotNOExpire_SP(int Mode, System.Int32 ID, System.Int32 ProductID, System.DateTime Expire, System.String LotNO
        )
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@ID", SqlDbType.Int, ID, null);
            param[1] = dal.MakeParam("@ProductID", SqlDbType.Int, ProductID, null);
            param[2] = dal.MakeParam("@Expire", SqlDbType.DateTime, Expire, null);
            param[3] = dal.MakeParam("@LotNO", SqlDbType.NVarChar, LotNO, null);
            param[4] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);

            dt = dal.ExecSpDt("TBL_QC_LotNOExpire_SP ", param);
            return dt;
        }
    }
}
