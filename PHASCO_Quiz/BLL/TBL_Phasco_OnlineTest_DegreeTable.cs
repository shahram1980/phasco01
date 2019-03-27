

using System;
using System.Data;

using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using OnlineTest.DAL;



namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_DegreeTable
    {

        DataTable dt = new DataTable();
        BaseDal Dal = new BaseDal();

        public DataTable TBL_Phasco_OnlineTest_Degree_I(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);

            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Degree_I", parm);

            return dt;



        }
        public DataTable TBL_Phasco_OnlineTest_Degree_I(int OperationType, string DegreeName)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@DegreeName", SqlDbType.NVarChar, DegreeName, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Degree_I", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_Degree_D(int OperationType, int id)
        {

            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Degree_D", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_Degree_U(int OperationType, int id, string DegreeName)
        {

            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = Dal.MakeParam("@DegreeName", SqlDbType.NVarChar, DegreeName, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Degree_U", parm);

            return dt;


        }

    }
}
