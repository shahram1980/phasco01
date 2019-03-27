<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuGallery.ascx.cs" Inherits="PerisanCMS.UI.MenuGallery" %>
<asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="5">
    <ItemTemplate>
        <div style="text-align: center">
            <table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td style="width: 100%">
                        <table border="0" style="width: 100%">
                            <tr>
                                <td align="center" style="width: 100%">
                                    <div>
                                        <a class="highslide" href='../upf/imgtpme/b<%# Eval("small")%>' onclick="return hs.expand(this)">
                                            <img alt="Highslide JS" src='../upf/imgtpme/s<%# Eval("small")%>' title="Click to enlarge" />
                                        </a>
                                        
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </ItemTemplate>
</asp:DataList>