<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Product_addtocard.ascx.cs" Inherits="phasco_webproject.UI.Product_addtocard" %>
       <asp:Panel ID="Panle_Basket" runat="server"  Width="95%">
            <br />
            <br />
            <table id="table3" border="0" dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" ID="direc" runat="server" />' style="border-collapse: collapse" width="100%">
                <tr>
                    <td dir='<asp:Literal ID="align007" Text="<%$ Resources:Resource, Align %>" runat="server" />' style="height: 52px" width="50%">
                    </td>
                    <td align="center" style="height: 52px" width="35%">
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Eshop_Q"
                                        ErrorMessage="Please Insert Number    " MaximumValue="999999999999" MinimumValue="0"></asp:RangeValidator>
                        <asp:Label ID="lbl_Qty" Text="<%$ Resources:Resource, qty %>" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:Label>
                                    <asp:TextBox ID="Eshop_Q" runat="server" Width="22px">1</asp:TextBox>
                                    &nbsp;&nbsp;</td>
                    <td dir='<asp:Literal ID="align008" Text="<%$ Resources:Resource, Align %>" runat="server" />' style="height: 52px" width="15%">
                        <asp:ImageButton ID="ImageButton_Buy" runat="server" ImageUrl="~/images/button_in_cart.gif"
                                        OnClick="ImageButton_Buy_Click" /></td>
                </tr>
            </table>
        </asp:Panel>