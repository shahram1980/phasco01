<%@ Page Language="C#" MasterPageFile="~/Template/Phasco_Eshop.Master" AutoEventWireup="true"
    Codebehind="flashshop.aspx.cs" Inherits="PHASCO_WEB.flashshop" %>

<asp:Content ContentPlaceHolderID="Plc" runat="server">
    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" style="width: 100%">
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%" dir="rtl">
                <asp:GridView ID="GridView_Pro" runat="server" AutoGenerateColumns="False"
                    Width="70%">
                    <Columns>
                        <asp:TemplateField HeaderText="تعداد">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox_q" runat="server" Width="20px"></asp:TextBox> 
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="AutoId" HeaderText="کد" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="قیمت (ریال)">
                            <ItemTemplate>
                                <%# Eval("Price")%>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام محصول">
                            <ItemTemplate>
                                <a class="menu" href="products.aspx?Deid=<%# Eval("AutoId")%>" title="<%# Eval("title")%>">
                                    <%# Eval("title")%>
                                </a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#CEBA99" />
                    <AlternatingRowStyle BackColor="#E2D3BB" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl" style="width: 100%">
                <asp:Button ID="Button_Addtoshop" runat="server" Text="  اضافه به سبد  " OnClick="Button_Addtoshop_Click" /></td>
        </tr>
    </table>
</asp:Content>
