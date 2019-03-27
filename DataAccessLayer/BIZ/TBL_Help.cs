using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
   public class TBL_Help
    {
        DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();

        public DataTable TBL_Help_Tra(int id, string mode, string Title, string Body_en, string Body_fa, string Body_ch)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[6];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[3] = dal.MakeParam("@Body_en", SqlDbType.NVarChar, Body_en, null);
            param[4] = dal.MakeParam("@Body_fa ", SqlDbType.NVarChar, Body_fa, null);
            param[5] = dal.MakeParam("@Body_ch", SqlDbType.NVarChar, Body_ch, null);

            dt = dal.ExecSpDt("TBL_Help_Tra", param);
            return dt;
        }

        public DataTable TBL_Help_Tra(int id, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dt = dal.ExecSpDt("TBL_Help_Tra", param);
            return dt;
        }
    }
}
