using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
    public class TBL_BIZ_User
    {
        DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();
        public DataTable TBL_User_Tra(int id, string mode, string Uid, string Password, int User_Status, string Business_Location,
            string Company, string Industry, string Given_Name, string Family_Name, string Tel_C_Code, string Tel_A_Code, string Tel_A_Number,
            string Mobile, int User_Level, int sex, int UsersRoleID)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[17];


            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            param[3] = dal.MakeParam("@Password", SqlDbType.NVarChar, Password, null);
            param[4] = dal.MakeParam("@User_Status", SqlDbType.Int, User_Status, null);
            param[5] = dal.MakeParam("@Business_Location", SqlDbType.NVarChar, Business_Location, null);
            param[6] = dal.MakeParam("@Company", SqlDbType.NVarChar, Company, null);
            param[7] = dal.MakeParam("@Industry", SqlDbType.NVarChar, Industry, null);
            param[8] = dal.MakeParam("@Given_Name", SqlDbType.NVarChar, Given_Name, null);
            param[9] = dal.MakeParam("@Family_Name", SqlDbType.NVarChar, Family_Name, null);
            param[10] = dal.MakeParam("@Tel_C_Code", SqlDbType.VarChar, Tel_C_Code, null);
            param[11] = dal.MakeParam("@Tel_A_Code", SqlDbType.VarChar, Tel_A_Code, null);
            param[12] = dal.MakeParam("@Tel_A_Number", SqlDbType.VarChar, Tel_A_Number, null);
            param[13] = dal.MakeParam("@Mobile", SqlDbType.VarChar, Mobile, null);
            param[14] = dal.MakeParam("@User_Level", SqlDbType.Int, User_Level, null);
            param[15] = dal.MakeParam("@sex", SqlDbType.Int, sex, null);
            param[16] = dal.MakeParam("@UsersRoleID", SqlDbType.Int, UsersRoleID, null);

            dt = dal.ExecSpDt("TBL_User_Tra", param);
            return dt;
        }
        public DataTable TBL_User_Tra(string mode)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_User_Tra", param);
            return dt;
        }
        public DataTable TBL_User_Tra(string mode, int id)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_User_Tra", param);
            return dt;
        }
        public DataTable TBL_User_Tra(string mode, string Uid, string Lastname)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@uid", SqlDbType.NVarChar, Uid, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Family_Name", SqlDbType.NVarChar, Lastname, null);
            dt = dal.ExecSpDt("TBL_User_Tra", param);
            return dt;
        }

        public DataTable TBL_User_Tra(string mode, int id, string forgotpassCcode)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@id", SqlDbType.NVarChar, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@forgotpassCcode", SqlDbType.NVarChar, forgotpassCcode, null);
            dt = dal.ExecSpDt("TBL_User_Tra", param);
            return dt;
        }

        public DataTable Changepass(string mode, int id, string passwordold, string passwordnew)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@Password", SqlDbType.NVarChar, passwordold, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Password2", SqlDbType.NVarChar, passwordnew, null);
            param[3] = dal.MakeParam("@id", SqlDbType.NVarChar, id, null);
            dt = dal.ExecSpDt("TBL_User_Tra", param);
            return dt;
        }

        public DataTable TBL_User_Tra(int ActiveMode, int id, string mode, string Uid, string Password, int User_Status, string Business_Location,
           string Company, string Industry, string Given_Name, string Family_Name, string Tel_C_Code, string Tel_A_Code, string Tel_A_Number,
           string Mobile, int User_Level, int sex, int UsersRoleID)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[18];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            param[3] = dal.MakeParam("@Password", SqlDbType.NVarChar, Password, null);
            param[4] = dal.MakeParam("@User_Status", SqlDbType.Int, User_Status, null);
            param[5] = dal.MakeParam("@Business_Location", SqlDbType.NVarChar, Business_Location, null);
            param[6] = dal.MakeParam("@Company", SqlDbType.NVarChar, Company, null);
            param[7] = dal.MakeParam("@Industry", SqlDbType.NVarChar, Industry, null);
            param[8] = dal.MakeParam("@Given_Name", SqlDbType.NVarChar, Given_Name, null);
            param[9] = dal.MakeParam("@Family_Name", SqlDbType.NVarChar, Family_Name, null);
            param[10] = dal.MakeParam("@Tel_C_Code", SqlDbType.VarChar, Tel_C_Code, null);
            param[11] = dal.MakeParam("@Tel_A_Code", SqlDbType.VarChar, Tel_A_Code, null);
            param[12] = dal.MakeParam("@Tel_A_Number", SqlDbType.VarChar, Tel_A_Number, null);
            param[13] = dal.MakeParam("@Mobile", SqlDbType.VarChar, Mobile, null);
            param[14] = dal.MakeParam("@User_Level", SqlDbType.Int, User_Level, null);
            param[15] = dal.MakeParam("@sex", SqlDbType.Int, sex, null);
            param[16] = dal.MakeParam("@ActiveMode", SqlDbType.Int, ActiveMode, null);
            param[17] = dal.MakeParam("@UsersRoleID", SqlDbType.Int, UsersRoleID, null);

            dt = dal.ExecSpDt("TBL_User_Tra", param);
            return dt;
        }

        public DataTable Check_login(int operationtype, string username, string password)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@username", SqlDbType.NVarChar, username, null);
            param[1] = dal.MakeParam("@password", SqlDbType.NVarChar, password, null);
            param[2] = dal.MakeParam("@operationtype", SqlDbType.Int, operationtype, null);
            dt = dal.ExecSpDt("SP_AdminUsers", param);
            return dt;
        }

        public DataTable Check_login(int operationtype, string username, string password, int id)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@username", SqlDbType.NVarChar, username, null);
            param[1] = dal.MakeParam("@password", SqlDbType.NVarChar, password, null);
            param[2] = dal.MakeParam("@operationtype", SqlDbType.Int, operationtype, null);
            param[3] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("SP_AdminUsers", param);
            return dt;
        }


        public DataTable TBL_User_Limitation_Tra(int UserRoleID, string mode, string RoleName, int ProductLimitedCount, int ProductLimitedDate
            , int RequestLimitedCount, int RequestLimitedDate, int CompanyLimitedCount, int CompanyLimitedDate)
        {
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = dal.MakeParam("@UserRoleID", SqlDbType.Int, UserRoleID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@RoleName", SqlDbType.NVarChar, RoleName, null);
            param[3] = dal.MakeParam("@ProductLimitedCount", SqlDbType.Int, ProductLimitedCount, null);
            param[4] = dal.MakeParam("@ProductLimitedDate", SqlDbType.Int, ProductLimitedDate, null);
            param[5] = dal.MakeParam("@RequestLimitedCount", SqlDbType.Int, RequestLimitedCount, null);
            param[6] = dal.MakeParam("@RequestLimitedDate", SqlDbType.Int, RequestLimitedDate, null);
            param[7] = dal.MakeParam("@CompanyLimitedCount", SqlDbType.Int, CompanyLimitedCount, null);
            param[8] = dal.MakeParam("@CompanyLimitedDate", SqlDbType.Int, CompanyLimitedDate, null);

            dtTemp = dal.ExecSpDt("TBL_User_Limitation_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_User_Limitation_Tra(int UserRoleID, string mode)
        {
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@UserRoleID", SqlDbType.Int, UserRoleID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_User_Limitation_Tra", param);
            return dtTemp;
        }


    }
}
