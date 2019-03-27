using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
  public  class TBL_Request
    {
        public DataTable TBL_Request_Tra(int RequestID, string mode, int Uid_id, string Group_id, string ProductName
     , string Model, string DetailsAndFeatures, string Count, int CityID, string Price, string Description, int Status, DateTime RequestDate
      , DateTime StartDate, DateTime EndDate, int ExpireSchedule)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[16];

            param[0] = dal.MakeParam("@RequestID", SqlDbType.Int, RequestID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid_id", SqlDbType.Int, Uid_id, null);
            param[3] = dal.MakeParam("@Group_id", SqlDbType.NVarChar, Group_id, null);
            param[4] = dal.MakeParam("@ProductName", SqlDbType.NVarChar, ProductName, null);
            param[5] = dal.MakeParam("@Model", SqlDbType.NVarChar, Model, null);
            param[6] = dal.MakeParam("@DetailsAndFeatures", SqlDbType.NVarChar, DetailsAndFeatures, null);
            param[7] = dal.MakeParam("@Count", SqlDbType.NVarChar, Count, null);
            param[8] = dal.MakeParam("@CityID", SqlDbType.Int, CityID, null);
            param[9] = dal.MakeParam("@Price", SqlDbType.NVarChar, Price, null);
            param[10] = dal.MakeParam("@Description", SqlDbType.NText, Description, null);
            param[11] = dal.MakeParam("@Status", SqlDbType.TinyInt, Status, null);
            param[12] = dal.MakeParam("@RequestDate", SqlDbType.DateTime, RequestDate, null);
            param[13] = dal.MakeParam("@StartDate", SqlDbType.DateTime, StartDate, null);
            param[14] = dal.MakeParam("@EndDate", SqlDbType.DateTime, EndDate, null);
            param[15] = dal.MakeParam("@ExpireSchedule", SqlDbType.Int, ExpireSchedule, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Request_Tra(int RequestID, string mode)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@RequestID", SqlDbType.Int, RequestID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Request_Tra(int Group_id)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@Group_id", SqlDbType.Int, Group_id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, "selectcount_bygroupid", null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Request_Tra(int uid, int status)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@Uid_id", SqlDbType.Int, uid, null);
            param[1] = dal.MakeParam("@Status", SqlDbType.Int, status, null);
            param[2] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_byuidandstatus", null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Request_Tra(string mode, int status)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@Status", SqlDbType.Int, status, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_bystatus", null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Request_Tra(string mode)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[1];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Request_Tra(string mode, int RequestID, int status, DateTime EndDate)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@RequestID", SqlDbType.Int, RequestID, null);
            param[1] = dal.MakeParam("@Status", SqlDbType.Int, status, null);
            param[2] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[3] = dal.MakeParam("@EndDate", SqlDbType.DateTime, EndDate, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Request_Tra(string mode, int uid, int status)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@Uid_id", SqlDbType.Int, uid, null);
            param[1] = dal.MakeParam("@Status", SqlDbType.Int, status, null);
            param[2] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_RequestByGroups(string mode, int groupID)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@Group_id", SqlDbType.Int, groupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_RequestByGroups(string mode, int groupID, int PageSize, int CurrentPage)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@Group_id", SqlDbType.Int, groupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@PageSize", SqlDbType.Int, PageSize, null);
            param[3] = dal.MakeParam("@CurrentPage", SqlDbType.Int, CurrentPage, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_RequestByGroups(string mode, int groupID, int requestID)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@Group_id", SqlDbType.Int, groupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@RequestID", SqlDbType.Int, requestID, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_RequestByUid(string mode, int uid, int requestID)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@Uid_id", SqlDbType.Int, uid, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@RequestID", SqlDbType.Int, requestID, null);

            dtTemp = dal.ExecSpDt("TBL_Request_Tra", param);
            return dtTemp;
        }
    }
}
