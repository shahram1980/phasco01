<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscInviteHome.ascx.cs"
    Inherits="BiztBiz.UC.uscInviteHome" %>
<asp:Panel runat="server" ID="PanelInvite" DefaultButton="btnSendEmail">

    <div class="shop-widget">
        <h4>معرفی سایت به دوستان</h4>
        <div class="price-range contact-form">
            <div class="text-input">
                <div class="float-input">

                    <asp:TextBox ID="txtEmail" runat="server" placeholder="تایپ آدرس ایمیل"></asp:TextBox>
                    <span><i class="fa fa-envelope"></i></span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Invite"
                        ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>

                </div>

                <div>

                    <asp:Button ID="btnSendEmail" CssClass="full-width" runat="server" OnClick="btnSendEmail_Click" Text="ارسال شود"
                        ValidationGroup="name" /><br />
                    <asp:Label runat="server" ID="lbl_Alaram" ForeColor="Maroon" />


                </div>
            </div>
        </div>
    </div>

</asp:Panel>
