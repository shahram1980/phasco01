using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class Tbl_Message_Outbox
    {
        DAL_Main dal = new DAL_Main();
        DataTable dt = new DataTable();

        public DataTable Select_Id(int id)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[10];

            string cmnd = "SELECT     TOP 100 PERCENT dbo.Tbl_Message_Outbox.Id, dbo.Tbl_Message_Outbox.Reciver, dbo.Tbl_Message_Outbox.Sender, ";
            cmnd += " dbo.Tbl_Message_Outbox.ModeMss, dbo.Tbl_Message_Outbox.Title, dbo.Tbl_Message_Outbox.DateSend, dbo.Tbl_Message_Outbox.DateOpen, ";
            cmnd += " dbo.Users.Uid, dbo.Users.Name, dbo.Users.Famil";
            cmnd += " FROM         dbo.Tbl_Message_Outbox INNER JOIN";
            cmnd += " dbo.Users ON dbo.Tbl_Message_Outbox.Reciver = dbo.Users.Id";
            cmnd += " where Sender=  " + id.ToString();
            cmnd += " ORDER BY dbo.Tbl_Message_Outbox.Id DESC";
            dt = dal.Exec_Cmd(cmnd);
            return dt;


        }
    }
}
