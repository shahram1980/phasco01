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
    public class Tbl_TodayText
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable Tbl_TodayText_Tra(string Mode,string Text,string Url,int View_Url)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Text", SqlDbType.NText, Text, null);
            param[2] = dal.MakeParam("@Url", SqlDbType.NVarChar, Url, null);
            param[3] = dal.MakeParam("@View_Url", SqlDbType.Int, View_Url, null);

            dt = dal.ExecSpDt("Tbl_TodayText_Tra", param);
            return dt;
        }
       
    }
}
