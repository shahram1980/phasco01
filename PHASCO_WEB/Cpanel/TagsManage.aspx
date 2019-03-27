<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="TagsManage.aspx.cs" Inherits="PHASCO_WEB.Cpanel.TagsManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style3" dir="rtl">
        <tr>
            <td>
                <table class="style3">
                    <tr>
                        <td style="width: 20%">
                            تعداد کل :
                        </td>
                        <td style="width: 80%">
                            <asp:Label ID="Label_Count" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            کلمه
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="TextBox_Tag" runat="server" Height="47px" TextMode="MultiLine" Width="443px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            آدرس
                        </td>
                        <td style="width: 80%; direction: ltr; text-align: right;">
                            <asp:TextBox ID="TextBox_Url" runat="server" Width="447px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            &nbsp;
                        </td>
                        <td style="width: 80%">
                            <br />
                            <asp:Button ID="Button_Insert" runat="server" Text="  ثبت شود  " OnClick="Button_Insert_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="Button_split" runat="server" OnClick="Button_split_Click" Text="  تجزیه شود  " />
                        </td>
                    </tr>
                </table>
                <asp:Panel runat="server" ID="panel_Checklist" Visible="false">
                    <asp:CheckBoxList ID="CheckBoxList_Words" runat="server" RepeatColumns="10" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <div id="dvGrid" style="padding: 10px; width: 550px">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                                Font-Names="Arial" Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B" HeaderStyle-BackColor="green"
                                AllowPaging="True" ShowFooter="True" OnPageIndexChanging="OnPaging" EnableModelValidation="True"
                                PageSize="50">
                                <Columns>
                                    <asp:BoundField DataField="tag" HeaderText="tag" />
                                    <asp:TemplateField HeaderText="Url Link">
                                        <ItemTemplate>
                                            <a href='<%# Eval("Url") %>' title='<%# Eval("tag") %>' target="_blank">لینک </a>
                                            link<br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                OnCommand="LinkButton_Delete_Command">
     Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle BackColor="#C2D69B" />
                                <HeaderStyle BackColor="Green" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
