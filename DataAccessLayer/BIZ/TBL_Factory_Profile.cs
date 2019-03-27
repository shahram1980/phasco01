using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer.BIZ
{
   public class TBL_Factory_Profile
    {
       DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();
        public DataTable TBL_Factory_Profile_Tra(int id, string mode, int Uid, string Area_Factory, string Factory_Address, string Year_built,
            string production_staf, string RD_staff, string Photo, string Materials_Components, string photo_Materials_Components, string Machinery_Equipment,
            string photo_Machinery_Equipment, string Production_Process, string photo_Production_Process)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[15];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@Area_Factory", SqlDbType.NVarChar, Area_Factory, null);
            param[4] = dal.MakeParam("@Factory_Address", SqlDbType.NVarChar, Factory_Address, null);

            param[5] = dal.MakeParam("@Year_built", SqlDbType.NVarChar, Year_built, null);
            param[6] = dal.MakeParam("@production_staf", SqlDbType.NVarChar, production_staf, null);
            param[7] = dal.MakeParam("@RD_staff", SqlDbType.NVarChar, RD_staff, null);

            param[8] = dal.MakeParam("@Photo", SqlDbType.NVarChar, Photo, null);
            param[9] = dal.MakeParam("@Materials_Components", SqlDbType.NVarChar, Materials_Components, null);
            param[10] = dal.MakeParam("@photo_Materials_Components", SqlDbType.NVarChar, photo_Materials_Components, null);

            param[11] = dal.MakeParam("@Machinery_Equipment", SqlDbType.NVarChar, Machinery_Equipment, null);
            param[12] = dal.MakeParam("@photo_Machinery_Equipment", SqlDbType.NVarChar, photo_Machinery_Equipment, null);
            param[13] = dal.MakeParam("@Production_Process", SqlDbType.NVarChar, Production_Process, null);
            param[14] = dal.MakeParam("@photo_Production_Process", SqlDbType.NVarChar, photo_Production_Process, null);

            dt = dal.ExecSpDt("TBL_Factory_Profile_Tra", param);
            return dt;
        }

        public DataTable TBL_Factory_Profile_Tra(int id, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dt = dal.ExecSpDt("TBL_Factory_Profile_Tra", param);
            return dt;
        }
    }
}
