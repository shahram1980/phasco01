<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageShow.aspx.cs" Inherits="PHASCO_Shopping.C_p.ImageShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PHASCO BIZ image gallery</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
<table border="2" width="100%" bordercolor="#DFDFDF" style="border-collapse: collapse">
	<tr>
		<td align="center" valign="top">
            <asp:Image ID="Image_View" runat="server" />
        </td>
	</tr>
	<tr>
		<td bgcolor="#DFDFDF" align="center"><b>
		<font face="Arabic Transparent" color="#FFFFFF">PHASCO BIZ image gallery</font></b></td>
	</tr>
</table>

    </div>
    </form>
</body>
</html>
