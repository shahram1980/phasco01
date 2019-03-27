<%@ Page Title="Submit Products" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="SubmitProducts.aspx.cs" Inherits="PHASCO_Shopping.bizpanel.SubmitProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table align="center" class="style1">
        <tr>
            <td align="center" style="width: 100%" width="50%">
                <asp:Label ID="lbl_msg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%" width="50%">
                <asp:LinkButton ID="lnk_btn_DeniedProduct" runat="server" 
                    onclick="lnk_btn_DeniedProduct_Click">Denied Products</asp:LinkButton>
&nbsp;/
                <asp:LinkButton ID="lnk_btn_sendProducts" runat="server" 
                    onclick="lnk_btn_sendProducts_Click">Send Products</asp:LinkButton>
            &nbsp;/
                <asp:LinkButton ID="lnk_btn_search" runat="server" 
                    onclick="lnk_btn_search_Click">Search</asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1" dir="rtl">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gv_products" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" 
                            onselectedindexchanged="gv_products_SelectedIndexChanged" Width="100%" 
                            CellPadding="4" ForeColor="#333333" GridLines="None">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_btn_select" runat="server" 
                                            CommandArgument='<%# Eval("id") %>' oncommand="lnk_btn_select_Command">Select</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Produc_Name" HeaderText="Product Name" 
                                    SortExpression="Produc_Name" />
                                <asp:BoundField DataField="Send_Date" HeaderText="Send Date" 
                                    SortExpression="Send_Date" />
                                <asp:BoundField DataField="Model_Number" HeaderText="Model Number" 
                                    SortExpression="Model_Number" />
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
        <asp:View ID="View3" runat="server">
            <table class="style1">
                <tr>
                    <td align="center" class="td_register" colspan="2" dir="rtl">
                        <asp:Label ID="Label_Title" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        <asp:Image ID="Image_Product" runat="server" EnableViewState="false" 
                            Width="200px" />
                    </td>
                    <td class="td_register_de">
                        <b>
                        <asp:Literal ID="Literal14" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Specialty_of_Product %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Specialty_of_Product" runat="server" 
                            EnableViewState="false"></asp:Label>
                        &nbsp;<br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal1" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Description %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Description" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal2" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Model_Number %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Model_Number" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal3" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Product_Brand %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Product_Brand" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal4" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Place_of_Origin %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Place_of_Origin" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal5" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Supply_Ability %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Supply_Ability" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal6" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Minimum_Order %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Minimum_Order" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal7" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Delivery_Time %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Delivery_Time" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal8" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Terms_of_Payment %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Terms_of_Payment" runat="server" EnableViewState="false"></asp:Label>
                        <br />
                        <br />
                        <b>
                        <asp:Literal ID="Literal9" runat="server" EnableViewState="false" 
                            Text="<%$ Resources:Resource, Packaging %>" />
                        </b>
                        <br />
                        <asp:Label ID="Label_Packaging" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_register" colspan="2">
                        <asp:TextBox ID="txt_desc" runat="server" Height="170px" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" dir="rtl">
                        <asp:Button ID="btn_denied" runat="server" onclick="btn_denied_Click" 
                            Text="Denied" />
                        &nbsp;|
                        <asp:Button ID="btn_submit" runat="server" onclick="btn_submit_Click" 
                            Text="Submit" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table align="center" class="style1">
                <tr>
                    <td align="center" dir="rtl" width="100%">
                        <asp:GridView ID="gv_Deniedproducts" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" onselectedindexchanged="gv_products_SelectedIndexChanged" 
                            Width="100%">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_btn_select_denied_product" runat="server" 
                                            CommandArgument='<%# Eval("id") %>' 
                                            oncommand="lnk_btn_select_denied_product_Command">Select</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Produc_Name" HeaderText="Product Name" 
                                    SortExpression="Produc_Name" />
                                <asp:BoundField DataField="Send_Date" HeaderText="Send Date" 
                                    SortExpression="Send_Date" />
                                <asp:BoundField DataField="Model_Number" HeaderText="Model Number" 
                                    SortExpression="Model_Number" />
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
        <asp:View ID="View5" runat="server">
            <table class="style1">
                <tr>
                    <td align="right" width="50%">
                        Product Name</td>
                    <td>
                        <asp:TextBox ID="txt_search_productName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="50%">
                        Product Id</td>
                    <td>
                        <asp:TextBox ID="txt_search_productId" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="50%">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btn_search" runat="server" onclick="btn_search_Click" 
                            Text="Search" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" dir="rtl" width="100%">
                        <asp:GridView ID="gv_search" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" onselectedindexchanged="gv_products_SelectedIndexChanged" 
                            Width="100%">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_btn_select_denied_product0" runat="server" 
                                            CommandArgument='<%# Eval("id") %>' 
                                            oncommand="lnk_btn_select_denied_product_Command">Select</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Produc_Name" HeaderText="Product Name" 
                                    SortExpression="Produc_Name" />
                                <asp:BoundField DataField="Send_Date" HeaderText="Send Date" 
                                    SortExpression="Send_Date" />
                                <asp:BoundField DataField="Model_Number" HeaderText="Model Number" 
                                    SortExpression="Model_Number" />
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
    </asp:MultiView>
    <table class="style1">
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" dir="rtl">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
