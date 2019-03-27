<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MessageBox.ascx.cs" Inherits="phasco_webproject.UI.MessageBox" %>
<table border="0"  width="90%" cellspacing="0" cellpadding="0" id="table2" dir="rtl" >
					<tr>
						<td valign="top" Width="55">
						
                            <asp:Image ID="Img_Msg" runat="server" ImageUrl="~/images2/non.gif" Visible="False" />
                            </td>
						<td align="right">
						<asp:Label ID="lbl_msg" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="Red" Width="100%" Visible="False"></asp:Label></td>
					</tr>
				</table>