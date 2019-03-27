<%@ Control Language="C#" AutoEventWireup="true" Codebehind="ArticleSubjects.ascx.cs"
    Inherits="PHASCO_WEB.UI.ArticleSubjects" %>
<div class="urbangreymenu">
    <% 
       DataAccessLayer.Tractate_List da_List = new DataAccessLayer.Tractate_List();
        System.Data.SqlClient.SqlConnection myConnection = null;
        System.Data.SqlClient.SqlDataReader drAuthors;
        System.Data.DataTable dt_List;

        int Id_ = Convert.ToInt32(Request.QueryString["id"]);
        string connectionString = ConfigurationSettings.AppSettings["Phasco_NetConnectionString"];
        myConnection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PHASCO_WEB.Properties.Settings.Article_phascoConnectionString"].ConnectionString);
        myConnection.Open();

        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT Id, SubLevel, SubJect, DateEn FROM dbo.Tractate_List where SubLevel = 0 ", myConnection);
        drAuthors = cmd.ExecuteReader();
        drAuthors.Read();

        ArrayList id = new ArrayList();
        ArrayList Subjet = new ArrayList();
        int counter = 0;

        do
        {
            counter = counter + 1;
            id.Add(int.Parse(drAuthors["Id"].ToString()));
            Subjet.Add(drAuthors["SubJect"].ToString());

        } while (drAuthors.Read());

        drAuthors.Close();

        //PHASCO_WEB.DAL.DS_ArticleTableAdapters.Tractate_ListTableAdapter da_Sub = new PHASCO_WEB.DAL.DS_ArticleTableAdapters.Tractate_ListTableAdapter();
        //PHASCO_WEB.DAL.DS_Article.Tractate_ListDataTable dt_Sub = new PHASCO_WEB.DAL.DS_Article.Tractate_ListDataTable();
        System.Data.DataTable dt;

        for (int i = 0; i < id.Count; i++)
        {
    %>
    <h3 class="headerbar">
        <%Response.Write("*" + Subjet[i].ToString());%>
    </h3>
    <ul class="submenu">
        <%
            dt = da_List.Select_Top_Qu_Weekly(int.Parse(id[i].ToString()));
            if (dt.Rows.Count > 0)
            {
                for (int o = 0; o < dt.Rows.Count; o++)
                {
                    %>
                    <li>
                        <%Response.Write(dt.Rows[o]["SubJect"].ToString()); %>
                    </li>
                    <%
            }

        }
        %>
    </ul>
    <%
        }
        myConnection.Close();
    %>
</div>
