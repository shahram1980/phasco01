<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscInvite.ascx.cs" Inherits="BiztBiz.UC.uscInvite" %>
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
            پست الکترونیک:
            <br />
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
