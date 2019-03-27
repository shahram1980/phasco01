using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
   public class TBL_News
    {
       DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();
        public DataTable News_Insert_Edit(int id, string mode, string Title, string News, string Image, string lang,
 string Comment, int f_month, int f_Day)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[10];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[3] = dal.MakeParam("@News", SqlDbType.NText, News, null);

            param[4] = dal.MakeParam("@Image", SqlDbType.NVarChar, Image, null);
            param[5] = dal.MakeParam("@lang", SqlDbType.NVarChar, lang, null);
            param[6] = dal.MakeParam("@Comment", SqlDbType.Char, Comment, null);

            param[7] = dal.MakeParam("@f_month", SqlDbType.Int, f_month, null);
            param[8] = dal.MakeParam("@f_Day", SqlDbType.Int, f_Day, null);
            param[9] = dal.MakeParam("@Outid", SqlDbType.Int, f_Day, null);


            dt = dal.ExecSpDt("News_Insert_Edit", param);
            return dt;
        }

        public DataTable News_Insert_Edit(string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Outid", SqlDbType.Int, 0, null);

            dt = dal.ExecSpDt("News_Insert_Edit", param);
            return dt;
        }
    }
}
