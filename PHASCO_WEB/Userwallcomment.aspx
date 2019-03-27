<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userwallcomment.aspx.cs" Inherits="PHASCO_WEB.Userwallcomment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>شما هم نظر خود را منتشر کنید</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 375px;
        }
    </style>
</head>
<body style="background:#c8b68e;margin:0px;">
    <form id="form1" runat="server" >
    <div>
    
        <table class="style1" style="width: 300px;" dir="rtl">
            <tr>
                <td colspan="2" dir="rtl">
                    <asp:TextBox ID="TextBox_comment" runat="server" Font-Names="Tahoma" 
                        Font-Size="X-Small" Height="50px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button_send_comment" runat="server" Text="بنویس" 
                        Font-Names="Tahoma" onclick="Button_send_comment_Click" />
                         <asp:Label ID="Label_Alaram_Comment" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
