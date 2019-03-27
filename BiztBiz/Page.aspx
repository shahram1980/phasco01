<%@ Page Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Page.aspx.cs" Inherits="PerisanCMS.Page" %>

<%@ Register Src="UC/MenuGallery.ascx" TagName="MenuGallery" TagPrefix="uc2" %>
<%@ Register Src="UC/MenuDownloads.ascx" TagName="MenuDownloads" TagPrefix="uc3" %>
<%@ Register Src="UC/uscTopProduct.ascx" TagName="uscTopProduct" TagPrefix="uc3" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <uc3:uscTopProduct ID="uscTopProduct1" runat="server" />
    <table style="width: 1000px;" dir='rtl'>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <a href="javascript: history.go(-1)" visible="false" runat="server" id="goback">برگشت
                </a>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <asp:Label ID="LBL_Title" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" dir="rtl" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <asp:Label ID="Label_Text" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <uc2:MenuGallery ID="MenuGallery1" runat="server"></uc2:MenuGallery>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <uc3:MenuDownloads ID="MenuDownloads1" runat="server"></uc3:MenuDownloads>
            </td>
        </tr>
    </table>
</asp:Content>
