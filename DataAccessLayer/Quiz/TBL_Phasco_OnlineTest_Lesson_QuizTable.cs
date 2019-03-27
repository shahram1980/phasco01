

using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;

namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_Lesson_QuizTable 
    {

        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();
        public DataTable TBL_Phasco_OnlineTest_Lesson_Quiz_I(int OperationType, int QuizID, int LessonID, int StartIndex, int EndIndex)
        {
            SqlParameter[] parm = new SqlParameter[5];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuizID", SqlDbType.Int, QuizID, null);
            parm[2] = Dal.MakeParam("@StartIndex", SqlDbType.Int, StartIndex, null);
            parm[3] = Dal.MakeParam("@EndIndex", SqlDbType.Int, EndIndex, null);
            parm[4] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Quiz_I", parm);

            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Lesson_Quiz_I(int OperationType, int QuizID)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuizID", SqlDbType.Int, QuizID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Lesson_Quiz_I", parm);
            return dt;
        }

    }
}
		