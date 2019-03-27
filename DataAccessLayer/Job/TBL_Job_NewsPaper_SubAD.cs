using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_Job_NewsPaper_SubAD
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_Job_NewsPaper_SubAD_SP(string mode, string JobTitle, string EduField
            , string EduTendency, string EduDegree, int AD_ID,int id)
        {
            SqlParameter[] parm = new SqlParameter[7];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@JobTitle", SqlDbType.NVarChar, JobTitle, null);
            parm[2] = dal.MakeParam("@EduField", SqlDbType.NVarChar, EduField, null);
            parm[3] = dal.MakeParam("@EduTendency", SqlDbType.NVarChar, EduTendency, null);
            parm[4] = dal.MakeParam("@EduDegree", SqlDbType.NVarChar, EduDegree, null);
            parm[5] = dal.MakeParam("@AD_ID", SqlDbType.Int, AD_ID, null);
            parm[6] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            //
            dt = dal.ExecSpDt("TBL_Job_NewsPaper_SubAD_SP", parm);

            return dt;
        }
        public DataTable TBL_Job_NewsPaper_SubAD_SP(string mode, int AD_ID,int id)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);  
            parm[1] = dal.MakeParam("@AD_ID", SqlDbType.Int, AD_ID, null);
            parm[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            //
            dt = dal.ExecSpDt("TBL_Job_NewsPaper_SubAD_SP", parm);

            return dt;
        }
        public DataTable TBL_Job_NewsPaper_SubAD_SP(string mode)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);

            //
            dt = dal.ExecSpDt("TBL_Job_NewsPaper_SubAD_SP", parm);

            return dt;
        }
    }
}
