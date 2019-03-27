<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="External_Article.aspx.cs" Inherits="phasco_webproject.External_Article" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Aricles</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Repeater ID="RPT_Last" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td dir="rtl" align="right" valign="top">
                                                            <table border="0" width="100%" cellpadding="0" style="border-collapse: collapse"
                                                                dir="rtl" id="table22">
                                                                <tr>
                                                                    <td width="4" height="21" background="images/doc-right-bg.gif" dir="rtl">
                                                                        &nbsp;</td>
                                                                    <td height="21" dir="rtl" align="right" valign="top">
                                                                        <font size="1" face="Tahoma"><span lang="en-us">&nbsp; <a href="ViewArticle.aspx?Id=<%# DataBinder.Eval(Container.DataItem, "Id") %>"
                                                                            class="A_Class_Top">
                                                                            <%# DataBinder.Eval(Container.DataItem, "Writer") %>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="4">
                                                                    </td>
                                                                    <td background="images/doc-bo-images.gif">
                                                                        <font size="1">
                                                                            <img border="0" src="images/doc-bo-images.gif" width="307" height="5"></font></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="10" height="27" dir="rtl">
                                                            &nbsp;</td>
                                                        <td dir="rtl" align="right" valign="top">
                                                            <div align="left">
                                                                <table border="0" width="95%" id="table20" style="border-collapse: collapse" dir="rtl">
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table border="0" width="100%" cellpadding="0" style="border-collapse: collapse"
                                                                    dir="rtl" id="table21">
                                                                    <tr>
                                                                        <td width="4" height="21" background="images/doc-right-bg.gif" dir="rtl">
                                                                            &nbsp;</td>
                                                                        <td height="21" dir="rtl" align="right" valign="top">
                                                                            <a href="ViewArticle.aspx?Id=<%# DataBinder.Eval(Container.DataItem, "Id") %>" class="A_Class_Top">
                                                                                <%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="4">
                                                                        </td>
                                                                        <td background="images/doc-bo-images.gif">
                                                                            <font size="1">
                                                                                <img border="0" src="images/doc-bo-images.gif" width="307" height="5"></font></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
    </div>
    </form>
</body>
</html>
