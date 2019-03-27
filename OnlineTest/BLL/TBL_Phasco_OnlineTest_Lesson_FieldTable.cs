
//----------------------------------------------------------------

using System;
using System.Data;

using System.Collections.Generic;
using System.Text;
using OnlineTest.DAL;
using System.Data.SqlClient;



namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_Lesson_FieldTable
    {


        DataTable dt = new DataTable();
        BaseDal Dal = new BaseDal();

        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_I(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);

            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Field_I", parm);

            return dt;



        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_I(int OperationType, int LessonID)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Field_I", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_I(int OperationType, int LessonID, int FieldID)
        {
            SqlParameter[] parm = new SqlParameter[3];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@FieldID", SqlDbType.Int, FieldID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Field_I", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_D(int OperationType, int LessonID, int FieldID)
        {

            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@FieldID", SqlDbType.Int, FieldID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Field_D", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_D(int OperationType, int LessonID)
        {

            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);

            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Field_D", parm);

            return dt;


        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_U(int OperationType, int LessonID, int FieldID)
        {

            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@FieldID", SqlDbType.Int, FieldID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Field_U", parm);

            return dt;


        }
    }

}