<%@ Page Language="C#" MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="PHASCO_Shopping.C_p.News" %>
<%@ Register src="../UC/B-card.ascx" tagname="B" tagprefix="uc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table cellspacing="1" class="style1">
    <tr>
        <td>
            <asp:Label ID="Label_title" runat="server" EnableViewState="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <hr /></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label_news" runat="server" EnableViewState="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3">
            </td>
    </tr>
    <tr>
        <td>
                     <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, Date_send %>" />
                   &nbsp; : <asp:Label ID="Label_Datesend" runat="server" Text="Label"></asp:Label>
</td>
    </tr>
    <tr>
        <td class="style4">
            </td>
    </tr>
    <tr>
        <td>
            <uc1:B ID="B1" runat="server" />
        </td>
    </tr>
</table>


</asp:Content>

 <asp:Content ID="Content1" runat="server" contentplaceholderid="head">

     <style type="text/css">
         .style2
         {
             height: 24px;
         }
         .style3
         {
             height: 34px;
         }
         .style4
         {
             height: 49px;
         }
     </style>

</asp:Content>


 