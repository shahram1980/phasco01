<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuGallery.ascx.cs" Inherits="PHASCO_WEB.UI.Page.MenuGallery" %>
<asp:Panel ID="Panel1" runat="server" GroupingText="  گالری تصاویر  " Direction="RightToLeft">
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
 <a href="#" onclick="javascript:window.open ('ImageSHow.aspx?img=<%# Eval("small")%>&mode=Page','mywindow','location=0,status=0,scrollbars=1,width=520,height=600');">
<%--<a class="highslide" onclick="return hs.expand(this)" href="/phascoupfile/imgtpme/b<%# Eval("small")%>">--%>
<img   src="/phascoupfile/imgtpme/s<%# Eval("small")%>">
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
</asp:Panel>
