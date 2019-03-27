<%@ Page Language="C#" EnableViewState="false" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="CatManager.aspx.cs" Inherits="PHASCO_Shopping.bizpanel.CatManager" title="Category Manager"%>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td align="center" style="width: 10%" valign="top">
                &nbsp;</td>
                        <td align="left" style="width: 90%" valign="top">
                            <asp:Label ID="Lbl_Alarm" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
    <table class="style1" style="width: 100%">
        <tr>
            <td style="width: 20%">
                <asp:LinkButton ID="LinkButton_Create_File" runat="server" 
                    onclick="LinkButton_Create_File_Click">Create File</asp:LinkButton>
            </td>
                        <td style="width: 80%">
                            &nbsp;</td>
                    </tr>
        <tr>
            <td style="width: 20%">
                En-Title:</td>
                        <td style="width: 80%">
                            <asp:TextBox ID="TextBox_En" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Ir-Title :</td>
            <td>
                            <asp:TextBox ID="TextBox_Ir" runat="server" ></asp:TextBox>
                        </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button_Insert" runat="server" Text="Insert New" 
                    onclick="Button_Insert_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
       
                
                <asp:GridView ID="grid_Cats" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False" 
                    Width="100%">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <table  style="width:100%;">
                    <tr>
                        <td style="width: 5%">
                            &nbsp;</td>
                        <td>
                            <%# Eval("Subject_en") %></td>
                        <td class="style2">
                       Sub Category no :   <%# Eval("SubCatNo")%></td>
                        <td> 
                        <a href="CatManager.aspx?status=Edit&id=<%# Eval("id") %>">
                          <img alt="Edit" src="images/edit.png" style="width: 30px; height: 30px"  title="Edit"/>
                             </a>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 5%">
                           
                                                       
                            </td>
                       
                        <td class="style2">
                            Created Date :   <%# Eval("datains")%></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 5%">
                            &nbsp;</td>
                        <td>
                             <%# Eval("Subject_ir") %></td>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                           <a href="CatManagerSub.aspx?subid=<%# Eval("id") %>">
                           <img alt="Subcategories" src="images/sub.png" style="width: 30px; height: 30px"  title="Subcategories"/>
                           </a></td>
                    </tr>
                </table>
                <hr />
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

</asp:Content>

 

 
