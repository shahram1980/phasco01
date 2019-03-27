<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdverTop.ascx.cs" Inherits="PHASCO_Shopping.UC.AdverTop"  %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<p style="direction: ltr">
    &nbsp;</p>
<p style="direction: ltr">
            <asp:DataList ID="DataList_adver" runat="server" Width="100%">
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td align="center">
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    CommandArgument='<%# Eval("id") %>' 
                                    ImageUrl='<%# ResolveUrl("~/adv/" + DataBinder.Eval(Container.DataItem, "name")) %>' 
                                    oncommand="ImageButton1_Command" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </p>
<table class="style1">
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
