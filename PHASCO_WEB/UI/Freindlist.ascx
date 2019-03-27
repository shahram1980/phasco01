<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Freindlist.ascx.cs" Inherits="PHASCO_WEB.UI.Freindlist" %>


<asp:UpdatePanel ID="upd" runat="server" UpdateMode="Conditional">
    <ContentTemplate>

        <asp:HiddenField ID="HiddenFieldCount" runat="server" />
        <asp:HiddenField ID="HiddenFieldCurrentpage" runat="server" />
        <asp:Repeater ID="DataList1" runat="server">
            <ItemTemplate>
                <asp:Literal runat="server" ID="Literial_Ids" Text='<%# Eval("smp") %>' />
            </ItemTemplate>
        </asp:Repeater>

        <center>
			<asp:Button runat="server" Text="بیشتر ..." ID="btt_MoreView" OnClick="btt_MoreView_Click" CssClass="btn btn-info btn-block"  ></asp:Button>
<%--                <asp:ImageButton ID="ImageButtonOtherRow" runat="server" onclick="ImageButtonOtherRow_Click"  CssClass="ButtonAddMore" />--%>

        </center>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <img src="images/ajax-loader-paging.gif" />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </ContentTemplate>
</asp:UpdatePanel>
