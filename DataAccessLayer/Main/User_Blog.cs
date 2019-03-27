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
    public class User_Blog
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable GetUsers_Blog_Tra_DT(string Mode, int id, string title, int uid, string body, int comment, string datafarsi)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[7];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Title", SqlDbType.NVarChar, title, null);
            param[3] = dal.MakeParam("@Uid", SqlDbType.Int, uid, null);
            param[4] = dal.MakeParam("@Body", SqlDbType.NText, body, null);
            param[5] = dal.MakeParam("@Comment", SqlDbType.Int, comment, null);
            param[6] = dal.MakeParam("@DateFarsi", SqlDbType.NText, datafarsi, null);
            dt = dal.ExecSpDt("Users_Blog_Tra", param);
            return dt;
        }
    }
}
