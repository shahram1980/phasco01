<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsFlash.ascx.cs" Inherits="PHASCO_WEB.UI.NewsFlash" %>
<style type="text/css">
    .style_Flashimg
    {
        width: 31px;
        height: 40px;
    }
</style>
 
        <img alt="" class="style_Flashimg" src="/images/mic.gif" runat="server" id="ImgNews" /> 
 
<asp:Label runat="server" ID="label_News_Flash"  />
 
 
 <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

 
 
 