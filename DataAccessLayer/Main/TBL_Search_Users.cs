using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
 


namespace DataAccessLayer
{
    public class TBL_Search_Users
    {
        DataTable dt = new DataTable();
        DAL_Main dal = new DAL_Main();
        public DataTable Serach_user(string name, int Gender)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@name", SqlDbType.NVarChar, name, null);
            param[1] = dal.MakeParam("@Gender", SqlDbType.Int, Gender, null);
            dt = dal.ExecSpDt("SP_Search_User", param);
            return dt;
        }

        public DataTable Next_Page(string name, int Gender,int index,int number_of_item_inEachPage )
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@name", SqlDbType.NVarChar, name, null);
            param[1] = dal.MakeParam("@Gender", SqlDbType.Int, Gender, null);
            DataSet ds = new DataSet();
            ds = dal.Paging("SP_Search_User",index,number_of_item_inEachPage,"TBL_Serach",param);
            return ds.Tables[0];
        }
    }
}
