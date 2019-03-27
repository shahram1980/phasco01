
using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DataAccessLayer;


namespace OnlineTest.BLL
{

    public class TBL_Phasco_OnlineTest_QuizTable 
    {


        DataTable dt = new DataTable();
        DAL_Quiz Dal = new DAL_Quiz();

        public DataTable TBL_Phasco_OnlineTest_Quiz_I(int OperationType, int FieldID, int DegreeID,
            int UserID, string QuizTitle, double QuizScore, DateTime CreationDate)
        {
            SqlParameter[] parm = new SqlParameter[7];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@FieldID", SqlDbType.Int, FieldID, null);
            parm[2] = Dal.MakeParam("@DegreeID", SqlDbType.Int, DegreeID, null);
            parm[3] = Dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            parm[4] = Dal.MakeParam("@QuizTitle", SqlDbType.NVarChar, QuizTitle, null);
            parm[5] = Dal.MakeParam("@QuizScore", SqlDbType.Float, QuizScore, null);
            parm[6] = Dal.MakeParam("@CreationDate", SqlDbType.DateTime, CreationDate, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Quiz_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Quiz_I(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Quiz_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Quiz_I(int OperationType, int UserID, int temp)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Quiz_I", parm);
            return dt;
        }
        public DataTable TBL_Phasco_OnlineTest_Quiz_I(int OperationType )
        {
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Quiz_I", parm);
            return dt;
        } 


        public DataTable TBL_Phasco_OnlineTest_Quiz_D(int OperationType, int id)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Quiz_D", parm);
            return dt;
        }

        public DataTable TBL_Phasco_OnlineTest_Quiz_U(int OperationType, int id, float QuizScore)
        {
            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = Dal.MakeParam("@QuizScore", SqlDbType.Float, Math.Round(QuizScore, 2), null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_Quiz_U", parm);
            return dt;
        }

    }
}