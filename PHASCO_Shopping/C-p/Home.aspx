<%@ Page Language="C#" MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PHASCO_Shopping.C_p.Home" %>
<%@ Register src="../UC/B-card.ascx" tagname="B" tagprefix="uc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="style1">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td rowspan="2" class="td_register"">
                            <asp:Image ID="image_Logo" runat="server" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Company_Name" runat="server" />
                             </td>
                    </tr>
                    <tr>
                        <td class="td_register_de">
                            <asp:Image ID="Image_Star" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
<asp:Literal ID="Literal103" runat="server" Text="<%$ Resources:Resource, Company_Introduction %>" /> : 
<asp:Label ID="Label_Company_Introduction" runat="server" /><br/<br />

<asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, year_Established %>" /> : 
<asp:Label ID="Label_year_Established" runat="server" /><br/<br />

<asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Total_Staff %>" /> : 
<asp:Label ID="Label_Total_Staff" runat="server" /><br/<br />
  

 
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
            
            
                <uc1:B ID="B1" runat="server" />
            
            
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>
 