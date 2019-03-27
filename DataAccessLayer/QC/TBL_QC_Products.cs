using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;
namespace DAL
{
    public class TBL_QC_Products
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_QC_Products_SP(int Mode,System.Int32 ID, System.Int32 BrandID, System.String ProductName, System.Int32 TestStatus
        )
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@ID", SqlDbType.Int, ID, null);
            param[1] = dal.MakeParam("@BrandID", SqlDbType.Int, BrandID, null);
            param[2] = dal.MakeParam("@ProductName", SqlDbType.NVarChar, ProductName, null);
            param[3] = dal.MakeParam("@TestStatus", SqlDbType.Int, TestStatus, null);
            param[4] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);

            dt = dal.ExecSpDt("TBL_QC_Products_SP ", param);
            return dt;
        }
    }
}
