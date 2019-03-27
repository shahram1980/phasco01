using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;

namespace OnlineTest.BLL
{
    public class TBL_Phasco_OnlineTest_FieldsGroupTable
    {

        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TBL_Phasco_OnlineTest_FieldsGroup_I(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_FieldsGroup_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_FieldsGroup_I(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_FieldsGroup_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_FieldsGroup_I(int OperationType, string GroupName)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@GroupName", SqlDbType.NVarChar, GroupName, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_FieldsGroup_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_FieldsGroup_D(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_FieldsGroup_D", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_FieldsGroup_U(int OperationType, int id, string GroupName)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = Dal.MakeParam("@GroupName", SqlDbType.NVarChar, GroupName, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_FieldsGroup_U", parm);
            return dt;
        }

    }
}
