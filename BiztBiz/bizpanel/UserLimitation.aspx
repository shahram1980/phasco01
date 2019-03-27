<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="UserLimitation.aspx.cs" Inherits="BiztBiz.bizpanel.UserLimitation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; direction: rtl;">
        <asp:MultiView ID="muvUserRole" runat="server">
            <asp:View ID="vwUserRoleList" runat="server">
                <table width="90%" style="text-align: right;">
                    <tr>
                        <td style="padding: 10px;" colspan="2">
                            <asp:LinkButton ID="lnkNewUserLimitations" OnClick="lnkNewUserLimitations_Click"
                                runat="server" Text="[ایجاد گروه کاربری جدید]"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="grdUserRole" runat="server" AutoGenerateColumns="false" Width="500px">
                                <Columns>
                                    <asp:BoundField DataField="RoleName" HeaderText="نام گروه کاربری" HeaderStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ProductLimitedCount" HeaderText="تعداد ارسال محصول" HeaderStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="RequestLimitedCount" HeaderText="تعداد ارسال درخواست"
                                        HeaderStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="عملیات" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="ویرایش" CommandArgument='<%#Eval("UserRoleID") %>'
                                                OnCommand="lnkEdit_Command"></asp:LinkButton>
                                            <asp:LinkButton ID="lnkDelete" runat="server" Text="حذف" CommandArgument='<%#Eval("UserRoleID") %>'
                                                OnCommand="lnkDelete_Command"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="vwUserRoleDetails" runat="server">
                <table class="style1">
                    <tr>
                        <td class="td_register" colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            نام گروه کاربری
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            تعداد ارسال محصول
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtProductLimitedCount" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            زمان انتضاء محصول
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtProductLimitedDate" runat="server"></asp:TextBox>
                            ماه
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            تعداد ارسال درخواست
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtRequestLimitedCount" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            زمان انتضاء درخواست
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtRequestLimitedDate" runat="server"></asp:TextBox>
                            ماه
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            تعداد دسته بندی شرکت
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtCompanyLimitedCount" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                        </td>
                        <td class="td_register_de">
                            <a href="UserLimitation.aspx">[بازگشت به لیست]</a>
                            <asp:LinkButton ID="lnkConfirm" runat="server" OnClick="lnkConfirm_Click" Text="تایید"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
