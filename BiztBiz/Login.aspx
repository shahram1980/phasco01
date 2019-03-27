<%@ Page Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="BiztBiz.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <table style="width: 867px" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 84px; background: transparent url('images/log-bg-frame-top.jpg') no-repeat scroll center top">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="background: transparent url('images/log-bg-frame-mid.jpg') repeat-y scroll center top;
                text-align: right;">
                <div style="width: 400px; float: right">
                    <asp:Panel ID="pnlUserLogin" runat="server" DefaultButton="ImageButton_Login">
                        <div id="divMessage" runat="server" visible="false" style="width: 300px; height: 20px;
                            padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                        <%-- <div id="invalidPass" runat="server" visible="false" style="float: right; width: 300px;
                            background: #F7D9DD; font: bold 11px tahoma; color: #DC1733; padding: 5px; margin: 5px 15px;">
                            نام کاربری یا رمز عبور اشتباه می باشد
                        </div>--%>
                        <span style="color: #808080; font: 18px arial; float: right; padding: 10px 20px">ورود
                            به سایت</span>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 120px">نام کاربری( آدرس ایمیل)</span>
                            <div class="input-bg-normal" dir="ltr">
                                <asp:TextBox ID="TextBox_Uid" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Uid"
                                ValidationGroup="register" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 120px">کلمه عبور</span>
                            <div class="input-bg-normal" dir="ltr">
                                <asp:TextBox ID="TextBox_Pass" runat="server" TextMode="Password" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Pass"
                                ValidationGroup="register" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div style="width: 200px; float: right; padding-right: 160px">
                            <span style="color: gray; float: right">
                                <asp:CheckBox ID="chkRememberme" runat="server" ForeColor="Gray" Text="مرا به یاد داشته باش"
                                    CssClass="defaultP" />
                            </span><a href="Login.aspx?s=forget"><span style="color: gray; float: right; clear: both">
                                <img alt="" height="10" src="images/log-ico-forget.jpg" width="10" />رمز عبور را
                                فراموش کرده ام !</span> </a><span style="float: right; clear: both; padding: 10px">
                                    <asp:ImageButton ID="ImageButton_Login" runat="server" OnClick="ImageButton_Login_Click"
                                        ImageUrl="~/images/log-bu-login.jpg" Height="34px" Width="123px" ValidationGroup="register" />
                                </span>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel_Fotget" runat="server" DefaultButton="ImageButton_Login">
                        <div style="width: 350px; float: right; padding-right: 30px">
                            <span style="color: #FF6600; font-weight: bold; float: right">نام کاربری (ایمیل):
                            </span>
                            <div class="input-bg-normal" dir="ltr">
                                <asp:TextBox ID="TextBox_FotgetUId" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_FotgetUId"
                                ValidationGroup="FotgetPass" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="FotgetPass"
                                runat="server" ControlToValidate="TextBox_FotgetUId" Display="Dynamic" ErrorMessage="ایمیل نامعتبر"
                                ForeColor="DarkRed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <span style="float: left;margin-left:60px;">
                                <asp:ImageButton ID="ImageButton_FORGET" runat="server" ImageUrl="~/images/log-bu-send.jpg"
                                    OnClick="ImageButton_FORGET_Click" ValidationGroup="FotgetPass" Height="25px"
                                    Width="63px" /></span>
                        </div>
                    </asp:Panel>
                    <img alt="" height="229" src="images/log-bg-liner.jpg" width="3" />
                </div>
                <div style="float: right; width: 300px; padding: 20px">
                    <img alt="" height="109" src="images/log-img-reg-text.jpg" width="377" />
                    <div style="padding: 30px; float: left">
                        <a href="register.aspx">
                            <img alt="" height="34" src="images/log-bu-reg.jpg" width="123" /></a></div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="background: transparent url('images/log-bg-frame-down.jpg') no-repeat scroll center top;
                height: 26px">
                &nbsp;
            </td>
        </tr>
    </table>
    <script type="text/javascript" language="javascript">
        $(function () {
            $("#<%=TextBox_Uid.ClientID %>").watermark("نام کاربری");
            $("#<%=TextBox_Pass.ClientID %>").watermark("رمز عبور");
        });
    </script>
    <%-- <table style="width: 1000px; margin: 0px auto">
        <tr>
            <td class="reg-title">
                <table style="width: 100%">
                    <tr>
                        <td class="center-align">
                            &nbsp;
                        </td>
                        <td class="last-news-center">
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div class="cat-main-login">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 504px" class="center-align">
                                <br />
                                <br />
                                <img alt="" src="images/text-top-reg.jpg" /><br />
                                <br />
                                <br />
                                <a href="register.aspx">
                                    <img style="border: 0px;" alt="" src='<asp:Literal ID="li12500" Text="<%$ Resources:Resource, jonin-reg %>" runat="server" />'
                                        width="146" height="49" />
                                </a>
                            </td>
                            <td style="width: 7px">
                                <img alt="" src="images/doter-reg.jpg" width="1" height="186" />
                            </td>
                            <td style="text-align: center;">
                                <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButton_Login">
                                    <div style="width: 300px; float: left;">
                                        <div style="float: left;">
                                            <img alt="" src='<asp:Literal ID="Literal65287400651" Text="<%$ Resources:Resource, Login_Id_img %>" runat="server" />'
                                                width="117" height="23" />
                                        </div>
                                        <div style="float: left;">
                                            <asp:TextBox ID="TextBox_Uid1" runat="server" Height="21px"></asp:TextBox></div>
                                    </div>
                                    <div style="width: 300px; float: left; margin-top: 5px;">
                                        <div style="float: left;">
                                            <img alt="" src='<asp:Literal ID="Literal65287400lik90651" Text="<%$ Resources:Resource, Login_Pass_img %>" runat="server" />'
                                                width="83" height="23" />
                                        </div>
                                        <div style="float: left;">
                                            <asp:TextBox ID="TextBox_Pass1" runat="server" TextMode="Password" Height="21px"
                                                Width="165px"></asp:TextBox></div>
                                    </div>
                                    <div style="width: 300px; float: left; margin-top: 5px;">
                                        <asp:CheckBox ID="chkRememberme1" runat="server" Text="من را به خاطر داشته باش" />
                                    </div>
                                    <center>
                                        <div style="float: left; width: 100%; margin-top: 5px;">
                                            <asp:Label runat="server" ID="Label_alarm" />
                                        </div>
                                        <div style="float: left; width: 100%; margin-top: 5px;">
                                            <asp:ImageButton ID="ImageButton_Login1" runat="server" OnClick="ImageButton_Login_Click"
                                                ImageUrl="<%$ Resources:Resource, sigin-buttom %>" />
                                        </div>
                                        <div style="float: left; width: 100%; margin-top: 5px;">
                                            <a href="Login.aspx?s=forget">
                                                <asp:Literal Text="<%$ Resources:Resource, Forget_Password %>" runat="server" ID="forgotpass001" />
                                            </a>
                                        </div>
                                    </center>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 504px" class="center-align">
                            </td>
                            <td style="width: 7px">
                                <img alt="" src="images/doter-reg.jpg" width="1" height="186" />
                            </td>
                            <td style="text-align: center;">
                                <asp:Panel ID="Panel_Fotget1" runat="server" DefaultButton="ImageButton_Login">
                                    <div style="width: 300px; float: left;">
                                        <div style="float: left; direction: ltr;">
                                            <img alt="" src='<asp:Literal ID="Literal6528e0527400651" Text="<%$ Resources:Resource, Login_Id_img %>" runat="server" />'
                                                width="117" height="23" />
                                        </div>
                                        <div style="float: left; direction: ltr;">
                                            <asp:TextBox ID="TextBox_FotgetUId2" runat="server" Height="21px"></asp:TextBox></div>
                                    </div>
                                    <center>
                                        <div style="float: left; width: 100%; margin-top: 5px;">
                                            <asp:ImageButton ID="ImageButton_FORGET1" runat="server" ImageUrl="<%$ Resources:Resource, inq_sub_en %>"
                                                OnClick="ImageButton_FORGET_Click" Height="31px" Width="102px" />
                                            <br />
                                            <asp:Label ID="Lbl_Forget_Pass1" runat="server" />
                                        </div>
                                    </center>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td class="footer-main-cat">
                &nbsp;
            </td>
        </tr>
    </table>--%>
</asp:Content>
