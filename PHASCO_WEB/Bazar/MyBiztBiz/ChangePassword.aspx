<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="BiztBiz.MyBiztBiz.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
        </div>
        <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000;">
            <table style="width: 450px; padding: 50px 30px;" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                        <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px;
                            padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 120px">رمز عبور قبلی : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="log-login-input-item" TextMode="Password"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                ControlToValidate="txtOldPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 120px">رمز عبور جدید : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="log-login-input-item" TextMode="Password"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                ControlToValidate="txtNewPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 120px">تکرار رمز عبور : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="txtConNewPassword" runat="server" CssClass="log-login-input-item"
                                    TextMode="Password"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <div style="float: right">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
                                    ControlToValidate="txtConNewPassword" ErrorMessage="<%$ Resources:Resource, Pass_not_equal %>"
                                    ForeColor="DarkRed" ValidationGroup="register"></asp:CompareValidator>
                            </div>
                        </div>
                        <div style="float: right; width: 350px;">
                            <div style="float: right; width: 180px;">
                                &nbsp;
                            </div>
                            <div style="float: right; width: 170px;">
                                <asp:Button SkinID="btnNormal" runat="server" ID="BtnChangePass" OnClick="BtnChangePass_Click"
                                    ValidationGroup="register" Text="تغییر رمز عبور" />
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right">
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" />
        </div>
    </div>
</asp:Content>
