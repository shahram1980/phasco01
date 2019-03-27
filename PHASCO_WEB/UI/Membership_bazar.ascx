<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Membership_bazar.ascx.cs" Inherits="PHASCO_WEB.UI.Membership_bazar" %>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
      
       
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButton_Login">
                            <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
                                <tr>
                                    <td align="right" style="width: 100%">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td align="center" style="height: 25px">
                                                    <table style="width: 100%">
                                                        <tr>
                                                          
                                                            <td align="right"  valign="top">
                                                       
                                                                 <div class="h-login-input" dir="ltr">
<asp:TextBox ID="TextBox_Uid" runat="server"  CssClass="h-login-input-item"></asp:TextBox>
                </div>
                                                  <div class="h-login-input" dir="ltr">
                                                                <asp:TextBox ID="TextBox_Pass" runat="server"   TextMode="Password"  CssClass="h-login-input-item">كلمه عبور</asp:TextBox>
                                                                </div>                             
                                                            </td>
                                                        </tr>
                                                   
                                                    </table>
                                                                    <script type="text/javascript" language="javascript">
                                                                        $(function () {
                                                                            $("#<%=TextBox_Uid.ClientID %>").watermark("نام کاربری");
                                                                            $("#<%=TextBox_Pass.ClientID %>").watermark("رمز عبور");
                                                                        });

                                                                        function InvalidUser() {
                                                                            alert("نام کاربری یا رمز عبور اشتباه می باشد");
                                                                        }
                </script>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">
                                                <div style="float:right;padding-right:4px;">
                                                    <asp:ImageButton ID="ImageButton_Login" runat="server" ImageUrl="~/Bazar/images/log-bu-login.jpg"
                                                        OnClick="ImageButton_Login_Click" />
                                                        </div>
          <div style="float:right;padding-right:2px;">
                                                    <asp:ImageButton ID="ImageButton_ForgotPass" runat="server" ImageUrl="~/Bazar/Images/forgotpass.jpg"
                                                        OnClick="ImageButton_ForgotPass_Click" />
                                                        </div>
                                                     
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                               
                            </table>
                        </asp:Panel>
          
  
    </asp:View>
    <asp:View ID="View2" runat="server">
<%--        <table style="width: 100%; margin-top: 10px">
           
 <tr>               <td  style="text-align:right;padding:2px 2px 2px 2px">

                .:&nbsp; 

                <a href="/myhome.aspx"> فاسکو من </a>
                <br />
                .:&nbsp;  <a href="/bazar/MyBiztBiz/"> دفتر کار من </a>
                <br />
                    .:&nbsp;  <asp:LinkButton ID="LinkButton_Logout" runat="server" OnClick="LinkButton_Logout_Click">خروج از سيستم</asp:LinkButton>
                </td>
            </tr>
        </table>--%>
    </asp:View>
    <asp:View ID="View3" runat="server">
        <div style="text-align: center">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 115px">
                <tr>
                    <td style="width: 100%; background-color: #ccc1a7" valign="middle">
                        <br />
                        <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 239px">
                            <tr>
                                <td align="center" style="width: 100%">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td align="center" colspan="2" style="height: 25px">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td align="left" style="width: 30%" valign="top">
                                                            ایمیل :
                                                        </td>
                                                        <td align="right" style="width: 70%" valign="top">
                                                            <asp:TextBox ID="TextBox_Email_Forgot" runat="server" Height="20px" Width="135px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Button ID="Button_Send_Pass" runat="server" OnCommand="Button_Send_Pass_Command"
                                                    Text="ارسال شود" OnClick="Button_Send_Pass_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="height: 25px">
                                                <a href="Default.aspx">ورود به سایت&nbsp;<br />
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100%">
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </asp:View>
</asp:MultiView>