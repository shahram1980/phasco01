<%@ Page Title="main" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="PHASCO_Shopping.bizpanel.main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td align="center" width="50%">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/images/Icons/0471.png" />
            </td>
            <td align="center">
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/images/Icons/0621.png" />
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                <asp:HyperLink ID="HyperLink8" runat="server" 
                    NavigateUrl="~/bizpanel/CatManager.aspx">Category Manager</asp:HyperLink>
            </td>
            <td align="center">
                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="~/bizpanel/Inquire.aspx">Inquire</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                <asp:ImageButton ID="ImageButton4" runat="server" 
                    ImageUrl="~/images/Icons/0402.png" />
            </td>
            <td align="center">
                <asp:ImageButton ID="ImageButton3" runat="server" 
                    ImageUrl="~/images/Icons/0107.png" />
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                <asp:HyperLink ID="HyperLink10" runat="server" 
                    NavigateUrl="~/bizpanel/Users.aspx">Manage Users</asp:HyperLink>
            </td>
            <td align="center">
                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="~/bizpanel/News.aspx">News</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                &nbsp;</td>
            <td align="center">
                <asp:ImageButton ID="ImageButton9" runat="server" 
                    ImageUrl="~/images/Icons/help.png" />
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                &nbsp;</td>
            <td align="center">
                <asp:HyperLink ID="HyperLink17" runat="server" 
                    NavigateUrl="~/bizpanel/Help.aspx">Help</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style2" width="50%" align="center">
                <asp:ImageButton ID="ImageButton5" runat="server" 
                    ImageUrl="~/images/Icons/0788.png" />
            </td>
            <td class="style2" align="center">
                <asp:ImageButton ID="ImageButton6" runat="server" 
                    ImageUrl="~/images/Icons/0507.png" />
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="~/bizpanel/SubmitProducts.aspx">Submit Products</asp:HyperLink>
            </td>
            <td align="center">
                <asp:HyperLink ID="HyperLink13" runat="server" 
                    NavigateUrl="~/bizpanel/CreateAdminUser.aspx">Admin Users</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                <asp:ImageButton ID="ImageButton8" runat="server" 
                    ImageUrl="~/images/Icons/0577.png" />
            </td>
            <td align="center">
                <asp:ImageButton ID="ImageButton7" runat="server" 
                    ImageUrl="~/images/Icons/0583.png" />
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                <asp:HyperLink ID="HyperLink15" runat="server">Advertisements</asp:HyperLink>
            </td>
            <td align="center">
                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="~/bizpanel/ChangePass.aspx">Change Password</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td width="50%" align="center">
                &nbsp;</td>
            <td align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="50%" align="center">
                &nbsp;</td>
            <td align="center">
                <a href="default.aspx">Logout</a></td>
        </tr>
    </table>
</asp:Content>
