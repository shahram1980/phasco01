

using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;

namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_QuestionAnswerTable
    {
        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TBL_Phasco_OnlineTest_QuestionAnswer_I(int OperationType, string QuestionBody, string QuestionAnatomicalResponse
            , int LessonID)
        {
            SqlParameter[] parm = new SqlParameter[4];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuestionBody", SqlDbType.NVarChar, QuestionBody, null);
            parm[2] = Dal.MakeParam("@QuestionAnatomicalResponse", SqlDbType.NVarChar, QuestionAnatomicalResponse, null);
            parm[3] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionAnswer_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_QuestionAnswer_I(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionAnswer_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_QuestionAnswer_I(int OperationType, int QuestionCount, string temp, int LessonID)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuestionCount", SqlDbType.Int, QuestionCount, null);
            parm[2] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionAnswer_I", parm);
            return dt;
        }

        public DataTable TBL_Phasco_OnlineTest_QuestionAnswer_I(int OperationType, int LessonID,int temp)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@LessonID", SqlDbType.Int, LessonID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionAnswer_I", parm);
            return dt;
        }



        public DataTable TBL_Phasco_OnlineTest_QuestionAnswer_D(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionAnswer_D", parm);
            return dt;
        }

        public DataTable TBL_Phasco_OnlineTest_QuestionAnswer_U(int OperationType, string QuestionBody, string QuestionAnatomicalResponse
            , int id)
        {
            SqlParameter[] parm = new SqlParameter[4];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuestionBody", SqlDbType.NVarChar, QuestionBody, null);
            parm[2] = Dal.MakeParam("@QuestionAnatomicalResponse", SqlDbType.NVarChar, QuestionAnatomicalResponse, null);
            parm[3] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_QuestionAnswer_U", parm);
            return dt;
        }

    }
}