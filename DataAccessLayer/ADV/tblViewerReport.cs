using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.ADV
{
    public class tblViewerReport
    {
        DAL_ADV dal = new DAL_ADV();
        DataTable dt = new DataTable();

        public DataTable tblViewerReport_SP( int OperationType, int ViewerReportID,int BannerID)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[1] = dal.MakeParam("@ViewerReportID", SqlDbType.Int, ViewerReportID, null);
            param[2] = dal.MakeParam("@BannerID", SqlDbType.NVarChar, BannerID, null);
            

            dt = dal.ExecSpDt("tblViewerReport_SP", param);
            return dt;
        }


    }
}
