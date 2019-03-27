<%@ Page Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="register.aspx.cs" Inherits="BiztBiz.register" %>
<%-- 
<%@ Register Src="~/UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc2" %>--%>
<%@ Register Assembly="dotNetFreak.WebControls.FormShield" Namespace="dotNetFreak.WebControls" TagPrefix="dnf" %>
<%@ Register Src="~/UC/uscTopProduct.ascx" TagName="uscTopProduct" TagPrefix="uc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script src="js-info/jquery.js" type="text/javascript"></script>
    <script src="js-info/jtip.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var minpwlength = 4;
        var fairpwlength = 7;
        var STRENGTH_SHORT = 0;  // less than minpwlength 
        var STRENGTH_WEAK = 1;  // less than fairpwlength
        var STRENGTH_FAIR = 2;  // fairpwlength or over, no numbers
        var STRENGTH_STRONG = 3; // fairpwlength or over with at least one number

        img0 = new Image();
        img1 = new Image();
        img2 = new Image();
        img3 = new Image();


        img0.src = 'images/tooshort.jpg';
        img1.src = 'images/fair.jpg';
        img2.src = 'images/medium.jpg';
        img3.src = 'images/strong.jpg';


        var strengthlevel = 0;
        var strengthimages = Array(img0.src,

                                    img1.src,

                                    img2.src,

                                    img3.src);



        function updatestrength(pw) {
            if (istoosmall(pw)) {
                strengthlevel = STRENGTH_SHORT;
            }

            else if (!isfair(pw)) {
                strengthlevel = STRENGTH_WEAK;
            }

            else if (hasnum(pw)) {
                strengthlevel = STRENGTH_STRONG;
            }

            else {
                strengthlevel = STRENGTH_FAIR;
            }

            document.getElementById('strength').src = strengthimages[strengthlevel];
        }
        function isfair(pw) {
            if (pw.length < fairpwlength) {
                return false;
            }
            else {
                return true;
            }
        }

        function istoosmall(pw) {
            if (pw.length < minpwlength) {
                return true;
            }

            else {
                return false;
            }
        }

        function hasnum(pw) {
            var hasnum = false;
            for (var counter = 0; counter < pw.length; counter++) {
                if (!isNaN(pw.charAt(counter))) {
                    hasnum = true;
                }
            }

            return hasnum;
        }
    </script>
    <%--  <style type="text/css">
        .style1
        {
            width: 265px;
        }
        .style2
        {
            width: 264px;
        }
        .style3
        {
            width: 202px;
        }
        .style4
        {
            width: 160px;
        }
        .style5
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style6
        {
            height: 72px;
        }
        .style7
        {
            height: 31px;
        }
    </style>--%>
    <style type="text/css">
        .style1
        {
            border-width: 0px;
            width: 126px;
            height: 54px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <uc1:uscTopProduct ID="uscTopProduct1" runat="server" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table style="width: 800px;">
                <tr>
                    <td style="vertical-align: top;">
                        <table style="width: 506px" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <img alt="" height="90" src="images/reg-bg-frame-top.jpg" width="506" />
                                </td>
                            </tr>
                            <tr>
                                <td style="background: transparent url('images/reg-bg-frame-mid.jpg') repeat-y scroll center top;
                                    padding: 20px; text-align: right;">
                                    <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px;
                                        padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    </div>
                                    <div style="float: right; width: 350px; vertical-align: top">
                                        <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                            font-weight: bold; width: 100px; vertical-align: top">نام کاربری (ایمیل):</span>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <div class="input-bg-normal">
                                                    <asp:TextBox ID="TextBox_Uid_Email" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                                </div>
                                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                    *</div>
                                                <div style="float: right;">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                                        ControlToValidate="TextBox_Uid_Email" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:LinkButton ID="LinkButton_check" Text="<%$ Resources:Resource, Check_Uid_Valid %>"
                                                        runat="server" OnClick="LinkButton_check_Click" CausesValidation="False"></asp:LinkButton>
                                                    <span class="formInfo"><a href="HC.aspx?id=68500&width=400" class="jTip" id="A1"
                                                        name=''>? </a></span>
                                                    <asp:Label ID="Label_Check_Alarm" runat="server"></asp:Label>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Uid_Email"
                                                        Display="Dynamic" ErrorMessage="<%$ Resources:Resource, Incorect_Email %>" ForeColor="DarkRed"
                                                        ValidationGroup="register" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    <br />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                                            <ProgressTemplate>
                                                Wait ..
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                    <div style="float: right; width: 350px">
                                        <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                            font-weight: bold; width: 100px">کلمه عبور :</span>
                                        <div class="input-bg-normal">
                                            <input runat="server" maxlength="15" onkeyup="updatestrength( this.value );" type="password"
                                                name="password" id="password" value="" class="log-login-input-item" />
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *</div>
                                        <div style="float: right; margin-right: 130px; margin-bottom: 10px;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password"
                                                ValidationGroup="register" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <img src="images/tooshort.jpg" id="strength" alt="" style="margin: 5px 10px;" />
                                            <br />
                                        </div>
                                    </div>
                                    <div style="float: right; width: 350px">
                                        <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                            font-weight: bold; width: 100px">تکرار کلمه عبور : </span>
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="TextBox_Password_Con" runat="server" TextMode="Password" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *</div>
                                        <div style="float: right">
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password"
                                                ControlToValidate="TextBox_Password_Con" ErrorMessage="<%$ Resources:Resource, Pass_not_equal %>"
                                                ForeColor="DarkRed" ValidationGroup="register"></asp:CompareValidator>
                                            <br />
                                        </div>
                                    </div>
                                    <div style="float: right; width: 350px">
                                        <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                            font-weight: bold; width: 100px">کد امنیتی : </span>
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="TextBox_Sec_Code" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *</div>
                                        <div style="float: right;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                                ControlToValidate="TextBox_Sec_Code" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <br />
                                        </div>
                                    </div>
                                    <div style="float: right; width: 300px; padding-right: 100px;">
                                        <asp:UpdatePanel ID="updSecureKey" runat="server">
                                            <ContentTemplate>
                                                <dnf:FormShield ID="FormShield1" runat="server" ImageBorderColor="Transparent" ImageBorderStyle="None"
                                                    NoiseColor="255, 128, 128" NoiseColor2="LightBlue" NoiseLevel="30" TextEffect="FontAngleWarp"
                                                    TextLength="4" Width="224px">
                                                    <RefreshIcon AlternateText="Refresh" />
                                                    <SoundIcon AlternateText="Listen" Visible="False" />
                                                    <HelpIcon AlternateText="Please enter the characters shown on the image" Visible="False" />
                                                </dnf:FormShield>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>


                                    <div style="float: right; width: 300px; padding-right: 100px;direction:rtl;">
                                         <asp:CheckBox ID="CheckBox_Agr" runat="server"  />
                                         <a href="http://www.biz.perisanweb.com/page.aspx?id=1">
                                         قوانین و مقررات را مطالعه کرده و قبول دارم
                                         </a>
                                    </div>
                                    <span style="float: right; clear: both; padding: 10px; margin-right: 180px">
                                        <asp:ImageButton ID="ImageButton_CreateAccount" runat="server" ImageUrl="~/images/reg-b-reg.jpg"
                                            OnClick="ImageButton_CreateAccount_Click" Width="123px" Height="34px" ValidationGroup="register" />
                                    &nbsp;</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <img alt="" height="23" src="images/reg-bg-frame-down.jpg" width="506" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td style="padding: 10px; padding-top: 45px; padding-bottom: 0px;">
 <center>
                                    <a href="page.aspx?id=7" 
                                        target="_blank">
                                    <img  alt="" class="style1" 
                                        src="images/GoldenUserCompany.jpg" />
                                    </a> 
</center>
                                    <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                                        <tr>
                                            <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                                width: 25px; height: 34px">
                                                <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                            </td>
                                            <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                                color: #3333ff; text-align: right;">
                                                <span class="frame-title">مزایای ثبت نام در ایران پروبیز</span>
                                            </td>
                                            <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                                width: 25px; height: 34px">
                                                <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                                width: 25px; height: 34px; border-bottom: 2px #ccc solid;">
                                                &nbsp;
                                            </td>
                                            <td style="background: #f9f9f9; color: #0196b4; text-align: right;  
                                                border-bottom: 2px #ccc solid; padding-bottom: 10px;">
                                         <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                                    <img src="images/arrow.png" alt="" width="4" height="7" />
                                                </div>
                                                <div style="float: right; width: 170px; text-align: justify;">
                                                    عضو یکی از تخصصی ترین وب سایتهای صنعت کامپیوتر می شوید.
                                                </div>
                                                <div style="width: 170px; height: 10px; float: right; clear: both;">
                                                </div>
                                                <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                                    <img src="images/arrow.png" alt="" width="4" height="7" />
                                                </div>
                                                <div style="float: right; width: 170px; text-align: justify;">
                                                    کلیه محصولات خود را به همراه توضیحات و جزئیات به راحتی آگهی نمایید.
                                                </div>
                                                <div style="width: 170px; height: 10px; float: right; clear: both;">
                                                </div>
                                                <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                                    <img src="images/arrow.png" alt="" width="4" height="7" />
                                                </div>
                                                <div style="float: right; width: 170px; text-align: justify;">
                                                    صفحه مربوط به خود را در اینرنت داشته باشید .
                                                </div>
                                                <div style="width: 170px; height: 10px; float: right; clear: both;">
                                                </div>
                                                <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                                    <img src="images/arrow.png" alt="" width="4" height="7" />
                                                </div>
                                                <div style="float: right; width: 170px; text-align: justify;">
                                                    به سادگی وارد تجارت الکترونیک شده و طیف گسترده تر و وسیعتری از مشتریان را جذب نمایید
                                                    .
                                                </div>
                                                <div style="width: 170px; height: 10px; float: right; clear: both;">
                                                </div>
                                                <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                                    <img src="images/arrow.png" alt="" width="4" height="7" />
                                                </div>
                                                <div style="float: right; width: 170px; text-align: justify;">
                                                    شرکت یا فروشگاه خود را در موتورهای جستجو نظیر گوگل و یاهو ببینید و به همگان معرفی
                                                    نمایید.
                                                </div>
                                            </td>
                                            <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                                width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                             <td rowspan="3" style="padding: 10px; padding-top: 45px; padding-bottom: 0px;" 
                                    valign="top">
                          <%--     <uc2:uscAdvertisement ID="uscAdvertisement1" runat="server" ZoneID="16" />--%>
                             
                                </td> 
                            </tr>
                            <tr>
                                <td style="padding: 10px; padding-bottom: 0px;">
                                    <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                                        <tr>
                                            <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                                width: 25px; height: 34px">
                                                <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                            </td>
                                            <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                                color: #3333ff; text-align: right;">
                                                <span class="frame-title">نظرات و پیشنهادات</span>
                                            </td>
                                            <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                                width: 25px; height: 34px">
                                                <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                                width: 25px; height: 34px; border-bottom: 2px #ccc solid;">
                                                &nbsp;
                                            </td>
                                            <td style="background: #f9f9f9; color: #0196b4; text-align: right; line-height: 17px;
                                                border-bottom: 2px #ccc solid; padding-bottom: 10px;">
                                                <div style="float: right; width: 170px; text-align: justify;">
                                                    نظرات و پیشنهادات خود را در خصوص بهبود ومشکلات سایت از طریق <a style="text-decoration: underline;"
                                                        href="#">صفحه تماس </a>، با ما در میان بگذارید
                                                </div>
                                            </td>
                                            <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                                width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 10px;">
                                    <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                                        <tr>
                                            <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                                width: 25px; height: 34px">
                                                <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                            </td>
                                            <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                                color: #3333ff; text-align: right;">
                                                <span class="frame-title">ایران پروبیز را معرفی نمائید. </span>
                                            </td>
                                            <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                                width: 25px; height: 34px">
                                                <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                                width: 25px; height: 34px; border-bottom: 2px #ccc solid;">
                                                &nbsp;
                                            </td>
                                            <td style="background: #f9f9f9; color: #0196b4; text-align: right; line-height: 20px;
                                                border-bottom: 2px #ccc solid; padding-bottom: 10px;">
                                                ایران پروبیز را به دوستان و همکاران خود پیشنهاد دهید.
                                                <br />
                                                <div style="float: right;">
                                                    پست الکترونیک:
                                                </div>
                                                <div class="input-bg-normal2" dir="ltr">
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="log-login-input-item2"></asp:TextBox>
                                                </div>
                                                <div style="float: right;">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ValidationGroup="Invite"
                                                        ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <div style="float: left; padding-left: 5px;">
                                                    <asp:ImageButton ImageUrl="~/images/btnSend.png" runat="server" ID="btnSendEmail"
                                                        OnClick="btnSendEmail_Click" ValidationGroup="Invite" />
                                                </div>
                                            </td>
                                            <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                                width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="0" class="style5">
                <tr>
                    <td align="center">
                        <img alt="" height="155" src="images/haer-reg.jpg" width="872" />
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table cellpadding="0" style="width: 880px;">
                            <tr>
                                <td style="width: 640px;">
                                    <img alt="" src="images/welreg.JPG" />
                                </td>
                                <td style="width: 240px; vertical-align: middle;">
                                    <asp:Label ID="Label_Success" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
