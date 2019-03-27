using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
  public class TBL_InviteEmails
    {
        DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();
        public DataTable  TBL_InviteEmails_Tra(  string Email, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@Email", SqlDbType.NVarChar, Email, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_InviteEmails_Tra", param);
            return dt;
        }
    }
}
