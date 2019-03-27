using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using DataAccessLayer;

namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_Lesson_DegreeTable
    {
        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TBL_Phasco_OnlineTest_Lesson_Degree_I(int OperationType)
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Degree_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Degree_I(int OperationType, int LessonID)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Degree_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Degree_I(int OperationType, int LessonID, int DegreeID)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@DegreeID", SqlDbType.Int, DegreeID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Degree_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Degree_D(int OperationType, int LessonID, int DegreeID)
        {

            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@DegreeID", SqlDbType.Int, DegreeID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Degree_D", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Degree_D(int OperationType, int LessonID)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Degree_D", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Degree_U(int OperationType, int LessonID, int DegreeID)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@DegreeID", SqlDbType.Int, DegreeID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Degree_U", parm);
            return dt;
        }
    }
}