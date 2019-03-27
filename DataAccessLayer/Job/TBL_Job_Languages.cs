using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_Job_Languages
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_Job_Languages_SP(string mode, string Language_name, string Read_Write_skill, string Speaking_skill, int ResumeID)
        {
            SqlParameter[] parm = new SqlParameter[5];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@Language_name", SqlDbType.NVarChar, Language_name, null);
            parm[2] = dal.MakeParam("@Read_Write_skill", SqlDbType.NVarChar, Read_Write_skill, null);
            parm[3] = dal.MakeParam("@Speaking_skill", SqlDbType.NVarChar, Speaking_skill, null);
            parm[4] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);

            dt = dal.ExecSpDt("TBL_Job_Languages_SP", parm);
            return dt;

        }
        public DataTable TBL_Job_Languages_SP(string mode, string Language_name, string Read_Write_skill, string Speaking_skill, int ResumeID,int id)
        {
            SqlParameter[] parm = new SqlParameter[6];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@Language_name", SqlDbType.NVarChar, Language_name, null);
            parm[2] = dal.MakeParam("@Read_Write_skill", SqlDbType.NVarChar, Read_Write_skill, null);
            parm[3] = dal.MakeParam("@Speaking_skill", SqlDbType.NVarChar, Speaking_skill, null);
            parm[4] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);
            parm[5] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("TBL_Job_Languages_SP", parm);
            return dt;

        }
        public DataTable TBL_Job_Languages_SP(string mode, int ResumeID, int id)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@ResumeID", SqlDbType.Int, ResumeID, null);
            parm[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("TBL_Job_Languages_SP", parm);
            return dt;

        }

    }
}