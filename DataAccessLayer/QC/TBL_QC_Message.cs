using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;


namespace DAL
{
    public class TBL_QC_Message
    {
        DAL_Main dal =new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_QC_Message_SP(int Mode, System.Int32 id, System.String Code, System.String message, System.Int32 messageGroup
        , string ReasonCodeId)
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@Code", SqlDbType.VarChar, Code, null);
            param[2] = dal.MakeParam("@message", SqlDbType.NVarChar, message, null);
            param[3] = dal.MakeParam("@messageGroup", SqlDbType.Int, messageGroup, null);
            param[4] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);
            param[5] = dal.MakeParam("@ReasonCodeId", SqlDbType.NVarChar, ReasonCodeId, null);
            
            dt = dal.ExecSpDt("TBL_QC_Message_SP ", param);
            return dt;
        }

        public DataTable TBL_QC_Message_SP(int Mode)
        {
            SqlParameter[] param = new SqlParameter[1];
                param[0] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);
            dt = dal.ExecSpDt("TBL_QC_Message_SP ", param);
            return dt;
        }
    }
}
