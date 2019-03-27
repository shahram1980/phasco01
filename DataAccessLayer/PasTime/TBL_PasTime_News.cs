using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_PasTime_News
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable SP_TBL_PasTime_News_SP(int OperationType, string body, string title, int UserID, DateTime insertionDate)
        {
            SqlParameter[] parm = new SqlParameter[5];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@body", SqlDbType.NVarChar, body, null);
            parm[2] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);
            parm[3] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            parm[4] = dal.MakeParam("@insertionDate", SqlDbType.DateTime, insertionDate, null);

            dt = dal.ExecSpDt("SP_TBL_PasTime_News_SP", parm);
            return dt;
        }
        public DataTable SP_TBL_PasTime_News_SP(int OperationType, string body, string title, int UserID, DateTime insertionDate,string img)
        {
            SqlParameter[] parm = new SqlParameter[6];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@body", SqlDbType.NVarChar, body, null);
            parm[2] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);
            parm[3] = dal.MakeParam("@img", SqlDbType.VarChar, img, null);
            parm[4] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            parm[5] = dal.MakeParam("@insertionDate", SqlDbType.DateTime, insertionDate, null);

            dt = dal.ExecSpDt("SP_TBL_PasTime_News_SP", parm);
            return dt;
        }
        public DataTable SP_TBL_PasTime_News_SP(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
 

            dt = dal.ExecSpDt("SP_TBL_PasTime_News_SP", parm);
            return dt;
        }
        public DataTable SP_TBL_PasTime_News_SP(int OperationType,int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("SP_TBL_PasTime_News_SP", parm);
            return dt;
        }
        public DataTable SP_TBL_PasTime_News_SP(int OperationType,int id, string body, string title,  DateTime insertionDate)
        {
            SqlParameter[] parm = new SqlParameter[5];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@body", SqlDbType.NVarChar, body, null);
            parm[2] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);
      
            parm[3] = dal.MakeParam("@insertionDate", SqlDbType.DateTime, insertionDate, null);
            parm[4] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("SP_TBL_PasTime_News_SP", parm);
            return dt;
        }
        public DataTable SP_TBL_PasTime_News_SP(int OperationType, int id, string body, string title, DateTime insertionDate,string img)
        {
            SqlParameter[] parm = new SqlParameter[6];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@body", SqlDbType.NVarChar, body, null);
            parm[2] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);
            parm[3] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[4] = dal.MakeParam("@insertionDate", SqlDbType.DateTime, insertionDate, null);
            parm[5] = dal.MakeParam("@img", SqlDbType.VarChar, img, null);

            dt = dal.ExecSpDt("SP_TBL_PasTime_News_SP", parm);
            return dt;
        }
        public DataTable SP_TBL_PasTime_News_SP(int OperationType, int id, string img)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@img", SqlDbType.VarChar, img, null);


            parm[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("SP_TBL_PasTime_News_SP", parm);
            return dt;
        }
     

    }
}
 