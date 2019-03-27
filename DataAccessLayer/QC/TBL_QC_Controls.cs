using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;
namespace DAL
{
    public class TBL_QC_Controls
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_QC_Controls_SP(int Mode, System.Int32 id, System.Int32 LotExprID, 
            System.String level_1_Low, System.String level_2_Low, System.String level_3_Low, 
            System.String level_4_Low, System.String level_1_High, System.String level_2_High, 
            System.String level_3_High, System.String level_4_High)
        {
            SqlParameter[] param = new SqlParameter[11];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@LotExprID", SqlDbType.Int, LotExprID, null);
            param[2] = dal.MakeParam("@level_1_Low", SqlDbType.NVarChar, level_1_Low, null);
            param[3] = dal.MakeParam("@level_2_Low", SqlDbType.NVarChar, level_2_Low, null);
            param[4] = dal.MakeParam("@level_3_Low", SqlDbType.NVarChar, level_3_Low, null);
            param[5] = dal.MakeParam("@level_4_Low", SqlDbType.NVarChar, level_4_Low, null);
            param[6] = dal.MakeParam("@level_1_High", SqlDbType.NVarChar, level_1_High, null);
            param[7] = dal.MakeParam("@level_2_High", SqlDbType.NVarChar, level_2_High, null);
            param[8] = dal.MakeParam("@level_3_High", SqlDbType.NVarChar, level_3_High, null);
            param[9] = dal.MakeParam("@level_4_High", SqlDbType.NVarChar, level_4_High, null);
            param[10] = dal.MakeParam("@Mode", SqlDbType.NVarChar, Mode, null);

            dt = dal.ExecSpDt("TBL_QC_Controls_SP ", param);
            return dt;
        }

        public DataTable TBL_QC_Controls_SP(int Mode, System.Int32 id )
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@Mode", SqlDbType.NVarChar, Mode, null);

            dt = dal.ExecSpDt("TBL_QC_Controls_SP ", param);
            return dt;
        }
    }
}
