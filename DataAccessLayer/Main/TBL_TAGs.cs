using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Main
{
    public class TBL_TAGs
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_TAGs_SP(int Mode, int id, string Tag, string Url)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@mode", SqlDbType.Int, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Tag", SqlDbType.NVarChar, Tag, null);
            param[3] = dal.MakeParam("@Url", SqlDbType.NVarChar, Url, null);

            dt = dal.ExecSpDt("TBL_TAGs_SP", param);
            return dt;
        }
    }
}
