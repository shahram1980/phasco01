
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer.BIZ
{
  public  class TBL_State
    {
        public DataTable TBL_State_Tra(int StateID, string mode, string StateName, int ParentID, int StateCode)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[5];

            param[0] = dal.MakeParam("@StateID", SqlDbType.Int, StateID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@StateName", SqlDbType.NVarChar, StateName, null);
            param[3] = dal.MakeParam("@ParentID", SqlDbType.Int, ParentID, null);
            param[4] = dal.MakeParam("@StateCode", SqlDbType.Int, StateCode, null);

            dtTemp = dal.ExecSpDt("TBL_State_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_State_Tra(int StateID, string mode)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@StateID", SqlDbType.Int, StateID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);


            dtTemp = dal.ExecSpDt("TBL_State_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_State_Tra(string mode)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[1];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);


            dtTemp = dal.ExecSpDt("TBL_State_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_State_Tra(int ParentID)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];


            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, "selectName_byParentID", null);
            param[1] = dal.MakeParam("@ParentID", SqlDbType.Int, ParentID, null);


            dtTemp = dal.ExecSpDt("TBL_State_Tra", param);
            return dtTemp;
        }
    }
}
