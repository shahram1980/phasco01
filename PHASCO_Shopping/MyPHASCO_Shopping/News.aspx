<%@ Page Language="C#"  MasterPageFile="~/Template/Office.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.News1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="C#" runat="server">
        
        public string set_Lang(string lang)
        {
            if (lang == "Persian (Iran)") return "فارسی";
            if (lang == "English (United States)") return "انگليسی";
            return "زبان ناشناخته";
        }
    </script>
    <div style="text-align: right">
        <table class="direction" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td dir="rtl" style="width: 100%">

<table border="0" width="100%" class="direction" >
	<tr>
		<td width="10%"></td>
		<td width="90%" class="direction_Align"><asp:Label ID="Lbl_ALARM" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td width="10%"> <img src="../images/plusicon.jpg" /></td>
		<td width="90%" class="direction_Align"><a href="News.aspx?statue=new">
                    <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, Insert_New %>" />
                    </a></td>
	</tr>
	<tr>
		<td width="10%"><img src="../images/reload.jpg" /></td>
		<td width="90%" class="direction_Align"> <a href="News.aspx?statue=edit">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Edit %>" />
                    </a></td>
	</tr>
</table>
<hr style="background:#ccc"/>
<br />
  
                </td>
            </tr>
            </table>
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="direction_Align" width="100%" >
   
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource,  Subject %>" />
                    </td>
                    <td class="td_register_de">
                        <asp:TextBox ID="Title" runat="server" Font-Names="Rod"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource,  News %>" />
                    </td>
                    <td class="td_register_de">


                         
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                       <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px" 
                                Width="95%">
                        </FCKeditorV2:FCKeditor></td>
                </tr>
                <tr>
                    <td class="td_register">
                        &nbsp;
                    </td>
                    <td class="td_register_de">
                        <asp:Button ID="Button_News_insert" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_News_insert_Click" Text="<%$ Resources:Resource,  Submit %>"
                            Height="20px" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table align="center" cellspacing="1" class="style1">
                <tr>
                    <td align="center">
                        <font face="Tahoma" size="2">
                            <asp:DataGrid ID="Grid_editList" runat="Server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" GridLines="None" PagerStyle-BorderColor="beige" PagerStyle-Mode="NumericPages"
                                PageSize="20" ShowHeader="False" Width="100%">
                                <Columns>
                                    <asp:TemplateColumn HeaderText="Column 1">
                                        <ItemTemplate>
                                            <table id="table1" border="0" dir="rtl" style="border-collapse: collapse" width="95%">
                                                <tr>
                                                    <td class="td_register">
                                                        <a href="News.aspx?statue=editapp&id=<%# Eval("id")%>">
                                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, Edit %>" />
                                                        </a>&nbsp;|&nbsp; <a href="News.aspx?statue=delete&id=<%# Eval("id")%>" onclick="return confirm('َAre You sure to delete ? ');">
                                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, delete %>" />
                                                        </a>
                                                    </td>
                                                    <td class="td_register_de">
                                                        <%# Eval("title")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" ForeColor="White"
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#999999" />
                                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            </asp:DataGrid>
                        </font>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_Nazar_Id" runat="server" />
    <asp:HiddenField ID="HiddenField_Edit_Id" runat="server" />
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</asp:Content>