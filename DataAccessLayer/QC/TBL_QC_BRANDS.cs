using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;


namespace DAL
{
    public class TBL_QC_BRANDS
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_QC_BRANDS_SP(int Mode, System.Int32 id, System.String Brand
        )
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@Brand", SqlDbType.NVarChar, Brand, null);
            param[2] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);

            dt = dal.ExecSpDt("TBL_QC_BRANDS_SP ", param);
            return dt;
        }
    }
}
