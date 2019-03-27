using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using PHASCO_Shopping.DAL;
using System.Data.SqlClient;

namespace PHASCO_Shopping.BLL
{
    public class TBL_inquire
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();
        public DataTable TBL_inquire_Tra(int id, string mode, int Uid_id, int Uid_receiver, int Product_Id, string topic, string Message, string message_admin_Translate, int admin_Translate)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[9];
 
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid_id", SqlDbType.Int, Uid_id, null);
            param[3] = dal.MakeParam("@Uid_receiver", SqlDbType.Int, Uid_receiver, null);
            param[4] = dal.MakeParam("@Product_Id", SqlDbType.Int, Product_Id, null);
            param[5] = dal.MakeParam("@topic", SqlDbType.NVarChar, topic, null);
            param[6] = dal.MakeParam("@Message", SqlDbType.NVarChar, Message, null);
            param[7] = dal.MakeParam("@message_admin_Translate", SqlDbType.NVarChar, message_admin_Translate, null);
            param[8] = dal.MakeParam("@admin_Translate", SqlDbType.Int, admin_Translate, null);

            dt = dal.ExecSpDt("TBL_inquire_Tra", param);
            return dt;
        }

        public DataTable TBL_inquire_Tra(int id, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
   
            dt = dal.ExecSpDt("TBL_inquire_Tra", param);
            return dt;
        }

        public DataTable TBL_inquire_Tra_select_Uid_rec(int Uid_receiver,String mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar,mode , null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, Uid_receiver, null);

            dt = dal.ExecSpDt("TBL_inquire_Tra", param);
            return dt;
        }
    }
}
