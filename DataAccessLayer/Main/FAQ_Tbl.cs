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
    public class FAQ_Tbl
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable FAQ_Tra(string Mode, int subid, int ans_Id, string title, string text, int Status,
            int sender_Id, int Questoin_Id, string lang)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[9];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@subid", SqlDbType.Int, subid, null);
            param[2] = dal.MakeParam("@ans_Id ", SqlDbType.Int, ans_Id, null);
            param[3] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);

            param[4] = dal.MakeParam("@text", SqlDbType.NText, text, null);
            param[5] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            param[6] = dal.MakeParam("@sender_Id", SqlDbType.Int, sender_Id, null);
            param[7] = dal.MakeParam("@Questoin_Id", SqlDbType.Int, Questoin_Id, null);
            param[8] = dal.MakeParam("@lang ", SqlDbType.NVarChar, lang, null);

            dt = dal.ExecSpDt("FAQ_Tra", param);
            return dt;
        }



        public DataTable FAQ_List_Tra(string Mode, int id, string title, string lang)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@title", SqlDbType.NVarChar, title, null);
            param[3] = dal.MakeParam("@lang ", SqlDbType.NVarChar, lang, null);

            dt = dal.ExecSpDt("FAQ_List_Tra", param);
            return dt;
        }

    }
}
