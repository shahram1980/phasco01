using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using PHASCO_Shopping.DAL;
using System.Data.SqlClient;

namespace PHASCO_Shopping.BLL
{
    public class TBL_Certification
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();

        public DataTable TBL_Certification_Tra(int id, string mode, int Uid,string Name,string No,string Issued_Date,string Expired_Date,
            string Valid_Area,string Photo,string Issued_Bureau) 
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[10];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);

            param[3] = dal.MakeParam("@Name", SqlDbType.NVarChar, Name, null);
            param[4] = dal.MakeParam("@No", SqlDbType.NVarChar, No, null);
            param[5] = dal.MakeParam("@Issued_Date", SqlDbType.NVarChar, Issued_Date, null);
            param[6] = dal.MakeParam("@Expired_Date", SqlDbType.NVarChar, Expired_Date, null);


            param[7] = dal.MakeParam("@Valid_Area", SqlDbType.NVarChar, Valid_Area , null);
            param[8] = dal.MakeParam("@Photo", SqlDbType.NVarChar, Photo, null);
            param[9] = dal.MakeParam("@Issued_Bureau", SqlDbType.NVarChar, Issued_Bureau, null);

            dt = dal.ExecSpDt("TBL_Certification_Tra", param);
            return dt;
        }

        public DataTable TBL_Certification_Tra(int id, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("TBL_Certification_Tra", param);
            return dt;
        }

    }
}
