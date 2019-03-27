using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_Job_Special_careers
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable Special_careers_SP(string mode, string career_name, int career_duration, DateTime startTime,
           DateTime FinishTime, string Institute_name, int ResumeID)
        {
            SqlParameter[] parm = new SqlParameter[7];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);

            parm[1] = dal.MakeParam("@career_name", SqlDbType.NVarChar, career_name, null);
            parm[2] = dal.MakeParam("@career_duration", SqlDbType.Int, career_duration, null);
            parm[3] = dal.MakeParam("@startTime", SqlDbType.DateTime, startTime, null);
            parm[4] = dal.MakeParam("@FinishTime", SqlDbType.DateTime, FinishTime, null);
            parm[5] = dal.MakeParam("@Institute_name", SqlDbType.NVarChar, Institute_name, null);
            parm[6] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);

            dt = dal.ExecSpDt("TBL_Job_Special_careers_SP", parm);
            return dt;

        }
        public DataTable Special_careers_SP(string mode, string career_name, int career_duration, DateTime startTime,
   DateTime FinishTime, string Institute_name, int ResumeID,int id)
        {
            SqlParameter[] parm = new SqlParameter[8];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);

            parm[1] = dal.MakeParam("@career_name", SqlDbType.NVarChar, career_name, null);
            parm[2] = dal.MakeParam("@career_duration", SqlDbType.Int, career_duration, null);
            parm[3] = dal.MakeParam("@startTime", SqlDbType.DateTime, startTime, null);
            parm[4] = dal.MakeParam("@FinishTime", SqlDbType.DateTime, FinishTime, null);
            parm[5] = dal.MakeParam("@Institute_name", SqlDbType.NVarChar, Institute_name, null);
            parm[6] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);
            parm[7] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("TBL_Job_Special_careers_SP", parm);
            return dt;

        }
        public DataTable Special_careers_SP(string mode, int ResumeID, int id)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);
            parm[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("TBL_Job_Special_careers_SP", parm);
            return dt;

        }



    }
}
