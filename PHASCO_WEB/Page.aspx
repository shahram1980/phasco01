<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="PHASCO_WEB.Page" %>
<%@ Register src="UI/Page/ManuPath.ascx" tagname="ManuPath" tagprefix="uc1" %>
<%@ Register src="UI/Page/MenuGallery.ascx" tagname="MenuGallery" tagprefix="uc2" %>
<%@ Register src="UI/Page/MenuDownload.ascx" tagname="MenuDownload" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc" runat="server">
<table
                    border="0" cellpadding="0" cellspacing="0" style="width: 100%;direction:rtl;background-color:#cdb57f;">
                    <tr>
                            <td align="right" style="width: 100%;padding:5px;">
                     <%--       <a href="javascript:PopUp('Print.aspx?id=<%Response.Write(Request.QueryString["id"].ToString()); %>&mode=page')">
                                <img style="border: 0px;" src="images/printer.jpg" />
                            </a>--%>
                <asp:Label ID="LBL_Title" runat="server" Font-Size="Medium" Font-Bold="True" 
                                    ForeColor="#990000"></asp:Label> 
                        </td>
                      <%--  <td align="right" style="width: 20%">
                             <asp:Literal ID="Literal1" Text="برگشت" runat="server" /> 
                        </td>--%>
                
                    </tr>
                </table>

    <table style="width: 100%" dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" runat="server" />'>
 
 
        <tr>
            <td style="width: 100%" dir="rtl">
                <uc1:ManuPath ID="ManuPath1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%" dir="rtl" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <asp:Label ID="Label_Text" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <uc2:MenuGallery ID="MenuGallery2" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <uc3:MenuDownload ID="MenuDownload1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
