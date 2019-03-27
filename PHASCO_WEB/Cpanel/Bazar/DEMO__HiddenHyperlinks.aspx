<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DEMO__HiddenHyperlinks.aspx.cs" Inherits="DEMO_PagerControlV2_8netFx3_5_CS.DEMO__HiddenHyperlinks" %>

<%@ Register assembly="BiztBiz" namespace="ASPnetControls" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASPnetPagerV2.8 netFx3.5 (CS) [Hidden Hyperlinks]</title>
    <style type="text/css">
        @import url('lightStyle.css');
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<cc1:PagerV2_8 ID="pager1"  OnCommand="pager_Command" 
GenerateGoToSection="true"
GenerateHiddenHyperlinks="true" runat="server" />
     <br />
     
            <br />

            
            <br /><br />

    
    			<asp:repeater id="rptProducts" runat="server">
				<HeaderTemplate>
					<table style="background-color:#ffcc66;" cellpadding="5" cellspacing="0">
						<tr>
							<th style="width:70px;">
								index</th>
							<th style="width:200px;">
								ProductName</th>
						</tr>
					</table>
				</HeaderTemplate>
				<ItemTemplate>
					<table cellpadding="5" cellspacing="0" style="background-color:#f0f1f2;">
						<tr>
						    <td style="width:70px;" align="center"><%#Eval("RowNumber")%></td>
							<td style="width:200px;"><%#Eval("[Uid]")%></td>
						</tr>
					</table>
				</ItemTemplate>
				<AlternatingItemTemplate>
					<table cellpadding="5" cellspacing="0" style="background-color:#ccccff;">
						<tr>
						    <td style="width:70px;" align="center"><%#Eval("RowNumber")%></td>
							<td style="width:200px;"><%#Eval("[Uid]")%></td>
						</tr>
					</table>
				</AlternatingItemTemplate>
			</asp:repeater>
    
    
    </div>
    </form>
</body>
</html>
