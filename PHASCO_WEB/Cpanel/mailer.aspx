<%@ Page Language="C#"  MasterPageFile="~/Template/admin.Master"  AutoEventWireup="true" CodeBehind="mailer.aspx.cs" Inherits="PHASCO_WEB.Cpanel.mailer" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table dir="rtl" style="width: 100%; border-collapse: collapse">
        <tr>
            <td style="width: 85px">
                تعداد کاربران</td>
                                                    <td>
                                                        <asp:Label ID="Label_Count" runat="server" Text="0"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 85px">
                                                        دوره</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox_Count" runat="server" Width="20px">1</asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 85px">
                                                        عنوان              دوره</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 85px">
                                                        عنوان</td>
            <td>
                <asp:TextBox ID="TextBox_Title" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 85px">
                بدنه</td>
            <td>
                <FCKeditorV2:FCKeditor ID="FCKeditor_Body" runat="server" Height="400px" 
                    Width="800px">
                </FCKeditorV2:FCKeditor>
            </td>
        </tr>
        <tr>
            <td style="width: 85px">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button_Send" runat="server" onclick="Button_Send_Click1" 
                    Text="  بروو  " />
            </td>
        </tr>
        <tr>
            <td style="width: 85px">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox_Report" runat="server" Height="68px" 
                    TextMode="MultiLine" Width="309px"></asp:TextBox>
            </td>
        </tr>
    </table>


</asp:Content>

 