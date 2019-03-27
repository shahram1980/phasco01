<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Membership.ascx.cs"
    Inherits="phasco_webproject.UI.Membership" %>

<asp:MultiView ID="MultiView1" runat="server">

    <asp:View ID="View1" runat="server">

        <div id="membership-modal" class="modal fade modal-sm" tabindex='-1' role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header rtl-text">
                        <button type="button" class="close pull-left" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">ورود به فاسکو</h4>
                    </div>
                    <div class="modal-body">
                        <div class="text-widget widget">

                            <div class="contact-form">
                                <div class="text-input">
                                    <div class="col-md-12">
                                        <div class="float-input">
                                            <asp:TextBox ID="TextBox_Uid" name="name" runat="server" placeholder="نام کاربری"></asp:TextBox>
                                            <span><i class="fa fa-user"></i></span>
                                        </div>
                                        <div class="float-input">
                                            <asp:TextBox ID="TextBox_Pass" runat="server" placeholder="کلمه عبور" TextMode="Password"
                                                autocomplete="off"></asp:TextBox>

                                            <span><i class="fa fa-lock"></i></span>
                                        </div>
                                        <div>
                                            <asp:Button runat="server" ID="Button_Login" CssClass="submit_contact main-form full-width" OnClick="ImageButton_Login_Click" Text="ورود" />
                                            <asp:HiddenField ID="RedirectUrl" runat="server" />
                                            <%--<asp:Button runat="server" ID="Button_ForgotPass" CssClass="submit_contact main-form pull-left" OnClick="ImageButton_ForgotPass_Click" Text="رمز عبور را فراموش کرده ام" />--%>
                                        </div>

                                    </div>

                                    <div class="col-sm-6">
                                        <a class="btn btn-primary btn-block" href="/PasswordReset.aspx">رمز عبور را فراموش کرده ام</a>


                                    </div>

                                    <div class="col-sm-6">

                                        <a class="btn btn-primary btn-block" href="/Register.aspx">ثبت نام در فاسکو</a>
                                    </div>

                                </div>
                            </div>

                            <script>

                                $("#<%= TextBox_Uid.ClientID %>").keyup(function (event) {
                                    if (event.keyCode == 13) {
                                        $("#ctl00_Membership1_Button_Login").click();
                                    }
                                });
                                $("#<%= TextBox_Pass.ClientID %>").keyup(function (event) {
                                    if (event.keyCode == 13) {
                                        $("#ctl00_Membership1_Button_Login").click();
                                    }
                                });
                            </script>
                        </div>
                    </div>
                    <%--<div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>--%>
                </div>
            </div>
        </div>
    </asp:View>
    <asp:View ID="View2" runat="server">

        <div id="membership-modal" class="modal fade" data-replace="true" tabindex='-1' style="display: none;">
            <div class="modal-dialog modal-sm">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header rtl-text">
                        <button type="button" class="close pull-left" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">حساب کاربری</h4>
                    </div>
                    <div class="modal-body">
                        <div class="profile-card">
                            <asp:Image ID="Image_User" runat="server" CssClass="profile-photo" />

                            <h5><span class="text-white">
                                <asp:Label ID="Label_Sex" runat="server" Text="Label"></asp:Label>
                                <asp:Label ID="Label_Name" runat="server" Text="Label"></asp:Label></span></h5>
                            <p class="text-white">
                                <i class="fa fa-star"></i>امتياز شما
                                 <asp:Label ID="Label_Point" runat="server"></asp:Label>
                            </p>
                            <p class="text-white">
                                <i class="fa fa-money"></i>فاسنی
                                 <asp:Label ID="Label_phasny" runat="server"></asp:Label>
                            </p>
                            <p class="text-white">
                                <i class="fa fa-sun-o"></i>روزشمار امتياز
                                  <asp:Label ID="Label_Daily" runat="server"></asp:Label>
                            </p>
                            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="text-white" NavigateUrl="/EditUser.aspx?mode=pro">  <i class="fa fa-pencil-square-o"> </i>ويرايش پروفایل </asp:HyperLink>
                        </div>

                        <ul class="nav-news-feed">
                            <li>
                                <div><a href="\myhome.aspx">فاسکوی من</a></div>
                            </li>
                                   <li>
                                <div><a href="/EditUser.aspx?mode=pss&upd=true">تغییر رمز عبور</a></div>
                            </li>
                            <li>
                                <div><a href="/bazar/mybiztbiz/">دفتر کار من</a></div>
                            </li>
                             <li>
                                <div><a href="\Blogeditor.aspx">وبلاگ من</a></div>
                            </li>
                             <li>
                                <div>
                                    <a href="\UserMssg.aspx">صندوق پیام</a>
                                    <asp:HyperLink ID="HyperLink_MailNumber" runat="server" NavigateUrl="\UserMssg.aspx"
                                        ForeColor="Red">[HyperLink_MailNumber]</asp:HyperLink>
                                </div>
                            </li>
                               <li>
                                <div><a href="\SendMss.aspx">ارسال پیام</a></div>
                            </li>
                            <li>
                                <div><a data-toggle="modal" href="#notif-modal">اطلاعیه ها</a></div>
                            </li>

                           
                         
                            <li>
                                <div><a href="\UserOutBox.aspx">نامه های ارسالی</a></div>
                            </li>
                            <li>
                                <div><a href="\Jobs.aspx">کارجو و کارفرمای فاسکو</a></div>
                            </li>
                            <li>
                                <div><a href="\FormLab.aspx">فرم مشخصات آزمايشگاه</a></div>
                            </li>
                            <li>
                                <div><a href="\Formfed.aspx?mode=err">فرم رفع اشکال</a></div>
                            </li>
                            <li>
                                <div><a href="\Formfed.aspx?mode=od">فرم ارسال OD</a></div>
                            </li>
                            <li>
                                <div><a href="\Quiz\MyQuiz.aspx">کارنامه آزمون های من</a></div>
                            </li>
                           
                            <li>
                                <div>
                                    <asp:LinkButton ID="LinkButton_Logout" runat="server" OnClick="LinkButton_Logout_Click">خروج از فاسکو</asp:LinkButton>
                                </div>
                            </li>
                        </ul>
                        <asp:Label ID="Label_DAY" runat="server" Font-Bold="True" Visible="false" />


                    </div>
                    <%--<div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>--%>
                </div>
            </div>
        </div>

        <div id="notif-modal" class="modal fade" style="display: none;">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">اطلاعیه ها</h4>
                    </div>
                    <div class="modal-body">
                        <iframe src="/notifiList.aspx" title="-" style="width: 550px; height: 500px;"></iframe>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="dropdown-menu form-login stop-propagation " role="menu">
        </div>
    </asp:View>
    <asp:View ID="View3" runat="server">
    </asp:View>
</asp:MultiView>
<script type="text/javascript">
    $('.stop-propagation').click(function (e) {
        e.stopPropagation();
    });
</script>
