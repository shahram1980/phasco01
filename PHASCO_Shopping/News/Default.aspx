<%@ Page Language="C#"  MasterPageFile="~/Template/MAin.Master"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PHASCO_Shopping.News.Default1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table border="1" width="800" style="border-collapse: collapse; padding: 5px;" bordercolor="#C5C9CF"
            bgcolor="#EAF0F5" dir='<asp:Literal ID="Literaldir002184" runat="server" EnableViewState="false"  Text="<%$ Resources:Resource, dir %>" />'>
            <tr>
                <td class="style_News">
                    <table border="0" width="100%" id="table2" style="border-collapse: collapse">
                        <tr>
                            <td width="50%" style="height: 100px;">
                                <asp:Label ID="Label_Title" runat="server"></asp:Label>
                            </td>
                            <td width="50%" style="height: 100px;">
                                <asp:Image ID="Image_News" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" style="padding: 5px;" colspan="2">
                                <asp:Label ID="Label_News" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style_News
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style_News_Body
        {
            width: 800;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
