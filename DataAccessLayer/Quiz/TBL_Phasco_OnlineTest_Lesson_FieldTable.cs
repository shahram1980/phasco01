
//----------------------------------------------------------------
using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;



namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_Lesson_FieldTable
    {


        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

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
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_I(int OperationType, int LessonID, int FieldID, int GroupId, int DegreeID)
        {
            SqlParameter[] parm = new SqlParameter[5];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@FieldID", SqlDbType.Int, FieldID, null);
            parm[3] = Dal.MakeParam("@GroupId", SqlDbType.Int, GroupId, null);
            parm[4] = Dal.MakeParam("@DegreeID", SqlDbType.Int, DegreeID, null);

            
            
            
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Field_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_I(int OperationType, int LessonID, int FieldID, int GroupId, int DegreeID, int UserID)
        {
            SqlParameter[] parm = new SqlParameter[6];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@FieldID", SqlDbType.Int, FieldID, null);
            parm[3] = Dal.MakeParam("@GroupId", SqlDbType.Int, GroupId, null);
            parm[4] = Dal.MakeParam("@DegreeID", SqlDbType.Int, DegreeID, null);
            parm[5] = Dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            


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
        public DataTable TBL_Phasco_OnlineTest_Lesson_Field_D(int OperationType, int LessonID,int GroupId,string temp)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            parm[2] = Dal.MakeParam("@GroupId", SqlDbType.Int, GroupId, null);
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