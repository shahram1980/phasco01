<%@ Page Title="Advertisement" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="advertisement.aspx.cs" Inherits="PHASCO_Shopping.bizpanel.advertisement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
        <tr>
            <td align="center" style="padding: 5px;">
                &nbsp;</td>
        </tr>
    </table>
    <table dir="ltr" style="width: 80%">
        </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style2">
        <tr>
            <td align="center">
                <asp:Label ID="Lbl_ALARM" runat="server" Font-Names="Tahoma"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton ID="link_btn_show" runat="server" OnClick="link_btn_show_Click">Edit</asp:LinkButton>
            &nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="link_btn_Insert" runat="server" 
                    onclick="link_btn_Insert_Click">Add Advertisement</asp:LinkButton>
            </td>
        </tr>
    </table>
    <br />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table dir="rtl" style="width: 100%" border="0" cellpadding="1" cellspacing="1">
                <tr>
                    <td align="left" class="style1" dir="rtl" valign="top">
                        <asp:FileUpload ID="FileUpload1" runat="server" Font-Names="Tahoma" 
                            Font-Size="XX-Small" />
                    </td>
                    <td align="left" style="width: 80%;" valign="top">
                        Picture&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style1" dir="rtl" valign="top">
                        &nbsp;&nbsp;</td>
                    <td align="left" style="width: 80%;" valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" class="style1" dir="rtl" valign="top">
                        <asp:DropDownList ID="ddl_position" runat="server" Font-Names="Tahoma" 
                            Font-Size="XX-Small">
                            <asp:ListItem Value="Top">Top</asp:ListItem>
                            <asp:ListItem Value="Left">Left</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 80%" valign="top">
                        &nbsp;: Position</td>
                </tr>
                <tr>
                    <td align="left" class="style1" dir="rtl" valign="top">
                        &nbsp;&nbsp;</td>
                    <td align="left" style="width: 80%" valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" class="style1" dir="ltr" valign="top">
                        <asp:TextBox ID="txt_url" runat="server" Font-Names="Tahoma" 
                            Font-Size="XX-Small" Width="40%">http://www.</asp:TextBox>
                    </td>
                    <td align="left" dir="ltr" style="width: 80%" valign="top">
                        URL:
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2" style="width: 100%; height: 11px" valign="top">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <img src="../../Images/loading.jpg" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="left" dir="ltr" style="width: 50%" valign="top">
                                            <asp:RadioButtonList ID="rd_btn_mode" runat="server" AutoPostBack="True" 
                                                Font-Names="Tahoma" Font-Size="XX-Small" 
                                                OnSelectedIndexChanged="rd_btn_mode_SelectedIndexChanged" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0">Date</asp:ListItem>
                                                <asp:ListItem Value="1">Click</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="3">Count</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td align="left" style="width: 50%" valign="top">
                                            &nbsp;: Mode</td>
                                    </tr>
                                    <tr>
                                        <td align="left" dir="ltr" style="width: 50%" valign="top">
                                            &nbsp;&nbsp;</td>
                                        <td align="left" style="width: 50%" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left" dir="rtl" style="width: 50%" valign="top">
                                            <asp:TextBox ID="txt_count" runat="server" Font-Names="Tahoma" 
                                                Font-Size="XX-Small">1</asp:TextBox>
                                        </td>
                                        <td align="left" style="width: 80%" valign="top">
                                            &nbsp;: Count
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" dir="rtl" style="width: 50%" valign="top">
                                            &nbsp;&nbsp;</td>
                                        <td align="left" style="width: 80%" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left" dir="rtl" style="width: 50%" valign="top">
                                            <asp:TextBox ID="txt_pagename" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left" style="width: 80%" valign="top">
                                            &nbsp;: Page Name</td>
                                    </tr>
                                    <tr>
                                        <td align="left" dir="rtl" style="width: 50%" valign="top">
                                            &nbsp;&nbsp;</td>
                                        <td align="left" style="width: 80%" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left" dir="rtl" style="width: 50%" valign="top">
                                            <asp:Label ID="txt_date" runat="server"></asp:Label>
                                            <br />
                                            <asp:Calendar ID="Calendar_Date" runat="server" Enabled="False" 
                                                OnSelectionChanged="Calendar_Date_SelectionChanged"></asp:Calendar>
                                        </td>
                                        <td align="left" style="width: 80%" valign="top">
                                            : Date</td>
                                    </tr>
                                    <tr>
                                        <td align="left" dir="rtl" style="width: 50%" valign="top">
                                            &nbsp;&nbsp;</td>
                                        <td align="left" style="width: 80%" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style1" dir="rtl" valign="top" width="50%">
                        <asp:TextBox ID="txt_desc" runat="server" Font-Names="Tahoma" 
                            Font-Size="XX-Small" Height="100px" TextMode="MultiLine" Width="50%"></asp:TextBox>
                    </td>
                    <td align="left" style="width: 50%" valign="top">
                        &nbsp;: Description</td>
                </tr>
                <tr>
                    <td align="left" class="style1" dir="rtl" valign="top" width="50%">
                        &nbsp;&nbsp;</td>
                    <td align="left" style="width: 50%" valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style1" colspan="2" dir="rtl" valign="top">
                        <asp:Button ID="btn_ok" runat="server" Font-Names="Tahoma" Font-Size="X-Small" 
                            OnClick="btn_ok_Click" Text="Submit" />
                        <asp:Button ID="btn_edit" runat="server" Font-Names="Tahoma" 
                            Font-Size="X-Small" Text="Edit" onclick="btn_edit_Click" Visible="False" />
                    </td>
                </tr>
            </table>
            &nbsp;
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table style="width: 100%">
                <tr>
                    <td align="right" dir="rtl" style="width: 50%; height: 24px;">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [Tbl_Advertise]"></asp:SqlDataSource>
                    </td>
                    <td align="left" dir="rtl" style="width: 50%; height: 24px;">
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:DataList ID="DataList1" runat="server" BackColor="White" 
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                DataKeyField="id" DataSourceID="SqlDataSource1" GridLines="Vertical" 
                OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="1" 
                RepeatDirection="Horizontal" Width="100%">
                <ItemTemplate>
                    <br />
                    <a>
                    <br />
                    </a>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="center" style="width: 33%" valign="top">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            <asp:LinkButton ID="edit" runat="server" 
                                                CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                                OnCommand="edit_Command" Text="Edit"></asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            <asp:LinkButton ID="link_btn_delete" runat="server" 
                                                CommandArgument='<%# Eval("id", "{0}") %>' ForeColor="Red" 
                                                OnClientClick="return confirm('Are you Sure to Delete? ');" 
                                                OnCommand="link_btn_delete_Command">Return</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" style="width: 33%" valign="top">
                                <asp:ImageButton ID="IMG1" runat="server" 
                                    CommandArgument='<%# Eval("id", "{0}") %>' 
                                    ImageUrl='<%# ResolveUrl("~/adv/" + DataBinder.Eval(Container.DataItem, "name")) %>' 
                                    OnCommand="IMG1_Command1" />
                            </td>
                            <td align="center" style="width: 33%" valign="top">
                                <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <AlternatingItemStyle BackColor="Gainsboro" />
                <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </asp:View>
    </asp:MultiView>
</asp:Content>
