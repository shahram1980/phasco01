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
    public class Tbl_Message
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable Message_Tra(string Mode, int id, int Reciver, int Sender, int ModeMss, string Title, string Body,
                                        int Archive,string Attach,int Outbox)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[10];
 
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Reciver", SqlDbType.Int, Reciver, null);
            param[3] = dal.MakeParam("@Sender", SqlDbType.Int, Sender, null);
            param[4] = dal.MakeParam("@ModeMss ", SqlDbType.Int, ModeMss, null);
            param[5] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[6] = dal.MakeParam("@Body", SqlDbType.NText, Body, null);
            param[7] = dal.MakeParam("@Archive", SqlDbType.Int, Archive, null);
            param[8] = dal.MakeParam("@Attach", SqlDbType.NVarChar, Attach, null);
            param[9] = dal.MakeParam("@Outbox", SqlDbType.Int, Outbox, null);

            dt = dal.ExecSpDt("Message_Tra", param);
            return dt;
        }


        public DataTable Message_Tra(string Mode, int id )
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);

            dt = dal.ExecSpDt("Message_Tra", param);
            return dt;
        }

        public DataTable Message_Tra(string Mode, int id, int Reciver)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Reciver", SqlDbType.Int, Reciver, null);
            dt = dal.ExecSpDt("Message_Tra", param);
            return dt;
        }


        public DataTable Message_Tra(string Mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[1];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);

            dt = dal.ExecSpDt("Message_Tra", param);
            return dt;
        }
    }
}
