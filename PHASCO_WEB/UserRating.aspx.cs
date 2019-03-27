using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace PHASCO_WEB
{
    public partial class UserRating : System.Web.UI.Page
    {
        string connectionstring = ConfigurationManager.ConnectionStrings["phasco.Properties.Settings.Phasco_NetConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(connectionstring);
            SqlDataAdapter ad = new SqlDataAdapter("TBL_User_Rated_Archive_SP", cn);
            ad.SelectCommand.Parameters.AddWithValue("@OperationType", 5);
            ad.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            ad.Fill(dt);

            DataTable dtUserRated = new DataTable();
            DataColumn columnRow = new DataColumn("row");
            DataColumn columnUserID = new DataColumn("uid");
            DataColumn columnImage = new DataColumn("Image");
            DataColumn columnsex = new DataColumn("sex");
            dtUserRated.Columns.Add(columnRow);
            dtUserRated.Columns.Add(columnUserID);
            dtUserRated.Columns.Add(columnImage);
            dtUserRated.Columns.Add(columnsex);
            int counter = 1;
            int dtrowcount = dt.Rows.Count;
            for (int i = 0; i < dtrowcount - 1; i++)
            {
                if (!GetExistUser(dt.Rows[i]["uid"].ToString(), dtUserRated))
                {
                    DataRow rowUserRate = dtUserRated.NewRow();
                    if (Convert.ToInt32(dt.Rows[i]["Rated"]) == Convert.ToInt32(dt.Rows[i + 1]["Rated"]))
                    {
                        if (Convert.ToInt32(dt.Rows[i]["c"]) == Convert.ToInt32(dt.Rows[i + 1]["c"]))
                        {
                            string suserID = GetMaxRateUserByRate(Convert.ToInt32(dt.Rows[i]["Rated"]));
                            if (!GetExistUser(suserID, dtUserRated))
                            {
                                DataTable dtUsers = GetUserByuserID(suserID);
                                rowUserRate["row"] = counter;
                                rowUserRate["uid"] = suserID;
                                rowUserRate["Image"] = dtUsers.Rows[0]["Image"].ToString();
                                rowUserRate["sex"] = dtUsers.Rows[0]["sex"].ToString();
                                dtUserRated.Rows.Add(rowUserRate);
                                counter++;
                            }
                            else
                            {
                                if (!GetExistUser(dt.Rows[i]["uid"].ToString(), dtUserRated))
                                {
                                    rowUserRate["row"] = counter;
                                    rowUserRate["uid"] = dt.Rows[i]["uid"].ToString();
                                    rowUserRate["Image"] = dt.Rows[i]["Image"].ToString();
                                    rowUserRate["sex"] = dt.Rows[i]["sex"].ToString();
                                    dtUserRated.Rows.Add(rowUserRate);
                                    counter++;
                                }
                            }
                            if (!GetExistUser(dt.Rows[i]["uid"].ToString(), dtUserRated))
                            {
                                DataRow rowUserRater = dtUserRated.NewRow();
                                rowUserRater["row"] = counter;
                                rowUserRater["uid"] = dt.Rows[i]["uid"].ToString();
                                rowUserRater["Image"] = dt.Rows[i]["Image"].ToString();
                                rowUserRater["sex"] = dt.Rows[i]["sex"].ToString();
                                dtUserRated.Rows.Add(rowUserRater);
                                counter++;
                            }
                        }
                        else if (Convert.ToInt32(dt.Rows[i]["c"]) > Convert.ToInt32(dt.Rows[i + 1]["c"]))
                        {
                            if (!GetExistUser(dt.Rows[i]["uid"].ToString(), dtUserRated))
                            {
                                rowUserRate["row"] = counter;
                                rowUserRate["uid"] = dt.Rows[i]["uid"];
                                rowUserRate["Image"] = dt.Rows[i]["Image"].ToString();
                                rowUserRate["sex"] = dt.Rows[i]["sex"].ToString();
                                dtUserRated.Rows.Add(rowUserRate);
                                counter++;
                            }
                        }
                    }
                    else if (Convert.ToInt32(dt.Rows[i]["Rated"]) < Convert.ToInt32(dt.Rows[i + 1]["Rated"]))
                    {
                        if (!GetExistUser(dt.Rows[i]["uid"].ToString(), dtUserRated))
                        {
                            rowUserRate["row"] = counter;
                            rowUserRate["uid"] = dt.Rows[i]["uid"];
                            rowUserRate["Image"] = dt.Rows[i]["Image"].ToString();
                            rowUserRate["sex"] = dt.Rows[i]["sex"].ToString();
                            dtUserRated.Rows.Add(rowUserRate);
                            counter++;
                        }
                    }
                }
            }
            if (!GetExistUser(dt.Rows[dtrowcount - 1]["uid"].ToString(), dtUserRated))
            {
                DataRow rowUserRate2 = dtUserRated.NewRow();
                rowUserRate2["row"] = counter;
                rowUserRate2["uid"] = dt.Rows[dtrowcount - 1]["uid"];
                rowUserRate2["Image"] = dt.Rows[dtrowcount - 1]["Image"].ToString();
                rowUserRate2["sex"] = dt.Rows[dtrowcount - 1]["sex"].ToString();
                dtUserRated.Rows.Add(rowUserRate2);
            }
            repUserRate.DataSource = dtUserRated;
            repUserRate.DataBind();
        }

        public bool GetExistUser(string userID, DataTable dtUserRate)
        {
            bool check = false;
            DataRow[] foundRows = dtUserRate.Select("uid =" + userID);
            if (foundRows.Length > 0)
                check = true;
            return check;
        }

        public string GetMaxRateUserByRate(int rate)
        {
            string userid = string.Empty;
            SqlConnection cn = new SqlConnection(connectionstring);
            SqlDataAdapter ad = new SqlDataAdapter("TBL_User_Rated_Archive_SP", cn);
            ad.SelectCommand.Parameters.AddWithValue("@OperationType", 9);
            ad.SelectCommand.Parameters.AddWithValue("@Rated", rate);
            ad.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dtuser = new DataTable();
            ad.Fill(dtuser);
            userid = dtuser.Rows[0]["uid"].ToString();
            for (int i = 1; i < dtuser.Rows.Count; i++)
            {
                userid = GetMaxRateUser(userid, dtuser.Rows[i]["uid"].ToString(), rate);
            }
            return userid;
        }

        public string GetMaxRateUser(string useridone, string useridtwo, int rate)
        {
            string maxuserid = string.Empty;
            SqlConnection cn = new SqlConnection(connectionstring);
            SqlDataAdapter adone = new SqlDataAdapter("TBL_User_Rated_Archive_SP", cn);
            adone.SelectCommand.Parameters.AddWithValue("@OperationType", 6);
            adone.SelectCommand.Parameters.AddWithValue("@Rated", rate);
            adone.SelectCommand.Parameters.AddWithValue("@uid", useridone);
            adone.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dtuserOne = new DataTable();
            adone.Fill(dtuserOne);

            SqlDataAdapter adtwo = new SqlDataAdapter("TBL_User_Rated_Archive_SP", cn);
            adtwo.SelectCommand.Parameters.AddWithValue("@OperationType", 6);
            adtwo.SelectCommand.Parameters.AddWithValue("@Rated", rate);
            adtwo.SelectCommand.Parameters.AddWithValue("@uid", useridtwo);
            adtwo.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dtuserTwo = new DataTable();
            adtwo.Fill(dtuserTwo);

            if (dtuserOne.Rows.Count > 0 && dtuserTwo.Rows.Count > 0)
            {
                if (Convert.ToInt32(dtuserOne.Rows[0]["Rated"]) < Convert.ToInt32(dtuserTwo.Rows[0]["Rated"]))
                { maxuserid = useridone; }
                else if (Convert.ToInt32(dtuserOne.Rows[0]["Rated"]) > Convert.ToInt32(dtuserTwo.Rows[0]["Rated"]))
                { maxuserid = useridtwo; }
                else
                {
                    if (dtuserOne.Rows.Count > 1 && dtuserTwo.Rows.Count > 1)
                    {
                        if (Convert.ToInt32(dtuserOne.Rows[1]["Rated"]) < Convert.ToInt32(dtuserTwo.Rows[1]["Rated"]))
                        { maxuserid = useridone; }
                        else if (Convert.ToInt32(dtuserOne.Rows[1]["Rated"]) > Convert.ToInt32(dtuserTwo.Rows[1]["Rated"]))
                        { maxuserid = useridtwo; }
                        else
                        { maxuserid = useridone; }
                    }
                    else if (dtuserOne.Rows.Count > 1)
                    { maxuserid = useridone; }
                    else if (dtuserTwo.Rows.Count > 1)
                    { maxuserid = useridtwo; }
                    else
                    { maxuserid = useridone; }
                }
            }
            else if (dtuserOne.Rows.Count > 0)
            { maxuserid = useridone; }
            else if (dtuserTwo.Rows.Count > 0)
            { maxuserid = useridtwo; }
            else
            { maxuserid = useridone; }
            return maxuserid;
        }

        public DataTable GetUserByuserID(string userID)
        {
            DataTable dtuser = new DataTable();
            SqlConnection cn = new SqlConnection(connectionstring);
            SqlDataAdapter adone = new SqlDataAdapter("TBL_User_Rated_Archive_SP", cn);
            adone.SelectCommand.Parameters.AddWithValue("@OperationType", 10);
            adone.SelectCommand.Parameters.AddWithValue("@uid", userID);
            adone.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            adone.Fill(dtuser);
            return dtuser;
        }

        public string GetUserRateCount(string userID, int rate)
        {
            string ratecount = "0";
            SqlConnection cn = new SqlConnection(connectionstring);
            SqlDataAdapter ad = new SqlDataAdapter("TBL_User_Rated_Archive_SP", cn);
            ad.SelectCommand.Parameters.AddWithValue("@OperationType", 8);
            ad.SelectCommand.Parameters.AddWithValue("@Rated", rate);
            ad.SelectCommand.Parameters.AddWithValue("@uid", userID);
            ad.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dtuser = new DataTable();
            ad.Fill(dtuser);
            if (dtuser.Rows.Count > 0)
                ratecount = dtuser.Rows[0][0].ToString();

            if (int.Parse(ratecount) == 0)
                ratecount = "<font color='#808080'>" + ratecount + "</font>";
            else
                ratecount = "<b><font color='#FF0000'>" + ratecount + "</font><b>";
            return ratecount;
        }
    }
}