<%@ Page Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Categories.aspx.cs" Inherits="BiztBiz.Categories" %>

<%@ Register Src="UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <uc3:uscadvancesearch id="uscAdvanceSearch1" runat="server" />
    <table style="width: 900px;" dir="rtl">
        <tr>
            <td style="width: 240; vertical-align: top;">
                <table style="width: 240px">
                    <tr>
                        <td align='<asp:Literal ID="Literal1align0" Text="<%$ Resources:Resource, align %>" runat="server" />'
                            dir='<asp:Literal ID="Literal1dir0" Text="<%$ Resources:Resource, dir %>" runat="server" />'
                            style="height: 25px; background: #EFF6F8 url( '../images/Title_Bg.jpg' ) repeat-y scroll center top;
                            padding: 5px;">
                            <b>
                                <asp:Literal ID="Literal10" Text="<%$ Resources:Resource, Menu %>" runat="server" />
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="direction" style="padding: 5px; background-color: #e3ebf8;">
                            <div style="padding-bottom: 10px; padding-left: 5px; padding-right: 5px; padding-top: 10;">
                                <img src="images/CurrentCat.jpg" />
                                <asp:Label runat="server" ID="Current_Cat" Font-Bold="True" Font-Size="Medium" />
                            </div>
                            <asp:DataList ID="DataList_UpCat" runat="server" RepeatColumns="1" CellPadding="5"
                                CellSpacing="5">
                                <ItemTemplate>
                                    <div style="padding: 1px;" class="direction">
                                        <img src="images/PB.jpg" alt="" />
                                        &nbsp;<a href='Categories.aspx?sid=<%# Eval("id")%>' title='<%# Eval(Resources.Resource.F_Subject)%>'>
                                            <%# Eval(Resources.Resource.F_Subject)%></a>
                                    </div>
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img alt="" src="../images/fotter-left.png" width="241" height="10" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 100%; vertical-align: top;">
                <center>
                    <table style="width: 95%" cellspacing="0" cellpadding="0" class="style1">
                        <tr>
                            <td style="background: #EFF6F8 url( 'images/map_title.jpg' ) repeat-x scroll center top;
                                height: 27px; padding-left: 5px; padding-right: 5px;">
                                <asp:Label ID="Label_Nav" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color: #f2f3f7">
                                <asp:DataList ID="DataList_Cat" runat="server" RepeatColumns="4" CellPadding="5"
                                    CellSpacing="5">
                                    <ItemTemplate>
                                        <div style="padding: 1px;" class="direction">
                                            <img src="images/b12.png" />
                                            &nbsp;<a href='categories-list.aspx?qid=<%# Eval("id")%>' title='<%# Eval(Resources.Resource.F_Subject)%>'>
                                                <%# Eval(Resources.Resource.F_Subject)%></a>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </center>
            </td>
        </tr>
    </table>
</asp:Content>
