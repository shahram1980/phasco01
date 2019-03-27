<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="FAQListManagment.aspx.cs" Inherits="PHASCO_WEB.Cpanel.FAQListManagment" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center;text-decoration:rtl;">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="right" style="width: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" dir="ltr">
                        <tr>
                            <td align="right" dir="rtl" style="width: 30%">
                            </td>
                            <td align="right" dir="rtl" style="width: 30%">
                            </td>
                            <td align="right" dir="rtl" style="width: 30%">
                                <asp:Label ID="Label_Alarm" runat="server" ForeColor="#C00000" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 30%">
                                <asp:Button ID="Button_Insert" runat="server" Font-Names="Tahoma" OnClick="Button_Insert_Click"
                                    Text="ثبت شود" />
                                <asp:Button ID="Button_Edit" runat="server" Font-Names="Tahoma" OnClick="Button_Edit_Click"
                                    Text=" ویرایش شود" Visible="False" /></td>
                            <td align="right" dir="rtl" style="width: 30%">
                                <asp:TextBox ID="TextBox_title" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
                            <td align="left" dir="rtl" style="width: 30%">
                                عنوان سرگروه سوالات :</td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 30%">
                            </td>
                            <td align="right" dir="rtl" style="width: 30%">
                                <asp:DropDownList ID="DropDownList_Lang" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                                    Font-Size="X-Small" OnSelectedIndexChanged="DropDownList_Lang_SelectedIndexChanged">
                                    <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                                    <asp:ListItem Value="English (United States)">English</asp:ListItem>
                                </asp:DropDownList></td>
                            <td align="left" dir="rtl" style="width: 30%">
                                زبان :</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%">
                    <asp:Repeater ID="GridView_Qu_List" runat="server">
                        <ItemTemplate>
                            <div align="right">
                                <table border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                    <tr>
                                        <td align="right" bgcolor="WhiteSmoke" style="height: 27px;" valign="top" width="100%">
                                            <%# Eval("title") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" width="100%">
                                            <table border="0" style="border-collapse: collapse" width="100%">
                                                <tr>
                                                    <td width="60%">
                                                        <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                            ForeColor="Red" OnClientClick="return confirm('در صورت حذف تمامی سوالات و پاسخ ها نیز حذف خواهد شد ! آیا برای حذف اطمینان دارید')"
                                                            OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>|
                                                        <asp:LinkButton ID="LinkButton_Edit" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                            ForeColor="Red" OnCommand="LinkButton_Edit_Command">ویرایش</asp:LinkButton>
                                                    </td>
                                                    <td width="40%">
                                                        سوالات موجود (<%# Eval("count")%>)
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" width="100%">
                                            <hr style="border: 1px solid #C0C0C0">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td style="width: 100%">
                    <asp:HiddenField ID="HiddenField_Id" runat="server" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

 