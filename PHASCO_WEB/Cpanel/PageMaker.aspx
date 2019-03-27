<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="PageMaker.aspx.cs" Inherits="phasco.Cpanel.PageMaker" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                &nbsp;::
                <asp:LinkButton ID="LinkButton_New" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Font-Underline="False" OnClick="LinkButton_New_Click">صفحه جدید</asp:LinkButton><br />
                &nbsp;::
                <asp:LinkButton ID="LinkButton_Edit" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Font-Underline="False" OnClick="LinkButton_Edit_Click">ویرایش صفحات</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="center" dir="rtl" style="width: 100%">
                <asp:Label ID="Lbl_Alarm" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div style="text-align: center">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 550px">
                                <tr>
                                    <td style="width: 100%; height: 91px;">
                                        <div style="text-align: center">
                                            <table border="0" cellpadding="0" dir="ltr" style="width: 100%">
                                                <tr>
                                                    <td align="right" style="width: 80%">
                                                        <asp:TextBox ID="TXT_Title_Page" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                            Width="150px"></asp:TextBox></td>
                                                    <td align="right" style="width: 20%">
                                                        عنوان</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 80%">
                                                        <asp:DropDownList ID="DropDownList_Page" runat="server" Font-Names="Tahoma" Visible="False">
                                                            <asp:ListItem Value="1">1</asp:ListItem>
                                                            <asp:ListItem Value="2">2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="DropDownList_Lang" runat="server" Font-Names="Tahoma">
                                                            <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                                                            <asp:ListItem Value="English (United States)">Eglish</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                    <td align="right" style="width: 20%">
                                                        زبان</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 80%">
                                                        &nbsp;</td>
                                                    <td align="right" style="width: 20%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 80%">
                                                        <radE:RadEditor ID="RadEditor1" runat="server" ImagesPaths="~/phascoupfile/RadFileUpload"
                                                            MediaPaths="~/phascoupfile/RadFileUpload" UploadImagesPaths="~/phascoupfile/RadFileUpload"
                                                            UploadMediaPaths="~/phascoupfile/RadFileUpload">
                                                        </radE:RadEditor>
                                                    </td>
                                                    <td align="right" style="width: 20%">
                                                        محتویات صفحه</td>
                                                </tr>
                                            </table>
                                        </div>
           
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; height: 13px">
                                        <asp:Button ID="Button_Insert" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                            OnClick="Button_Insert_Click" Text="ثبت شود" /></td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div style="text-align: center">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td dir="ltr" style="width: 100%">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="550px">
                                            <Columns>
                                                <asp:BoundField DataField="Title" HeaderText="عنوان" />
                                                <asp:BoundField DataField="lang" HeaderText="زبان" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                            Font-Names="Tahoma" Font-Size="X-Small" Font-Underline="False" ForeColor="Red"
                                                            OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>&nbsp;
                                                        <asp:LinkButton ID="LinkButton_Edit" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                            Font-Names="Tahoma" Font-Size="X-Small" Font-Underline="False" ForeColor="Red"
                                                            OnCommand="LinkButton_Edit_Command">ويرايش</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="Gray" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="Silver" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                </asp:MultiView></td>
        </tr>
    </table>
</asp:Content>
 