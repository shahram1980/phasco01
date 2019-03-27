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
    public class TBL_Company_Profile
    {
        BaseDAL dal = new BaseDAL();
        DataTable dt = new DataTable();
        public DataTable TBL_Company_Profile_Tra(int id, string mode, int Uid, string image, string Company_Name, string Company_Logo,
            string Company_Address, string State_Province, string City, string Zip, string Total_Staff, string registered_capital,
            string year_Established, string Company_Website, string Business_Type, string Services, string Company_Introduction,
            string Main_Markets, string annual_sales, int exports, string Advertisement)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[21];


            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, Uid, null);

            param[3] = dal.MakeParam("@image", SqlDbType.NVarChar, image, null);

            param[4] = dal.MakeParam("@Company_Name", SqlDbType.NVarChar, Company_Name, null);
            param[5] = dal.MakeParam("@Company_Logo", SqlDbType.NVarChar, Company_Logo, null);
            param[6] = dal.MakeParam("@Company_Address", SqlDbType.NVarChar, Company_Address, null);

            param[7] = dal.MakeParam("@State_Province", SqlDbType.NVarChar, State_Province, null);
            param[8] = dal.MakeParam("@City", SqlDbType.NVarChar, City, null);
            param[9] = dal.MakeParam("@Zip", SqlDbType.NVarChar, Zip, null);
            param[10] = dal.MakeParam("@Total_Staff", SqlDbType.NVarChar, Total_Staff, null);
            param[11] = dal.MakeParam("@registered_capital", SqlDbType.NVarChar, registered_capital, null);

            param[12] = dal.MakeParam("@year_Established", SqlDbType.NVarChar, year_Established, null);
            param[13] = dal.MakeParam("@Company_Website", SqlDbType.NVarChar, Company_Website, null);
            param[14] = dal.MakeParam("@Business_Type", SqlDbType.NVarChar, Business_Type, null);

            param[15] = dal.MakeParam("@Services", SqlDbType.NVarChar, Services, null);
            param[16] = dal.MakeParam("@Company_Introduction", SqlDbType.NVarChar, Company_Introduction, null);
            param[17] = dal.MakeParam("@Main_Markets", SqlDbType.NVarChar, Main_Markets, null);
            param[18] = dal.MakeParam("@annual_sales", SqlDbType.NVarChar, annual_sales, null);
            param[19] = dal.MakeParam("@exports", SqlDbType.Int, exports, null);
            param[20] = dal.MakeParam("@Advertisement", SqlDbType.NVarChar, Advertisement, null);



            dt = dal.ExecSpDt("TBL_Company_Profile_Tra", param);
            return dt;
        }


        public DataTable TBL_Company_Profile_Tra(int id, string mode)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];


            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dt = dal.ExecSpDt("TBL_Company_Profile_Tra", param);
            return dt;
        }


    }
}
