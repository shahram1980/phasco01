<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="UserActiveList.aspx.cs" Inherits="PHASCO_WEB.Cpanel.Bazar.UserActiveList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Uid" HeaderText="نام کاربری" />
            <asp:BoundField DataField="EMail" HeaderText="ایمیل" />
            <asp:BoundField DataField="Company_Name" HeaderText="شرکت" />
            <asp:TemplateField HeaderText="لینک کاربری">
                <ItemTemplate>
                <a href="http://phasco.com/bazar/Home.aspx?CompanyID=<%# Eval("Id") %>" target="_blank">
                لینک مشاهده
                </a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:phasco.Properties.Settings.Phasco_com_Bazar %>" 
        SelectCommand="  SELECT     TOP (100) PERCENT dbo.TBL_User.Uid, dbo.TBL_User.User_Status, dbo.TBL_User.Business_Location, dbo.TBL_User.Company, dbo.TBL_User.Industry, 
                      dbo.TBL_User.Sex, dbo.TBL_User.Given_Name, dbo.TBL_User.Family_Name, dbo.TBL_User.Fax, dbo.TBL_User.Mobile, dbo.TBL_User.User_Level, 
                      dbo.TBL_User.DateIns, dbo.TBL_User.LastLogin, dbo.TBL_User.ActiveMode, dbo.TBL_User.forgotpassCcode, dbo.TBL_User.UsersRoleID, dbo.TBL_User.EMail, 
                      dbo.TBL_Company_Profile.id, dbo.TBL_Company_Profile.Company_Name
FROM         dbo.TBL_User INNER JOIN
                      dbo.TBL_Company_Profile ON dbo.TBL_User.Id = dbo.TBL_Company_Profile.Uid
WHERE     (dbo.TBL_User.ActiveMode = 1)
ORDER BY dbo.TBL_User.Uid"></asp:SqlDataSource>
</asp:Content>
