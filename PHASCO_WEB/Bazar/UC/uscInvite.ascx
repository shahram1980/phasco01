<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscInvite.ascx.cs" Inherits="BiztBiz.UC.uscInvite" %>
<asp:Panel runat="server" ID="PanelInvite" DefaultButton="btnSendEmail">




      <div class="shop-widget">
        <h4>معرفی سایت به دوستان</h4>
        <div class="price-range contact-form">
            <div class="text-input">
                <div class="float-input">

   <asp:TextBox ID="txtEmail" placeholder="تایپ آدرس ایمیل" runat="server" CssClass="log-login-input-item2"></asp:TextBox>                    <span><i class="fa fa-envelope"></i></span>
   <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ValidationGroup="Invite"
                    ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>

                </div>

                <div>

                    <asp:Button ID="btnSendEmail" CssClass="full-width" runat="server" OnClick="btnSendEmail_Click" Text="ارسال شود"
                        ValidationGroup="name" /><br />
                                    <asp:Label runat="server" ID="lbl_Alaram" ForeColor="Maroon" />

                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>--%>

                </div>
            </div>
        </div>
    </div>
</asp:Panel>