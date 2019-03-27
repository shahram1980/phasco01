using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;

namespace DAL
{
    public class Users_Action_Log
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable Users_Action_Log_SP(int Mode, System.Int32 id, System.Int32 Uid, System.String UrlReferrer, System.String Url)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[2] = dal.MakeParam("@UrlReferrer", SqlDbType.NVarChar, UrlReferrer, null);
            param[3] = dal.MakeParam("@Url", SqlDbType.NVarChar, Url, null);
            param[4] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);
            
            dt = dal.ExecSpDt("Users_Action_Log_SP ", param);
            return dt;
        }
    }
}
