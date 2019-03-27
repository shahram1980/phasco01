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

namespace PHASCO_Shopping.DAL
{
    public class BaseDAL
    {
    //  public SqlConnection Conn = new SqlConnection("Data Source=PERISANSERVER;Initial Catalog=biztbiz;Integrated Security=True;Pooling=false;Connect Timeout=45");
       //  public SqlConnection Conn = new SqlConnection("Data Source=sql2.perisanweb.com;Initial Catalog=biztbiz;Persist Security Info=true;User ID=biztbiz;Password=1045");
         public SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        public SqlParameter MakeParam(string ParamName, SqlDbType Type, object Value, object nullvalue)
        {
            if ((Value == null) || (nullvalue != null) && (Value.Equals(Convert.ChangeType(nullvalue, Value.GetType()))))
                Value = DBNull.Value;
            SqlParameter Outparam = new SqlParameter(ParamName, Type);
            Outparam.Value = Value;
            return Outparam;
        }
        public SqlParameter MakeParam(string ParamName, SqlDbType Type, object Value, object nullvalue, ParameterDirection ParamDirection)
        {
            if ((Value == null) || (nullvalue != null) && (Value.Equals(Convert.ChangeType(nullvalue, Value.GetType()))))
                Value = DBNull.Value;
            SqlParameter Outparam = new SqlParameter(ParamName, Type);
            Outparam.Direction = ParamDirection;
            return Outparam;
        }
        public DataSet ExecSpDs(string SPname, SqlParameter[] Param)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = SPname;
            for (int i = 0; i <= Param.Length - 1; i++)
            {
                cmd.Parameters.Add(Param[i]);
            }

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds, SPname);

            //DataTable dt = new DataTable();
            //da.Fill(dt);
            return ds;
            closeConn();
        }
        public DataTable ExecSpDt(string SPname, SqlParameter[] Param)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = SPname;
            for (int i = 0; i <= Param.Length - 1; i++)
            {
                cmd.Parameters.Add(Param[i]);
            }

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);

            return dt;
            closeConn();
        }
        public DataTable ExecSpDt(string SPname)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = SPname;

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);

            return dt;
            closeConn();
        }
        public int ExecSpInt(string SPname, SqlParameter[] Param)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = SPname;
            for (int i = 0; i <= Param.Length - 1; i++)
            {
                cmd.Parameters.Add(Param[i]);
            }
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds, SPname);
            int result = int.Parse(da.SelectCommand.Parameters[0].Value.ToString());

            ds = null;
            ds.Dispose();
            //if (cmd.Connection.State != ConnectionState.Closed)
            //    cmd.Connection.Close();
            return result;
            closeConn();
        }
        public void ExecSp(string SPname, SqlParameter[] Param)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = SPname;
            for (int i = 0; i <= Param.Length - 1; i++)
            {
                cmd.Parameters.Add(Param[i]);
            }

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds);

            closeConn();
        }
        public void ExecSp(string SPname)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = SPname;
            Conn.Open();
            cmd.ExecuteNonQuery();

            closeConn();
        }
        public DataSet Paging(string SPName, int Index, string TableName, SqlParameter[] Param)
        {
            SqlCommand cmd = new SqlCommand(SPName, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            for (int i = 0; i <= Param.Length - 1; i++)
            {
                cmd.Parameters.Add(Param[i]);
            }
            da.SelectCommand = cmd;
            //index ---> shomareye safhe ast va adade badi tedad record haye ghabele namayesh dar har safhe ra neshan midahad
            da.Fill(ds, Index, 8, TableName);
            da.Fill(dt);

            return ds;
        }
        private void closeConn()
        {

            Conn.Close();
        }
    }
}
