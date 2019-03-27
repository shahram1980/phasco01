using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using DataAccessLayer.BIZ;

namespace BiztBiz.Component
{
    public class UserRole
    {
        public static int CheckUserRole_BycompanyId(int id)
        {
            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            int UsersRoleID = 0;
            dt = dauser.TBL_User_Tra(id, "Select_UserRolebycompany", "", "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            if (dt.Rows.Count > 0)
            {
                  UsersRoleID = int.Parse(dt.Rows[0]["UsersRoleID"].ToString());
            }
            return UsersRoleID;
        }


        public static int CheckUserRole_ByProductId(int id)
        {
            TBL_User_Biz dauser = new TBL_User_Biz();
            DataTable dt;
            int UsersRoleID = 0;
            dt = dauser.TBL_User_Tra(id, "Select_UserRolebyProduct", "", "", 0, "", "", "", "", "", "", "", "", "", 0, 0, 0);
            if (dt.Rows.Count > 0)
            {
                  UsersRoleID = int.Parse(dt.Rows[0]["UsersRoleID"].ToString());
            }
            return UsersRoleID;
        }


        
    }
}