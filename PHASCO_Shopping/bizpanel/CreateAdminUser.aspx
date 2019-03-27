<%@ Page Title="Create Admin Users" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="CreateAdminUser.aspx.cs" Inherits="PHASCO_Shopping.bizpanel.CreateAdminUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 225px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Label ID="lbl_msg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton ID="lnk_btn_createUser" runat="server" 
                    onclick="lnk_btn_createUser_Click">Create User</asp:LinkButton>
&nbsp;|
                <asp:LinkButton ID="lnk_btn_showUser" runat="server" 
                    onclick="lnk_btn_showUser_Click">Show Users</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table class="style1">
                            <tr>
                                <td width="50%">
                                    Name</td>
                                <td>
                                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Lastname</td>
                                <td>
                                    <asp:TextBox ID="txt_lastname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Username</td>
                                <td>
                                    <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Password</td>
                                <td>
                                    <asp:TextBox ID="txt_pass" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style2" colspan="2" width="50%">
                                    <asp:CheckBoxList ID="chk_list_pages" runat="server" Width="100%" 
                                        RepeatColumns="4" RepeatDirection="Horizontal">
                                        <asp:ListItem>Category Manager</asp:ListItem>
                                        <asp:ListItem>Sub Category Manager</asp:ListItem>
                                        <asp:ListItem>Main</asp:ListItem>
                                        <asp:ListItem>Create Admin Users</asp:ListItem>
                                        <asp:ListItem>News</asp:ListItem>
                                        <asp:ListItem>Submit Products</asp:ListItem>
                                        <asp:ListItem>Users</asp:ListItem>
                                        <asp:ListItem>Inquire</asp:ListItem>
                                        <asp:ListItem>Advertisement</asp:ListItem>
                                        <asp:ListItem>ChangePassword</asp:ListItem>
                                        <asp:ListItem>Help</asp:ListItem>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" width="50%">
                                    <asp:Button ID="btn_submit" runat="server" onclick="btn_submit_Click" 
                                        Text="Submit" />
                                    <asp:Button ID="btn_edit" runat="server" onclick="btn_edit_Click" Text="Edit" 
                                        Visible="False" />
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:GridView ID="Gv_adminusers" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="Password" HeaderText="Password" 
                                    SortExpression="Password" />
                                <asp:BoundField DataField="Username" HeaderText="Username" 
                                    SortExpression="Username" />
                                <asp:BoundField DataField="Lastname" HeaderText="Lastname" 
                                    SortExpression="Lastname" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td align="center">
                                                    <asp:LinkButton ID="lnk_btn_Select" runat="server" 
                                                        CommandArgument='<%# Eval("id") %>' oncommand="lnk_btn_Select_Command">Select</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </asp:View>
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
