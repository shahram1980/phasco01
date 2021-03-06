<%@ Page Language="C#" AutoEventWireup="true" Codebehind="External_User.aspx.cs"
    Inherits="PHASCO_WEB.ExternalHome.External_User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" type="text/css" href="../CSS/art-final.css" />
          <link rel="stylesheet" type="text/css" href="../CSS/main-final.css" />
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
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" dir="rtl" style="width: 50%; height: 33px;" valign="top">
                        <strong>
                        جدیدترین کاربرن عضو شده</strong></td>
                    <td align="right" dir="rtl" style="width: 50%; height: 33px;" valign="top">
                        <strong>
                        جدیدترین وبلاگ های به روز شده</strong></td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 50%" valign="top">
                        <asp:GridView ID="GridView_TopUser" runat="server" AutoGenerateColumns="False" Width="100%"
                            BorderStyle="None" BorderWidth="0px" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td align="right" dir="rtl" style="width: 95%" valign="top">
                                                    <img src="../images/arrow3.gif" />
                                                    <a target="_parent" href="../UserProfile.aspx?id=<%# Eval("id")%>" title="<%# Eval("uid")%>">
                                                        <%# Eval("uid")%>
                                                    </a>&nbsp;&nbsp 
                                                    <%# Eval("name")%>
                                                     
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-image: url(../images/line.gif); height: 20px">
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td align="right" dir="rtl" style="width: 50%" valign="top">
                        <asp:GridView ID="GridView_Top_Blog_User" runat="server" AutoGenerateColumns="False"
                            Width="100%" BorderStyle="None" BorderWidth="0px" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td align="right" dir="rtl" style="width: 95%" valign="top">
                                                    <img src="../images/arrow3.gif" />
                                                    <a target="_parent" href="../Wblog.aspx?Bid=<%# Eval("id")%>" title="<%# Eval("Title")%>">
                                                        <%# Eval("Title")%>
                                                        </br>[<%# Eval("Uid")%>]&nbsp;[<%# Eval("DateFarsi")%>]</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-image: url(../images/line.gif); height: 20px">
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
