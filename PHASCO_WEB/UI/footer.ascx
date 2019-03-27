<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="PHASCO_WEB.UI.footer" %>
<table style="width: 100%">
                    <tr>
                        <td class="style8">
                            <table cellspacing="0" cellpadding="0" style="width: 100%" align="right">
                                <tr>
                                    <td class="style20" style="height: 32px" align="center">
                                        پیاده سازی و اجرا : <a href="http://www.perisanweb.com" title="گروه فن آوری اطلاعات پریسان">
                                            پریسان </a>
                                    </td>
                                    <td style="width: 514px; height: 32px;" align="right" dir="rtl">
                                        &nbsp;<p>
                                            کلیه حقوق این سایت برای&nbsp; 
                                            وب سایت جامع علوم آزمایشگاهی و پزشکی فاسکو محفوظ است ©
                                            <br />
                                        </p>
                                    </td>
                                    <td style="height: 32px">
                                    </td>
                                    <td style="width: 50px; height: 32px;">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
<p>
                                            <asp:Repeater runat="server" ID="rpt_Keyword">
                            <ItemTemplate>
                            <span style="color:#fff3db">
                           <a href='<%# Eval("url")%>' title='<%# Eval("tag")%>' style="color:#fff3db"> <%# Eval("tag")%></a>, </span>
                            </ItemTemplate>
                            </asp:Repeater>
                                        </p>
