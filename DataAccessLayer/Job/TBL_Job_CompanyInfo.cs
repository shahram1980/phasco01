using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class TBL_Job_CompanyInfo
    {
        DAL_Main dal=new DAL_Main();
        DataTable dt=new DataTable();
        public DataTable TBL_Job_CompanyInfo_SP(string mode,int id,string CName,string CoType, int institutionYear,string RegisterNO,string ActivityScope,string High_resp_name
            ,string High_resp_Role,string Link_person_name,string Link_person_role,string _State,string City,string _address ,string postalCode,
            string postalBox,string phone,string mobile,string fax,string email,string web,string duty,string PublicInfo,string vision
            ,int MenNo ,int womenNo,int DrNo,int postLicence,int Licence,int postDiploma,int Diploma,int underDiploma ,int stockholderNo,
            string ownershipType,string usage,int branchNo,string unionName,int userID)
        {
            SqlParameter[] parm = new SqlParameter[38];
            parm[0]=dal.MakeParam("@mode",SqlDbType.VarChar,mode,null);
            parm[1]=dal.MakeParam("@id",SqlDbType.Int,id,null);
            parm[2]=dal.MakeParam("@CName",SqlDbType.NVarChar,CName,null);
            parm[3]=dal.MakeParam("@institutionYear",SqlDbType.Int,institutionYear,null);
            parm[4]=dal.MakeParam("@RegisterNO",SqlDbType.VarChar,RegisterNO,null);
            parm[5]=dal.MakeParam("@ActivityScope",SqlDbType.NVarChar,ActivityScope,null);
            parm[6]=dal.MakeParam("@High_resp_name",SqlDbType.NVarChar,High_resp_name,null);
            parm[7]=dal.MakeParam("@High_resp_Role",SqlDbType.NVarChar,High_resp_Role,null);
            parm[8]=dal.MakeParam("@Link_person_name",SqlDbType.NVarChar,Link_person_name,null);
            parm[9]=dal.MakeParam("@Link_person_role",SqlDbType.NVarChar,Link_person_role,null);
            parm[10]=dal.MakeParam("@_State",SqlDbType.NVarChar,_State,null);
            parm[11]=dal.MakeParam("@City",SqlDbType.NVarChar,City,null);
            parm[12]=dal.MakeParam("@_address",SqlDbType.NVarChar,_address,null);
            parm[13]=dal.MakeParam("@postalCode",SqlDbType.VarChar,postalCode,null);
            parm[14]=dal.MakeParam("@postalBox",SqlDbType.VarChar,postalBox,null);
            parm[15]=dal.MakeParam("@phone",SqlDbType.VarChar,phone,null);
            parm[16]=dal.MakeParam("@mobile",SqlDbType.VarChar,mobile,null);
            parm[17]=dal.MakeParam("@fax",SqlDbType.VarChar,fax,null);
            parm[18]=dal.MakeParam("@email",SqlDbType.VarChar,email,null);
            parm[19]=dal.MakeParam("@web",SqlDbType.VarChar,web,null);
            parm[20]=dal.MakeParam("@duty",SqlDbType.NVarChar,duty,null);
            parm[21]=dal.MakeParam("@PublicInfo",SqlDbType.NVarChar,PublicInfo,null);
            parm[22]=dal.MakeParam("@vision",SqlDbType.NVarChar,vision,null);
            parm[23]=dal.MakeParam("@MenNo",SqlDbType.Int,MenNo,null);
            parm[24]=dal.MakeParam("@womenNo",SqlDbType.Int,womenNo,null);
            parm[25]=dal.MakeParam("@DrNo",SqlDbType.Int,DrNo,null);
            parm[26]=dal.MakeParam("@postLicence",SqlDbType.Int,postLicence,null);
            parm[27]=dal.MakeParam("@Licence",SqlDbType.Int,Licence,null);
            parm[28]=dal.MakeParam("@postDiploma",SqlDbType.Int,postDiploma,null);
            parm[29]=dal.MakeParam("@Diploma",SqlDbType.Int,Diploma,null);
            parm[30]=dal.MakeParam("@underDiploma",SqlDbType.Int,underDiploma,null);
            parm[31]=dal.MakeParam("@stockholderNo",SqlDbType.Int,stockholderNo,null);
            parm[32]=dal.MakeParam("@ownershipType",SqlDbType.NVarChar,ownershipType,null);
            parm[33]=dal.MakeParam("@usage",SqlDbType.NVarChar,usage,null);
            parm[34]=dal.MakeParam("@branchNo",SqlDbType.Int,branchNo,null);
            parm[35]=dal.MakeParam("@unionName",SqlDbType.NVarChar,unionName,null);
            parm[36] = dal.MakeParam("@coType", SqlDbType.NVarChar, CoType, null);
            parm[37] = dal.MakeParam("@UserID", SqlDbType.Int, userID, null);
            dt = dal.ExecSpDt("TBL_Job_CompanyInfo_SP", parm);
            return dt;

        }
        public DataTable TBL_Job_CompanyInfo_SP(string mode, int userID)
        {
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = dal.MakeParam("@mode", SqlDbType.VarChar, mode, null);
            parm[1] = dal.MakeParam("@UserID", SqlDbType.Int, userID, null);
            dt=dal.ExecSpDt("TBL_Job_CompanyInfo_SP", parm);
            return dt;
        }
            
        
    }

}



