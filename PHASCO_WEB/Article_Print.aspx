<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Article_Print.aspx.cs"
    Inherits="PHASCO_WEB.Article_Print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>چاپ مقاله_فاسکو</title>
    <style>
<!--
body         { font-family: Tahoma; font-size: 8pt }
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
            <tr>
                <td align="left" style="width: 30%">
                    &nbsp;
                </td>
                <td align="left" style="width: 70%" valign="top">
                    <a href="JavaScript:window.print();">چاپ شود</a>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%; height: 13px;">
                    عنوان : &nbsp;
                </td>
                <td align="right" style="width: 70%; height: 13px;" valign="top">
                    <asp:Label ID="SubJect" runat="server" CssClass="TXTClass"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%">
                    ارسال کننده :&nbsp;
                </td>
                <td align="right" style="width: 70%" valign="top">
                    <asp:Label ID="LBL_UserSender" runat="server" CssClass="TXTClass"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%">
                    <span style="font-size: 10pt">نویسنده / نويسندگان :&nbsp;</span>
                </td>
                <td align="right" style="width: 70%" valign="top">
                    <asp:Label ID="Writer" runat="server" CssClass="TXTClass"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%">
                    <span style="font-size: 10pt">مترجم :&nbsp;</span>
                </td>
                <td align="right" style="width: 70%" valign="top">
                    <asp:Label ID="Translator" runat="server" CssClass="TXTClass"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%">
                    <span style="font-size: 10pt">کلید واژه :&nbsp; </span>
                </td>
                <td align="right" style="width: 70%" valign="top">
                    <asp:Label ID="keyWork" runat="server" CssClass="TXTClass"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%; height: 17px">
                    <span style="font-size: 10pt">چکیده :&nbsp; </span>
                </td>
                <td align="right" style="width: 70%; height: 17px" valign="top">
                    <asp:Label ID="ShortText" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%">
                    <span style="font-size: 10pt">منابع :&nbsp; </span>
                </td>
                <td align="right" style="width: 70%" valign="top">
                    <asp:Label ID="Ref" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%">
                </td>
                <td align="right" style="width: 70%" valign="top">
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="right" style="padding: 5px;" colspan="2">
                    <p align="justify">
                        <asp:Label ID="Text" runat="server" Width="100%"></asp:Label></p>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 30%">
                </td>
                <td align="right" style="width: 70%" valign="top">
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
