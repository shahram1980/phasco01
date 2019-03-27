<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BiztBiz.News.Default" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="745" bgcolor="#fbfbfc" dir="ltr">
            <tr>
                <td width="8" height="10">
                    <img src="/images/News_left_top.gif" />
                </td>
                <td height="10" background="/images/News_header_bg.gif">
                </td>
                <td width="8" height="10">
                    <img src="/images/News_right_top.gif" />
                </td>
            </tr>
            <tr>
                <td width="8" background="/images/News_left_bg.gif">
                </td>
                <td bgcolor="#fbfbfc" dir="rtl">
                    <table width="727" border="0" style="vertical-align: top; margin-top: 20px;">
                        <tr>
                            <td style="background-image: url(../images/header.gif); background-position: center;
                                background-repeat: no-repeat; height: 42px;">
                                &nbsp;<div style="font-family: tahoma; font-size: 12px; direction: rtl; text-align: left;
                                    padding-left: 20px;">
                                    <strong>تاریخ ارسال :</strong>
                                    <asp:Label ID="Label_date" runat="server" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="font-family: tahoma; font-size: 12px; direction: rtl; text-align: right;
                                    padding: 20px; line-height: 20px; color: #457EAD;">
                                    <a href="#" style="font-weight: bold; text-decoration: none; color: #0000FF">
                                        <img src="../images/sign.png" border="0" align="absmiddle">
                                        &nbsp;&nbsp;
                                        <asp:Label ID="Label_Title" runat="server" /></a><br />
                                    <br />
                                    <asp:Image ID="Image_News" runat="server" />
                                    <asp:Label ID="Label_News" runat="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="8" background="/images/News_right_bg.gif">
                </td>
            </tr>
            <tr>
                <td width="8" height="10">
                    <img src="/images/News_left_down.gif" />
                </td>
                <td height="10" background="/images/News_footer_bg.gif">
                </td>
                <td width="8" height="10">
                    <img src="/images/News_right_down.gif" />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style_News_Left
        {
            width: 100%;
            height: 100%;
            border-collapse: collapse;
        }
        .style_News_Body
        {
            width: 800;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
