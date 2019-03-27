<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPTlist.aspx.cs" Inherits="PHASCO_WEB.Cpanel.UserPTlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" EnableModelValidation="True" 
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
                <asp:BoundField DataField="period" HeaderText="period" 
                    SortExpression="period" />
                <asp:BoundField DataField="User_Id" HeaderText="User_Id" 
                    SortExpression="User_Id" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Phasco_NetConnectionString1 %>" 
            SelectCommand="
SELECT     TOP (100) PERCENT dbo.Users.Uid, dbo.Point_Manage.name, dbo.Users_Point_log.Point_Mode, dbo.Users_Point_log.Point, dbo.Users_Point_log.dateins, 
dbo.Users_Point_log.period, dbo.Users_Point_log.uid AS User_Id
FROM         dbo.Users INNER JOIN
dbo.Users_Point_log ON dbo.Users.Id = dbo.Users_Point_log.uid INNER JOIN
dbo.Point_Manage ON dbo.Users_Point_log.Point_Mode = dbo.Point_Manage.PointMode
WHERE     (dbo.Users_Point_log.uid = @id)
ORDER BY dbo.Users_Point_log.dateins DESC
            
            ">
                <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
    
 
    
    </div>
    </form>
</body>
</html>
