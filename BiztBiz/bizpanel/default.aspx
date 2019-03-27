<%@ Page Title="" Language="C#" MasterPageFile="~/Template/adminlogin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BiztBiz.bizpanel.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td width="50%">
                Username</td>
            <td>
                <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password</td>
            <td>
                <asp:TextBox ID="txt_pass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btn_login" runat="server" onclick="btn_login_Click" 
                    Text="Login" />
            </td>
        </tr>
    </table>
</asp:Content>
