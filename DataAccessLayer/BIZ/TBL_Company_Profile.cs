using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
    public class TBL_Company_Profile
    {
        DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();
        public DataTable TBL_Company_Profile_Tra(int id, string mode, int Uid, string image, string Company_Name, string Company_Logo,
            string Company_Address, string State_Province, string City, string Zip, string Total_Staff, string registered_capital,
            string year_Established, string Company_Website, string Group_ID, string Services, string Company_Introduction,
            string Main_Markets, string annual_sales, int exports, string Advertisement, string BusinessType, string UsageType, string BrandTypeOne,
            string BrandNameOne, string BrandTypeTwo, string BrandNameTwo, string BrandTypeThree, string BrandNameThree)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[29];


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
            param[14] = dal.MakeParam("@Group_ID", SqlDbType.NVarChar, Group_ID, null);

            param[15] = dal.MakeParam("@Services", SqlDbType.NVarChar, Services, null);
            param[16] = dal.MakeParam("@Company_Introduction", SqlDbType.NVarChar, Company_Introduction, null);
            param[17] = dal.MakeParam("@Main_Markets", SqlDbType.NVarChar, Main_Markets, null);
            param[18] = dal.MakeParam("@annual_sales", SqlDbType.NVarChar, annual_sales, null);
            param[19] = dal.MakeParam("@exports", SqlDbType.Int, exports, null);
            param[20] = dal.MakeParam("@Advertisement", SqlDbType.NVarChar, Advertisement, null);
            param[21] = dal.MakeParam("@BusinessType", SqlDbType.NVarChar, BusinessType, null);
            param[22] = dal.MakeParam("@UsageType", SqlDbType.NVarChar, UsageType, null);
            param[23] = dal.MakeParam("@BrandTypeOne", SqlDbType.NVarChar, BrandTypeOne, null);
            param[24] = dal.MakeParam("@BrandNameOne", SqlDbType.NVarChar, BrandNameOne, null);
            param[25] = dal.MakeParam("@BrandTypeTwo", SqlDbType.NVarChar, BrandTypeTwo, null);
            param[26] = dal.MakeParam("@BrandNameTwo", SqlDbType.NVarChar, BrandNameTwo, null);
            param[27] = dal.MakeParam("@BrandTypeThree", SqlDbType.NVarChar, BrandTypeThree, null);
            param[28] = dal.MakeParam("@BrandNameThree", SqlDbType.NVarChar, BrandNameThree, null);



            dt = dal.ExecSpDt("TBL_Company_Profile_Tra", param);
            return dt;
        }
        public DataTable TBL_Company_Profile_Tra(string mode, int uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];


            param[0] = dal.MakeParam("@Uid", SqlDbType.Int, uid, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

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
        public DataTable TBL_Company_ProfileByGroupID(string mode, string groupID)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];


            param[0] = dal.MakeParam("@Group_id", SqlDbType.NVarChar, groupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dt = dal.ExecSpDt("TBL_Company_Profile_Tra", param);
            return dt;
        }
        public DataTable TBL_Company_ProfileByGroupID(string mode, int groupID, int PageSize, int CurrentPage)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];


            param[0] = dal.MakeParam("@Group_id", SqlDbType.NVarChar, groupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@PageSize", SqlDbType.Int, PageSize, null);
            param[3] = dal.MakeParam("@CurrentPage", SqlDbType.Int, CurrentPage, null);

            dt = dal.ExecSpDt("TBL_Company_Profile_Tra", param);
            return dt;
        }
        public DataTable TBL_Company_ProfileByGroupID(string groupID)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];


            param[0] = dal.MakeParam("@Company_Introduction", SqlDbType.NVarChar, groupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_cat", null);

            dt = dal.ExecSpDt("TBL_Company_Profile_Tra", param);
            return dt;
        }
        public DataTable TBL_Company_Branch_Tra(int CompanyBranchID, string mode, int CompanyID, string BranchName, string BranchCode, string BranchAdress
            , string BranchTel, string Description)
        {
     
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[8];

            param[0] = dal.MakeParam("@CompanyBranchID", SqlDbType.Int, CompanyBranchID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@CompanyID", SqlDbType.Int, CompanyID, null);
            param[3] = dal.MakeParam("@BranchName", SqlDbType.NVarChar, BranchName, null);
            param[4] = dal.MakeParam("@BranchCode", SqlDbType.NVarChar, BranchCode, null);
            param[5] = dal.MakeParam("@BranchAdress", SqlDbType.NVarChar, BranchAdress, null);
            param[6] = dal.MakeParam("@BranchTel", SqlDbType.NVarChar, BranchTel, null);
            param[7] = dal.MakeParam("@Description", SqlDbType.NVarChar, Description, null);

            dtTemp = dal.ExecSpDt("TBL_Company_Branch_Tra", param);
            return dtTemp;
        }
        public DataTable TBL_Company_Branch_Tra(int CompanyBranchID, string mode)
        {
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@CompanyBranchID", SqlDbType.Int, CompanyBranchID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_Company_Branch_Tra", param);
            return dtTemp;
        }
        public DataTable TBL_Company_Branch_Tra(int CompanyBranchID, string mode, int CompanyID)
        {
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@CompanyBranchID", SqlDbType.Int, CompanyBranchID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@CompanyID", SqlDbType.Int, CompanyID, null);

            dtTemp = dal.ExecSpDt("TBL_Company_Branch_Tra", param);
            return dtTemp;
        }
        public DataTable TBL_Company_Branch_Tra(int CompanyID)
        {
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@CompanyID", SqlDbType.Int, CompanyID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_byCompanyID", null);

            dtTemp = dal.ExecSpDt("TBL_Company_Branch_Tra", param);
            return dtTemp;
        }
        public DataTable TBL_Company_Groups_Tra(int CompanyGroupsID, string mode, int CompanyID, int GroupsID)
        {
            DataTable dtTemp = new DataTable();
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@CompanyGroupsID", SqlDbType.Int, CompanyGroupsID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@CompanyID", SqlDbType.Int, CompanyID, null);
            param[3] = dal.MakeParam("@GroupsID", SqlDbType.Int, GroupsID, null);
            dtTemp = dal.ExecSpDt("TBL_Company_Groups_Tra", param);
            return dtTemp;
        }
    }
}
