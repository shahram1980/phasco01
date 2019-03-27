

using System;
using System.Data;

using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using OnlineTest.DAL;


namespace OnlineTest.BLL
{

	public class TBL_Phasco_OnlineTest_AnswerSwitchTable
    {
        DataTable dt = new DataTable();
        BaseDal Dal = new BaseDal();

        public DataTable TBL_Phasco_OnlineTest_AnswerSwitch_I(int OperationType, string SwitchBody, int SwitchNumber, int QuestionID
          , bool IsTrueAnswer)
        {
            SqlParameter[] parm = new SqlParameter[5];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@SwitchBody", SqlDbType.NVarChar, SwitchBody, null);
            parm[2] = Dal.MakeParam("@SwitchNumber", SqlDbType.Int, SwitchNumber, null);
            parm[3] = Dal.MakeParam("@QuestionID", SqlDbType.Int, QuestionID, null);
            parm[4] = Dal.MakeParam("@IsTrueAnswer", SqlDbType.Bit, IsTrueAnswer, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_AnswerSwitch_I", parm);

            return dt;






        }
        public DataTable TBL_Phasco_OnlineTest_AnswerSwitch_I(int OperationType, int QuestionID)
        {
            SqlParameter[] parm = new SqlParameter[2];

            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@QuestionID", SqlDbType.Int, QuestionID, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_AnswerSwitch_I", parm);

            return dt;



        }



        public DataTable TBL_Phasco_OnlineTest_AnswerSwitch_D(int OperationType, int id)
        {

            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_AnswerSwitch_D", parm);

            return dt;


        }

        public DataTable TBL_Phasco_OnlineTest_AnswerSwitch_U(int OperationType, string SwitchBody, int SwitchNumber, int id
          , bool IsTrueAnswer)
        {
            SqlParameter[] parm = new SqlParameter[5];
            parm[0] = Dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = Dal.MakeParam("@SwitchBody", SqlDbType.NVarChar, SwitchBody, null);
            parm[2] = Dal.MakeParam("@SwitchNumber", SqlDbType.Int, SwitchNumber, null);
            parm[3] = Dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[4] = Dal.MakeParam("@IsTrueAnswer", SqlDbType.Bit, IsTrueAnswer, null);

            dt = Dal.ExecSpDt("TBL_Phasco_OnlineTest_AnswerSwitch_U", parm);

            return dt;


        }

	} 
} 
