<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="phasco.Cpanel.main" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 80%">
        <tr>
            <td style="height: 20px" colspan="3">
                 &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/Aaza.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/akhbar.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/directori.jpg" /></td>
        </tr>
        <tr>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/Members.aspx">Members</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/News.aspx">News</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/DirMain.aspx">Directory</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/moshkelat.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/modiriyate%20payam.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/maghulut.jpg" /></td>
        </tr>
        <tr>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink4" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/RequestUserPm.aspx">Manage PM</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink5" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/Orders.aspx">Orders</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink6" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/Products.aspx">Create Tree & Pages</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/shukhe%20hu.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/sefareshut.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/payum.jpg" /></td>
        </tr>
        <tr>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink9" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/Advertisment.aspx">Advertisment</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink8" runat="server" Font-Names="Tahoma" Font-Size="X-Small">Send Photo</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink7" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/Usersms.aspx">Send PM</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/tablighut.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/sukhte%20safahut.jpg" /></td>
            <td style="width: 33%">
                <img src="../Cpanel/Images/Menu/soAl%20.jpg" /></td>
        </tr>
        <tr>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink10" runat="server" Font-Names="Tahoma" Font-Size="X-Small">weekly Answer</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink11" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/ProblemsMaker.aspx">Problems Maker</asp:HyperLink></td>
            <td style="width: 33%">
                <asp:HyperLink ID="HyperLink12" runat="server" Font-Names="Tahoma" Font-Size="X-Small" NavigateUrl="~/Cpanel/WeeklyAnsQus.aspx">weekly Answer</asp:HyperLink></td>
        </tr>
    </table>

</asp:Content>
 