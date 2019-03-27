<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscTopSite.ascx.cs"
    Inherits="BiztBiz.UC.uscTopSite" %>

<table class="table-header">
    <tr>
        <td  style="width:150px;vertical-align:middle;">
                  <%--<a href="<%= SiteFolder %>Default.aspx" style="cursor: pointer; text-decoration: none;">
                صفحه اصلی سایت </a>--%>
            <a href="<%= SiteFolder %>Default.aspx" style="margin: 0 4px;">خانه </a>&nbsp;|&nbsp;<a
                href="<%= SiteFolder %>page.aspx?id=3" style="margin: 0 4px;"> راهنما </a>&nbsp;|&nbsp;<a
                    href="<%= SiteFolder %>page.aspx?id=4" style="margin: 0 4px;"> درباره ما
            </a>
        </td>
            <td   class="h-date">
                        <img alt="" height="18" src="<%= ImgSiteFolder %>NEW-ICON-TOP-time.jpg" width="17"
                style="vertical-align: middle;" />
            امروز &nbsp;
            <%=QLink.Helpers.DateHelper.GregorianToJalaali(DateTime.Now.ToString(), 1) %>
        </td>
            <td  class="h-login">
            <asp:Panel DefaultButton="btnLogin" ID="pnlLogin" runat="server">
 <div class="h-login-b">
                    <asp:ImageButton ID="btnLogin" runat="server" ImageUrl="~/images/new-icon-top-singin.jpg"
                        Height="20px" Width="20px" OnClick="btnLogin_Click" CssClass="icon-login" />
                </div>
               <div class="h-login-input" dir="ltr">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="h-login-input-item" TextMode="Password"></asp:TextBox>
                </div>
               
                <div class="h-login-input" dir="ltr">
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="h-login-input-item"></asp:TextBox>
                </div>
 
                <script type="text/javascript" language="javascript">
                    $(function () {
                        $("#<%=txtUserName.ClientID %>").watermark("نام کاربری");
                        $("#<%=txtPassword.ClientID %>").watermark("رمز عبور");
                    });

                    function InvalidUser() {
                        alert("نام کاربری یا رمز عبور اشتباه می باشد");
                    }
                </script>
            </asp:Panel>
                        <asp:Panel runat="server" id="userPanel" Visible="false">
            <div style="float: left; padding: 2px 10px;">
                <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" Text="خروج"></asp:LinkButton>
            </div>
            <div style="float: left; padding: 2px 10px;">
                <img src="<%= ImgSiteFolder %>new-icon-top-settinh.jpg" alt="" width="18" height="18"
                    style="vertical-align: middle;" />
                <asp:HyperLink ID="lnkUserInfo" runat="server" Text="پنل کاربری" NavigateUrl="~/MyBiztBiz/Default.aspx"></asp:HyperLink>
            </div>
            <div style="float: left; padding: 2px 10px;">
                <img src="<%= ImgSiteFolder %>NEW-ICON-TOP-user.jpg" alt="" width="19" height="17"
                    style="vertical-align: middle;" />
                <div style="float: left; padding-top: 2px; padding-right: 5px;">
                    <asp:Label ID="lblUserInfo" runat="server"></asp:Label>
                </div>
            </div>
</asp:Panel>
        </td>
             <td  class="h-reg" runat="server" id="userregister" visible="false">
                           <a href="http://www.phasco.com/register.aspx">
                <img alt="" height="20" src="<%= ImgSiteFolder %>new-icon-top-register.jpg" width="20"
                    style="vertical-align: middle;" />
                عضویت در سایت </a>
        </td>
    </tr>
</table>
 

