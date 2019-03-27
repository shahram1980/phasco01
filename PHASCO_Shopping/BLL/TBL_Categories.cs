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
using System.Data.SqlClient;
using PHASCO_Shopping.DAL;

namespace PHASCO_Shopping.BLL
{
    public class TBL_Categories
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();

        public DataTable TBL_Categories_Tra(int id, string mode, int subid, string Subject_en, string Subject_ch, string Subject_ir, int SubCatNo)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[7];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@subid", SqlDbType.Int, subid, null);
            param[3] = dal.MakeParam("@Subject_en", SqlDbType.NVarChar, Subject_en, null);
            param[4] = dal.MakeParam("@Subject_ch", SqlDbType.NVarChar, Subject_ch, null);
            param[5] = dal.MakeParam("@Subject_ir", SqlDbType.NVarChar, Subject_ir, null);
            param[6] = dal.MakeParam("@SubCatNo", SqlDbType.Int, SubCatNo, null);
            dt = dal.ExecSpDt("TBL_Categories_Tra", param);
            return dt;
        }
        public DataTable TBL_Categories_Tra(int id, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_Categories_Tra", param);
            return dt;
        }
        internal object TBL_Categories_Tra(int p, string p_2, int p_3, string p_4, string p_5, string p_6, string p_7)
        {
            throw new NotImplementedException();
        }
    }
}
