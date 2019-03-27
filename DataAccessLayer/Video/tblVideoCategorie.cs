using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Video
{
   public class tblVideoCategorie
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable tblVideoCategorie_SP(int OperationType, int id, string Categorie_Name)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Categorie_Name", SqlDbType.NVarChar, Categorie_Name, null);
 
            dt = dal.ExecSpDt("tblVideoCategorie_SP", param);
            return dt;
        }
    }
}
