using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_PasTime_Interestig_Theme
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable SP_Interestig_Theme(int OperationType, string Status, int rate, int UserID, string title,
               DateTime InsertertionDate, int GroupID, string body)
        {
            SqlParameter[] parm = new SqlParameter[8];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@Status", SqlDbType.VarChar, Status, null);
            parm[2] = dal.MakeParam("@rate", SqlDbType.Int, rate, null);
            parm[3] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            parm[4] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);
            parm[5] = dal.MakeParam("@InsertertionDate", SqlDbType.DateTime, InsertertionDate, null);
            parm[6] = dal.MakeParam("@GroupID", SqlDbType.Int, GroupID, null);
            parm[7] = dal.MakeParam("@body", SqlDbType.NVarChar, body, null);

            dt = dal.ExecSpDt("SP_Interestig_Theme", parm);
            return dt;

        }
        public DataTable SP_Interestig_Theme(int OperationType, string condition)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);


            parm[1] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);


            dt = dal.ExecSpDt("SP_Interestig_Theme", parm);
            return dt;

        }
        public DataTable SP_Interestig_Theme(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);


            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);


            dt = dal.ExecSpDt("SP_Interestig_Theme", parm);
            return dt;

        }
        public DataTable SP_Interestig_Theme(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);


            dt = dal.ExecSpDt("SP_Interestig_Theme", parm);
            return dt;

        }
        public DataTable SP_Interestig_Theme(int OperationType, int id, string Status, string title,
       DateTime InsertertionDate, int GroupID, string body)
        {
            SqlParameter[] parm = new SqlParameter[7];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@Status", SqlDbType.VarChar, Status, null);
            parm[2] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);
            parm[3] = dal.MakeParam("@InsertertionDate", SqlDbType.DateTime, InsertertionDate, null);
            parm[4] = dal.MakeParam("@GroupID", SqlDbType.Int, GroupID, null);
            parm[5] = dal.MakeParam("@body", SqlDbType.NVarChar, body, null);
            parm[6] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("SP_Interestig_Theme", parm);
            return dt;

        }

        public DataTable SP_Interestig_Theme(int OperationType,  int rate, int id)
        
        {
            SqlParameter[] parm = new SqlParameter[8];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
  
            parm[1] = dal.MakeParam("@rate", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@id", SqlDbType.Int, rate, null);


            dt = dal.ExecSpDt("SP_Interestig_Theme", parm);
            return dt;

        }

    }
}

		
