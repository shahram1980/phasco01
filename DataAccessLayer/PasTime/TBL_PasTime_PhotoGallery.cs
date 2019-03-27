using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_PasTime_PhotoGallery
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable SP_PasTime_PhotoGallery(int OperationType, int UserID, int groupID, int FileSize, bool Status
                                    , DateTime Upload_Date, string FileName, string Discription)
        {

            SqlParameter[] parm = new SqlParameter[8];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@UserID", SqlDbType.Int, UserID, null);
            parm[2] = dal.MakeParam("@groupID", SqlDbType.Int, groupID, null);
            parm[3] = dal.MakeParam("@FileSize", SqlDbType.Int, FileSize, null);
            parm[4] = dal.MakeParam("@Status", SqlDbType.Bit, Status, null);
            parm[5] = dal.MakeParam("@Upload_Date", SqlDbType.DateTime, Upload_Date, null);
            parm[6] = dal.MakeParam("@FileName", SqlDbType.VarChar, FileName, null);
            parm[7] = dal.MakeParam("@Discription", SqlDbType.NVarChar, Discription, null);

            dt = dal.ExecSpDt("SP_PasTime_PhotoGallery", parm);
            return dt;
        }
        public DataTable SP_PasTime_PhotoGallery(int OperationType, int groupID, int FileSize, bool Status
                            , DateTime Upload_Date, string FileName, string Discription, int id)
        {

            SqlParameter[] parm = new SqlParameter[8];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@groupID", SqlDbType.Int, groupID, null);
            parm[3] = dal.MakeParam("@FileSize", SqlDbType.Int, FileSize, null);
            parm[4] = dal.MakeParam("@Status", SqlDbType.Bit, Status, null);
            parm[5] = dal.MakeParam("@Upload_Date", SqlDbType.DateTime, Upload_Date, null);
            parm[6] = dal.MakeParam("@FileName", SqlDbType.VarChar, FileName, null);
            parm[7] = dal.MakeParam("@Discription", SqlDbType.NVarChar, Discription, null);

            dt = dal.ExecSpDt("SP_PasTime_PhotoGallery", parm);
            return dt;
        }
        public DataTable SP_PasTime_PhotoGallery(int OperationType, int groupID,  bool Status
                    , DateTime Upload_Date,  string Discription, int id)
        {

            SqlParameter[] parm = new SqlParameter[6];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            parm[2] = dal.MakeParam("@groupID", SqlDbType.Int, groupID, null);
           
            parm[3] = dal.MakeParam("@Status", SqlDbType.Bit, Status, null);
            parm[4] = dal.MakeParam("@Upload_Date", SqlDbType.DateTime, Upload_Date, null);
     
            parm[5] = dal.MakeParam("@Discription", SqlDbType.NVarChar, Discription, null);

            dt = dal.ExecSpDt("SP_PasTime_PhotoGallery", parm);
            return dt;
        }
        public DataTable SP_PasTime_PhotoGallery(int OperationType, string FileName, int id)
        {

            SqlParameter[] parm = new SqlParameter[3];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@FileName", SqlDbType.VarChar, FileName, null);
            parm[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);


            dt = dal.ExecSpDt("SP_PasTime_PhotoGallery", parm);
            return dt;
        }
        public DataTable SP_PasTime_PhotoGallery(int OperationType, string condition)
        {

            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);
   


            dt = dal.ExecSpDt("SP_PasTime_PhotoGallery", parm);
            return dt;
        }
        public DataTable SP_PasTime_PhotoGallery(int OperationType,int id)
        {

            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            parm[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);



            dt = dal.ExecSpDt("SP_PasTime_PhotoGallery", parm);
            return dt;
        }
        public DataTable SP_PasTime_PhotoGallery(int OperationType)
        {

            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);




            dt = dal.ExecSpDt("SP_PasTime_PhotoGallery", parm);
            return dt;
        }
    }
}
	 