<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSlide.aspx.cs" Inherits="phasco_webproject.ViewSlide" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>View Slide</title>
</head>
<body>
    <form id="form1" runat="server">
<div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td style="width: 100%" align="center">
                 <asp:Label ID="Lbl_Title" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100%" align="center">
                    <asp:Image
                       ID="Image_View" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 100%; height: 19px;" align="center" dir="rtl">
              
                    <asp:Label ID="Lbl_Coment" runat="server"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
