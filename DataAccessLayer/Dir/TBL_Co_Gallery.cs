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
    public class TBL_Co_Gallery
    {
        BaseDAL_Dir dal = new BaseDAL_Dir();
        DataTable dt = new DataTable();

        public DataTable Lab_Gallery_Tra(string Mode, int id, int Uid, string Comment)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            param[3] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);
            return dal.ExecSpDt("TBL_Co_Gallery_Tra", param);
        }

        public DataTable Lab_Gallery_Tra(string Mode, int id)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            return dal.ExecSpDt("TBL_Co_Gallery_Tra", param);
        }
    }
}
