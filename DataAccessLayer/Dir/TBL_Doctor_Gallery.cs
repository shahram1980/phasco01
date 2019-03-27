using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer
{
    public class TBL_Doctor_Gallery
    {
        BaseDAL_Dir dal = new BaseDAL_Dir();
        DataTable dt = new DataTable();

        public DataTable TBL_Doctor_Gallery_Tra(string Mode, int id, int Uid, string Comment)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            param[3] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);
            return dal.ExecSpDt("TBL_Doctor_Gallery_Tra", param);
        }

        public DataTable TBL_Doctor_Gallery_Tra(string Mode, int id)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            return dal.ExecSpDt("TBL_Doctor_Gallery_Tra", param);
        }
    }
}