<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true" CodeBehind="SuccessShop.aspx.cs" Inherits="PHASCO_WEB.SuccessShop" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">

</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <table id="Table6" border="0" cellpadding="0" cellspacing="0" dir='<asp:Literal ID="dir3" Text="<%$ Resources:Resource, Price_Text %>" runat="server" />'
        style="border-collapse: collapse" width="100%">
        <tr>
            <td align="center" style="text-align: center">
                <table id="Table5" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td background="images/topcellbg2.jpg" height="25" valign="middle">
                            <img src="images/finalshop.jpg" /></td>
                    </tr>
                    <tr>
                        <td class="mycell2" height="2" style="text-align: center" valign="top">
                            <table id="Table9" border="0" dir='<asp:Literal Text="<%$ Resources:Resource, dir%>" ID="Literal1" runat="server" />'
                                style="border-collapse: collapse" width="100%">
                                <tr>
                                    <td align="center">
                                        <div align="center">
                                            &nbsp;</div>
                                        <table id="Table2" border="1" bordercolor="#e2d3bb" style="border-collapse: collapse"
                                            width="95%">
                                            <tr>
                                                <td align="right" bgcolor="#e2d3bb" dir="rtl" valign="top">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="right" bordercolor="#e2d3bb" dir="rtl" valign="top" style="text-align: center">
                                                    &nbsp; با تشکر از خرید شما:<br />
                                                    <br />
                                                    سفارش شما با شماره
                                                    <asp:Label ID="Label_NO" runat="server" Font-Bold="True" Font-Size="XX-Small" ForeColor="Maroon"></asp:Label>
                                                    در سیستم ثبت گردید .
                                                    <br />
                                                    همچنین شما می تواند روند پیگیری سفارش خود را از سوی شرکت فاسکو در بخش رهگیری سفارش
                                                    در پنل کاربری خود پیگیری نمائید.<br />
                                                    <br />
                                                    از اینکه روش نوین الکترونیک و همچنین شرکت فاسکو را برای سفارش خود انتخاب کرده اید
                                                    متشکریم.<br />
                                                    <br />
                                                    <br />
                                                    (فروش پایان یک معامله نیست، بلکه آغاز یک تعهد است)</td>
                                            </tr>
                                        </table>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <div style="text-align: center">
                                        </div>
                                        <div align="center">
                                            &nbsp;</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="2">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>

 