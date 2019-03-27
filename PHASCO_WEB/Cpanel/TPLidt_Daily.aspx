;<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="TPLidt_Daily.aspx.cs" Inherits="PHASCO_WEB.Cpanel.TPLidt_Daily" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style3" dir="rtl">
          <tr>
            <td style="width:50%;vertical-align:top;">امروز</td>
              <td style="width:50%;vertical-align:top;">دیروز</td>
              </tr>


        <tr>
            <td style="width:50%;vertical-align:top;">
                       <asp:GridView ID="GridView_Today" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource_Today" EnableModelValidation="True" 
            ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="Uid" HeaderText="Uid" SortExpression="Uid" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="Point_Mode" HeaderText="Point_Mode" 
                    SortExpression="Point_Mode" />
                <asp:BoundField DataField="Point" HeaderText="Point" SortExpression="Point" />
                <asp:BoundField DataField="dateins" HeaderText="dateins" 
                    SortExpression="dateins" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_Today" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Phasco_NetConnectionString1 %>" 
            SelectCommand="
SELECT     TOP (100) PERCENT dbo.Users.Uid, dbo.Point_Manage.name,
 dbo.Users_Point_log.Point_Mode, dbo.Users_Point_log.Point,
  dbo.Users_Point_log.dateins, 
dbo.Users_Point_log.period, dbo.Users_Point_log.uid AS User_Id
FROM         dbo.Users INNER JOIN
dbo.Users_Point_log ON dbo.Users.Id = dbo.Users_Point_log.uid INNER JOIN
dbo.Point_Manage ON dbo.Users_Point_log.Point_Mode = dbo.Point_Manage.PointMode
 where dbo.Users_Point_log.dateins >  CONVERT (date, GETDATE())
 and  dbo.Users_Point_log.dateins <  CONVERT (date, GETDATE()+1)
ORDER BY dbo.Users_Point_log.dateins DESC
            
            ">
  
            </asp:SqlDataSource></td>
            <td style="width:50%;vertical-align:top;">
             <asp:GridView ID="GridView_yes" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource_Yes" EnableModelValidation="True" 
            ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="Uid" HeaderText="Uid" SortExpression="Uid" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="Point_Mode" HeaderText="Point_Mode" 
                    SortExpression="Point_Mode" />
                <asp:BoundField DataField="Point" HeaderText="Point" SortExpression="Point" />
                <asp:BoundField DataField="dateins" HeaderText="dateins" 
                    SortExpression="dateins" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_Yes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Phasco_NetConnectionString1 %>" 
            SelectCommand="
SELECT     TOP (100) PERCENT dbo.Users.Uid, dbo.Point_Manage.name,
 dbo.Users_Point_log.Point_Mode, dbo.Users_Point_log.Point,
  dbo.Users_Point_log.dateins, 
dbo.Users_Point_log.period, dbo.Users_Point_log.uid AS User_Id
FROM         dbo.Users INNER JOIN
dbo.Users_Point_log ON dbo.Users.Id = dbo.Users_Point_log.uid INNER JOIN
dbo.Point_Manage ON dbo.Users_Point_log.Point_Mode = dbo.Point_Manage.PointMode
 where dbo.Users_Point_log.dateins >  CONVERT (date, GETDATE()-1)
 and  dbo.Users_Point_log.dateins <  CONVERT (date, GETDATE())
ORDER BY dbo.Users_Point_log.dateins DESC
            ">
     
            </asp:SqlDataSource>
             </td>
        </tr>
        
    </table>
</asp:Content>
