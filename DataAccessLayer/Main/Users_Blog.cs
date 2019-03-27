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
    public class Users_Blog
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

 
        public DataTable Users_Blog_Tra(string Mode, int id, int uid,string Title,string Body,int Comment,string DateFarsi)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[7];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, uid, null);
            param[3] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[4] = dal.MakeParam("@Body ", SqlDbType.NText, Body, null);
            param[5] = dal.MakeParam("@Comment", SqlDbType.Int, Comment, null);
            param[6] = dal.MakeParam("@DateFarsi", SqlDbType.NVarChar, DateFarsi, null);

            dt = dal.ExecSpDt("Users_Blog_Tra", param);
            return dt;
        }

        public DataTable Users_Blog_Tra_LikeDisike(string Mode, int id, int uid, int UserPoint)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[4];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Uid", SqlDbType.Int, uid, null);
            param[3] = dal.MakeParam("@UserPoint", SqlDbType.Int, UserPoint, null);
            
            dt = dal.ExecSpDt("Users_Blog_Tra", param);
            return dt;
        }


        public DataTable Users_Blog_Tra(string Mode,  int uid)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[2];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.Int, uid, null);

            dt = dal.ExecSpDt("Users_Blog_Tra", param);
            return dt;
        }


        public DataTable Users_Blog_Tra(string Mode, int uid, string DateFarsi)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];
            int? getid = 0;

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@Uid", SqlDbType.Int, uid, null);
            param[2] = dal.MakeParam("@DateFarsi", SqlDbType.NVarChar, DateFarsi, null);
            dt = dal.ExecSpDt("Users_Blog_Tra", param);
            return dt;
        }
    }
}
