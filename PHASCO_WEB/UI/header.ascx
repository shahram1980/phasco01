<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="PHASCO_WEB.UI.header" %>
<%@ Register Src="../UI/NewsFlash.ascx" TagName="NewsFlash" TagPrefix="uc3" %>
<table style="width: 100%; float: right; height: 35px;" bgcolor="white" cellspacing="0"
    cellpadding="0">
    <tr>
        <td valign="bottom" style="padding-right: 5px; text-align: left">
            <%--   <a runat="server" href="~/Default.aspx?mLang=fa-IR">فارسی</a> |
                             <a runat="server" href="~/Default.aspx?mLang=en-US">English</a>--%>
            <img alt=",هورمونی,الایزا,کیت,آزمایشگاه,فاسکو"
                src="/images/Header_Left.jpg" />
        </td>
        <td valign="middle" style="width: 486px" dir="rtl">
            <uc3:NewsFlash ID="NewsFlash1" runat="server" />

        </td>
        <td style="width: 271px; text-align: right;">
            <img alt=",هورمونی,الایزا,کیت,آزمایشگاه,فاسکو" src="/images/logo.jpg" />
        </td>
    </tr>
</table>
