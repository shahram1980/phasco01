<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BiztBiz.Contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .frm td
        {
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="frmContacts" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="scrmanager" runat="server" ScriptMode="Debug">
    </ajaxToolkit:ToolkitScriptManager>
    <asp:UpdatePanel ID="updContact" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="muvContact" runat="server">
                <asp:View ID="vwContact" runat="server">
                <div id="FeildComplate" runat="server" style="width: 520px; height: auto;
background: #F7D9DD; margin: 15px; float: right; font: bold 11px tahoma; color: #DC1733;
padding: 10px;direction:rtl;">
                    لطفا موارد ستاره دا ر&nbsp; را تکمیل نمائید.<br />
  </div> 
                    <div style="width: 550px; margin: 20px; height: 450px;">
                        <div>
                            <h3>
                                <%--ارسال مستقیم پیغام برای فروشنده--%>
                                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                            </h3>
                        </div>
                        <table class="frm">
                            <tr>
                                <td>
                                    دریافت کننده :
                                </td>
                                <td>
                                    <asp:Label ID="lblReciverName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    موضوع :
                                </td>
                                <td>
                                    <div class="input-bg-normal">
                                        <asp:TextBox ID="txtSubject" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                    </div>
                                    <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                        *</div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                        ControlToValidate="txtSubject" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    پیغام :
                                </td>
                                <td>
                                    <div class="multiinput-bg-normal">
                                        <asp:TextBox ID="txtMessages" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
                                    </div>
                                    <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                        *</div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                                        ControlToValidate="txtMessages" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <fieldset>
                            <legend>اطلاعات تماس شما:</legend>
                            <table class="frm">
                                <tr>
                                    <td>
                                        آدرس ایمیل شما :
                                    </td>
                                    <td>
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="txtSenderEmail" runat="server" Width="215px" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *</div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="register"
                                            ControlToValidate="txtSenderEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSenderEmail"
                                            Display="Dynamic" ErrorMessage="ایمیل نامعتبر" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        نام :
                                    </td>
                                    <td>
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *</div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="register"
                                            ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                            ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        تلفن تماس :
                                    </td>
                                    <td>
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="txtTelNum" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *</div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="register"
                                            ControlToValidate="txtTelNum" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <table class="frm">
                            <tr>
                                <th>
                                </th>
                                <td style="padding-right: 50px;">
                                    <asp:Button runat="server" CssClass="pi-pro-b-bg" ID="btnSend" OnClick="btnSend_Click"
                                        Text="ارسال پیام" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="vwmessage" runat="server">
                    <div style="width: 500px; margin: 20px; height: 400px; padding: 20px;">
                        <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
<%--<script type="text/javascript">
    jQuery(document).ready(function () {
        $(".popup-close").click(function () {
            if (parent.closeColorBox)
                parent.closeColorBox();
            return false;
        });
    });        
</script>--%>
</html>
