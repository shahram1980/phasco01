<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscRegisterHome.ascx.cs"
    Inherits="BiztBiz.UC.uscRegisterHome" %>
<%@ Register Src="../../UI/Membership_bazar.ascx" TagName="Membership_bazar" TagPrefix="uc1" %>
<table style="width: 193px" cellpadding="0" cellspacing="0" runat="server" id="TblLogin">
    <tr>
        <td>
            <img alt="" height="8" src="images/new-frame-11-top.jpg" width="193" />
        </td>
    </tr>
    <tr>
        <td style="background: transparent  url('images/new-frame-11--mid.jpg') repeat-y scroll center top;
            padding: 10px; color: #1eb3d7; text-align: center">
            <uc1:Membership_bazar ID="Membership_bazar1" runat="server" />
            <asp:Panel runat="server" ID="Panel_Regifter">
                <br />
                <strong style="font-size: 12px;">عضو فاسکو نیستید !</strong>
                <br />
                <a href="http://www.phasco.com/register.aspx" title="عضویت رایگان در سایت فاسکو">
                    <img alt="" height="41" src="images/reg-fre.jpg" width="124" /></a>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
            <img alt="" height="8" src="images/new-fanme-down.jpg" width="193" />
        </td>
    </tr>
</table>
