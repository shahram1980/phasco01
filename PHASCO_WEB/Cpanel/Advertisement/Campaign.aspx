<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="Campaign.aspx.cs" Inherits="AdvertisementManagement.Admin.Campaign" %>

<%@ Register Src="~/Cpanel/UI/uscAdminRightMenu.ascx" TagName="uscAdminRightMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <uc1:uscAdminRightMenu ID="uscAdminRightMenu1" runat="server" />
    <asp:ScriptManager ID="scrCampaign" runat="server">
    </asp:ScriptManager>
    <jq:JQLoader ID="jqLoad" runat="server">
    </jq:JQLoader>
    <table style="width: 100%; text-align: right;">
        <tr>
            <td style="width: 15%;">
                انتخاب تبلیغ دهنده
            </td>
            <td style="width: 85%;">
                <asp:UpdatePanel ID="updAdvertiser" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlAdvertiser" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAdvertiser_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                نام تبلیغ
            </td>
            <td>
                <asp:TextBox ID="txtCampaignName" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                توضیحات
            </td>
            <td>
                <asp:TextBox ID="txtNotes" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                نوع نمایش تبلیغ
            </td>
            <td>
                <asp:RadioButtonList ID="rdbCampaignType" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                    <asp:ListItem Text="مدت دار" Value="1"></asp:ListItem>
                    <asp:ListItem Text="بر اساس کلیک" Value="2"></asp:ListItem>
                    <asp:ListItem Text="بر اساس بازدید" Value="3"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                تارتاریخ شروع
            </td>
            <td>
                <jq:jqdatepicker ID="jqStartDate" ButtonImage="../../site/images/Calendar.png" Font-Names="Tahoma"
                    ShowSelectButton="true" IsRTL="true" runat="server" ChangeMonth="true" ChangeYear="true"
                    Regional="fa" SkinID="jqdatepiker"></jq:jqdatepicker>
            </td>
        </tr>
        <tr>
            <td>
                تاریخ پایان
            d>
            <td>
                <jq:JQDatePicker ID="jqEndDate" ButtonImage="../../site/images/Calendar.png" Font-Names="Tahoma"
                    ShowSelectButton="true" IsRTL="true" runat="server" ChangeMonth="true" ChangeYear="true"
                    Regional="fa" SkinID="jqdatepiker"></jq:JQDatePicker>
            </td>
        </tr>
        <tr>
            <td>
                ساعت شروع روزانه
            </td>
            <td>
                <asp:TextBox ID="txtDailyStartTime" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                ساعت پایان روزانه
            </td>
            <td>
                <asp:TextBox ID="txtDailyEndTime" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                روز های نمایش هفته
            </td>
            <td>
                <asp:CheckBoxList ID="chkListDaysOfWeek" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                هزینه روزانه
            </td>
            <td>
                <asp:TextBox ID="txtCreditForDay" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                بازدید روزانه
            </td>
            <td>
                <asp:TextBox ID="txtCampaignVisit" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                کلیک روزانه
            </td>
            <td>
                <asp:TextBox ID="txtCampaignClick" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="updCampaignBanner" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdBannerList" runat="server" AutoGenerateColumns="False" 
                            EmptyDataText="بنری براي نمايش وجود ندارد" BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" 
                            EnableModelValidation="True" ForeColor="Black" GridLines="None">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="BannerID" HeaderText="کد بنر" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelectBanner" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="BannerName" HeaderText="نام بنر" />
                                <asp:BoundField DataField="Height" HeaderText="طول" />
                                <asp:BoundField DataField="Width" HeaderText="عرض" />
                                <asp:BoundField DataField="BannerType" HeaderText="نوع بنر" />
                            </Columns>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="updCampaignZone" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdZoneList" runat="server" AutoGenerateColumns="False" 
                            EmptyDataText="محلی براي نمايش وجود ندارد" BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" 
                            EnableModelValidation="True" ForeColor="Black" GridLines="None">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="ZoneID" HeaderText="کد محل" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelectZone" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ZoneName" HeaderText="نام محل" />
                                <asp:BoundField DataField="Description" HeaderText="توضیح" />
                                <asp:BoundField DataField="Width" HeaderText="عرض" />
                                <asp:BoundField DataField="Height" HeaderText="طول" />
                            </Columns>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
    <asp:GridView ID="grdCampaign" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="grdCampaign_PageIndexChanging"
        OnRowDataBound="grdCampaign_RowDataBound" CellPadding="4" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CampaignName" HeaderText="نام تبلیغ" />
            <asp:BoundField DataField="StartDate" HeaderText="تاریخ شروع" />
            <asp:BoundField DataField="EndDate" HeaderText="تاریخ پایان" />
            <asp:BoundField DataField="CampaignType" HeaderText="نوع تبلیغ" />
            <asp:BoundField DataField="CampaignVisit" HeaderText="تعداد بازدید" />
            <asp:BoundField DataField="CreditForDay" HeaderText="هزینه روزانه" />
            <asp:BoundField DataField="CampaignClick" HeaderText="تعداد کلیک" />
            <asp:TemplateField HeaderText="عملیات">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("CampaignID") %>'
                        OnCommand="lnkEdit_Command" Text="ویرایش"></asp:LinkButton>
                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("CampaignID") %>'
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
