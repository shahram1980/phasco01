using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
 



namespace DataAccessLayer
{
    public class TBL_Job_Resume
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_Job_Resume_SP(string mode, string ResumeSubject, string NationalNum, string serviceStatus, string Phone, string mobile,
                                          string JobStatus, string EducationStatus, int ExpirationTime, DateTime InsertDate, DateTime Expire_Date,
                                         int UserID, int CategoryID, int CategoryID_Sub, string Explantion, int Enabaled, int id,
                                     string CoOperate_Condition, string pro_abilities, string Requested_Wage)
        {
            SqlParameter[] parm = new SqlParameter[20];
            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);

            parm[1] = dal.MakeParam("ResumeSubject", SqlDbType.NVarChar, ResumeSubject, null);

            parm[2] = dal.MakeParam("NationalNum", SqlDbType.VarChar, NationalNum, null);

            parm[3] = dal.MakeParam("serviceStatus", SqlDbType.NVarChar, serviceStatus, null);

            parm[4] = dal.MakeParam("Phone", SqlDbType.VarChar, Phone, null);

            parm[5] = dal.MakeParam("mobile", SqlDbType.VarChar, mobile, null);

            parm[6] = dal.MakeParam("JobStatus", SqlDbType.NVarChar, JobStatus, null);

            parm[7] = dal.MakeParam("EducationStatus", SqlDbType.NVarChar, EducationStatus, null);

            parm[8] = dal.MakeParam("ExpirationTime", SqlDbType.Int, ExpirationTime, null);

            parm[9] = dal.MakeParam("InsertDate", SqlDbType.DateTime, InsertDate, null);

            parm[10] = dal.MakeParam("Expire_Date", SqlDbType.DateTime, Expire_Date, null);

            parm[11] = dal.MakeParam("UserID", SqlDbType.Int, UserID, null);

            parm[12] = dal.MakeParam("CategoryID", SqlDbType.Int, CategoryID, null);

            parm[13] = dal.MakeParam("CategoryID_Sub", SqlDbType.Int, CategoryID_Sub, null);

            parm[14] = dal.MakeParam("CoOperate_Condition", SqlDbType.NVarChar, CoOperate_Condition, null);
            parm[15] = dal.MakeParam("pro_abilities", SqlDbType.NVarChar, pro_abilities, null);
            parm[16] = dal.MakeParam("Requested_Wage", SqlDbType.NVarChar, Requested_Wage, null);

            parm[17] = dal.MakeParam("Explantion", SqlDbType.NVarChar, Explantion, null);

            parm[18] = dal.MakeParam("Enabaled", SqlDbType.Int, Enabaled, null);

            parm[19] = dal.MakeParam("id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);
            return dt;

        }

        //another overload :
        public DataTable TBL_Job_Resume_SP(string mode, int UserID, int Enabaled)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);

            parm[1] = dal.MakeParam("UserID", SqlDbType.Int, UserID, null);

            parm[2] = dal.MakeParam("Enabaled", SqlDbType.Int, Enabaled, null);

            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);
            return dt;
        }
        //
        public DataTable TBL_Job_Resume_SP(string mode)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);


            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);
            return dt;
        }
        //another overload :
        public DataTable TBL_Job_Resume_SP_2(string mode, int id, int CategoryID)
        {
            SqlParameter[] parm = new SqlParameter[3];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("CategoryID", SqlDbType.Int, CategoryID, null);

            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);
            return dt;
        }
        //another overload :
        public DataTable TBL_Job_Resume_SP(string mode, string ResumeSubject, string NationalNum, string serviceStatus, string Phone, string mobile,
                                  string JobStatus, string EducationStatus, int UserID, int CategoryID, int CategoryID_Sub, string Explantion, int id,
                                string CoOperate_Condition, string pro_abilities, string Requested_Wage)
        {
            SqlParameter[] parm = new SqlParameter[16];
            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);

            parm[1] = dal.MakeParam("ResumeSubject", SqlDbType.NVarChar, ResumeSubject, null);

            parm[2] = dal.MakeParam("NationalNum", SqlDbType.VarChar, NationalNum, null);

            parm[3] = dal.MakeParam("serviceStatus", SqlDbType.NVarChar, serviceStatus, null);

            parm[4] = dal.MakeParam("Phone", SqlDbType.VarChar, Phone, null);

            parm[5] = dal.MakeParam("mobile", SqlDbType.VarChar, mobile, null);

            parm[6] = dal.MakeParam("JobStatus", SqlDbType.NVarChar, JobStatus, null);

            parm[7] = dal.MakeParam("EducationStatus", SqlDbType.NVarChar, EducationStatus, null);

            parm[8] = dal.MakeParam("UserID", SqlDbType.Int, UserID, null);

            parm[9] = dal.MakeParam("CategoryID", SqlDbType.Int, CategoryID, null);

            parm[10] = dal.MakeParam("CategoryID_Sub", SqlDbType.Int, CategoryID_Sub, null);

            parm[11] = dal.MakeParam("Explantion", SqlDbType.NVarChar, Explantion, null);
            parm[12] = dal.MakeParam("id", SqlDbType.Int, id, null);
            parm[13] = dal.MakeParam("CoOperate_Condition", SqlDbType.NVarChar, CoOperate_Condition, null);
            parm[14] = dal.MakeParam("pro_abilities", SqlDbType.NVarChar, pro_abilities, null);
            parm[15] = dal.MakeParam("Requested_Wage", SqlDbType.NVarChar, Requested_Wage, null);

            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_Resume_SP(string mode, string condition)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("condition", SqlDbType.VarChar, condition, null);

            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);

            return dt;
        }
        public DataTable TBL_Job_Resume_SP(string mode, DateTime today)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("today", SqlDbType.DateTime, today, null);

            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);

            return dt;
        }
        public DataTable TBL_Job_Resume_SP(string mode, int enabled)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("Enabaled", SqlDbType.Int, enabled, null);

            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);

            return dt;

        }
        public DataTable TBL_Job_Resume_SP_confirm(string mode, int enabled, int id)
        {
            SqlParameter[] parm = new SqlParameter[3];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("Enabaled", SqlDbType.Int, enabled, null);
            parm[2] = dal.MakeParam("id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);

            return dt;

        }
        public DataTable TBL_Job_Resume_SP_confirm(string mode, string Enabled_cause, int id)
        {
            SqlParameter[] parm = new SqlParameter[3];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("Enabled_cause", SqlDbType.NVarChar, Enabled_cause, null);
            parm[2] = dal.MakeParam("id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("TBL_Job_Resume_SP", parm);

            return dt;

        }

    }
}