<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs" Inherits="AdvertisementManagement.Admin.Reports" %>

<%@ Register Src="~/Cpanel/UI/uscAdminRightMenu.ascx" TagName="uscAdminRightMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uscAdminRightMenu ID="uscAdminRightMenu1" runat="server" />تعداد کل نمایش :&nbsp;<asp:Label 
        ID="Label_Total" runat="server" Font-Bold="True"></asp:Label>
&nbsp;<br />
    تعداد کل کلیک&nbsp;&nbsp; :&nbsp;<asp:Label ID="Label_Click" runat="server" 
        Font-Bold="True"></asp:Label>
&nbsp;<asp:GridView ID="grdReport" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
        GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="BannerID" HeaderText=" کد بنر" />
            <asp:BoundField DataField="ZoneID" HeaderText="کد محل" />
            <asp:BoundField DataField="CampaignsID" HeaderText="کد تبلیغ" />
            <asp:BoundField DataField="ViewerIP" HeaderText="ای پی" />
            <asp:BoundField DataField="ViewerOperationSystem" HeaderText="سیستم عامل" />
            <asp:BoundField DataField="ViewerBrowserType" HeaderText="نوع مرورگر" />
            <asp:BoundField DataField="ViewerDate" HeaderText="تاریخ" />
            <asp:BoundField DataField="Page" HeaderText="صفحه" />
            <asp:BoundField DataField="IsClick" HeaderText="کلیک" />
            <asp:TemplateField HeaderText="مرورگر">
            <ItemTemplate>
            
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
</asp:Content>
