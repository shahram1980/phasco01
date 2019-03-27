<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addpoint.aspx.cs" Inherits="PHASCO_WEB.Cpanel.addpoint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>-/+</title>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="right" dir="rtl" style="width: 100%" valign="top">
                    امتیاز فعلی :
                    <asp:Label ID="Label_Current_Point" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" dir="ltr" style="width: 100%" valign="top">
                    &nbsp;<asp:TextBox ID="TextBox_Point" runat="server"></asp:TextBox>امتیاز اضافه
                    / کسر&nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 100%" valign="top">
                    <asp:Button ID="Button_Insert" runat="server" OnClick="Button_Insert_Click" Text="ثبت شود" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
