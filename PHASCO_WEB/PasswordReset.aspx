<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Master_Phasco.Master" CodeBehind="PasswordReset.aspx.cs" Inherits="PHASCO_WEB.PasswordReset" %>

<asp:Content runat="server" ContentPlaceHolderID="head_Meta">
</asp:Content>

<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
	<div class="row">
		<div class="col-md-3 pull-right"></div>
		<div class="sidebar-widgets col-md-6 col-xs-9 pull-right">
			<div class="text-widget widget">
				<h5>فراموشی رمز عبور</h5>
				<div class="contact-form">
					<div class="text-input">
						<div class="float-input">
							<asp:TextBox ID="TextBox_Email_Forgot" placeholder="ایمیل" runat="server"></asp:TextBox>
							<span><i class="fa fa-envelope"></i></span>
						</div>

						<div>
							<asp:Button ID="Button3" CssClass="submit_contact main-form full-width" runat="server" OnCommand="Button_Send_Pass_Command"
								Text="ارسال شود" OnClick="Button_Send_Pass_Click" />

						</div>
					</div>

				</div>

				<script>
					$("#<%= TextBox_Email_Forgot.ClientID %>").keyup(function (event) {
						if (event.keyCode == 13) {
							$("#ctl00_Membership1_Button3").click();
						}
					});
				</script>
			</div>
		</div>
	</div>


</asp:Content>
