<%@ Page Language="C#" title="Sub Category Manager Level3" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="CatManagerSub3.aspx.cs" Inherits="BiztBiz.bizpanel.CatManagerSub3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td align="center" style="width: 10%" valign="top">
                &nbsp;
            </td>
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
                You are here</td>
            <td style="width: 80%">
                <img alt="Up" src="images/Up.png" style="width: 30px; height: 30px" /><asp:Label ID="Label_Nav" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                En-Title:
            </td>
            <td style="width: 80%">
                <asp:TextBox ID="TextBox_En" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Ch-Title:
            </td>
            <td>
                <asp:TextBox ID="TextBox_Ch" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Ir-Title :
            </td>
            <td>
                <asp:TextBox ID="TextBox_Ir" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="Button_Insert" runat="server" Text="Insert New" OnClick="Button_Insert_Click" />
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
                <asp:GridView ID="GridView_cats" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" ShowHeader="False" Width="100%">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 5%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <%# Eval("Subject_en") %>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <a href="CatManagerSub3.aspx?status=Edit&id=<%# Eval("id") %>&subid=<%# Eval("subid") %>">
                                            <img alt="Edit" src="images/edit.png" style="width: 30px; height: 30px"  title="Edit"/>
                                            </a>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 5%">
                                        </td>
                                        <td>
                                            <%# Eval("Subject_ch") %>
                                        </td>
                                        <td class="style2">
                                            Created Date :
                                            <%# Eval("datains")%>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 5%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <%# Eval("Subject_ir") %>
                                        </td>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td>
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
 <asp:Content ID="Content2" runat="server" contentplaceholderid="head">

     <style type="text/css">
         .style1
         {
             height: 25px;
         }
         .style2
         {
             height: 1px;
         }
         .style3
         {
             height: 47px;
         }
         .style4
         {
             width: 20%;
             height: 29px;
         }
         .style5
         {
             width: 80%;
             height: 29px;
         }
     </style>

</asp:Content>

 