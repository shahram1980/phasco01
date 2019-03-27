<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Shopcart.ascx.cs" Inherits="phasco_webproject.UI.Shopcart" %>
<script language="C#" runat="server">
    public string Active_Check(int val) 
    {
        string ret_ = "";
        
        if (val==1)
            ret_ = "<img alt='" + Resources.Resource.user_Card_NotAvliableProducts.ToString() + "'  border='0' src='images/notvalid.gif' width='10' height='12' >";
           return ret_;
    }
</script>

        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td style="width: 100%">
                    <img src="../Images/basket.gif" /></td>
            </tr>
            <tr>
                <td style="width: 100%">
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <asp:Literal ID="Nocart" runat="server" Text="<%$ Resources:Resource, shoping_Cart_Empty %>"></asp:Literal></asp:View>
    <asp:View ID="View2" runat="server">
        <table id="Table9" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td align="center" bgcolor="#f5f5f5" style="height: 13px" valign="top">
                    <asp:DataGrid ID="Grd_Bsk" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyField="AUTOiD"
                        Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                        ShowHeader="False" Width="95%">
                        <EditItemStyle BorderColor="Transparent" Font-Names="Tahoma" Font-Size="X-Small" BackColor="#2461BF" />
                        <HeaderStyle BackColor="#507CD1" BorderColor="White" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align='<asp:Literal ID="align_101" Text="<%$ Resources:Resource, align %>" runat="server" />'
                                                dir='<asp:Literal ID="dir_101" Text="<%$ Resources:Resource, dir %>" runat="server" />'>
                                                <a href='products.aspx?Deid=<%#Eval("pid")%>'>
                                                    <%#Eval("Product_Namme")%>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="Order_No" HeaderText="تعداد"></asp:BoundColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <%# Active_Check(Convert.ToInt32(Eval("Mode_Err")))%>
                                    <asp:ImageButton ID="ImageButton_Down" runat="server" AlternateText="remove one"
                                        CausesValidation="False" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
                                        CommandName="ImageButton_Down_Command" ImageUrl="~/images/DownLevel.gif" OnCommand="ImageButton_Down_Command" />
                                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="add one" CausesValidation="False"
                                        CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>' CommandName="ImageButton_Up_Command"
                                        ImageUrl="~/images/LevelUp.gif" OnCommand="ImageButton_Up_Command" />
                                    <asp:ImageButton ID="ImageButton2" runat="server" AlternateText="Remove product from card"
                                        CausesValidation="False" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
                                        CommandName="ImageButton_Remove_Command" ImageUrl="~/images/removeLevel.gif"
                                        OnCommand="ImageButton_Remove_Command" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <AlternatingItemStyle BackColor="White" CssClass="grid1" />
                        <ItemStyle BackColor="#EFF3FB" />
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    <table id="Table6" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"
                        width="100%">
                        <tr>
                            <td align="center" background="../images/bgcard.gif" colspan="2" height="10">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="menu_card_Back" colspan="2" style="height: 15px">
                                <span style="color: #000000"><strong><span lang="fa" style="color: #000000">&nbsp;<asp:Label
                                    ID="Label1" runat="server" Text="جمع کل">
						</asp:Label>&nbsp; &nbsp;  
                                <asp:Label ID="lbl_Total_Price" runat="server" CssClass="menu_card_Back" Font-Bold="True"></asp:Label>
                                ریال</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" valign=middle style="height: 35px">
                                <asp:ImageButton ID="ImageButton_FinalBuy" runat="server" CausesValidation="False"
                                    ImageUrl="<%$ Resources:Resource, User_card_CheckOut %>" OnClick="ImageButton_FinalBuy_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>
</td>
            </tr>
        </table>

 
 