<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true"
    Codebehind="UserGallery.aspx.cs" Inherits="PHASCO_WEB.UserGallery" %>

 
 
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">

</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <div style="text-align: center">
        <table border="0" style="width: 100%">
            <tr>
                <td align="center" style="width: 50%" valign="top">
                </td>
                <td align="right" style="width: 50%" valign="top">
                    <table border="0" style="width: 100%">
                        <tr>
                            <td align="right" colspan="2" dir="rtl">
                                &nbsp;::<a href="#" onclick="javascript:window.open ('agree.htm','mywindow','location=0,status=0,scrollbars=1,width=520,height=600');">توافقنامه فاسکو را مطالعه و مفاد آن را قبول کرده ام
                                </a>
                                </td>
                        </tr>
                        <tr>
                            <td align="right" width="70%">
                                <asp:Label ID="Lbl_alarm" runat="server"></asp:Label></td>
                            <td align="right" width="30%">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="70%">
                                <asp:FileUpload ID="FileUpload_Image_Big" runat="server" /></td>
                            <td align="left" width="30%" dir="rtl">
                                &nbsp;تصویر بزرگ&nbsp; :</td>
                        </tr>
                        <tr>
                            <td align="right" width="70%">
                                <asp:TextBox ID="TextBox_Comment" runat="server" Height="40px" TextMode="MultiLine"></asp:TextBox></td>
                            <td align="left" width="30%" dir="rtl">
                                <span style="font-size: 10pt; font-family: Tahoma">توضیح کوتاه تصویر :</span></td>
                        </tr>
                        <tr>
                            <td align="right" width="70%">
                                <asp:Button ID="Button_Images" runat="server" Font-Names="Tahoma" OnCommand="Button_Images_Command"
                                    Text="ارسال" /></td>
                            <td align="right" width="30%">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="70%">
                            </td>
                            <td align="right" width="30%">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <!--**************************************************-->
                    <div id="preview_div" style="display: none; z-index: 110; left: -500px; position: absolute;
                        top: 302px">
                        <div id="loader">
                            <div id="loader_bg">
                                <div id="progress" style="left: 92px; width: 20px">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="preview_temp_load">
                    </div>
                    <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="5" CellPadding="3">
                        <ItemTemplate>
                            <div style="text-align: center">
                                <table border="1" cellpadding="0" cellspacing="0" style="width: 100px;">
                                    <tr>
                                        <td style="width: 100%">
                                            <table border="0" style="width: 100%">
                                                <tr>
                                                    <td align="center" style="width: 100%">
                                                        <a class="highslide" onclick="return hs.expand(this)" href="phascoupfile/UserGallery/b<%# image_Check(Eval("id").ToString())%>">
                                                            <img title="Click to enlarge" alt="Highslide JS" src="phascoupfile/UserGallery/s<%# image_Check(Eval("id").ToString())%>">
                                                        </a>
                                           
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="width: 100%">
                                                        <%# Eval("comment")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="width: 100%">
                                                        <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                            Font-Names="Tahoma" Font-Size="Small" Font-Underline="False" OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                    </asp:DataList>
                    <p>
                    </p>
                    <p>
                    </p>
                    <div>
                    </div>
                    <!--**************************************************-->
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
