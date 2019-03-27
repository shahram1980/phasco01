<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top_Link.ascx.cs" Inherits="PHASCO_Shopping.UC.Top_Link" %>
<%@ Register Src="Searchbox.ascx" TagName="Searchbox" TagPrefix="uc1" %>

<link type="text/css" href="/js/jquery.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery-1.js"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#postbarnavigate').click(function () {
            if ($('#imgdown').attr('src') == 'js/updown.jpg') {
                $('#divPostBar').slideToggle(400);
                $('#divattach').slideToggle(100);
                $('#imgdown').attr('src', 'js/updown.jpg');
            }
            else {
                $('#divPostBar').slideToggle(400);
                setTimeout(divattachToggle, 200);
                $('#imgdown').attr('src', 'js/updown.jpg');
            }

            return false;
        });

        function divattachToggle() {
            $('#divattach').slideToggle(200);
        }

    });
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False" ScriptMode="Release">
</asp:ScriptManager>
<table class="top-icon">
    <tr>
        <td>
            &nbsp;
        </td>
        <td class="top-icon-content">
            <table style="width: 1000px;">
                <tr>
                    <td style="width: 60%; vertical-align: top">
                        <table border="0" width="100%" dir="rtl" style="border-collapse: collapse">
                            <tr>
                                <td width="70%">
                                    <uc1:Searchbox ID="Searchbox1" runat="server" />
                                </td>
                                <td width="30%">
                                    <a href="../Default.aspx">&nbsp;</a>&nbsp; &nbsp; <a id="A1" title="English Language"
                                        class="fa" runat="server" href="~/default.aspx?mLang=en-US">
                                        <img alt="" src="../images/en.png" width="73" height="19" />
                                    </a><a id="A2" title="زبان فارسی" class="en" runat="server" href="~/default.aspx?mLang=fa-IR">
                                        <img alt="" src="../images/fa.png" width="73" height="19" />
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 40%;vertical-align:top;">
<table border="0" width="280" dir='<asp:Literal ID="Literal103291" Text="<%$ Resources:Resource, dir %>" runat="server" />'
style="border-collapse: collapse">
<tr>
<td width="5%">
<asp:Image ID="Image2" ImageUrl="~/images/b-1-top.jpg" runat="server" />
</td>
<td width="15%">
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" Text="<%$ Resources:Resource, Home %>"></asp:HyperLink>
</td>
<td width="5%">
<asp:Image ID="Image100" ImageUrl="~/images/b2-top.jpg" runat="server" />
</td>
<td width="36%">
<asp:HyperLink ID="HyperLink_Hoin_Now" runat="server" NavigateUrl="~/Register.aspx"
Text="<%$ Resources:Resource, Join_Now %>"></asp:HyperLink>
</td>
<td width="5%">
<asp:Image ID="Image1" ImageUrl="~/images/b-3-top.jpg" runat="server" />
</td>
<td width="33%">
<asp:Panel runat="server" ID="Panel_User_Offline">
<a href="#" id="postbarnavigate" style="text-decoration: none;">
<asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, Sign_In %>" /></a>
</asp:Panel>
<asp:Panel runat="server" ID="Panel_User_Online">
<asp:HyperLink ID="HyperLink_Sign_in" runat="server" NavigateUrl="" Text="<%$ Resources:Resource, Sign_In %>"></asp:HyperLink>
</asp:Panel>
</td>
</tr>
</table>
                        <div>
                            <div>
                                <div style="display: none;" id="divPostBar">
                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
       
 
                                            <table border="0" style="height: 1500; width: 300px;" dir="rtl">
                                                <tr>
                                                    <td width="100%" colspan="5">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        نام کاربر
                                                    </td>
                                                    <td width="25%">
                                                        <asp:TextBox ID="TextBox_Uid" runat="server" CssClass="input-login" />
                                                    </td>
                                                    <td width="15%">
                                                        نام رمز
                                                    </td>
                                                    <td width="25%">
                                                        <asp:TextBox ID="TextBox_Pass" runat="server" TextMode="Password" CssClass="input-login" />
                                                    </td>
                                                    <td width="20%">
                                                        <asp:Button ID="Button_Signin" runat="server" CausesValidation="False" OnClick="Button_Signin_Click" Text="ثبت شود" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100%" colspan="5">
                                                        <asp:Label runat="server" ID="LbL_Alarm" />
                                                    </td>
                                                </tr>
                                            </table>
                                     
                                </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <img src="../images/loader.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>
                                </div>
                                <div>
                                    <div style="margin: 0pt 0pt 0pt 80px; width: 10px; height: 6px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</table>


