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

using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class TBL_Co_Properties
    {
        BaseDAL_Dir dal = new BaseDAL_Dir();
        DataTable dt = new DataTable();

        public DataTable TBL_Co_Properties_Tra(string Mode, int id, string Name, string NameEN, int star, string Address, string Manager, string Time, string Foods,
           string WebSite, string tel, string Pic, int ExpDate, int UID, int AllowView, string EMail)
        {
            int? getid = 0;
            SqlParameter[] param = new SqlParameter[21];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Name", SqlDbType.NVarChar, Name, null);
            param[3] = dal.MakeParam("@NameEN", SqlDbType.NVarChar, NameEN, null);
            param[4] = dal.MakeParam("@star", SqlDbType.Int, star, null);
            param[5] = dal.MakeParam("@Address", SqlDbType.NVarChar, Address, null);
            param[6] = dal.MakeParam("@AddressEN", SqlDbType.NVarChar, Address, null);
            param[7] = dal.MakeParam("@Manager", SqlDbType.NVarChar, Manager, null);
            param[8] = dal.MakeParam("@ManagerEN", SqlDbType.NVarChar, Manager, null);
            param[9] = dal.MakeParam("@Time", SqlDbType.NVarChar, Time, null);
            param[10] = dal.MakeParam("@TimeEN", SqlDbType.NVarChar, Time, null);
            param[11] = dal.MakeParam("@Foods", SqlDbType.NVarChar, Foods, null);
            param[12] = dal.MakeParam("@FoodsEN", SqlDbType.NVarChar, Foods, null);
            param[13] = dal.MakeParam("@WebSite", SqlDbType.NVarChar, WebSite, null);
            param[14] = dal.MakeParam("@EMail", SqlDbType.NVarChar, EMail, null);
            param[15] = dal.MakeParam("@tel", SqlDbType.NVarChar, tel, null);
            param[16] = dal.MakeParam("@Pic", SqlDbType.NVarChar, Pic, null);
            param[17] = dal.MakeParam("@ExpDate", SqlDbType.Int, ExpDate, null);
            param[18] = dal.MakeParam("@UID", SqlDbType.Int, UID, null);
            param[19] = dal.MakeParam("@AllowView", SqlDbType.Int, AllowView, null);
            param[20] = dal.MakeParam("@idOut", SqlDbType.Int, getid, null, ParameterDirection.Output);

            return dal.ExecSpDt("TBL_Co_Properties_Tra", param);
        }
        public DataTable TBL_Co_Properties_Tra(string Mode)
        {
            int? getid = 0;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@idOut", SqlDbType.Int, getid, null, ParameterDirection.Output);
            return dal.ExecSpDt("TBL_Co_Properties_Tra", param);

        }
        public DataTable TBL_Co_Properties_Tra(string Mode, int id)
        {
            int? getid = 0;
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@idOut", SqlDbType.Int, getid, null, ParameterDirection.Output);
            return dal.ExecSpDt("TBL_Co_Properties_Tra", param);
        }

        public DataTable TBL_Co_Properties_Tra(string Mode, string Name)
        {
            int? getid = 0;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Name", SqlDbType.NVarChar, Name, null);
            return dal.ExecSpDt("TBL_Co_Properties_Tra", param);
        }

        public DataTable TBL_Co_Properties_Tra(string Mode, int id, string Pic)
        {
            int? getid = 0;
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Pic", SqlDbType.NVarChar, Pic, null);
            param[3] = dal.MakeParam("@idOut", SqlDbType.Int, getid, null, ParameterDirection.Output);
            return dal.ExecSpDt("TBL_Co_Properties_Tra", param);
        }
    }
}
