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
    public class User
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable GetUsers_Tra_DT(string Mode, int id, string uid,string password,string name,string famil,string father,int sex,DateTime birthDaye,
            string website,string email,string tel,string address,string des,int image,int intriId,int userRole,int userActive)
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
       
        public DataTable GetUsers_Tra_DT(string Mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[1];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }

        public DataTable GetUsers_Tra_DT(string Mode,int id)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }

        public DataTable GetUsers_Tra_DT(string Mode, string Uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }

        public DataTable GetUsers_Tra_DT(string Mode,int id, string Uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.NVarChar, Uid, null);
            dt = dal.ExecSpDt("Users_Tra", param);
            return dt;
        }
    }
}
