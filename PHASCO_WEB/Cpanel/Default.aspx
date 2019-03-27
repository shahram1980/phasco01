<%@ Page Language="C#" MasterPageFile="~/Template/UnsecAdmin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="phasco.Cpanel.Default" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 300px; direction: ltr;">
            <tr>
                <td align="right" style="width: 65%; height: 13px;">
                    <asp:TextBox ID="TextBox_UId" runat="server" Font-Size="X-Small"></asp:TextBox>
                </td>
                <td align="left" dir="rtl" style="width: 35%; height: 13px;">
                    نام کاربری :
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 65%">
                    <asp:TextBox ID="TextBox_Pass" runat="server" Font-Size="X-Small" TextMode="Password"></asp:TextBox>
                </td>
                <td align="left" dir="rtl" style="width: 35%">
                    نام رمز :
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 65%">
                    <asp:Button ID="Button1" runat="server" Font-Names="Tahoma" Font-Size="X-Small" OnClick="Button1_Click"
                        Text="ورود به سایت" />
                </td>
                <td align="left" dir="rtl" style="width: 35%">
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2" dir="rtl">
                    <asp:Label ID="Label_Alarm" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
