<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="CPro.aspx.cs" Inherits="BiztBiz.MyBiztBiz.CPro" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="first-page-edit-prof">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td class="td_profile">
                            نام رمز فعلی :
                        </td>
                        <td class="td_profile" colspan="2">
                            <asp:TextBox ID="TextBox_CurrentPass" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_profile">
                            نام رمز جدید :
                        </td>
                        <td class="td_profile" colspan="2">
                            <asp:TextBox ID="TextBox_NewPass1" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_profile">
                            تکرار نام رمز جدید :
                        </td>
                        <td class="td_profile" colspan="2">
                            <asp:TextBox ID="TextBox_NewPass2" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_NewPass1"
                                ControlToValidate="TextBox_NewPass2" ErrorMessage="<%$ Resources:Resource, Pass_not_equal %>"
                                ForeColor="DarkRed"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_profile">
                            &nbsp;
                        </td>
                        <td class="td_profile" colspan="2">
                            <asp:Label ID="Label_Alarm" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_profile">
                        </td>
                        <td class="td_profile">
                            <asp:Button ID="Button_Apply" runat="server" Text="  اعمال شود  " OnClick="Button_Apply_Click" />
                        </td>
                        <td class="td_profile">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                نام رمز با موفقیت تغییر کرد.
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
