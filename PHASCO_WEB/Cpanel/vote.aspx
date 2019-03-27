<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="vote.aspx.cs" Inherits="phasco_webproject.Cpanel.vote" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td style="width: 100%" valign="top">
                    <asp:Label ID="Label_Alarm" runat="server" Text="Label"></asp:Label></TD>
            </tr>
            <tr>
                <td style="width: 100%;direction:rtl;" valign="top" >
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;direction:ltr;" >
                        <tr>
                            <td style="width: 80%" align="right">
                                <asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                                    Font-Size="X-Small" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
                            <asp:ListItem Value="-1">---انتخاب زبان---</asp:ListItem>
                            <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                            <asp:ListItem Value="English (United States)">انگلیسی</asp:ListItem>
                        </asp:DropDownList></td>
                            <td style="width: 20%" align="left">
                                زبان</td>
                        </tr>
                        <tr>
                            <td style="width: 80%" align="right">
                                <asp:TextBox ID="Txt_Question" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                    TextMode="MultiLine" Width="90%"></asp:TextBox></td>
                            <td style="width: 20%" align="left">
                                        سوال نظر سنجی 
                            <EditItemStyle Font-Names="Tahoma" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" />
                   <EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /> <EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" />
                            <EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" />
                            <EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" />
                            <EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" /><EDITITEMSTYLE Font-Names="Tahoma" /><HEADERSTYLE ForeColor="White" Font-Bold="True" BackColor="Black" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 80%; height: 19px">
                                <asp:Button ID="Button_Insert_q" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                    OnClick="Button_Insert_q_Click" Text="ثبت شود" /></td>
                            <td align="left" style="width: 20%; height: 19px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;direction:ltr;">
                    <tr>
                        <td style="width: 80%" align="right">
                        </td>
                        <td style="width: 20%" align="left">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 80%" align="right">
                            <asp:TextBox ID="Txt_Item" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="90%"></asp:TextBox></td>
                        <td style="width: 20%" align="left">
                            پاسخ</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 80%; height: 19px">
                            <asp:Button ID="Button_Items" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                OnClick="Button_Items_Click" Text="ثبت شود" /></td>
                        <td align="left" style="width: 20%; height: 19px">
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%" valign="top">
                    <asp:DataGrid ID="Grd_Tax" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyField="Id"
                        Font-Names="Tahoma" Font-Size="X-Small" GridLines="Horizontal" OnCancelCommand="DataCancel"
                        OnDeleteCommand="Grd_Tax_DeleteCommand" OnEditCommand="DataEdit" OnUpdateCommand="DataUpdate"
                        Width="100%">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" Mode="NumericPages" />
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <Columns>
                                <asp:ButtonColumn CommandName="Delete" HeaderText="حذف" Text="حذف"></asp:ButtonColumn>
<asp:EditCommandColumn HeaderText="ويرايش" CancelText="انصراف" UpdateText="ذخيره" EditText="ويرايش"></asp:EditCommandColumn>
<asp:BoundColumn DataField="item" HeaderText="پاسخ"></asp:BoundColumn>
                                <asp:BoundColumn DataField="vote" HeaderText="تعداد نظرات" ReadOnly="True"></asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid></td>
            </tr>
            <tr>
                <td style="width: 100%" valign="top">
                </td>
            </tr>
        </table>
    </div>
        
</asp:Content>
 