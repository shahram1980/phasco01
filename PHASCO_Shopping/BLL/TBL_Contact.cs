using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PHASCO_Shopping.DAL;
using System.Data;
using System.Data.SqlClient;

namespace PHASCO_Shopping.BLL
{
    public class TBL_Contact
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();

        public DataTable TBL_Contact_SP(int OperationType, int id, int Uid, string teloffice1, string teloffice2, string teloffice3, string teloffice4, string teloffice5,
string faxoffice1, string faxoffice2, string faxoffice3, string Email_Support, string Email_Sales,string Email_Manager, string Address1, string Address2, string website, string zipcode, string Description)
        {



            DataTable dt;
            SqlParameter[] param = new SqlParameter[19];
            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid ", SqlDbType.Int, Uid, null);
            param[3] = dal.MakeParam("@teloffice1", SqlDbType.NVarChar, teloffice1, null);
            param[4] = dal.MakeParam("@teloffice2", SqlDbType.NVarChar, teloffice2, null);
            param[5] = dal.MakeParam("@teloffice3", SqlDbType.NVarChar, teloffice3, null);
            param[6] = dal.MakeParam("@teloffice4", SqlDbType.NVarChar, teloffice4, null);
            param[7] = dal.MakeParam("@teloffice5", SqlDbType.NVarChar, teloffice5, null);
            param[8] = dal.MakeParam("@faxoffice1", SqlDbType.NVarChar, faxoffice1, null);
            param[9] = dal.MakeParam("@faxoffice2", SqlDbType.NVarChar, faxoffice2, null);
            param[10] = dal.MakeParam("@faxoffice3", SqlDbType.NVarChar, faxoffice3, null);
            param[11] = dal.MakeParam("@Email_Support", SqlDbType.NVarChar, Email_Support, null);
            param[12] = dal.MakeParam("@Email_Sales", SqlDbType.NVarChar, Email_Sales, null);
            param[13] = dal.MakeParam("@Email_Manager", SqlDbType.NVarChar, Email_Manager, null);
            
            param[14] = dal.MakeParam("@Address1", SqlDbType.NVarChar, Address1, null);
            param[15] = dal.MakeParam("@Address2", SqlDbType.NVarChar, Address2, null);
            param[16] = dal.MakeParam("@website", SqlDbType.NVarChar, website, null);
            param[17] = dal.MakeParam("@zipcode", SqlDbType.NVarChar, zipcode, null);
            param[18] = dal.MakeParam("@Description", SqlDbType.NVarChar, Description, null);

            dt = dal.ExecSpDt("TBL_Contact_SP", param);
            return dt;
        }


        public DataTable TBL_Contact_SP(int OperationType, int id, int Uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid ", SqlDbType.Int, Uid, null);

            dt = dal.ExecSpDt("TBL_Contact_SP", param);
            return dt;
        }

    }
}