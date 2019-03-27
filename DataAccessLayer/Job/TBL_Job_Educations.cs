using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_Job_Educations
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_Job_Educations_SP(string mode, string Field, string Last_document, string country, string City, string University,
                         double average, DateTime StartDate, DateTime FinishDate, int ResumeID,int id)
        {
            SqlParameter[] parm = new SqlParameter[11];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@Field", SqlDbType.NVarChar, Field, null);
            parm[2] = dal.MakeParam("@Last_document", SqlDbType.NVarChar, Last_document, null);
            parm[3] = dal.MakeParam("@country", SqlDbType.NVarChar, country, null);
            parm[4] = dal.MakeParam("@City", SqlDbType.NVarChar, City, null);
            parm[5] = dal.MakeParam("@University", SqlDbType.NVarChar, University, null);
            parm[6] = dal.MakeParam("@average", SqlDbType.Real, average, null);
            parm[7] = dal.MakeParam("@StartDate", SqlDbType.DateTime, StartDate, null);
            parm[8] = dal.MakeParam("@FinishDate", SqlDbType.DateTime, FinishDate, null);
            parm[9] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);
            parm[10] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("TBL_Job_Educations_SP", parm);
            return dt;
        }
        //another overload
        public DataTable TBL_Job_Educations_SP(string mode, int ResumeID, int id)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);
            parm[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("TBL_Job_Educations_SP", parm);
            return dt;
        }
    }
}
