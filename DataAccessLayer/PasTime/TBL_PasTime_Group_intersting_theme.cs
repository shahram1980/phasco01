using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessLayer;

using System.Data;
using System.Data.SqlClient;
 

namespace DataAccessLayer
{
    public class TBL_PasTime_Group_intersting_theme
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_PasTime_Group_intersting_theme_SP(string mode, int ParentID, string GroupName)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@ParentID", SqlDbType.Int, ParentID, null);
            parm[2] = dal.MakeParam("@GroupName", SqlDbType.NVarChar, GroupName, null);
            dt = dal.ExecSpDt("TBL_PasTime_Group_intersting_theme_SP", parm);
            return dt;
        }
        public DataTable TBL_PasTime_Group_intersting_theme_SP(string mode, string GroupName, int id)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@GroupName", SqlDbType.NVarChar, GroupName, null);
            dt = dal.ExecSpDt("TBL_PasTime_Group_intersting_theme_SP", parm);
            return dt;
        }
        public DataTable TBL_PasTime_Group_intersting_theme_SP(string mode, int ParentID)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@ParentID", SqlDbType.Int, ParentID, null);

            dt = dal.ExecSpDt("TBL_PasTime_Group_intersting_theme_SP", parm);
            return dt;
        }
        public DataTable TBL_PasTime_Group_intersting_theme_SP(string mode)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            dt = dal.ExecSpDt("TBL_PasTime_Group_intersting_theme_SP", parm);
            return dt;
        }
    }
}
