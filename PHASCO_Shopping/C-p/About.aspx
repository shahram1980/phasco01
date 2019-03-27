<%@ Page Language="C#" MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PHASCO_Shopping.C_p.About" %>
<%@ Register src="../UC/B-card.ascx" tagname="B" tagprefix="uc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="Label_Alarm" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Panel runat="server" ID="Panel_Co_Detiels">
<asp:Literal ID="Literal103" runat="server" Text="<%$ Resources:Resource, year_Established %>" /> : 
<asp:Label ID="Label_year_Established" runat="server" /><br/<br />

<asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, capital %>" /> : 
<asp:Label ID="Label_registered_capital" runat="server" /><br/<br />

<asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, annual_sales %>" /> : 
<asp:Label ID="Label_annual_sales" runat="server" /><br/<br />

<asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Total_Staff %>" /> : 
<asp:Label ID="Label_Total_Staff" runat="server" /><br/<br />

<asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, Main_Products_or_Services %>" /> : 
<asp:Label ID="Label_Main_Products_or_Services" runat="server" /><br/<br />

<asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Main_Markets %>" /> : 
<asp:Label ID="Label_Main_Markets" runat="server" /><br/<br />
</asp:Panel>
            
            
            </td>
        </tr>
        <tr>
            <td>
                <uc1:B ID="B1" runat="server" />
            </td>
        </tr>
    </table>


</asp:Content>

 