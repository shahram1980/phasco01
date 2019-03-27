<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" EnableViewState="false" AutoEventWireup="true" CodeBehind="CatManagerSub.aspx.cs" Inherits="BiztBiz.bizpanel.CatManagerSub" title="Sub Category Manager"%>
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
                &nbsp;</td>
                        <td style="width: 80%">
                <asp:LinkButton ID="LinkButton_Create_File" runat="server" 
                    onclick="LinkButton_Create_File_Click">Create File</asp:LinkButton>
                                                                            </td>
                    </tr>
        <tr>
            <td style="width: 20%">
                &nbsp;</td>
                        <td style="width: 80%">
                            <img alt="Up" src="images/Up.png" style="width: 30px; height: 30px" /><a href=  "CatManager.aspx">To First Level</a></td>
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
                            Ch-Title:</td>
                        <td>
                            <asp:TextBox ID="TextBox_Ch" runat="server" ></asp:TextBox>
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
            <td class="style3">
                </td>
            <td class="style3">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView_cats" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False" 
                    Width="100%">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table  style="width:100%;">
                    <tr>
                        <td style="width: 5%">
                            &nbsp;</td>
                        <td>
                            <%# Eval("Subject_en") %></td>
                        <td>
                      </td>
                        <td> 
                        <a href="CatManagerSub.aspx?status=Edit&id=<%# Eval("id") %>&subid=<%# Eval("subid") %>">
                        <img alt="Edit" src="images/edit.png" style="width: 30px; height: 30px"  title="Edit"/>
                             </a>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 5%">
                           
                                                       
                            </td>
                        <td>
                             <%# Eval("Subject_ch") %></td>
                        <td  >
                            Created Date :   <%# Eval("datains")%></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 5%">
                            &nbsp;</td>
                        <td>
                             <%# Eval("Subject_ir") %></td>
                        <td >
                            &nbsp;</td>
                        <td>
                           <a href="CatManagerSub3.aspx?subid=<%# Eval("id") %>">
                            <img alt="Subcategories" src="images/sub.png" style="width: 30px; height: 30px"  title="Subcategories"/>
                           
                           </a>
                         
                         </td>
                    </tr>
                </table>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                
                
            </td>
        </tr>
    </table>

</asp:Content>

 <asp:Content ID="Content1" runat="server" contentplaceholderid="head">

     <style type="text/css">
         .style1
         {
             height: 25px;
         }
         .style2
         {
             height: 30px;
         }
         .style3
         {
             height: 37px;
         }
     </style>

</asp:Content>


 