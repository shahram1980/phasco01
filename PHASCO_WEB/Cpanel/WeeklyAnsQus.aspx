
<%@ Page MasterPageFile="~/Template/admin.Master" Language="C#" AutoEventWireup="true" CodeBehind="WeeklyAnsQus.aspx.cs" Inherits="phasco.Cpanel.WeeklyAnsQus" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
<table border="0" width="100%" id="table46" dir="rtl" style="border-collapse: collapse">
	<tr>
		<td style="width: 46px" align="left" dir="rtl"><font face="Tahoma" size="1">سوال : </font></td>
		<td align="right">
            <asp:TextBox ID="TextBox_Qu" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                Width="80%"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 46px" align="left" dir="rtl"><font face="Tahoma" size="1">گزینه 1 : </font></td>
		<td align="right">
            <asp:TextBox ID="TextBox_q1" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                Width="80%"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 46px" align="left" dir="rtl"><font face="Tahoma" size="1">گزینه 2&nbsp; :</font></td>
		<td align="right">
            <asp:TextBox ID="TextBox_q2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                Width="80%"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 46px" align="left" dir="rtl"><font face="Tahoma" size="1">گزینه 3 :</font></td>
		<td align="right">
            <asp:TextBox ID="TextBox_q3" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                Width="80%"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 46px" align="left" dir="rtl"><font face="Tahoma" size="1">گزینه 4&nbsp; :</font></td>
		<td align="right">
            <asp:TextBox ID="TextBox_q4" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                Width="80%"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 46px" align="left" dir="rtl"><font face="Tahoma" size="1">جواب :</font></td>
		<td align="right">
            &nbsp;<asp:DropDownList ID="DropDownList_Ans_Ques" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList></td>
	</tr>
	<tr>
		<td style="width: 46px" align="left" dir="rtl"><font face="Tahoma" size="1">امتياز : </font></td>
		<td align="right">
            &nbsp;<asp:DropDownList ID="DropDownList_Point" runat="server">
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>35</asp:ListItem>
                <asp:ListItem>40</asp:ListItem>
            </asp:DropDownList></td>
	</tr>
	<tr>
		<td style="width: 46px">&nbsp;</td>
		<td align="right">
            <asp:Button ID="Button_Insert" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                OnClick="Button_Insert_Click" Text="ثبت شود" /></td>
	</tr>
</table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="center" style="width: 100%">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" dir="rtl" style="width: 100%; height: 13px">
                            سوال هفته با موفقيت ارسال گرديد.</td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 100%; height: 13px">
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content> 
 