using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using PHASCO_Shopping.DAL;

namespace PHASCO_Shopping.BLL
{
    public class TBL_product_Images_gallery
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();

        public DataTable TBL_product_Images_gallery_SP(int id, string mode,string small,string big)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@small", SqlDbType.NVarChar, small, null);
            param[3] = dal.MakeParam("@big", SqlDbType.NVarChar, big, null);
            dt = dal.ExecSpDt("TBL_product_Images_gallery_SP", param);
            return dt;
        }


        public DataTable TBL_product_Images_gallery_SP(int id, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_product_Images_gallery_SP", param);
            return dt;
        }
    }
}