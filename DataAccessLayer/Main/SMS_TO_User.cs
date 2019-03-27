using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace DataAccessLayer
{
    public class SMS_TO_User
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();
        public DataTable SELECT_Top_1(int Uid)
        {
            DataTable dt;
            dt = dal.Exec_Cmd("SELECT top 1 * From SMS_TO_User WheRe UserId=" + Uid.ToString() + " And Del_Check='f' And Flash='t' Order By DateSend Desc");
            return dt;
        }
        public Boolean delete(int id)
        {
            try { DataTable dt; dal.Exec_Cmd("Delete From SMS_TO_User WheRe Id=" + id.ToString()); return true; }
            catch (Exception) { return false; }
            return false;
        }
    }
}
