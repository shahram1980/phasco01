using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class Article_Main
    {
        DAL_ART dal = new DAL_ART();
        DataTable dt = new DataTable();

        public DataTable GetHomeArticles(string Mode, int id, string Subject)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Subject", SqlDbType.NVarChar, Subject, null);
            dt = dal.ExecSpDt("article_SubJect", param);
            return dt;
        }

        public DataTable GetArticleList(string Mode, int id, string Subject)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Subject", SqlDbType.NVarChar, Subject, null);
            dt = dal.ExecSpDt("article_SubJect", param);
            return dt;
        }

        public DataSet GetArtic_Paging(int gvPageIndex, int gvPageSize, string Mode, int id,string text)
        {
            DataSet dt;
            SqlParameter[] param = new SqlParameter[5];
            param[0] = dal.MakeParam("@PageIndex", SqlDbType.Int, gvPageIndex, null);
            param[1] = dal.MakeParam("@PageSize", SqlDbType.Int, gvPageSize, null);
            param[2] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[3] = dal.MakeParam("@Id", SqlDbType.Int, id, null);
            param[4] = dal.MakeParam("@Text", SqlDbType.NVarChar, text, null);
            dt = dal.ExecSpDs("ARTICLE_Paging", param);
            return dt;
        }

        public void Update_Click(string Mode, int id, string Subject)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Subject", SqlDbType.NVarChar, Subject, null);

            
            dal.ExecSp("article_SubJect", param);
        }

        public DataTable AtlasTra(string Mode, int id, string Title, int Visitcount)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[3] = dal.MakeParam("@Visitcount", SqlDbType.NVarChar, Visitcount, null);
            dt = dal.ExecSpDt("T_Atlas_Group_Tra", param);
            return dt;
        }

        public DataTable Atlas_Edit(string Mode, int SubId, int id, string Title, int Visit, string Comment)
        {
            int? getid = 0;
            SqlParameter[] param = new SqlParameter[7];
            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@SubId", SqlDbType.Int, id, null);
            param[3] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[4] = dal.MakeParam("@Visit", SqlDbType.Int, Visit, null);
            param[5] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);
            param[6] = dal.MakeParam("@OutId", SqlDbType.Int, getid, null);

            dt = dal.ExecSpDt("Atlas_Tra", param);
            return dt;
        }
        public int Atlas_Return_Id(string Mode, int SubId, int id, string Title, int Visit, string Comment)
        {
            int getid = 0;
            SqlParameter[] param = new SqlParameter[7];
            param[0] = dal.MakeParam("@OutId", SqlDbType.Int, 0, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[2] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[3] = dal.MakeParam("@SubId", SqlDbType.Int, id, null);
            param[4] = dal.MakeParam("@Title", SqlDbType.NVarChar, Title, null);
            param[5] = dal.MakeParam("@Visit", SqlDbType.NVarChar, Visit, null);
            param[6] = dal.MakeParam("@Comment", SqlDbType.NVarChar, Comment, null);


            getid = dal.ExecSpInt("Atlas_Tra", param);
            return getid;
        }
    }
}
