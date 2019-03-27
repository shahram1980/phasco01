<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftCat.ascx.cs" Inherits="PHASCO_Shopping.UC.LeftCat" %>
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
                                    <td class="cat_Left">
                                        <asp:Repeater ID="Repeater_Cat" runat="server">
                                        <ItemTemplate>
                                        
                                        <div style="padding:1px;" class="direction">
                                   <img src="images/PB.jpg" />
                                   &nbsp;<a href='categories-list.aspx?qid=<%# Eval("id")%>' title='<%# Eval(Resources.Resource.F_Subject)%>'>
                                        <%# Eval(Resources.Resource.F_Subject)%></a>
                                        </div>
                                       <br />
                                        </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img alt="" src="../images/fotter-left.png" width="241" height="10" />
                                    </td>
                                </tr>
                            </table><br />
                            <table style="width: 240px">
                        
                                <tr>
                                    <td style="vertical-align:top;text-align:center;">
                                        
                                        
                                        <img src="../Biztbiz-adv/temp.jpg"  /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img alt="" src="../images/fotter-left.png" width="241" height="10" />
                                    </td>
                                </tr>
                            </table>
                        