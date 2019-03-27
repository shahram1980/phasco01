using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
   public class TBL_Categories
    {
        DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();

        public DataTable TBL_Categories_Tra(int id, string mode, int subid, string Subject_en, string Subject_ch, string Subject_ir, int SubCatNo, int LevelID)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[8];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@subid", SqlDbType.Int, subid, null);
            param[3] = dal.MakeParam("@Subject_en", SqlDbType.NVarChar, Subject_en, null);
            param[4] = dal.MakeParam("@Subject_ch", SqlDbType.NVarChar, Subject_ch, null);
            param[5] = dal.MakeParam("@Subject_ir", SqlDbType.NVarChar, Subject_ir, null);
            param[6] = dal.MakeParam("@SubCatNo", SqlDbType.Int, SubCatNo, null);
            param[7] = dal.MakeParam("@LevelID", SqlDbType.Int, LevelID, null);
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

        public DataTable TBL_Categories_Tra(string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[1];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_Categories_Tra", param);
            return dt;
        }

        public DataTable TBL_Categories_Tra(int subid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@subid", SqlDbType.Int, subid, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_L2_fa", null);
            dt = dal.ExecSpDt("TBL_Categories_Tra", param);
            return dt;
        }

        public DataTable TBL_Categories_Tra_Cascade(int subid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@subid", SqlDbType.Int, subid, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_L2_cascade", null);
            dt = dal.ExecSpDt("TBL_Categories_Tra", param);
            return dt;
        }

        public DataTable TBL_Categories_Tra(string mode, int subid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@subid", SqlDbType.Int, subid, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_Categories_Tra", param);
            return dt;
        }

        public DataTable TBL_Categories_Tra(string mode, string multiid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@multicatID", SqlDbType.NVarChar, multiid, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_Categories_Tra", param);
            return dt;
        }
    }
}
