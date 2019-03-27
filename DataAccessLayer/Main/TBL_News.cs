using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Main
{
    public class TBL_News
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable News_Insert_Edit(string mode, int Id, string Title, string News, string Mode, string Image, string lang, string Comment,
           int f_month, int f_Day, int News_Mode, int IsSpecial, int count_)
        {
            SqlParameter[] param = new SqlParameter[12];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Id", SqlDbType.Int, Id, null);
            param[2] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[3] = dal.MakeParam("@News", SqlDbType.NText, News, null);
            param[4] = dal.MakeParam("@Image", SqlDbType.NVarChar, Image, null);
            param[5] = dal.MakeParam("@lang", SqlDbType.NVarChar, lang, null);
            param[6] = dal.MakeParam("@Comment", SqlDbType.Char, Comment, null);
            param[7] = dal.MakeParam("@f_month", SqlDbType.Int, f_month, null);
            param[8] = dal.MakeParam("@f_Day", SqlDbType.Int, f_Day, null);
            param[9] = dal.MakeParam("@News_Mode", SqlDbType.Int, News_Mode, null);
            param[10] = dal.MakeParam("@IsSpecial", SqlDbType.Int, IsSpecial, null);
            param[11] = dal.MakeParam("@count_", SqlDbType.Int, count_, null);

            dt = dal.ExecSpDt("News_Insert_Edit ", param);
            return dt;
        }
    }
}
