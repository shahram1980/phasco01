<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="TodayTextEdit.aspx.cs" Inherits="PHASCO_WEB.Cpanel.TodayTextEdit" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                متن :&nbsp;</td>
            <td align="right" style="width: 70%" valign="top">
                <asp:TextBox ID="TextBox_Text" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Height="200px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%; height: 13px" valign="top">
                پیوند :&nbsp;
            </td>
            <td align="right" dir="ltr" style="width: 70%; height: 13px" valign="top">
                <asp:TextBox ID="TextBox_Url" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="80%">http://www.</asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                نمايش پيوند :&nbsp;
            </td>
            <td align="right" style="width: 70%" valign="top">
                <asp:CheckBox ID="CheckBox_Link" runat="server" Font-Names="Tahoma" Font-Size="XX-Small" /></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%; height: 18px" valign="top">
            </td>
            <td align="right" style="width: 70%; height: 18px" valign="top">
                <asp:Button ID="Button_Insert" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    OnClick="Button_Insert_Click" Text="  ثبت شود  " /></td>
        </tr>
    </table>
</asp:Content>

 