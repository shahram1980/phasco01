<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="Advertiser.aspx.cs" Inherits="AdvertisementManagement.Admin.Advertiser" %>

<%@ Register Src="~/Cpanel/UI/uscAdminRightMenu.ascx" TagName="uscAdminRightMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <uc1:uscAdminRightMenu ID="uscAdminRightMenu1" runat="server" />  <table style="width: 100%; text-align: right;">
        <tr>
            <td style="width: 15%;">
                کاربر
            </td>
            <td style="width: 85%;">
                <asp:DropDownList ID="ddlUser" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                نام تبلیغ دهنده
            </td>
            <td>
                <asp:TextBox ID="txtAdvertiserName" runat="server">
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
                ارسال گزارش روزانه
            </td>
            <td>
                <asp:CheckBox ID="chkEmailDailyReport" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                ارسال گزارش هفتگی
            </td>
            <td>
                <asp:CheckBox ID="chkEmailWeeklyReport" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                ارسال گزارش ماهانه
            </td>
            <td>
                <asp:CheckBox ID="chkEmailMonthlyReport" runat="server" />
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
    <asp:GridView ID="grdAdvertiser" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="grdAdvertiser_PageIndexChanging"
        OnRowDataBound="grdAdvertiser_RowDataBound" CellPadding="4" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="AdvertiserName" HeaderText="نام تبلیغ دهنده" />
            <asp:BoundField DataField="Description" HeaderText="توضیح" />
            <asp:BoundField DataField="EmailDailyReport" HeaderText="ارسال گزارش روزانه" />
            <asp:BoundField DataField="EmailWeeklyReport" HeaderText=" ارسال گزارش هفتگی" />
            <asp:BoundField DataField="EmailMonthlyReport" HeaderText=" ارسال گزارش ماهانه" />
            <asp:TemplateField HeaderText="عملیات">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("AdvertiserID") %>'
                        OnCommand="lnkEdit_Command" Text="ویرایش"></asp:LinkButton>
                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("AdvertiserID") %>'
                        OnCommand="lnkDelete_Command" Text="حذف"></asp:LinkButton>
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
