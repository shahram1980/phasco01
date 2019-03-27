

using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;



namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_FieldsTable 
    {

        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TBL_Phasco_OnlineTest_Fields_I(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Fields_I", parm);
            return dt;
        }
        //
        public DataTable TBL_Phasco_OnlineTest_Fields_I(int OperationType, int GroupID)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@GroupID", SqlDbType.Int, GroupID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Fields_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Fields_I(int OperationType, string FieldName, int GroupID)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@FieldName", SqlDbType.NVarChar, FieldName, null);
            parm[2] = Dal.MakeParam("@GroupID", SqlDbType.Int, GroupID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Fields_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Fields_D(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Fields_D", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Fields_U(int OperationType, int id, string FieldName)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = Dal.MakeParam("@FieldName", SqlDbType.NVarChar, FieldName, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Fields_U", parm);
            return dt;
        }
    }
}