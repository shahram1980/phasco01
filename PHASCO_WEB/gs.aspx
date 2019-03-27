<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true"
    CodeBehind="gs.aspx.cs" Inherits="PerisanCMS.gs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <div style="direction: rtl;">
        <asp:TextBox ID="q" MaxLength="512" Width="275px" AutoPostBack="false" runat="server"
            Font-Names="Tahoma" Font-Size="XX-Small" Visible="False" />
        <asp:Button ID="_btnSearch" Text="پیدا کن" OnClick="_btnSearch_Click" runat="server"
            Font-Names="Tahoma" Font-Size="XX-Small" Visible="False" />
        <asp:RequiredFieldValidator ID="_rfvQ" ControlToValidate="q" runat="server" />
        <asp:HiddenField ID="cx" Value="008473727229366657275:krz0dhqtkmu" runat="server" />
        <asp:HiddenField ID="cof" Value="FORID:9" runat="server" />

        <script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_008473727229366657275%3Adkrz0dhqtkmu"></script>

        <input name="dummyHidden" value="" style="visibility: hidden; display: none;" />
        <div id="results_008473727229366657275:krz0dhqtkmu">
        </div>

        <script type="text/javascript">
var googleSearchIframeName = "results_008473727229366657275:krz0dhqtkmu";
var googleSearchFormName = "searchbox_008473727229366657275:krz0dhqtkmu";
var googleSearchFrameWidth = 600;
var googleSearchFrameborder = 0;
var googleSearchDomain = "www.google.com";
var googleSearchPath = "/cse";
        </script>

        <script type="text/javascript" src="http://www.google.com/afsonline/show_afs_search.js"></script>

    </div>
</asp:Content>
