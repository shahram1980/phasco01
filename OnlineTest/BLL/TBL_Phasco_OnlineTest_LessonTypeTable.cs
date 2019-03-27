using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using OnlineTest.DAL;

namespace OnlineTest.BLL
{
    public class TBL_Phasco_OnlineTest_LessonTypeTable
    {
        DataTable dt = new DataTable();
        BaseDal Dal = new BaseDal();

        public DataTable TBL_Phasco_OnlineTest_LessonType_I(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);

            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_LessonType_I", parm);

            return dt;



        }
        public DataTable TBL_Phasco_OnlineTest_LessonType_I(int OperationType, string LessonType)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonType", SqlDbType.NVarChar, LessonType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_LessonType_I", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_LessonType_D(int OperationType, int id)
        {

            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_LessonType_D", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_LessonType_U(int OperationType, int id, string LessonType)
        {

            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = Dal.MakeParam("@LessonType", SqlDbType.NVarChar, LessonType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_LessonType_U", parm);

            return dt;


        }
    }
}
