using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Users
{
    public class TBL_User
    {



        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable Users_Tra(string Mode, int id, string uid, string password, string name, string famil, string father, int sex, DateTime birthDaye,
            string website, string email, string tel, string address, string des, int image, int intriId, int userRole, int userActive)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[19];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.NVarChar, uid, null);
            param[3] = dal.MakeParam("@Password", SqlDbType.NVarChar, password, null);

            param[4] = dal.MakeParam("@Name ", SqlDbType.NVarChar, name, null);
            param[5] = dal.MakeParam("@Famil", SqlDbType.NVarChar, famil, null);
            param[6] = dal.MakeParam("@Father", SqlDbType.NVarChar, father, null);

            param[7] = dal.MakeParam("@Sex ", SqlDbType.Int, sex, null);
            param[8] = dal.MakeParam("@BirthDay", SqlDbType.DateTime, birthDaye, null);
            param[9] = dal.MakeParam("@Website", SqlDbType.NVarChar, website, null);

            param[10] = dal.MakeParam("@Email ", SqlDbType.NVarChar, email, null);
            param[11] = dal.MakeParam("@Tel", SqlDbType.NVarChar, tel, null);
            param[12] = dal.MakeParam("@Address", SqlDbType.NVarChar, address, null);


            param[13] = dal.MakeParam("@Description ", SqlDbType.NVarChar, des, null);
            param[14] = dal.MakeParam("@Image", SqlDbType.Int, image, null);
            param[15] = dal.MakeParam("@IntriId", SqlDbType.Int, intriId, null);


            param[16] = dal.MakeParam("@UserRole ", SqlDbType.Int, userRole, null);
            param[17] = dal.MakeParam("@UserActive", SqlDbType.Int, userActive, null);
            param[18] = dal.MakeParam("@Outid", SqlDbType.Int, getid, null);

            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }



        public DataTable Users_Tra(string Mode, int id, string uid, string password)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.NVarChar, uid, null);
            param[3] = dal.MakeParam("@Password", SqlDbType.NVarChar, password, null);
            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;

        }
        public DataTable Users_Tra(string Mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[1];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);

            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }

        public DataTable Users_Tra(string Mode, int id)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }

        public DataTable Users_Tra(string Mode, string Uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }





        public DataTable Set_User_Point(string Mode, int Uid, int Point_Mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[2] = dal.MakeParam("@Point_Mode", SqlDbType.Int, Point_Mode, null);
            dt = dal.ExecSpDt("Set_User_Point", param);
            return dt;
        }




    }
}
