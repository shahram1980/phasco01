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
    public class T_Qu_Weekly
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable Select_Top_Qu_Weekly()
        {
            DataTable dt;
            dt = dal.Exec_Cmd("SELECT top 1* From Qu_Weekly order by Id desc");
            return dt;
        }
        public DataTable Select_Valid_User_Qu(int Uid, int Qid)
        {
            DataTable dt;
            dt = dal.Exec_Cmd("SELECT   Qid, Uid FROM   Qu_Weekly_UId WHERE   (Uid = " + Uid.ToString() + ") AND (Qid = " + Qid.ToString() + ")");
            return dt;
        }
        public DataTable Qu_weekly_Tra(string Mode, int id,int Uid,int Qid,int Uanswerid,int Qanswerid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[6];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid ", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@Qid", SqlDbType.Int, Qid, null);
            param[4] = dal.MakeParam("@Uanswerid ", SqlDbType.Int, Uanswerid, null);
            param[5] = dal.MakeParam("@Qanswerid", SqlDbType.Int, Qanswerid, null);
            dt = dal.ExecSpDt("Qu_weekly_Tra", param);
            return dt;
        }

    }
}
