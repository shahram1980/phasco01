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
    public class TBL_Lab_QC
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable TBL_Lab_QC_SP(string Mode, int id, string Title, string Url)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];
            
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[3] = dal.MakeParam("@Url", SqlDbType.NVarChar, Url, null);
          

            dt = dal.ExecSpDt("TBL_Lab_QC_SP", param);
            return dt;
        }
    }
}
