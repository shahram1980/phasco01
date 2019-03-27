using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using DataAccessLayer;
namespace DAL
{
    public class TBL_Notification
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable TBL_Notification_SP(int mode, System.Int32 NotificationID, System.Int32 UserDoingId, System.Int32 UserReciverId,
            System.Int32 UserOwnerId, System.Int32 NotificationTypeID, string URL, System.Int32 Status, int NotificationIconId, string Title)
        {
            SqlParameter[] param = new SqlParameter[10];
            param[0] = dal.MakeParam("@mode", SqlDbType.Int, mode, null);
            param[1] = dal.MakeParam("@NotificationID", SqlDbType.Int, NotificationID, null);
            param[2] = dal.MakeParam("@UserDoingId", SqlDbType.Int, UserDoingId, null);
            param[3] = dal.MakeParam("@UserReciverId", SqlDbType.Int, UserReciverId, null);
            param[4] = dal.MakeParam("@UserOwnerId", SqlDbType.Int, UserOwnerId, null);
            param[5] = dal.MakeParam("@NotificationTypeID", SqlDbType.Int, NotificationTypeID, null);
            param[6] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            param[7] = dal.MakeParam("@URL", SqlDbType.NVarChar, URL, null);
            param[8] = dal.MakeParam("@NotificationIconId", SqlDbType.Int, NotificationIconId, null);
            param[9] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);

            
            dt = dal.ExecSpDt("TBL_Notification_SP ", param);
            return dt;
        }
    }
}
