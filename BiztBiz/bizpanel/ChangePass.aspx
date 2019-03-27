<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="BiztBiz.bizpanel.ChangePass" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<center>
    <table id="table1" border="0" bordercolor="#000000" cellpadding="0" 
        style="border-collapse: collapse" width="400" dir="rtl">
        <tr>
            <td align="left" dir="ltr" valign="top" width="70%">
                <asp:TextBox ID="TextBox_Old" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td align="right" dir="ltr" valign="top" width="30%">
                Old Pass : </td>
        </tr>
        <tr>
            <td align="left" dir="ltr" valign="top" width="70%">
                <asp:TextBox ID="TextBox_New" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td align="right" dir="ltr" valign="top" width="30%">
                New Pass : </td>
        </tr>
        <tr>
            <td align="left" dir="ltr" valign="top" width="70%">
                <asp:TextBox ID="TextBox_New2" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox_New" ControlToValidate="TextBox_New2" 
                    ErrorMessage=" Pass not equal " ForeColor="DarkRed"></asp:CompareValidator>
            </td>
            <td align="right" dir="ltr" valign="top" width="30%">
                New Pass 2 : </td>
        </tr>
        <tr>
            <td align="left" dir="ltr" valign="top" width="70%">
                <asp:Button ID="Button_Change" runat="server" onclick="Button_Change_Click" 
                    Text="Change" />
            </td>
            <td align="right" dir="ltr" valign="top" width="30%">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" dir="ltr" valign="top" width="70%">
                <asp:Label ID="Label_alarm" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td align="right" dir="ltr" valign="top" width="30%">
                &nbsp;</td>
        </tr>
    </table>
</center>

</asp:Content>

 