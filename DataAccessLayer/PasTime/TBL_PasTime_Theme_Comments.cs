using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_PasTime_Theme_Comments
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable SP_Theme_Comments(int OperationType, string condition)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);

            dt = dal.ExecSpDt("SP_Theme_Comments", parm);
            return dt;
        }
        public DataTable SP_Theme_Comments(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("SP_Theme_Comments", parm);
            return dt;
        }
        public DataTable SP_Theme_Comments(int OperationType, int id,bool status)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@status", SqlDbType.Bit, status, null);

            dt = dal.ExecSpDt("SP_Theme_Comments", parm);
            return dt;
        }
    }
}
