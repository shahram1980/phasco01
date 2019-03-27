<%@ Page Language="C#"  MasterPageFile="~/Template/Office.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.Default1" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="first-page-edit-prof">
        <table style="width: 100%">
            <tr>
                <td class="td_profile">
                    <asp:Literal ID="Literal11" Text="<%$ Resources:Resource, wel_come %>" runat="server" />
                </td>
                <td class="td_profile">
                    <asp:Label ID="Label_Uid" runat="server"></asp:Label>
                </td>
                <td class="td_profile">
                </td>
            </tr>
            <tr>
                <td class="td_profile">
                    <asp:Literal ID="Literal4" Text="<%$ Resources:Resource, Personal_Info %>" runat="server" />
                </td>
                <td class="td_profile">
                    <asp:Literal ID="Literal5" Text="<%$ Resources:Resource, posted %>" runat="server" />
                </td>
                <td class="td_profile">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="td_profile">
                    <asp:Literal ID="Literal1" Text="<%$ Resources:Resource, You_have_submitted  %>"
                        runat="server" />
                </td>
                <td class="td_profile">
                    <asp:Label ID="Label_Product_No" runat="server" Text="0"></asp:Label>
                </td>
                <td class="td_profile">
                    <asp:Literal ID="Literal2" Text="<%$ Resources:Resource, product_s  %>" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="td_profile">
                    <asp:Literal ID="Literal3" Text="<%$ Resources:Resource, Company_information  %>"
                        runat="server" />
                </td>
                <td class="td_profile">
                    <asp:Label ID="Label_certificate_Company_information" runat="server"> </asp:Label>
                </td>
                <td class="td_profile">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="td_profile">
                    <asp:Literal ID="Literal6" Text="<%$ Resources:Resource, Factory_Profile  %>" runat="server" />
                </td>
                <td class="td_profile">
                    <asp:Label ID="Label_Factory_Profile" runat="server"> </asp:Label>
                </td>
                <td class="td_profile">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="td_profile">
                    <asp:Literal ID="Literal7" Text="<%$ Resources:Resource, Manage_Certificate_Info  %>"
                        runat="server" />
                </td>
                <td class="td_profile">
                    <asp:Literal ID="Literal8" Text="<%$ Resources:Resource, You_have_submitted  %>"
                        runat="server" />
                    <asp:Label ID="Label_Manage_Certificate_Info" Text="0" runat="server"> </asp:Label>
                    <asp:Literal ID="Literal9" Text="<%$ Resources:Resource, certificate_s %>" runat="server" />
                </td>
                <td class="td_profile">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="td_profile">
                    &nbsp;</td>
                <td class="td_profile">
                    &nbsp;</td>
                <td class="td_profile">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
      <title runat="server" id="pagetile" >
 
   
      </title>
</asp:Content>