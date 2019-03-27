using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;
namespace DAL
{
    public class TBL_NotificationType
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_NotificationType_SP(int mode, System.Int32 NotificationTypeID, System.String NotificationMessage,
            System.Int32 status)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, mode, null);
            param[1] = dal.MakeParam("@NotificationTypeID", SqlDbType.Int, NotificationTypeID, null);
            param[2] = dal.MakeParam("@NotificationMessage", SqlDbType.NVarChar, NotificationMessage, null);
            param[3] = dal.MakeParam("@status", SqlDbType.Int, status, null);
          

            dt = dal.ExecSpDt("TBL_NotificationType_SP ", param);
            return dt;
        }
    }
}
