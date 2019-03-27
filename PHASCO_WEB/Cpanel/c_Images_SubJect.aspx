<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master"AutoEventWireup="true" CodeBehind="c_Images_SubJect.aspx.cs" Inherits="phasco_webproject.Cpanel.c_Images_SubJect" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View_Insert_New" runat="server">
                &nbsp;<table border="0" align="center">
                    <tr>
                        <td >
                            <asp:Button ID="Button_Ins" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                OnClick="Button_Ins_Click" Text="ثبت شود" /></td>
                        <td >
                            <asp:CheckBox ID="CheckBox_Ins" runat="server" /></td>
                        <td >
                            اجازه نمایش</td>
                        <td >
                            <asp:FileUpload ID="FileUpload_Ins" runat="server" /></td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View_Change_Image" runat="server">
                &nbsp;<table dir="rtl" align="center" width="100%">
                    <tr>
                        <td align="center" colspan="2" rowspan="2">
                            <asp:FileUpload ID="FileUpload1_Change" runat="server" /></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" rowspan="1">
                            <asp:CheckBox ID="CheckBox_Change" runat="server" />اجازه نمایش</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="Button_Change" runat="server" Font-Names="Tahoma" Font-Size="X-Small" 
                                Text="ثبت شود" OnClick="Button_Change_Click" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="Image1" runat="server" /></td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
</asp:Content>

 