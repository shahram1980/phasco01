<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="siteSearch.ascx.cs" Inherits="PHASCO_WEB.UI.siteSearch" %>
    <asp:HiddenField ID="cx" Value="008473727229366657275:krz0dhqtkmu" runat="server" />
    <asp:HiddenField ID="cof" Value="FORID:9" runat="server" />
    <asp:TextBox ID="q" MaxLength="512" Width="100" AutoPostBack="false" runat="server"
        Font-Names="Tahoma" Font-Size="X-Small" />
    <asp:Button ID="_btnSearch" Text="جستجو در فاسکو" OnClick="_btnSearch_Click" runat="server"
        Font-Names="Tahoma" Font-Size="XX-Small" />

    <%--<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_008473727229366657275%3Adkrz0dhqtkmu"></script>--%>

    <input name="dummyHidden" value="" style="visibility: hidden; display: none;" />