using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;
namespace DAL
{
    public class TBL_QC_Products_QuantitativeTst
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_QC_Products_QuantitativeTst_SP(int Mode, System.Int32 ID, System.Int32 LotExprID, System.String Standards, System.Double StandardRange, System.String Unit, System.String Formula, System.String Specifications_Low, System.String Specifications_High, System.String PHASCO_OD, System.String Company_OD
        )
        {
            SqlParameter[] param = new SqlParameter[11];
            param[0] = dal.MakeParam("@ID", SqlDbType.Int, ID, null);
            param[1] = dal.MakeParam("@LotExprID", SqlDbType.Int, LotExprID, null);
            param[2] = dal.MakeParam("@Standards", SqlDbType.NVarChar, Standards, null);
            param[3] = dal.MakeParam("@StandardRange", SqlDbType.Float, StandardRange, null);
            param[4] = dal.MakeParam("@Unit", SqlDbType.NVarChar, Unit, null);
            param[5] = dal.MakeParam("@Formula", SqlDbType.NVarChar, Formula, null);
            param[6] = dal.MakeParam("@Specifications_Low", SqlDbType.NVarChar, Specifications_Low, null);
            param[7] = dal.MakeParam("@Specifications_High", SqlDbType.NVarChar, Specifications_High, null);
            param[8] = dal.MakeParam("@PHASCO_OD", SqlDbType.NVarChar, PHASCO_OD, null);
            param[9] = dal.MakeParam("@Company_OD", SqlDbType.NVarChar, Company_OD, null);
            param[10] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);
            
            dt = dal.ExecSpDt("TBL_QC_Products_QuantitativeTst_SP ", param);
            return dt;
        }

        public DataTable TBL_QC_Products_QuantitativeTst_SP(int Mode, System.Int32 ID)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@ID", SqlDbType.Int, ID, null);
            param[1] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);

            dt = dal.ExecSpDt("TBL_QC_Products_QuantitativeTst_SP ", param);
            return dt;
        }
    }
}
