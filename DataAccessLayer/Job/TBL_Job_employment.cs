using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{

    public class TBL_Job_employment
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_Job_employment_SP(string mode, int id, int JobTitle, string Company_name, int Required_specialty,
                                     DateTime insertionDate, DateTime TimeOutDate, string _address, string _state, string city,
                                     string Edu_step, int job_experience, string gender, string IsMarriage, string serviceStatus,
                                     string age, string phone, string explenation, int UserID, int _statuse)
        {
            SqlParameter[] parm = new SqlParameter[20];
            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("JobTitle", SqlDbType.Int, JobTitle, null);
            parm[3] = dal.MakeParam("Company_name", SqlDbType.NVarChar, Company_name, null);
            parm[4] = dal.MakeParam("Required_specialty", SqlDbType.Int, Required_specialty, null);
            parm[5] = dal.MakeParam("insertionDate", SqlDbType.DateTime, insertionDate, null);
            parm[6] = dal.MakeParam("TimeOutDate", SqlDbType.DateTime, TimeOutDate, null);
            parm[7] = dal.MakeParam("_address", SqlDbType.NVarChar, _address, null);
            parm[8] = dal.MakeParam("_state", SqlDbType.NVarChar, _state, null);
            parm[9] = dal.MakeParam("city", SqlDbType.NVarChar, city, null);
            parm[10] = dal.MakeParam("Edu_step", SqlDbType.NVarChar, Edu_step, null);
            parm[11] = dal.MakeParam("job_experience", SqlDbType.Int, job_experience, null);
            parm[12] = dal.MakeParam("gender", SqlDbType.NVarChar, gender, null);
            parm[13] = dal.MakeParam("age", SqlDbType.NVarChar, age, null);
            parm[14] = dal.MakeParam("phone", SqlDbType.VarChar, phone, null);
            parm[15] = dal.MakeParam("explenation", SqlDbType.NVarChar, explenation, null);
            parm[16] = dal.MakeParam("UserID", SqlDbType.Int, UserID, null);
            parm[17] = dal.MakeParam("_statuse", SqlDbType.Int, _statuse, null);
            parm[18] = dal.MakeParam("IsMarriage", SqlDbType.NVarChar, IsMarriage, null);
            parm[19] = dal.MakeParam("serviceStatus", SqlDbType.NVarChar, serviceStatus, null);


            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);



            return dt;
        }
        public DataTable TBL_Job_employment_SP(string mode, int UserID, int _statuse)
        {
            SqlParameter[] parm = new SqlParameter[3];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("UserID", SqlDbType.Int, UserID, null);
            parm[2] = dal.MakeParam("_statuse", SqlDbType.Int, _statuse, null);

            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);
            return dt;
        }

        public DataTable TBL_Job_employment_SP(string mode, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("id", SqlDbType.Int, id, null);


            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_employment_SP(string mode)
        {
            SqlParameter[] parm = new SqlParameter[1];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);

            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_employment_SP_confirm(string mode, int id, int _statuse)
        {
            SqlParameter[] parm = new SqlParameter[3];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("_statuse", SqlDbType.Int, _statuse, null);

            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_employment_SP_confirm(string mode, int id, string Enabled_cause)
        {
            SqlParameter[] parm = new SqlParameter[3];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("Enabled_cause", SqlDbType.NVarChar, Enabled_cause, null);

            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_employment_SP(string mode, string condition)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("condition", SqlDbType.VarChar, condition, null);

            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);

            return dt;

        }
        public DataTable TBL_Job_employment_SP(string mode, DateTime today)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = dal.MakeParam("mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("today", SqlDbType.DateTime, today, null);

            dt = dal.ExecSpDt("TBL_Job_employment_SP", parm);

            return dt;

        }


    }
}


 




