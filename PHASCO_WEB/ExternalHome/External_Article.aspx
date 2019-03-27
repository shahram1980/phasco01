<%@ Page Language="C#" AutoEventWireup="true" Theme="faTheme" CodeBehind="External_Article.aspx.cs"
    Inherits="phasco_webproject.ExternalHome.External_Article" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aricles</title>
    <script language="JavaScript">
      function toggle(id) {
            var state = document.getElementById(id).style.display;
            if (state == 'none') {
                  document.getElementById(id).style.display = 'block';
            } else {
                  document.getElementById(id).style.display = 'none';
            }
      }
</script> 
</head>
<body  style="background-color:#FCF0D5;" onload="toggle('load')">

<div id="load">
  <img src="../images/CalBiotech_Adv.jpg"  align="left" />
  در حال بارگزاری ..
  </div>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" width="100%" align="center">
        <tr>
                <td style="width: 48%; direction: rtl" valign="top" align="right">
                   <img src="../images/arrow4.gif" />&nbsp;جدیدترین مقالات
                </td>
                <td style="width: 10px">
                </td>
                <td style="width: 48%; direction: rtl" align="right" valign="top">
                    <img src="../images/arrow4.gif" />&nbsp;پربیننده ترین مقالات
                </td>
            </tr>
         <tr>
                <td style="width: 48%; direction: rtl;background-image: url(../images/line.gif); height: 20px" valign="top" align="right">
                </td>
                <td style="width: 10px">
                </td>
                <td style="width: 48%; direction: rtl;background-image: url(../images/line.gif); height: 20px" align="right" valign="top">
                </td>
            </tr>
            <tr>
                <td style="width: 48%; direction: rtl" valign="top" align="right">
                    <asp:Repeater ID="RPT_Last" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <img src="../images/arrow3.gif" />
                                        <a href="../Article.aspx?Detailsid=<%# DataBinder.Eval(Container.DataItem, "Id") %>" target=_parent>
                                            <%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(../images/line.gif); height: 20px">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
                <td style="width: 10px">
                </td>
                <td style="width: 48%; direction: rtl" align="right" valign="top">
                    <asp:Repeater ID="RPT_Best" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <img src="../images/arrow3.gif" />
                                        <a title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" href="../Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>" target=_parent>
                                            <%#DataBinder.Eval(Container.DataItem, "SubJect")%>&nbsp;[مشاهده<%#DataBinder.Eval(Container.DataItem, "ClickNumber")%>بار]
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(../images/line.gif); height: 20px">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
