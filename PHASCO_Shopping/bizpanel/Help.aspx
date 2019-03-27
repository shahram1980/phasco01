<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" Title="Help" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="PHASCO_Shopping.bizpanel.Help" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <table cellpadding="0" class="style1">
        <tr>
            <td align="center">
            <a href="Help.aspx?status=new">
                Insert New</a> |<a href="Help.aspx?status=List"> List / Edit</a></td>
        </tr>
        <tr>
            <td>
           <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView_List" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="95%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Code" >
                        <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" >
                        <ItemStyle Width="80%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Oprate">
                        <ItemTemplate>
                            <a href='Help.aspx?status=Edit&id=<%# Eval("id") %>'>Edit</a>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="0" class="style1">
                <tr>
                    <td class="style3">
                        Title</td>
                    <td>
                        <asp:TextBox ID="TextBox_title" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Body English</td>
                    <td>
                        <asp:TextBox ID="TextBox_Body_en" runat="server" Height="200px" 
                            TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Body Farsi</td>
                    <td>
                        <asp:TextBox ID="TextBox_Body_fa" runat="server" Height="200px" 
                            TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Body chaina</td>
                    <td>
                        <asp:TextBox ID="TextBox_Body_ch" runat="server" Height="200px" 
                            TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button_Insert" runat="server" onclick="Button_Insert_Click" 
                            Text="Submit" />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView></td>
        </tr>
    </table>
 


</asp:Content>

 <asp:Content ID="Content1" runat="server" contentplaceholderid="head">

     <style type="text/css">
         .style1
         {
             width: 100%;
             border-collapse: collapse;
         }
         .style2
         {
             width: 273px;
         }
         .style3
         {
             width:40%;
         }
     </style>

</asp:Content>


 