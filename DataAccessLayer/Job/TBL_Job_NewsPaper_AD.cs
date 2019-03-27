using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_Job_NewsPaper_AD
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_Job_NewsPaper_AD_SP(string mode, int id, string AdTopic, DateTime TimeOutCall,
                                        string explenation, string newsPaperNmae, DateTime newsPaperDate, int number, int visitCounter, string _FileName, DateTime InsertionDate)
        {
            SqlParameter[] parm = new SqlParameter[11];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@AdTopic", SqlDbType.NVarChar, AdTopic, null);
            parm[3] = dal.MakeParam("@TimeOutCall", SqlDbType.DateTime, TimeOutCall, null);
            parm[4] = dal.MakeParam("@explenation", SqlDbType.NVarChar, explenation, null);
            parm[5] = dal.MakeParam("@newsPaperNmae", SqlDbType.NVarChar, newsPaperNmae, null);
            parm[6] = dal.MakeParam("@newsPaperDate", SqlDbType.DateTime, newsPaperDate, null);
            parm[7] = dal.MakeParam("@number", SqlDbType.Int, number, null);
            parm[8] = dal.MakeParam("@visitCounter", SqlDbType.Int, visitCounter, null);
            parm[9] = dal.MakeParam("@_FileName", SqlDbType.VarChar, _FileName, null);
            parm[10] = dal.MakeParam("@InsertionDate", SqlDbType.DateTime, InsertionDate, null);

            dt = dal.ExecSpDt("TBL_Job_NewsPaper_AD_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_NewsPaper_AD_SP(string mode, int id,  string _FileName)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@_FileName", SqlDbType.VarChar, _FileName, null);

            dt = dal.ExecSpDt("TBL_Job_NewsPaper_AD_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_NewsPaper_AD_SP(string mode, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);


            dt = dal.ExecSpDt("TBL_Job_NewsPaper_AD_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_NewsPaper_AD_SP(string mode)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
    
            dt = dal.ExecSpDt("TBL_Job_NewsPaper_AD_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_NewsPaper_AD_SP(string mode, DateTime todayMinusOneWeek)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@todayMinusOneWeek", SqlDbType.DateTime, todayMinusOneWeek, null);
            dt = dal.ExecSpDt("TBL_Job_NewsPaper_AD_SP", parm);
            return dt;
        }
    }
}