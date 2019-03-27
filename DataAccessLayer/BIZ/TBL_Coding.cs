using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DataAccessLayer.BIZ
{
    public class TBL_Coding
    {
        DAL_BIZ dal = new DAL_BIZ();
        DataTable dtTemp = new DataTable();
        public DataTable TBL_Coding_Tra(int CodingID, string mode, string CodingName, int CodingParentID, int CodingGroupID, int CodingValue)
        {

            SqlParameter[] param = new SqlParameter[6];

            param[0] = dal.MakeParam("@CodingID", SqlDbType.Int, CodingID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@CodingName", SqlDbType.NVarChar, CodingName, null);
            param[3] = dal.MakeParam("@CodingParentID", SqlDbType.Int, CodingParentID, null);
            param[4] = dal.MakeParam("@CodingGroupID", SqlDbType.Int, CodingGroupID, null);
            param[5] = dal.MakeParam("@CodingValue", SqlDbType.Int, CodingValue, null);

            dtTemp = dal.ExecSpDt("TBL_Coding_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Coding_Tra(int CodingID, string mode)
        {
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@CodingID", SqlDbType.Int, CodingID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_Coding_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Coding_Tra(string multiID, string mode)
        {
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@CodingName", SqlDbType.NVarChar, multiID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_Coding_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_Coding_Tra(int CodingGroupID)
        {
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@CodingGroupID", SqlDbType.Int, CodingGroupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, "select_byGroupID", null);

            dtTemp = dal.ExecSpDt("TBL_Coding_Tra", param);
            return dtTemp;
        }



        public DataTable TBL_CodingGroup_Tra(int CodingGroupID, string mode, string CodingGroupName, int CodingGroupCode, int CodingGroupValue)
        {
            SqlParameter[] param = new SqlParameter[5];

            param[0] = dal.MakeParam("@CodingGroupID", SqlDbType.Int, CodingGroupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);
            param[2] = dal.MakeParam("@CodingGroupName", SqlDbType.NVarChar, CodingGroupName, null);
            param[3] = dal.MakeParam("@CodingGroupCode", SqlDbType.Int, CodingGroupCode, null);
            param[4] = dal.MakeParam("@CodingGroupValue", SqlDbType.Int, CodingGroupValue, null);

            dtTemp = dal.ExecSpDt("TBL_CodingGroup_Tra", param);
            return dtTemp;
        }

        public DataTable TBL_CodingGroup_Tra(int CodingGroupID, string mode)
        {
            SqlParameter[] param = new SqlParameter[2];

            param[0] = dal.MakeParam("@CodingGroupID", SqlDbType.Int, CodingGroupID, null);
            param[1] = dal.MakeParam("@mode", SqlDbType.NVarChar, mode, null);

            dtTemp = dal.ExecSpDt("TBL_CodingGroup_Tra", param);
            return dtTemp;
        }


        public void BindSendModeDropDown(DropDownList ddl)
        {
            DataTable dtSendMode = TBL_Coding_Tra((int)CodingGroupType.SendMode);
            ddl.DataValueField = "CodingID";
            ddl.DataTextField = "CodingName";
            ddl.DataSource = dtSendMode;
            ddl.DataBind();
        }

        public void BindSendModeCheckBoxList(CheckBoxList chk)
        {
            DataTable dtSendMode = TBL_Coding_Tra((int)CodingGroupType.SendMode);
            chk.DataValueField = "CodingID";
            chk.DataTextField = "CodingName";
            chk.DataSource = dtSendMode;
            chk.DataBind();
        }

        public void BindPaymentTypeCheckBoxList(CheckBoxList chk)
        {
            DataTable dtPaymentType = TBL_Coding_Tra((int)CodingGroupType.PaymentType);
            chk.DataValueField = "CodingID";
            chk.DataTextField = "CodingName";
            chk.DataSource = dtPaymentType;
            chk.DataBind();
        }

        public void BindUsageTypeCheckBoxList(CheckBoxList chk)
        {
            DataTable dtUsageType = TBL_Coding_Tra((int)CodingGroupType.UsageType);
            chk.DataValueField = "CodingID";
            chk.DataTextField = "CodingName";
            chk.DataSource = dtUsageType;
            chk.DataBind();
        }

        public void BindBusinessTypeCheckBoxList(CheckBoxList chk)
        {
            DataTable dtBusinessType = TBL_Coding_Tra((int)CodingGroupType.BusinessType);
            chk.DataValueField = "CodingID";
            chk.DataTextField = "CodingName";
            chk.DataSource = dtBusinessType;
            chk.DataBind();
        }

        public void BindExpireScheduleProductForNormalUserDropDown(DropDownList ddl)
        {
            DataTable dtSendMode = TBL_Coding_Tra((int)CodingGroupType.ExpireScheduleProductForNormalUser);
            ddl.DataValueField = "CodingID";
            ddl.DataTextField = "CodingName";
            ddl.DataSource = dtSendMode;
            ddl.DataBind();
        }

        public void BindExpireScheduleProductForGoldenUserDropDown(DropDownList ddl)
        {
            DataTable dtSendMode = TBL_Coding_Tra((int)CodingGroupType.ExpireScheduleProductForGoldenUser);
            ddl.DataValueField = "CodingID";
            ddl.DataTextField = "CodingName";
            ddl.DataSource = dtSendMode;
            ddl.DataBind();
        }

        public void BindExpireScheduleRequestForNormalUserDropDown(DropDownList ddl)
        {
            DataTable dtSendMode = TBL_Coding_Tra((int)CodingGroupType.ExpireScheduleRequestForNormalUser);
            ddl.DataValueField = "CodingID";
            ddl.DataTextField = "CodingName";
            ddl.DataSource = dtSendMode;
            ddl.DataBind();
        }

        public void BindExpireScheduleRequestForGoldenUserDropDown(DropDownList ddl)
        {
            DataTable dtSendMode = TBL_Coding_Tra((int)CodingGroupType.ExpireScheduleRequestForGoldenUser);
            ddl.DataValueField = "CodingID";
            ddl.DataTextField = "CodingName";
            ddl.DataSource = dtSendMode;
            ddl.DataBind();
        }

        public enum CodingGroupType
        {
            SendMode = 1, // نحوه ارسال
            PaymentType = 2, // نحوه پرداخت
            UsageType = 3, // رسته کاربری
            BusinessType = 4,// نوع فعالیت
            ExpireScheduleProductForNormalUser = 5,
            ExpireScheduleProductForGoldenUser = 6,
            ExpireScheduleRequestForNormalUser = 7,
            ExpireScheduleRequestForGoldenUser = 8
        }
    }
}
