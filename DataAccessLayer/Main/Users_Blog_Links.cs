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
    public class Users_Blog_Links
    {
        DAL_Main dal = new DAL_Main();
        public DataTable Users_Blog_Links_Tra(string Mode, int id, int Uid,string Url,string Title)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[5];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@Url", SqlDbType.NVarChar, Url, null);
            param[4] = dal.MakeParam("@Title ", SqlDbType.NVarChar, Title, null);

            dt = dal.ExecSpDt("Users_Blog_Links_Tra", param);
            return dt;
        }
    }
}
