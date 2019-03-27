<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuPath.ascx.cs" Inherits="PerisanCMS.UI.MenuPath" %>
 ::<asp:Repeater ID="Repeater_path" runat="server">
 <ItemTemplate>
<a href="page.aspx?id=<%# Eval("menuid")%>"><%# Eval("text")%></a>>

 </ItemTemplate>
</asp:Repeater>
