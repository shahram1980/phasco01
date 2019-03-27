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
    public class TBL_News
    {
        BaseDAL dal = new BaseDAL();
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
    }
}
