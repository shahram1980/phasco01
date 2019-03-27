<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="PerisanCMS.UI.Menu" %>
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
    <tr>
        <td dir="rtl" style="width: 100%" align="right">
<asp:Menu ID="Menu1" runat="server" DataSourceID="xmlDataSource" DynamicEnableDefaultPopOutImage="False"
    DynamicHorizontalOffset="2" DynamicPopOutImageUrl="~/Images/Menu_PopUp_Farsi.gif"
    Height="23px" MaximumDynamicDisplayLevels="9" StaticDisplayLevels="1" 
    StaticPopOutImageUrl="~/Images/Menu_PopUp_Farsi.gif">
    <DataBindings>
        <asp:MenuItemBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text"
            ToolTipField="ToolTip" />
    </DataBindings>
    <StaticSelectedStyle CssClass="Menu_static_Text" />
    <StaticHoverStyle CssClass="Menu_static_Ohover" />
    <StaticMenuItemStyle CssClass="Menu_static" />
    <StaticMenuStyle CssClass="Menu_static_Text" />
    <DynamicMenuItemStyle CssClass="Menu_static" />
    <DynamicMenuStyle CssClass="Menu_static" />
    <DynamicSelectedStyle CssClass="Menu_static_Text" />
    <DynamicHoverStyle CssClass="Menu_static_Ohover" />
</asp:Menu>
        </td>
    </tr>
</table>
<asp:XmlDataSource 
ID="xmlDataSource" 
runat="server" EnableCaching="False"
 TransformFile="~/mainTransformXSLT.xsl"
    XPath="MenuItems/MenuItem"></asp:XmlDataSource>