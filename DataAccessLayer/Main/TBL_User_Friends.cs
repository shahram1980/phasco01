using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_User_Friends
    {
        DataTable dt = new DataTable();
        DAL_Main dal = new DAL_Main();
        public DataTable Insert_del_update(int OperationType, int User_Id, string Status, int Id, int Friend_User_Id, string condition)
        {
            SqlParameter[] Param = new SqlParameter[6];
            Param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            Param[1] = dal.MakeParam("@User_Id", SqlDbType.Int, User_Id, null);
            Param[2] = dal.MakeParam("@Status", SqlDbType.NVarChar, Status, null);
            Param[3] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);
            Param[4] = dal.MakeParam("@Friend_User_Id", SqlDbType.Int, Friend_User_Id, null);
            Param[5] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);
            dt = dal.ExecSpDt("SP_Users_Friends", Param);
            return dt;
        }


        public DataTable Insert_del_update(int OperationType, int id)
        {
            SqlParameter[] Param = new SqlParameter[2];
            Param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            Param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("SP_Users_Friends", Param);
            return dt;
        }

        public DataTable Insert_del_update(int OperationType, int User_Id, int Friend_User_Id)
        {
            SqlParameter[] Param = new SqlParameter[3];
            Param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            Param[1] = dal.MakeParam("@User_Id", SqlDbType.Int, User_Id, null);
            Param[2] = dal.MakeParam("@Friend_User_Id", SqlDbType.Int, Friend_User_Id, null);
            dt = dal.ExecSpDt("SP_Users_Friends", Param);
            return dt;
        }


        public DataTable Insert_del_update(int OperationType, int id, string startPage, string endPage, string pagesize)
        {
            SqlParameter[] Param = new SqlParameter[5];
            Param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            Param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            Param[2] = dal.MakeParam("@startPage", SqlDbType.NVarChar, startPage, null);
            Param[3] = dal.MakeParam("@endPage", SqlDbType.NVarChar, endPage, null);
            Param[4] = dal.MakeParam("@pagesize", SqlDbType.NVarChar, pagesize, null);
            dt = dal.ExecSpDt("SP_Users_Friends", Param);
            return dt;
        }

    }
}
