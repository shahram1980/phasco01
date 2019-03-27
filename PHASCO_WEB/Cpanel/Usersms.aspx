<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="Usersms.aspx.cs" Inherits="phasco.Cpanel.Usersms" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="right" dir="rtl" style="width: 100%; height: 13px">
                &nbsp;::
                <asp:LinkButton ID="LinkButton_Send_To_All" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    OnClick="LinkButton_Send_To_All_Click">ارسال برای همه</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                &nbsp;::
                <asp:LinkButton ID="LinkButton_Hand" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    OnClick="LinkButton_Hand_Click">انتخاب گروه</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                &nbsp;::
                <asp:LinkButton ID="LinkButton_Choise_User" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    OnClick="LinkButton_Choise_User_Click">انتخاب دستی</asp:LinkButton></td>
        </tr>
    </table>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" dir="rtl" style="width: 70%; height: 208px;">
                        <asp:TextBox ID="TextBox_PM" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            Height="200px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
                    <td align="left" dir="rtl" style="width: 30%; height: 208px;">
                        متن پيام :</td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 70%">
                        <asp:FileUpload ID="FileUpload_Attach" runat="server" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                    <td align="left" dir="rtl" style="width: 30%">
                        پیوست :</td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 70%">
                        <asp:Button ID="Button_Send" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_Send_Click" Text="ارسال" /></td>
                    <td align="left" dir="rtl" style="width: 30%">
                    </td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 70%">
                    </td>
                    <td align="left" dir="rtl" style="width: 30%">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td dir="rtl" style="width: 100%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td dir="ltr" style="width: 100%"><table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" dir="rtl" style="width: 70%">
                                <asp:DropDownList ID="DropDownList_Member_Group" runat="server" Font-Names="Tahoma"
                                    Font-Size="X-Small">
                                </asp:DropDownList></td>
                            <td align="left" dir="rtl" style="width: 30%">
                                گروه کاربران :</td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 70%">
                                <asp:TextBox ID="TextBox_PM2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                    Height="150px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
                            <td align="left" dir="rtl" style="width: 30%">
                                متن پيام :</td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 70%">
                                <asp:FileUpload ID="FileUpload_Attach2" runat="server" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                            <td align="left" dir="rtl" style="width: 30%">
                                پیوست :</td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 70%">
                                <asp:Button ID="Button_Send2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_Send2_Click" Text="ارسال" /></td>
                            <td align="left" dir="rtl" style="width: 30%">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 70%">
                            </td>
                            <td align="left" dir="rtl" style="width: 30%">
                            </td>
                        </tr>
                    </table>
                    </td>
                </tr>
                <tr>
                    <td dir="rtl" style="width: 100%">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server"><table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="left" colspan="2" dir="rtl" style="height: 208px">
                    <asp:GridView ID="GRD_User" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black"
                        GridLines="Vertical" Width="100%">
                        <FooterStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="کد">
                                <ItemStyle Width="10%" />
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="uid" HeaderText="کدکاربری">
                                <ItemStyle Width="70%" />
                                <HeaderStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemStyle Width="20%" />
                                <HeaderStyle Width="50px" />
                                <ItemTemplate>
                                    <input id="chkBxMail" runat="server" type="checkbox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Height="25px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                        <AlternatingRowStyle BackColor="#CCCCCC" Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 70%; height: 208px;">
                    <asp:TextBox ID="TextBox_PM3" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                        Height="200px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
                <td align="left" dir="rtl" style="width: 30%; height: 208px;">
                    متن پيام :</td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 70%">
                    <asp:FileUpload ID="FileUpload_Attach3" runat="server" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                <td align="left" dir="rtl" style="width: 30%">
                    پیوست :</td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 70%">
                    <asp:Button ID="Button_Send3" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_Send3_Click" Text="ارسال" /></td>
                <td align="left" dir="rtl" style="width: 30%">
                </td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 70%">
                </td>
                <td align="left" dir="rtl" style="width: 30%">
                </td>
            </tr>
        </table>
        </asp:View>
    </asp:MultiView>

</asp:Content>
 
