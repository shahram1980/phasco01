<%@ Control Language="C#" AutoEventWireup="true" Codebehind="User_Middle_Option.ascx.cs"
    Inherits="PHASCO_WEB.UI.User_Middle_Option" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" 
    LoadScriptsBeforeUI="False" ScriptMode="Release">
</asp:ScriptManager>
<asp:Panel ID="Panel_All" runat="server" Height="50px" Width="100%">
    <div class="applemenu">
        <div headerindex="0h" class="silverheader">
            <a href="#">راه حل شما چیست ؟</a></div>
        <div style="display: none;" contentindex="0c" class="submenu">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:MultiView ID="MultiView_Sol" runat="server">
                        <asp:View ID="View1" runat="server">
                            <div style="text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" dir="rtl" style="width: 32%; height: 19px">
                                        </td>
                                        <td align="right" dir="rtl" style="width: 100%; height: 19px">
                                            راه حل شما چيست</td>
                                    </tr>
                                    <tr>
                                        <td align="right" dir="rtl" style="width: 32%">
                                        </td>
                                        <td align="right" dir="rtl" style="width: 100%">
                                            <asp:Label ID="Label_Solu_Qu" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right" dir="rtl" style="width: 32%; height: 69px">
                                            <asp:Button ID="Button_Insert" runat="server" OnClick="Button_Insert_Click" Text="ارسال پاسخ"
                                                Font-Names="Tahoma" Font-Size="XX-Small" /></td>
                                        <td align="right" dir="rtl" style="width: 20%; height: 69px">
                                            <asp:TextBox ID="TextBox_Ans" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                Height="88px" TextMode="MultiLine" Width="70%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="right" dir="rtl" style="width: 32%">
                                        </td>
                                        <td align="right" dir="rtl" style="width: 100%">
                                            <asp:Label ID="Label_Alaram" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div style="text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" dir="rtl" style="width: 100%">
                                            باتشکر ، راه حل شما با موفقيت ارسال گردید
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <div style="text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            سوال جدیدی مطرح نشده است.&nbsp; متشکریم</td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                    <asp:HiddenField ID="HiddenField_Id" runat="server"></asp:HiddenField>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div align="center">
                        <table border="0" dir="rtl" style="border-collapse: collapse" width="50%">
                            <tr>
                                <td>
                                    <p align="center">
                                        <font face="Tahoma" size="2"><span lang="fa" style="font-size: 9pt">در حال بارگزاری
                                            ...</span></font></p>
                                </td>
                            </tr>
                            <tr style="font-size: 9pt">
                                <td align="center">
                                    <font face="Verdana"><font size="2"><a href="http://www.perisanweb.com" target="_blank">
                                    </a>
                                        <img src="images/CalBiotech_Adv.jpg" /></font><b><font size="2"><span style="text-decoration: none"><a
                                            href="http://www.perisanweb.com/" target="_blank" title="گروه فناوری اطلاعات پریسان"><span
                                                style="font-size: 9pt"><font color="#000000"><span style="text-decoration: none"></span></font></span></a></span></font></b></font></td>
                            </tr>
                        </table>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <div headerindex="1h" class="silverheader">
            <a href="#">علم و دانش خود را محک بزنيد </a>
        </div>
        <div style="display: none;" contentindex="1c" class="submenu">
            <asp:UpdatePanel ID="UpdatePanel_QU" runat="server">
                <ContentTemplate>
                    <asp:MultiView ID="MultiView_QU" runat="server">
                        <asp:View ID="View4" runat="server">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td align="right" dir="rtl" style="width: 100%">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="width: 90%">
                                                    <asp:Label ID="Label_Qu" runat="server"></asp:Label><br />
                                                    [امتیاز
                                                    <asp:Label ID="point" runat="server"></asp:Label>]
                                                </td>
                                                <td style="width: 10%">
                                                    <asp:Button ID="Button_Answer" runat="server" OnClick="Button1_Click" Text="ارسال پاسخ"
                                                        Font-Names="Tahoma" Font-Size="XX-Small" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" dir="rtl" style="width: 100%" valign="top">
                                        <asp:RadioButtonList ID="RadioButtonList_QU" runat="server">
                                        </asp:RadioButtonList></td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="HiddenField_Answer_Id" runat="server" />
                            <asp:HiddenField ID="HiddenField_QU_ID" runat="server" />
                        </asp:View>
                        <asp:View ID="View5" runat="server">
                            &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td align="right" dir="rtl" style="width: 100%">
                                        <asp:Label ID="Label_QU_ALARM" runat="server"></asp:Label><br />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View6" runat="server">
                            <div style="text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            سوال جدیدی مطرح نشده است.&nbsp; متشکریم</td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel_QU">
                <ProgressTemplate>
                    <div align="center">
                        <table border="0" dir="rtl" style="border-collapse: collapse" width="50%">
                            <tr>
                                <td>
                                    <p align="center">
                                        <font face="Tahoma" size="2"><span lang="fa" style="font-size: 9pt">در حال بارگزاری
                                            ...</span></font></p>
                                </td>
                            </tr>
                            <tr style="font-size: 9pt">
                                <td align="center">
                                    <img src="images/CalBiotech_Adv.jpg" /><a href="http://www.perisanweb.com" target="_blank"></a></td>
                            </tr>
                        </table>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            &nbsp;
        </div>
        <div headerindex="2h" class="silverheader">
            <a href="#">پیام فوری از سوی مدیر سایت</a></div>
        <div style="display: none;" contentindex="2c" class="submenu">
            <asp:UpdatePanel ID="UpdatePanel_SMS" runat="server">
                <ContentTemplate>
                    <asp:MultiView ID="MultiView_SMS" runat="server">
                        <asp:View ID="View7" runat="server">
                            <table border="0" width="100%" dir="rtl" style="border-collapse: collapse">
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label_FlashMessage" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton_Ok" runat="server" OnClick="LinkButton_Ok_Click">متوجه شدم</asp:LinkButton>
                                        <asp:Label ID="Label_SMS_Alarm" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="HiddenField_ID_SMS" runat="server" />
                        </asp:View>
                        <asp:View ID="View8" runat="server">
                            <div style="text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            پیام جدید وجود ندارد.&nbsp; متشکریم</td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel_SMS">
                <ProgressTemplate>
                    <div align="center">
                        <table border="0" dir="rtl" style="border-collapse: collapse" width="50%">
                            <tr>
                                <td>
                                    <p align="center">
                                        <font face="Tahoma" size="2"><span lang="fa" style="font-size: 9pt">در حال بارگزاری
                                            ...</span></font></p>
                                </td>
                            </tr>
                            <tr style="font-size: 9pt">
                                <td align="center">
                                    <font face="Verdana"><b><font size="2"><span style="text-decoration: none">
                                        <img src="images/CalBiotech_Adv.jpg" /><a href="http://www.perisanweb.com" target="_blank"></a></span></font></b></font></td>
                            </tr>
                        </table>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            &nbsp;
        </div>
    </div>
</asp:Panel>
