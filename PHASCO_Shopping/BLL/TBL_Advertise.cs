using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using PHASCO_Shopping.DAL;

namespace PHASCO_Shopping.BLL
{
    public class TBL_Advertise
    {
        DataTable dt = new DataTable();
        BaseDAL dal = new BaseDAL();
        public DataTable Tbl_Advertise(int OperationType, string Ex, DateTime StartDate, string Url, int Hit, DateTime EndDate, int id, int Mode, int load, string name, string text, string position, string condition,string PageName)
        {
            SqlParameter[] param = new SqlParameter[15];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@Ex", SqlDbType.NVarChar, Ex, null);
            param[2] = dal.MakeParam("@Url", SqlDbType.NVarChar, Url, null);
            param[3] = dal.MakeParam("@name", SqlDbType.NVarChar, name, null);
            param[4] = dal.MakeParam("@text", SqlDbType.NVarChar, text, null);
            param[5] = dal.MakeParam("@position", SqlDbType.NVarChar,position, null);
            param[6] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);
            param[7] = dal.MakeParam("@Hit", SqlDbType.Int, Hit, null);
            //param[8] = dal.MakeParam("@id", SqlDbType.Int, Hit, null);
            param[8] = dal.MakeParam("@load", SqlDbType.Int,load, null);
            param[9] = dal.MakeParam("@EndDate", SqlDbType.DateTime, EndDate, null);
            param[10] = dal.MakeParam("@StartDate", SqlDbType.DateTime, StartDate, null);
            param[11] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[12] = dal.MakeParam("@MaxId", SqlDbType.Int, id, null,ParameterDirection.Output);
            param[13] = dal.MakeParam("@PageName", SqlDbType.NVarChar, PageName, null);
            param[14] = dal.MakeParam("@Mode", SqlDbType.Int, Mode, null);
            dt = dal.ExecSpDt("sp_Advertise", param);
            return dt;

        }
        public DataTable Tbl_Advertise(int? maxid,int OperationType, string Ex, DateTime StartDate, string Url, int Hit, DateTime EndDate, int id, int Mode, int load, string name, string text, string position, string condition)
        {
            SqlParameter[] param = new SqlParameter[13];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@Ex", SqlDbType.NVarChar, Ex, null);
            param[2] = dal.MakeParam("@Url", SqlDbType.NVarChar, Url, null);
            param[3] = dal.MakeParam("@name", SqlDbType.NVarChar, name, null);
            param[4] = dal.MakeParam("@text", SqlDbType.NVarChar, text, null);
            param[5] = dal.MakeParam("@position", SqlDbType.NVarChar, position, null);
            param[6] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);
            param[7] = dal.MakeParam("@Hit", SqlDbType.Int, Hit, null);
            //param[8] = dal.MakeParam("@id", SqlDbType.Int, Hit, null);
            param[8] = dal.MakeParam("@load", SqlDbType.Int, Hit, null);
            param[9] = dal.MakeParam("@EndDate", SqlDbType.DateTime, EndDate, null);
            param[10] = dal.MakeParam("@StartDate", SqlDbType.DateTime, StartDate, null);
            param[11] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[12] = dal.MakeParam("@MaxId", SqlDbType.Int,maxid , null, ParameterDirection.Output);
            dt = dal.ExecSpDt("sp_Advertise", param);
            return dt;

        }
        

    }
}
