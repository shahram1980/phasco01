using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
 public   class TBL_SearchHistory
    {
        public DataTable TBL_SearchHistory_Tra(int SearchID, string mode, int SearchType, int UserID, DateTime SearchDate, string SearchWord
       , string SearchSection, string SearchCategory, string SearchDateLimited, string SearchLocation, string SearchUrl)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[11];

            param[0] = dal.MakeParam("@SearchID", SqlDbType.Int, SearchID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@SearchType", SqlDbType.Int, SearchType, null);
            param[3] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            param[4] = dal.MakeParam("@SearchDate", SqlDbType.DateTime, SearchDate, null);
            param[5] = dal.MakeParam("@SearchWord", SqlDbType.NVarChar, SearchWord, null);
            param[6] = dal.MakeParam("@SearchSection", SqlDbType.NVarChar, SearchSection, null);
            param[7] = dal.MakeParam("@SearchCategory", SqlDbType.NVarChar, SearchCategory, null);
            param[8] = dal.MakeParam("@SearchDateLimited", SqlDbType.NVarChar, SearchDateLimited, null);
            param[9] = dal.MakeParam("@SearchLocation", SqlDbType.NVarChar, SearchLocation, null);
            param[10] = dal.MakeParam("@SearchUrl", SqlDbType.NVarChar, SearchUrl, null);

            dtTemp = dal.ExecSpDt("TBL_SearchHistory_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_SearchHistory_Tra(int SearchID, string mode)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@SearchID", SqlDbType.Int, SearchID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_SearchHistory_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_SearchHistory_Tra(string mode)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[1];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_SearchHistory_Tra", param);
            return dtTemp;
        }

        public DataTable AdvanceSearch(string SearchWord, int SearchSection, int CategoryID)
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@SearchWord", SqlDbType.NVarChar, SearchWord, null);
            param[1] = dal.MakeParam("@SearchSection", SqlDbType.Int, SearchSection, null);
            param[2] = dal.MakeParam("@Group_ID", SqlDbType.Int, CategoryID, null);

            dtTemp = dal.ExecSpDt("AdvanceSearch", param);
            return dtTemp;
        }

        public DataTable SelectResForAdmin()
        {
            DAL_BIZ dal = new DAL_BIZ();
            DataTable dtTemp = new DataTable();
            dtTemp = dal.Exec_Cmd("SELECT  [SearchWord]  ,count(*) as count_   FROM  [dbo].[TBL_SearchHistory] group by SearchWord order by count(*) desc");
            return dtTemp;
        }

    
    }
}
