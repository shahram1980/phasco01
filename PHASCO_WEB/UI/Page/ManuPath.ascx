<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManuPath.ascx.cs" Inherits="PHASCO_WEB.UI.Page.ManuPath" %>
 ::<asp:Repeater ID="Repeater_path" runat="server">
 <ItemTemplate>
<a href="page.aspx?id=<%# Eval("menuid")%>"><%# Eval("text")%></a>>

 </ItemTemplate>
</asp:Repeater>
