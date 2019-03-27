using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



namespace DataAccessLayer
{
    public class TBL_Job_CityState
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_Job_CityState_SP(string mode, string state)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0]=dal.MakeParam("@mode",SqlDbType.VarChar,mode,null);
            parm[1]=dal.MakeParam("@_state",SqlDbType.NVarChar,state,null);
            dt = dal.ExecSpDt("TBL_Job_CityState_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_CityState_SP(string mode, string state,string city)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@_state", SqlDbType.NVarChar, state, null);
            parm[2] = dal.MakeParam("city", SqlDbType.NVarChar, city, null);
            dt = dal.ExecSpDt("TBL_Job_CityState_SP", parm);
            return dt;
        }
        public DataTable TBL_Job_CityState_SP(string mode, string city,int id)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@city", SqlDbType.NVarChar, city, null);
            dt = dal.ExecSpDt("TBL_Job_CityState_SP", parm);
            return dt;
        }
    }
}
