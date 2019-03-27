<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserPointTable.ascx.cs" Inherits="phasco_webproject.UI.UserPointTable" %>
<asp:GridView ID="GridView_Total" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <table border="0" cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
                    <tr>
                        <td style="width: 25%; height: 19px">
                               <%# Eval("Total")%></td>
                        <td style="width: 70%; height: 19px;">
                        <%# Eval("UID")%>
                        </td>
                        <td style="width: 5%; height: 19px;">
                        
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
