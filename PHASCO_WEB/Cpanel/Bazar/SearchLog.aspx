<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="SearchLog.aspx.cs" Inherits="PHASCO_WEB.Cpanel.Bazar.SearchLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" CellPadding="5" CellSpacing="5" 
        RepeatColumns="6">
    <ItemTemplate>
    <div style="direction:rtll;">
   <%# Eval("SearchWord")%> ( <%# Eval("count_")%> )
   </div>
    </ItemTemplate>

    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server">
    
    </asp:SqlDataSource>

</asp:Content>
