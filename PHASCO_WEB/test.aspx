<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="PHASCO_WEB.test" %>
<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
 
    <style type='text/css'>
        .UserFreindListTable
        {
            width: 250px;
            direction: rtl;
        }
        .UserFreindListPic
        {
            width: 50%;
            text-align: left;
            vertical-align: top;
            padding: 5px;
        }
        .UserFreindListPic a
        {
            color: #3b5998;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <%--    <asp:GridView ID="GridView2" Font-Names="Verdana" Font-Size="9pt" runat="server"
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                    BorderColor="#507CD1" BorderStyle="Solid">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Literal runat="server" ID="Literial_Id" Text='<%# Eval("smp") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>--%>

<%--
        <asp:ScriptManager ID="sc" runat="server">
        </asp:ScriptManager>--%>
        <asp:UpdatePanel ID="upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                
                <asp:HiddenField ID="HiddenFieldCount" runat="server" />
                <asp:HiddenField ID="HiddenFieldCurrentpage" runat="server" />
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
                    <ItemTemplate>
                        <asp:Literal runat="server" ID="Literial_Ids" Text='<%# Eval("smp") %>' />
                    </ItemTemplate>
                </asp:DataList>
                <asp:Button ID="btnAddOtherRow" Width="24px" ForeColor="White" Height="20px" Font-Bold="true"
                    ToolTip="Add New Row" Font-Size="Medium" BorderStyle="None" BackColor="#507CD1"
                    CommandName="Add" runat="server" Text="+" OnClick="btnAddOtherRow_Click" />
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <img src="images/ajax-loader-paging.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
