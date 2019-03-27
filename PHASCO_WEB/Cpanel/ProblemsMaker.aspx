<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="ProblemsMaker.aspx.cs" Inherits="phasco.Cpanel.ProblemsMaker" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="width: 100%">
                <asp:LinkButton ID="LinkButton_qu" runat="server" OnClick="LinkButton_qu_Click">درج مسئله جدید</asp:LinkButton>&nbsp;
                |&nbsp;
                <asp:LinkButton ID="LinkButton_Ans" runat="server" OnClick="LinkButton_Ans_Click">پاسخ ها</asp:LinkButton></td>
        </tr>
        <tr>
            <td style="width: 100%">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" dir="ltr">
                <tr>
                    <td align="right" dir="rtl" style="width: 80%; height: 13px">
                        <asp:TextBox ID="txt_Sulotion" runat="server" Font-Names="Tahoma" Font-Size="X-Small" Height="100px"
                            TextMode="MultiLine" Width="300px"></asp:TextBox></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 13px">
                        مسئله :</td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 80%">
                        <asp:Button ID="Button_Send" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_Send_Click" Text="ارسال شود" /></td>
                    <td align="left" dir="rtl" style="width: 20%">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td style="width: 892px">
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td dir="rtl" style="width: 892px">
                        مسئله با موفقيت ارسال گردید.</td>
                </tr>
                <tr>
                    <td style="width: 892px">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="center" style="width: 100%">
            <asp:GridView ID="GridView_Ans" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="95%">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="Uid" HeaderText="نام کاربری">
                        <ItemStyle Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="answer" HeaderText="پاسخ">
                        <ItemStyle Width="60%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="آرشیو">
                        <ItemStyle Width="10%" />
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton_Archive" runat="server" ForeColor="#00C000" CommandArgument='<%# Eval("autoid") %>' OnCommand="LinkButton_Archive_Command">آرشیو</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="حذف">
                        <ItemStyle Width="10%" />
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton_Delete" runat="server" ForeColor="Red" CommandArgument='<%# Eval("autoid") %>' OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView></td>
        </tr>
    </table>


</asp:Content>
 