

using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;



namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_QuestionUserAnswerTable 
    {

        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_I(int OperationType, int QuizID, int QuestionID, int QuestionNumber)
        {
            SqlParameter[] parm = new SqlParameter[4];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuizID", SqlDbType.Int, QuizID, null);
            parm[2] = Dal.MakeParam("@QuestionID", SqlDbType.Int, QuestionID, null);
            parm[3] = Dal.MakeParam("@QuestionNumber", SqlDbType.Int, QuestionNumber, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_I", parm);
            return dt;
        }
  
        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_I(int OperationType, int QuizID)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuizID", SqlDbType.Int, QuizID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_I(int OperationType, int QuestionID,int temp)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuestionID", SqlDbType.Int, QuestionID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_I(int OperationType, int QuizID, int StartIndex, int EndIndex,string temp)
        {
            SqlParameter[] parm = new SqlParameter[4];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuizID", SqlDbType.Int, QuizID, null);
            parm[2] = Dal.MakeParam("@StartIndex", SqlDbType.Int, StartIndex, null);
            parm[3] = Dal.MakeParam("@EndIndex", SqlDbType.Int, EndIndex, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_I(int OperationType, int QuestionCount, string temp)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_I", parm);
            return dt;
        }

        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_D(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_D", parm);
            return dt;
        }

        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_U(int OperationType, string QuestionBody, string QuestionAnatomicalResponse
            , int id)
        {
            SqlParameter[] parm = new SqlParameter[4];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_U", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_QuestionUserAnswer_U(int OperationType, int QuizID, int QuestionID, int SwitchNumber,string QuizUId)
        {
            SqlParameter[] parm = new SqlParameter[5];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuizID", SqlDbType.Int, QuizID, null);
            parm[2] = Dal.MakeParam("@QuestionID", SqlDbType.Int, QuestionID, null);
            parm[3] = Dal.MakeParam("@SwitchNumber", SqlDbType.Int, SwitchNumber, null);
            parm[4] = Dal.MakeParam("@QuizUId", SqlDbType.NVarChar, QuizUId, null);

            
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionUserAnswer_U", parm);
            return dt;
        }
    }
}