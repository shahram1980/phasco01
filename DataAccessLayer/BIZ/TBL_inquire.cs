using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
 public   class TBL_inquire
    {
     DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();
        public DataTable TBL_inquire_Tra(int id, string mode, int Uid_id, int Uid_receiver, int Product_Id, string topic, string Message
            , string message_admin_Translate, int admin_Translate, int TypeID, string SenderName, string SenderEmail, string SenderTel)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[13];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid_id", SqlDbType.Int, Uid_id, null);
            param[3] = dal.MakeParam("@Uid_receiver", SqlDbType.Int, Uid_receiver, null);
            param[4] = dal.MakeParam("@Product_Id", SqlDbType.Int, Product_Id, null);
            param[5] = dal.MakeParam("@topic", SqlDbType.NVarChar, topic, null);
            param[6] = dal.MakeParam("@Message", SqlDbType.NVarChar, Message, null);
            param[7] = dal.MakeParam("@message_admin_Translate", SqlDbType.NVarChar, message_admin_Translate, null);
            param[8] = dal.MakeParam("@admin_Translate", SqlDbType.Int, admin_Translate, null);
            param[9] = dal.MakeParam("@Type", SqlDbType.Int, TypeID, null);
            param[10] = dal.MakeParam("@SenderName", SqlDbType.NVarChar, SenderName, null);
            param[11] = dal.MakeParam("@SenderEmail", SqlDbType.NVarChar, SenderEmail, null);
            param[12] = dal.MakeParam("@SenderTel", SqlDbType.NVarChar, SenderTel, null);


            dt = dal.ExecSpDt("TBL_inquire_Tra", param);
            return dt;
        }
        public DataTable TBL_inquire_Tra(int Uid_receiver, String mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, Uid_receiver, null);

            dt = dal.ExecSpDt("TBL_inquire_Tra", param);
            return dt;
        }

        public DataTable TBL_inquire_Tra(String mode, int Uid_receiver, int typeID1, int typeID2)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Uid_receiver", SqlDbType.Int, Uid_receiver, null);
            param[2] = dal.MakeParam("@Type", SqlDbType.Int, typeID1, null);
            param[3] = dal.MakeParam("@id", SqlDbType.Int, typeID2, null);

            dt = dal.ExecSpDt("TBL_inquire_Tra", param);
            return dt;
        }

        public DataTable TBL_inquire_Tra_select_Uid_rec(int Uid_receiver, String mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, Uid_receiver, null);

            dt = dal.ExecSpDt("TBL_inquire_Tra", param);
            return dt;
        }
    }
}
