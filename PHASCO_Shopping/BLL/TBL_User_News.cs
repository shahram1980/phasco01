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
using PHASCO_Shopping.DAL;

namespace PHASCO_Shopping.BLL
{
    public class TBL_User_News
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();

        public DataTable TBL_User_News_Tra(int id, string mode, int Uid,string Title,string news)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[5];
 
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[4] = dal.MakeParam("@news", SqlDbType.NVarChar, news, null);

            dt = dal.ExecSpDt("TBL_User_News_Tra", param);
            return dt;
        }

        public DataTable TBL_User_News_Tra(string mode, int Uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, Uid, null);

            dt = dal.ExecSpDt("TBL_User_News_Tra", param);
            return dt;
        }

        public DataTable TBL_User_News_Tra(int id)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_id", null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("TBL_User_News_Tra", param);
            return dt;
        }
    }
}
