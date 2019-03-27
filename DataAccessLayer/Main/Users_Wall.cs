using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class Users_Wall
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable Users_Wall_tra(string Mode, int uid_sender,int uid_owner, int subid, string comment)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[5];
 
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@uid_sender", SqlDbType.Int, uid_sender, null);
            param[2] = dal.MakeParam("@uid_owner", SqlDbType.Int, uid_owner, null);
            param[3] = dal.MakeParam("@subid", SqlDbType.Int, subid, null);
            param[4] = dal.MakeParam("@comment", SqlDbType.NVarChar, comment, null);
 
            dt = dal.ExecSpDt("Users_Wall_tra", param);
            return dt;
        }

        public DataTable Users_Wall_tra(string Mode, int uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@uid_owner", SqlDbType.Int, uid, null);
        
            dt = dal.ExecSpDt("Users_Wall_tra", param);
            return dt;
        }

     public DataTable Users_Wall_tra(string Mode,int uid, int id)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@uid_owner", SqlDbType.Int, uid, null);
            param[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("Users_Wall_tra", param);
            return dt;
        }
    }
}
