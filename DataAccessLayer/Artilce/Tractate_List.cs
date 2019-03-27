using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class Tractate_List
    {
        DAL_ART dal = new DAL_ART();
        DataTable dt = new DataTable();
        public DataTable Select_Top_Qu_Weekly(int id)
        {
            DataTable dt;
            dt = dal.Exec_Cmd("SELECT Id, SubLevel, SubJect, DateEn FROM Tractate_List where SubLevel = " + id.ToString());
            return dt;
        }
        public DataTable article_SubJect(string Mode, int id, string Subject)
        {
            DataTable dt;
            SqlParameter[] param = new SqlParameter[3];

            param[0] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[1] = dal.MakeParam("@id", SqlDbType.Int, id, null);
            param[2] = dal.MakeParam("@Subject", SqlDbType.NVarChar, Subject, null);
            dt = dal.ExecSpDt("article_SubJect", param);
            return dt;
        }


        public DataTable article_Text_Insert(int SubId, string SubJect, string Writer, string Ref, string ShortText, string ShortTextOtherLan, string Translator, string ManElm,
            string keyWork, string keyWorkOtherLan, string Text, string Active, string title_Offer, string SubTitle_Offer, string Offer, string Mode, int id)
        {

            DataTable dt;
            SqlParameter[] param = new SqlParameter[17];
            param[0] = dal.MakeParam("@SubId", SqlDbType.Int, SubId, null);
            param[1] = dal.MakeParam("@SubJect", SqlDbType.NVarChar, SubJect, null);
            param[2] = dal.MakeParam("@Writer", SqlDbType.NVarChar, Writer, null);
            param[3] = dal.MakeParam("@Ref", SqlDbType.NVarChar, Ref, null);
            param[4] = dal.MakeParam("@ShortText", SqlDbType.NVarChar, ShortText, null);
            param[5] = dal.MakeParam("@ShortTextOtherLan", SqlDbType.NVarChar, ShortTextOtherLan, null);
            param[6] = dal.MakeParam("@Translator", SqlDbType.NVarChar, Translator, null);
            param[7] = dal.MakeParam("@ManElm", SqlDbType.NVarChar, ManElm, null);
            param[8] = dal.MakeParam("@keyWork", SqlDbType.NVarChar, keyWork, null);
            param[9] = dal.MakeParam("@keyWorkOtherLan", SqlDbType.NVarChar, keyWorkOtherLan, null);
            param[10] = dal.MakeParam("@Text", SqlDbType.NText, Text, null);
            param[11] = dal.MakeParam("@Active", SqlDbType.NVarChar, Active, null);
            param[12] = dal.MakeParam("@title_Offer", SqlDbType.NVarChar, title_Offer, null);
            param[13] = dal.MakeParam("@SubTitle_Offer", SqlDbType.NVarChar, SubTitle_Offer, null);
            param[14] = dal.MakeParam("@Offer", SqlDbType.Char, Offer, null);
            param[15] = dal.MakeParam("@mode", SqlDbType.NVarChar, Mode, null);
            param[16] = dal.MakeParam("@id", SqlDbType.Int, id, null);



            dt = dal.ExecSpDt("article_Text_Insert", param);
            return dt;
        }



 
    }
}
