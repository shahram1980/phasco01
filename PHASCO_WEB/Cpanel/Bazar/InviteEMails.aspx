<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="InviteEMails.aspx.cs" Inherits="PHASCO_WEB.Cpanel.Bazar.InviteEMails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DataList ID="DataList1" runat="server"  
        RepeatColumns="5">
<ItemTemplate>
<div style="padding:5px;margin:5px;background-color:#ccc;direction:ltr;">
    <%# Eval("Email")%> (<%# Eval("Count")%>) 
    </div>
 </ItemTemplate>
    </asp:DataList>  
      </asp:Content>
