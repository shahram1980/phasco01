<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="Banner.aspx.cs" Inherits="AdvertisementManagement.Admin.Banner" %>

<%@ Register Src="~/Cpanel/UI/uscAdminRightMenu.ascx" TagName="uscAdminRightMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:uscAdminRightMenu ID="uscAdminRightMenu1" runat="server" />
    <asp:ScriptManager ID="scrBanner" runat="server">
    </asp:ScriptManager>
    <table style="width: 100%; text-align: right;">
        <tr>
            <td style="width: 15%;">
                تبلیغ دهنده
            </td>
            <td style="width: 85%;">
                <asp:DropDownList ID="ddlAdvertiser" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                نام بنر
            </td>
            <td>
                <asp:TextBox ID="txtBannerName" runat="server">
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
                فعال
            </td>
            <td>
                <asp:CheckBox ID="chkActive" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                یادداشت
            </td>
            <td>
                <asp:TextBox ID="txtNotes" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="updBannerType" runat="server">
        <ContentTemplate>
            <table style="width: 100%; text-align: right;">
                <tr>
                    <td style="width: 15%;">
                        نوع بنر
                    </td>
                    <td style="width: 85%;">
                        <asp:RadioButtonList ID="rdbBannerType" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                            OnSelectedIndexChanged="rdbBannerType_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="متنی" Value="1"></asp:ListItem>
                            <asp:ListItem Text="عکس" Value="2"></asp:ListItem>
                            <asp:ListItem Text="فلش" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <table id="pnlText" runat="server" style="width: 100%; text-align: right;">
                <tr>
                    <td style="width: 15%;">
                        متن تیتر
                    </td>
                    <td style="width: 85%;">
                        <asp:TextBox ID="txtHeadlineText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        متن لینک
                    </td>
                    <td>
                        <asp:TextBox ID="txtLinkText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        لینک نمایشی
                    </td>
                    <td>
                        <asp:TextBox ID="txtDisplayURL" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        نام فونت
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFontName" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Tahoma" Value="Tahoma"></asp:ListItem>
                            <asp:ListItem Text="Times New Roman" Value="Times New Roman"></asp:ListItem>
                            <asp:ListItem Text="Arial" Value="Arial"></asp:ListItem>
                            <asp:ListItem Text="MS Sans Serif" Value="MS Sans Serif"></asp:ListItem>
                            <asp:ListItem Text="Sans-Serif" Value="Sans-Serif"></asp:ListItem>
                            <asp:ListItem Text="Arial Black" Value="Arial Black"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        سایز فونت
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFontSize" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                            <asp:ListItem Text="13" Value="14"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        رنگ فونت
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFontColor" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="مشکی" Value="Black"></asp:ListItem>
                            <asp:ListItem Text="آبی" Value="Blue"></asp:ListItem>
                            <asp:ListItem Text="سبز" Value="Green"></asp:ListItem>
                            <asp:ListItem Text="سفید" Value="White"></asp:ListItem>
                            <asp:ListItem Text="نارنجی" Value="Orange"></asp:ListItem>
                            <asp:ListItem Text="قرمز" Value="Red"></asp:ListItem>
                            <asp:ListItem Text="زرد" Value="Yellow"></asp:ListItem>
                        </asp:DropDownList>
                        یا به صورت RGB
                        <asp:TextBox ID="txtFontColor" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table id="pnlFlash" runat="server" style="width: 100%; text-align: right;">
                <tr>
                    <td style="width: 15%;">
                        لینک فلش
                    </td>
                    <td style="width: 85%;">
                        <asp:FileUpload ID="fluFlashUrl" runat="server" />
                        <asp:HiddenField ID="hdfFlashUrl" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        نمایش عکس
                    </td>
                    <td>
                        <asp:CheckBox ID="chkIsShowImage" runat="server" OnCheckedChanged="chkIsShowImage_CheckedChanged"
                            AutoPostBack="true" />
                    </td>
                </tr>
            </table>
            <table id="pnlImage" runat="server" style="width: 100%; text-align: right;">
                <tr>
                    <td style="width: 15%;">
                        تصویر
                    </td>
                    <td style="width: 85%;">
                        <asp:FileUpload ID="fluImageURL" runat="server" />
                        <asp:Image ID="imgBannerImage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        متن روی تصویر
                    </td>
                    <td>
                        <asp:TextBox ID="txtAltText" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%; text-align: right;">
                <tr>
                    <td style="width: 15%;">
                        لینک
                    </td>
                    <td style="width: 85%;">
                        <asp:TextBox ID="txtTargetUrl" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        عرض
                    </td>
                    <td>
                        <asp:TextBox ID="txtWidth" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        طول
                    </td>
                    <td>
                        <asp:TextBox ID="txtHeight" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        سبک حاشیه
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBorderStyle" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="dashed" Value="dashed"></asp:ListItem>
                            <asp:ListItem Text="dotted" Value="dotted"></asp:ListItem>
                            <asp:ListItem Text="none" Value="none"></asp:ListItem>
                            <asp:ListItem Text="solid" Value="solid"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        اندازه حاشیه
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBorderWidth" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        رنگ حاشیه
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBorderColor" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="مشکی" Value="Black"></asp:ListItem>
                            <asp:ListItem Text="آبی" Value="Blue"></asp:ListItem>
                            <asp:ListItem Text="سبز" Value="Green"></asp:ListItem>
                            <asp:ListItem Text="سفید" Value="White"></asp:ListItem>
                            <asp:ListItem Text="نارنجی" Value="Orange"></asp:ListItem>
                            <asp:ListItem Text="قرمز" Value="Red"></asp:ListItem>
                            <asp:ListItem Text="زرد" Value="Yellow"></asp:ListItem>
                        </asp:DropDownList>
                        یا به صورت RGB
                        <asp:TextBox ID="txtBorderColor" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        چینش
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAlignment" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="center" Value="center"></asp:ListItem>
                            <asp:ListItem Text="justify" Value="justify"></asp:ListItem>
                            <asp:ListItem Text="left" Value="left"></asp:ListItem>
                            <asp:ListItem Text="right" Value="right"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        نوع لینک
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTatgetWindows" runat="server">
                            <asp:ListItem Text="انتخاب کنید" Value="0"></asp:ListItem>
                            <asp:ListItem Text="_blank" Value="_blank"></asp:ListItem>
                            <asp:ListItem Text="_parent" Value="_parent"></asp:ListItem>
                            <asp:ListItem Text="_self" Value="_self"></asp:ListItem>
                            <asp:ListItem Text="_top" Value="_top"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table style="width: 100%; text-align: right;">
        <tr>
            <td style="width: 15%;">
            </td>
            <td style="width: 85%;">
                <asp:Button ID="btnConfirm" runat="server" Text="  ثبت شود  " 
                    OnClick="btnConfirm_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdBanner" runat="server" AutoGenerateColumns="False" 
    OnPageIndexChanging="grdBanner_PageIndexChanging"
        OnRowDataBound="grdBanner_RowDataBound" CellPadding="4" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="BannerName" HeaderText="نام بنر" />
            <asp:BoundField DataField="AdvertiserID" HeaderText="تبلیغ کننده" />
            <asp:BoundField DataField="Height" HeaderText="طول" />
            <asp:BoundField DataField="Width" HeaderText="عرض" />
            <asp:BoundField DataField="Active" HeaderText="فعال" />
            <asp:BoundField DataField="BannerType" HeaderText="نوع بنر" />
            <asp:TemplateField HeaderText="عملیات">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("BannerID") %>'
                        OnCommand="lnkEdit_Command" Text="ویرایش"></asp:LinkButton>
                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("BannerID") %>'
                        OnCommand="lnkDelete_Command" Text="حذف"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="گزارش">
            <ItemTemplate><a href="Reports.aspx?BannerId=<%#Eval("BannerID") %>" /> نمایش گزارش </ItemTemplate>
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
