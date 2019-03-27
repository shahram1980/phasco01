using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_Job_Category
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable Select_categories(string mode)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            dt = dal.ExecSpDt("TBL_Job_Category_SP", parm);
            return dt;
        }
        // this is an onother overload of Select_categories
        public DataTable Select_categories(string mode, int CategoryID)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@CategoryID", SqlDbType.Int, CategoryID, null);
            dt = dal.ExecSpDt("TBL_Job_Category_SP", parm);
            return dt;
        }
        public DataTable Select_categories(string mode, int SubCategoryID, string CategoryName)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@SubCategoryID", SqlDbType.Int, SubCategoryID, null);
            parm[2] = dal.MakeParam("@CategoryName", SqlDbType.NVarChar, CategoryName, null);
            dt = dal.ExecSpDt("TBL_Job_Category_SP", parm);
            return dt;
        }
        public DataTable Select_categories_2(string mode, int CategoryID,  string CategoryName)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@CategoryID", SqlDbType.Int, CategoryID, null);
            parm[2] = dal.MakeParam("@CategoryName", SqlDbType.NVarChar, CategoryName, null);
        
            dt = dal.ExecSpDt("TBL_Job_Category_SP", parm);
            return dt;
        }

    }
}
