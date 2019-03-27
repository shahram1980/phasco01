using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Users
{
    public class TBL_User_Profile
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable Users_Profile_Tra_DT(string Mode, int id, string City, string Reshte,
            string Maghata, string Takhasos, string OfficeName, string Job, string email, DateTime birtDate)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[10];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@City", SqlDbType.NVarChar, City, null);
            param[3] = dal.MakeParam("@Reshte", SqlDbType.NVarChar, Reshte, null);
            param[4] = dal.MakeParam("@Maghata", SqlDbType.NVarChar, Maghata, null);
            param[5] = dal.MakeParam("@Takhasos", SqlDbType.NVarChar, Takhasos, null);
            param[6] = dal.MakeParam("@OfficeName", SqlDbType.NVarChar, OfficeName, null);
            param[7] = dal.MakeParam("@Job", SqlDbType.NVarChar, Job, null);
            param[8] = dal.MakeParam("@email", SqlDbType.NVarChar, email, null);
            param[9] = dal.MakeParam("@birtDate", SqlDbType.DateTime, birtDate, null);
            dt = dal.ExecSpDt("Users_Profile_Tra", param);
            return dt;
        }



        public DataTable Users_Profile_Tra_DT(string Mode, int id)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
           
            dt = dal.ExecSpDt("Users_Profile_Tra", param);
            return dt;
        }
    }
}
