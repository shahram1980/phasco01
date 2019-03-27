<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="Coding.aspx.cs" Inherits="BiztBiz.bizpanel.Coding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; direction: rtl;">
        <asp:MultiView ID="muvCoding" runat="server">
            <asp:View ID="vwCodingList" runat="server">
                <table width="90%" style="text-align: right;">
                    <tr>
                        <td style="padding: 10px;" colspan="2">
                            <asp:LinkButton ID="lnkNewUserLimitations" OnClick="lnkNewCoding_Click"
                                runat="server" Text="[ایجاد دسته جدید]"></asp:LinkButton>
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
                            <asp:GridView ID="grdCoding" runat="server" AutoGenerateColumns="false" Width="500px">
                                <Columns>
                                    <asp:BoundField DataField="CodingName" HeaderText="نام دسته" HeaderStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="CodingGroupName" HeaderText="گروه" HeaderStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="CodingValue" HeaderText="مقدار" HeaderStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="عملیات" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="ویرایش" CommandArgument='<%#Eval("CodingID") %>'
                                                OnCommand="lnkEdit_Command"></asp:LinkButton>
                                            <asp:LinkButton ID="lnkDelete" runat="server" Text="حذف" CommandArgument='<%#Eval("CodingID") %>'
                                                OnCommand="lnkDelete_Command"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="vwCodingDetails" runat="server">
                <table class="style1">
                    <tr>
                        <td class="td_register" colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            نام دسته
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtCodingName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            انتخاب گروه
                        </td>
                        <td class="td_register">
                            <asp:DropDownList ID="ddlCodingGroup" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            مقدار
                        </td>
                        <td class="td_register">
                            <asp:TextBox ID="txtCodingValue" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                        </td>
                        <td class="td_register_de">
                            <a href="Coding.aspx">[بازگشت به لیست]</a>
                            <asp:LinkButton ID="lnkConfirm" runat="server" OnClick="lnkConfirm_Click" Text="تایید"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
