using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
  public  class Tbl_Products
    {
      DAL_BIZ dal = new DAL_BIZ();
        DataTable dt = new DataTable();


        public int Product_id
        {
            get { return Product_id; }
            set { Product_id = value; }
        }
        public DataTable Tbl_Products_Tra(int id, string mode, int Uid_id, int Group_id, int Status, string Produc_Name, string Product_Keywords,
            string Specialty_Product, string Place_Origin, string Product_Brand, string Model_Number, string Defined_Attributes, string Description,
            string Terms_Payment, string Minimum_Order, string Supply_Ability, string Delivery_Time, string Packaging, int image, string Rejected_reason
            , string image_name, string lang, string SendMode, string Price, DateTime StartDate, DateTime EndDate, int ExpireSchedule, string ProductCountInPakage)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[28];

            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Uid_id", SqlDbType.Int, Uid_id, null);

            param[3] = dal.MakeParam("@Group_id", SqlDbType.Int, Group_id, null);
            param[4] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            param[5] = dal.MakeParam("@Produc_Name", SqlDbType.NVarChar, Produc_Name, null);

            param[6] = dal.MakeParam("@Product_Keywords", SqlDbType.NVarChar, Product_Keywords, null);
            param[7] = dal.MakeParam("@Specialty_Product", SqlDbType.NVarChar, Specialty_Product, null);
            param[8] = dal.MakeParam("@Place_Origin", SqlDbType.NVarChar, Place_Origin, null);

            param[9] = dal.MakeParam("@Product_Brand", SqlDbType.NVarChar, Product_Brand, null);
            param[10] = dal.MakeParam("@Model_Number", SqlDbType.NVarChar, Model_Number, null);
            param[11] = dal.MakeParam("@Defined_Attributes", SqlDbType.NVarChar, Defined_Attributes, null);

            param[12] = dal.MakeParam("@Description", SqlDbType.NVarChar, Description, null);
            param[13] = dal.MakeParam("@Terms_Payment", SqlDbType.NVarChar, Terms_Payment, null);
            param[14] = dal.MakeParam("@Minimum_Order", SqlDbType.NVarChar, Minimum_Order, null);

            param[15] = dal.MakeParam("@Supply_Ability", SqlDbType.NVarChar, Supply_Ability, null);

            param[16] = dal.MakeParam("@Delivery_Time", SqlDbType.NVarChar, Delivery_Time, null);
            param[17] = dal.MakeParam("@Packaging", SqlDbType.NVarChar, Packaging, null);
            param[18] = dal.MakeParam("@image", SqlDbType.Int, image, null);
            param[19] = dal.MakeParam("@Rejected_reason", SqlDbType.NVarChar, Rejected_reason, null);

            param[20] = dal.MakeParam("@image_name", SqlDbType.VarChar, image_name, null);
            param[21] = dal.MakeParam("@lang", SqlDbType.VarChar, lang, null);
            param[22] = dal.MakeParam("@SendMode", SqlDbType.NVarChar, SendMode, null);
            param[23] = dal.MakeParam("@Price", SqlDbType.NVarChar, Price, null);

            param[24] = dal.MakeParam("@StartDate", SqlDbType.DateTime, StartDate, null);
            param[25] = dal.MakeParam("@EndDate", SqlDbType.DateTime, EndDate, null);
            param[26] = dal.MakeParam("@ExpireSchedule", SqlDbType.Int, ExpireSchedule, null);
            param[27] = dal.MakeParam("@ProductCountInPakage", SqlDbType.NVarChar, ProductCountInPakage, null);

            dt = dal.ExecSpDt("Tbl_Products_Tra", param);
            return dt;
        }

        public DataTable Tbl_Products_Tra(string mode)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);
            return dt;
        }

        public DataTable Tbl_Products_Tra(string mode, int id)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);
            return dt;
        }

        public DataTable Tbl_Products_Tra(string mode, string Produc_Name)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Produc_Name", SqlDbType.NVarChar, Produc_Name, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);
            return dt;
        }

        public DataTable Tbl_Products_Tra(string mode, int Uid, int Status)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Uid_id", SqlDbType.Int, Uid, null);
            param[2] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);
            return dt;
        }

        public DataTable TBL_Product_Detail_Desc(int OperationType, int Product_id, string Description, int id, string Condition)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@OperationType", SqlDbType.Int, OperationType, null);
            param[1] = dal.MakeParam("@Product_id", SqlDbType.Int, Product_id, null);
            param[2] = dal.MakeParam("@Description", SqlDbType.NText, Description, null);
            param[3] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[4] = dal.MakeParam("@Condition", SqlDbType.NVarChar, Condition, null);
            dt = dal.ExecSpDt("SP_ProductDetail_desc", param);

            return dt;
        }
        public DataTable search(string mode, string productName, int ProductId)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Uid_id", SqlDbType.Int, ProductId, null);
            param[2] = dal.MakeParam("@Produc_Name", SqlDbType.NVarChar, productName, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);

            return dt;
        }

        public DataTable Tbl_Products_Tra(int Status, int ProductId, string mode, DateTime EndDate)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, ProductId, null);
            param[2] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            param[3] = dal.MakeParam("@EndDate", SqlDbType.DateTime, EndDate, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);

            return dt;
        }

              public DataTable Tbl_Products_Tra(int Status, int ProductId, string mode, DateTime EndDate,string Rejected_reason)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, ProductId, null);
            param[2] = dal.MakeParam("@Status", SqlDbType.Int, Status, null);
            param[3] = dal.MakeParam("@EndDate", SqlDbType.DateTime, EndDate, null);
            param[4] = dal.MakeParam("@Rejected_reason", SqlDbType.NVarChar, Rejected_reason, null);
            
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);

            return dt;
        }
      
        public DataTable Tbl_ProductsByGroupID(string mode, int groupID)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Group_id", SqlDbType.Int, groupID, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);

            return dt;
        }

        public DataTable Tbl_ProductsByGroupID(string mode, int groupID, int PageSize, int CurrentPage)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Group_id", SqlDbType.Int, groupID, null);
            param[2] = dal.MakeParam("@PageSize", SqlDbType.Int, PageSize, null);
            param[3] = dal.MakeParam("@CurrentPage", SqlDbType.Int, CurrentPage, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);

            return dt;
        }

        public DataTable Tbl_ProductsByGroupID(string mode, int groupID, int id)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Group_id", SqlDbType.Int, groupID, null);
            param[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);

            return dt;
        }

        public DataTable Tbl_ProductsByUID(string mode, int uid, int id)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Uid_id", SqlDbType.Int, uid, null);
            param[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            dt = dal.ExecSpDt("Tbl_Products_Tra", param);

            return dt;
        }

        public DataTable Search_Products(string mode, string condition)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@condition", SqlDbType.NVarChar, condition, null);
            dt = dal.ExecSpDt("Search", param);
            return dt;
        }


        public DataTable Tbl_Product_Gallery_Tra(int id, string mode, int Product_id, string image_name, string image_Address)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@Product_id", SqlDbType.Int, Product_id, null);
            param[3] = dal.MakeParam("@image_name", SqlDbType.NVarChar, image_name, null);
            param[4] = dal.MakeParam("@image_Address", SqlDbType.NVarChar, image_Address, null);
            dt = dal.ExecSpDt("Tbl_Product_Gallery_Tra", param);

            return dt;
        }

        public DataTable Tbl_Product_Gallery_Tra(string mode, int Product_id)
        {
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[1] = dal.MakeParam("@Product_id", SqlDbType.Int, Product_id, null);

            dt = dal.ExecSpDt("Tbl_Product_Gallery_Tra", param);

            return dt;
        }
    }
}
