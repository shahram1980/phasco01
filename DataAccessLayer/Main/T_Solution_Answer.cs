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
    public class T_Solution_Answer
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable T_Solution_Answer_Tra(string Mode, int id, int Uid, string Answer)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid ", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@Answer", SqlDbType.NText, Answer, null);
            
            dt = dal.ExecSpDt("T_Solution_Answer_Tra", param);
            return dt;
        }
    }
}
