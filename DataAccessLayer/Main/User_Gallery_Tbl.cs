using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class User_Gallery_Tbl
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable User_Gallery_Tra(string Mode, int id, int uid, string Comment)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, uid, null);
            param[3] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);

            dt = dal.ExecSpDt("User_Gallery_Tra", param);
            return dt;
        }
    }
}
