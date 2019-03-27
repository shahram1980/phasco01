

using System;
using System.Data;

using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using OnlineTest.DAL;



namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_LessonTable 
    {


        DataTable dt = new DataTable();
        BaseDal Dal = new BaseDal();

        public DataTable TBL_Phasco_OnlineTest_Lesson_I(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);

            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_I", parm);

            return dt;



        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_I(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_I", parm);

            return dt;



        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_I(int OperationType, string LessonName, int LessonType
            , int LessonCoefficient, string Lessondescription, DateTime LastModificationDate, int TimeToAnswer)
        {
            SqlParameter[] parm = new SqlParameter[7];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonName", SqlDbType.NVarChar, LessonName, null);
            parm[2] = Dal.MakeParam("@LessonType", SqlDbType.Int, LessonType, null);
            parm[3] = Dal.MakeParam("@LessonCoefficient", SqlDbType.Int, LessonCoefficient, null);
            parm[4] = Dal.MakeParam("@Lessondescription", SqlDbType.NVarChar, Lessondescription, null);
            parm[5] = Dal.MakeParam("@LastModificationDate", SqlDbType.DateTime, LastModificationDate, null);
            parm[6] = Dal.MakeParam("@TimeToAnswer", SqlDbType.Int, TimeToAnswer, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_I", parm);

            return dt;


        }

		
        public DataTable TBL_Phasco_OnlineTest_Lesson_D(int OperationType, int id)
        {

            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_D", parm);

            return dt;


        }

        public DataTable TBL_Phasco_OnlineTest_Lesson_U(int OperationType,int id, string LessonName, int LessonType
     , int LessonCoefficient, string Lessondescription, DateTime LastModificationDate, int TimeToAnswer)
        {
            SqlParameter[] parm = new SqlParameter[7];

         parm[0] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[1] = Dal.MakeParam("@LessonName", SqlDbType.NVarChar, LessonName, null);
            parm[2] = Dal.MakeParam("@LessonType", SqlDbType.Int, LessonType, null);
            parm[3] = Dal.MakeParam("@LessonCoefficient", SqlDbType.Int, LessonCoefficient, null);
            parm[4] = Dal.MakeParam("@Lessondescription", SqlDbType.NVarChar, Lessondescription, null);
            parm[5] = Dal.MakeParam("@LastModificationDate", SqlDbType.DateTime, LastModificationDate, null);
            parm[6] = Dal.MakeParam("@TimeToAnswer", SqlDbType.Int, TimeToAnswer, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_U", parm);

            return dt;


        }

    }
}
