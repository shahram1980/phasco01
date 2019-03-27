<%@ Page Title="Users" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="Users.aspx.cs" Inherits="BiztBiz.bizpanel.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('lightStyle.css');
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="style1">
        <tr>
            <td align="center">
                <asp:Label ID="lbl_msg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl">
                تعداد کاربران سایت&nbsp; :&nbsp; &nbsp; <asp:Label ID="Label_Count_User" 
                    runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton ID="lnk_btn_allUsers" runat="server" OnClick="lnk_btn_allUsers_Click">All Users</asp:LinkButton>
                &nbsp; |&nbsp;
                <asp:LinkButton ID="lnk_btn_search" runat="server" OnClick="lnk_btn_search_Click">Search</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table class="style1">
                            <tr>
                                <td align="center" colspan="2" dir="ltr">
                                    <%--<Pager:PagerV2_8 ID="pager1" PageSize="50" OnCommand="pager_Command" GenerateGoToSection="true"
                                        GenerateHiddenHyperlinks="true" runat="server" />--%>
                                    <asp:GridView ID="Gv_users" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                        CellPadding="5" ForeColor="#333333" GridLines="None" Width="500" 
                                        PageSize="200">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="Uid" HeaderText="Username" SortExpression="Uid" />
                                            <asp:BoundField DataField="Family_Name" HeaderText="Family" SortExpression="Family_Name" />
                                            <asp:BoundField DataField="Given_Name" HeaderText="Name" SortExpression="Given_Name" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                  <a href="Users.aspx?UserId=<%# Eval("id") %>">Detail</a>
                                         <%--           <asp:LinkButton ID="lnk_btn_UserSelect" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        OnCommand="lnk_btn_UserSelect_Command">Detail</asp:LinkButton>--%>
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table class="style1">
                            <tr>
                                <td align="left" width="50%">
                                    Name
                                </td>
                                <td align="left" width="50%">
                                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Lastname
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_lastname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Username
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_Username" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Password
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_pass" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    BusinessLocation
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_buss_Location" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Company
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_company" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Industry
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_industry" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <%-- <tr>
                                <td width="50%">
                                    Sex
                                </td>
                                <td width="50%">
                                    <asp:DropDownList ID="drp_sex" runat="server">
                                        <asp:ListItem Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="2">Femail</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>--%>
                            <tr>
                                <td width="50%">
                                    Tel_C_Code
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_c_code" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Tel_A_Code
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_a_code" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Tel_A_Number
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_a_num" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Mobile
                                </td>
                                <td width="50%">
                                    <asp:TextBox ID="txt_mobile" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    User_Level
                                </td>
                                <td width="50%">
                                    <asp:DropDownList ID="drp_userlevel" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Image ID="img_userLevel" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    DateIns
                                </td>
                                <td width="50%">
                                    <asp:Label ID="lbl_dateins" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    LastLogin
                                </td>
                                <td width="50%">
                                    <asp:Label ID="lbl_LastLogin" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    ActiveMode
                                </td>
                                <td width="50%">
                                    <asp:DropDownList ID="drp_ActiveMode" runat="server">
                                        <asp:ListItem Value="0">NotSelect</asp:ListItem>
                                        <asp:ListItem Value="1">Avtive</asp:ListItem>
                                        <asp:ListItem Value="2">Deactive</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    User Status
                                </td>
                                <td width="50%">
                                    <asp:DropDownList ID="drp_userstatus" runat="server">
                                        <asp:ListItem Value="0">UnKnown</asp:ListItem>
                                        <asp:ListItem Value="1">Supplier</asp:ListItem>
                                        <asp:ListItem Value="2">Buyer</asp:ListItem>
                                        <asp:ListItem Value="3">Both</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    User Role
                                </td>
                                <td width="50%">
                                    <asp:DropDownList ID="drp_userRole" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    &nbsp;
                                </td>
                                <td width="50%">
                                    <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="submit" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <br />
                    <asp:View ID="View3" runat="server">
                        <table class="style1">
                            <tr>
                                <td width="50%">
                                    Lastname
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_search_lastname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Username
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_search_username" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btn_search" runat="server" OnClick="btn_search_Click" Text="Search" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" width="50%">
                                    <asp:GridView ID="Gv_Search" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                                        PageSize="200">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="DateIns" HeaderText="Date" SortExpression="DateIns" />
                                            <asp:BoundField DataField="Uid" HeaderText="Username" SortExpression="Uid" />
                                            <asp:BoundField DataField="Family_Name" HeaderText="Family" SortExpression="Family_Name" />
                                            <asp:BoundField DataField="Given_Name" HeaderText="Name" SortExpression="Given_Name" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                <a href="Users.aspx?UserId=<%# Eval("id") %>">Detail</a>
                                                  <%--  <asp:LinkButton ID="lnk_btn_UserSelect0" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        OnCommand="lnk_btn_UserSelect_Command">Detail</asp:LinkButton>--%>
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
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <br />
                    <br />
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
