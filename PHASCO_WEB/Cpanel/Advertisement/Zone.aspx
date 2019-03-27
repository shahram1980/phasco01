<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="Zone.aspx.cs" Inherits="AdvertisementManagement.Admin.Zone" %>


<%@ Register Src="~/Cpanel/UI/uscAdminRightMenu.ascx" TagName="uscAdminRightMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

  

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
 <uc1:uscAdminRightMenu ID="uscAdminRightMenu1" runat="server" />
    <table style="width: 100%; text-align: right;">
        <tr>
            <td style="width:15%;">
                نام محل
            </td>
            <td style="width:85%;">
                <asp:TextBox ID="txtZoneName" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                توضیح
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                طول
            </td>
            <td>
                <asp:TextBox ID="txtHeight" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                عرض
            </td>
            <td>
                <asp:TextBox ID="txtWidth" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                وضعیت
            </td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Value="1">فعال</asp:ListItem>
                    <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                رنگ پشت زمینه
            </td>
            <td>
                <asp:TextBox ID="txtBackgroundColor" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                زمان بازیابی
            </td>
            <td>
                <asp:TextBox ID="txtRefreshInterval" runat="server">
                </asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                تعداد بنر
            </td>
            <td>
                <asp:TextBox ID="txtBannerCount" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                مکان
            </td>
            <td>
                <asp:DropDownList ID="ddlZoneLocation" runat="server">
                    <asp:ListItem Value="0">بالا</asp:ListItem>
                    <asp:ListItem Value="1">پائین</asp:ListItem>
                    <asp:ListItem Value="2">راست</asp:ListItem>
                    <asp:ListItem Value="3">چپ</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnConfirm" runat="server" Text="ثبت" OnClick="btnConfirm_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdZone" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="grdZone_PageIndexChanging"
        OnRowDataBound="grdZone_RowDataBound" CellPadding="4" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="99%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ZoneName" HeaderText="نام محل" />
            <asp:BoundField DataField="Description" HeaderText="توضیح" />
            <asp:BoundField DataField="Width" HeaderText="عرض" />
            <asp:BoundField DataField="Height" HeaderText="طول" />
            <asp:BoundField DataField="Status" HeaderText="وضعیت" />
            <asp:TemplateField HeaderText="عملیات">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("ZoneID") %>'
                        OnCommand="lnkEdit_Command" Text="ویرایش"></asp:LinkButton>
                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("ZoneID") %>'
                        OnCommand="lnkDelete_Command" Text="حذف"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ZoneID" HeaderText="کد محل" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
</asp:Content>
