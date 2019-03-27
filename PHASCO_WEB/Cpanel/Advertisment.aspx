<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" Codebehind="Advertisment.aspx.cs" Inherits="phasco.Cpanel.Advertisment" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 80%" dir="ltr">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lbl_info" runat="server" BackColor="#FFFFFF" ForeColor="#009999" Width="100%"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 50%; height: 21px;" dir="ltr">
                </td>
            <td align="right">
                <asp:LinkButton ID="link_btn_show" runat="server" OnClick="link_btn_show_Click">حذف و ويرايش</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="right" dir="ltr" style="width: 50%; height: 21px">
            </td>
            <td align="right">
                <asp:LinkButton ID="link_btn_Insert" runat="server" OnClick="link_btn_Insert_Click">اضافه کردن</asp:LinkButton></td>
        </tr>
    </table>
    <br />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table style="width: 100%" dir="rtl">
                <tr>
                    <td style="width: 7%; height: 26px" align="left">
                        تصوير :</td>
                    <td style="width: 35%; height: 26px" align="right">
                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                    <td style="width: 5%; height: 26px" align="left">
                        آدرس:</td>
                    <td style="width: 50%; height: 26px" align="right">
                        <asp:TextBox ID="txt_url" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 7%; height: 11px;" align="left">
                        تاریخ :</td>
                    <td style="width: 35%; height: 11px;" align="right">
                        <asp:TextBox ID="txt_date" runat="server"></asp:TextBox></td>
                    <td style="width: 5%; height: 11px;" align="left">
                        حالت:</td>
                    <td style="width: 50%; height: 11px;" align="right">
                        <asp:RadioButtonList ID="rd_btn_mode" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">تاريخ</asp:ListItem>
                            <asp:ListItem Value="1">کليک</asp:ListItem>
                            <asp:ListItem Value="3">بارشدن</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td style="width: 7%" align="left">
                        شماره :</td>
                    <td style="width: 35%" align="right">
                        <asp:TextBox ID="txt_count" runat="server"></asp:TextBox></td>
                    <td style="width: 5%" align="left">
                        زبان :</td>
                    <td style="width: 50%" align="right" dir="rtl">
                        <asp:DropDownList ID="ddl_language" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                            <asp:ListItem Value="-1">---انتخاب زبان---</asp:ListItem>
                            <asp:ListItem Value="1">فارسی</asp:ListItem>
                            <asp:ListItem Value="2">انگلیسی</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 7%" align="left">
                        توضیحات:</td>
                    <td style="width: 35%" align="right">
                        <asp:TextBox ID="txt_desc" runat="server" Height="176px" TextMode="MultiLine" Width="280px"></asp:TextBox></td>
                    <td style="width: 5%" align="left">
                    </td>
                    <td style="width: 50%" align="right">
                    </td>
                </tr>
                <tr>
                    <td style="width: 7%">
                    </td>
                    <td style="width: 35%">
                        <asp:Button ID="btn_ok" runat="server" OnClick="btn_ok_Click" Text="ثبت شود" Width="37px" Font-Names="Tahoma" Font-Size="X-Small" />
                        <asp:Button ID="btn_Cancel" runat="server" Text="انصراف" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                    <td style="width: 5%">
                        </td>
                    <td style="width: 50%">
                        </td>
                </tr>
            </table>
            &nbsp;
        </asp:View>
        <asp:View ID="View2" runat="server">
            &nbsp;<table style="width: 100%">
                <tr>
                    <td style="width: 50%" align="right" dir="rtl">
                        <asp:DropDownList ID="DropDownList_Language" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Language_SelectedIndexChanged" Font-Names="Tahoma" Font-Size="X-Small">
                            <asp:ListItem Value="-1">---انتخاب زبان---</asp:ListItem>
                            <asp:ListItem Value="1">فارسی</asp:ListItem>
                            <asp:ListItem Value="2">انگليسي</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="width: 50%" align="left" dir="rtl">
                        زبان :</td>
                </tr>
            </table>
            <br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
            DataSourceID="SqlDataSource1"
                Width="100%" RepeatColumns="1" RepeatDirection="Horizontal" 
                OnSelectedIndexChanged="DataList1_SelectedIndexChanged" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <ItemTemplate>
                    <br />
                    <a>
                        <br />
                    </a>&nbsp;&nbsp;
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="center" style="width: 33%" valign="top">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 100%">
                    <asp:LinkButton ID="edit" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                        Text="ويرايش" OnCommand="edit_Command"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            <asp:LinkButton ID="link_btn_delete" runat="server" CommandArgument='<%# Eval("id", "{0}") %>'
                        OnCommand="link_btn_delete_Command" ForeColor="Red">حذف</asp:LinkButton></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" style="width: 33%" valign="top">
                        <asp:ImageButton runat="server" ID="IMG1" CommandArgument='<%# Eval("id", "{0}") %>'
                            OnCommand="IMG1_Command" ImageUrl='<%# ResolveUrl("~/phascoupfile/adver-img/" + DataBinder.Eval(Container.DataItem, "name")) %> ' /></td>
                            <td align="center" style="width: 33%" valign="top">
                    <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>'></asp:Label></td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <AlternatingItemStyle BackColor="#DCDCDC" />
                <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:phasco.Properties.Settings.Phasco_NetConnectionString %>"
                SelectCommand="select * from TAdvertise where (mode=0 and EndDate<=Getdate() and Language=@language) or (mode=1 and [load]>0 and [load]<=hit and Language=@language) or (mode=2 and [load]>0 and [load]<=hit and Language=@language)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList_Language" Name="language" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
