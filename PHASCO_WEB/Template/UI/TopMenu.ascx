<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="PHASCO_WEB.Template.UI.Top" %>
<!--header =====================================================!-->
<%@ Register Src="../../UI/Membership.ascx" TagName="Membership" TagPrefix="uc1" %>

<header class="clearfix">

    <div class="navbar navbar-default navbar-fixed-top">
        <div class="top-line">
            <div class="container">

                <p>
                    <span><i class="fa fa-phone"></i>+98-21-44711870-73</span>
                    <span><i class="fa fa-envelope-o"></i>info@phasco.com</span>

                </p>
                <ul class="social-icons">

                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                    <li><a class="google" href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a class="linkedin" href="#"><i class="fa fa-instagram"></i></a></li>
                    <li><a class="pinterest" href="#"><i class="fa fa-telegram"></i></a></li>

                </ul>
            </div>
        </div>
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="hamburger is-closed hidden-lg hidden-md" data-toggle="offcanvas">
                    <span class="hamb-top"></span>
                    <span class="hamb-middle"></span>
                    <span class="hamb-bottom"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img alt="" src="images/logo.png"></a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <asp:HyperLink ID="HyperLink239" runat="server" EnableViewState="False"
                            NavigateUrl="~\default.aspx">صفحه اصلی <i class="fa fa-home" aria-hidden="true"></i>
                        </asp:HyperLink>
                    </li>

                    <li class="drop">
                        <a id="elmi-menu" href="#">علمی کاربردی</a>
                        <ul class="drop-down">
                            <li>
                                <asp:HyperLink ID="HyperLink238" runat="server" EnableViewState="False"
                                    NavigateUrl="~\Article.aspx">مقالات</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink ID="HyperLink237" runat="server" EnableViewState="False"
                                    NavigateUrl="~\atlas.aspx">اطلس ها</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink ID="HyperLink5" runat="server" EnableViewState="False"
                                    NavigateUrl="~\video\">ویدئوها</asp:HyperLink></li>

                            <li>
                                <asp:HyperLink ID="HyperLink3" runat="server" EnableViewState="False"
                                    NavigateUrl="~\quiz\makequiz.aspx">آزمون</asp:HyperLink></li>

                            <li>
                                <asp:HyperLink ID="HyperLink4" runat="server" EnableViewState="False"
                                    NavigateUrl="~\QuestionsBank.aspx">بانک سوالات</asp:HyperLink></li>



                        </ul>
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink234" runat="server" CssClass="blog-menu"  EnableViewState="False"
                            NavigateUrl="~\webloglist.aspx">  وبلاگ ها <i class="fa fa-rss"  aria-hidden="true"></i></asp:HyperLink></li>

                    <li>
                        <asp:HyperLink ID="HyperLink236" runat="server" CssClass="faq-menu" EnableViewState="False"
                            NavigateUrl="~\FAQList.aspx"> پرسش و پاسخ <i class="fa fa-question" aria-hidden="true"></i> </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink233" runat="server" CssClass="lab-menu" EnableViewState="False"
                            NavigateUrl="~\LabDirectory.aspx">آزمایشگاه ها<i class="fa fa-flask" aria-hidden="true"></i></asp:HyperLink></li>

                    <li>
                        <asp:HyperLink ID="HyperLink240" runat="server" EnableViewState="False"
                            NavigateUrl="~\CoDirectory.aspx">شرکت ها<i class="fa fa-building-o" aria-hidden="true"></i></asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="HyperLink2" runat="server" EnableViewState="False"
                            NavigateUrl="~\jobs.aspx">کار و کاریابی <i class="fa fa-handshake-o" aria-hidden="true"></i></asp:HyperLink></li>

                    <li>
                        <asp:HyperLink ID="HyperLink235" runat="server" EnableViewState="False"
                            NavigateUrl="~\news.aspx"> اخبار <i class="fa fa-globe" aria-hidden="true"></i></asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="HyperLink6" runat="server" CssClass="bazar-menu" EnableViewState="False"
                            NavigateUrl="~\bazar\">بازار <i class="fa fa-shopping-basket" aria-hidden="true"></i></asp:HyperLink>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal"  data-keyboard="true" data-target="#membership-modal" id="MenuLogin" runat="server" role="button" aria-expanded="false">ورود به فاسکو <i class="fa fa-user"></i>
                        </a>
                        <a href="#" data-toggle="modal"  data-keyboard="true" data-target="#membership-modal" id="MenuAccount" runat="server" role="button" aria-expanded="false">حساب کاربری <i class="fa fa-user"></i>
                        </a>
                    </li>


                </ul>
            </div>


            <div class="overlay"></div>

            <!-- Sidebar -->
            <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
                <ul class="nav sidebar-nav">
                    <li>
                        <asp:HyperLink ID="HyperLink7" runat="server" EnableViewState="False"
                            NavigateUrl="~\default.aspx">صفحه اصلی <i class="fa fa-home" aria-hidden="true"></i>
                        </asp:HyperLink>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">علمی کاربردی <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <li>
                                <asp:HyperLink ID="HyperLink20" runat="server" EnableViewState="False"
                                    NavigateUrl="~\Article.aspx">مقالات</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink ID="HyperLink21" runat="server" EnableViewState="False"
                                    NavigateUrl="~\atlas.aspx">اطلس ها</asp:HyperLink></li>
                            <li>
                                <asp:HyperLink ID="HyperLink22" runat="server" EnableViewState="False"
                                    NavigateUrl="~\video\">ویدئوها</asp:HyperLink></li>

                            <li>
                                <asp:HyperLink ID="HyperLink23" runat="server" EnableViewState="False"
                                    NavigateUrl="~\quiz\makequiz.aspx">آزمون</asp:HyperLink></li>

                            <li>
                                <asp:HyperLink ID="HyperLink24" runat="server" EnableViewState="False"
                                    NavigateUrl="~\QuestionsBank.aspx">بانک سوالات</asp:HyperLink></li>
                        </ul>
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink13" runat="server" EnableViewState="False"
                            NavigateUrl="~\webloglist.aspx">  وبلاگ ها <i class="fa fa-rss" aria-hidden="true"></i></asp:HyperLink></li>

                    <li>
                        <asp:HyperLink ID="HyperLink14" runat="server" EnableViewState="False"
                            NavigateUrl="~\FAQList.aspx"> پرسش و پاسخ <i class="fa fa-question" aria-hidden="true"></i> </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink15" runat="server" EnableViewState="False"
                            NavigateUrl="~\LabDirectory.aspx">آزمایشگاه ها<i class="fa fa-flask" aria-hidden="true"></i></asp:HyperLink></li>

                    <li>
                        <asp:HyperLink ID="HyperLink16" runat="server" EnableViewState="False"
                            NavigateUrl="~\CoDirectory.aspx">شرکت ها<i class="fa fa-building-o" aria-hidden="true"></i></asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="HyperLink17" runat="server" EnableViewState="False"
                            NavigateUrl="~\jobs.aspx">کار و کاریابی <i class="fa fa-handshake-o" aria-hidden="true"></i></asp:HyperLink></li>

                    <li>
                        <asp:HyperLink ID="HyperLink18" runat="server" EnableViewState="False"
                            NavigateUrl="~\news.aspx"> اخبار <i class="fa fa-globe" aria-hidden="true"></i></asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="HyperLink19" runat="server" EnableViewState="False"
                            NavigateUrl="~\bazar\">بازار <i class="fa fa-shopping-basket" aria-hidden="true"></i></asp:HyperLink>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#membership-modal" id="A2" runat="server" role="button" aria-expanded="false">ورود به فاسکو <i class="fa fa-user"></i>
                        </a>
                        <a href="#" data-toggle="modal" data-target="#membership-modal" id="A3" runat="server" role="button" aria-expanded="false">حساب کاربری <i class="fa fa-user"></i>
                        </a>
                    </li>

                </ul>
            </nav>

            <!-- /#sidebar-wrapper -->

            <script type="text/javascript">
                $(document).ready(function () {
                    var trigger = $('.hamburger'),
                        overlay = $('.overlay'),
                       isClosed = false;

                    trigger.click(function () {
                        hamburger_cross();
                    });
                    overlay.click(function () {
                        trigger.click();
                    });

                    function hamburger_cross() {

                        if (isClosed == true) {
                            overlay.hide();
                            trigger.removeClass('is-open');
                            trigger.addClass('is-closed');
                            isClosed = false;
                        } else {
                            overlay.show();
                            trigger.removeClass('is-closed');
                            trigger.addClass('is-open');
                            isClosed = true;
                        }
                    }

                    $('[data-toggle="offcanvas"]').click(function () {
                        $('#wrapper').toggleClass('toggled');
                    });
                });
            </script>

        </div>
    </div>
</header>
<uc1:Membership ID="Membership1" runat="server" />
<!-- End Header -->
<asp:Panel runat="server" Visible="false" ID="UserOnline_Panle">

    <table style="width: 100%; display: none; direction: rtl;">
        <tr>
            <td style="width: 5%">

                <!-- ******************** notification ********************************* -->
                <div id='container'>

                    <div id='content'>
                        <div id='osx-modalo'>
                            <a href='#' class='osx' title="اطلاعیه ها">
                                <table style="width: 62px; height: 28px;">
                                    <tr>
                                        <td style="background: transparent url('/images/notiAalarm.png') no-repeat scroll right top; width: 62px; height: 28px; text-align: left; padding: 0px 0px 0px 5px; color: #cc0001;"></td>
                                    </tr>
                                </table>
                            </a>
                        </div>

                        <!-- modal content -->
                        <div id="osx-modal-content">
                            <div id="osx-modal-title">اطلاعیه ها </div>
                            <div class="close"><a href="#" class="simplemodal-close">x</a></div>
                            <div id="osx-modal-data">
                                <iframe src="/notifiList.aspx" title="-" style="width: 550px; height: 500px;"></iframe>
                                لیست کامل ...
				<p>
                    <button class="simplemodal-close">بسته شود</button>
                    <span>(یا برای خروج کلید Esc را بزنید)</span>
                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- ******************** notification ********************************* -->
            </td>
            <td style="width: 95%">
                <div style="height: 20px; width: 100%; padding-right: 10px; padding-bottom: 5px;">

                    <a id="A1" href="~\myhome.aspx" runat="server">فاسکو من (<asp:Label ID="Label_Name" runat="server" Text="Label"></asp:Label>)
                    </a>&nbsp; |&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~\UserMssg.aspx">صندوق پیام</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink_MailNumber" runat="server" ForeColor="Red" NavigateUrl="~\UserMssg.aspx">
[HyperLink_MailNumber]
                    </asp:HyperLink>
                    &nbsp;| امتیاز من (<asp:Label ID="Label_Point" runat="server"></asp:Label>) &nbsp;|
        &nbsp;|بانک من (<asp:Label ID="Label_phasny" runat="server"></asp:Label>&nbsp;فاسنی) &nbsp;|
        <asp:LinkButton ID="LinkButton_Logof" runat="server" OnClick="LinkButton_Logof_Click">خروج</asp:LinkButton>
                </div>
            </td>

        </tr>
    </table>


</asp:Panel>
<!-- ******************** notification ********************************* -->
<!-- Load JavaScript files -->
<%--<script type='text/javascript' src='/NotificatoinsJS/jquery.js'></script>
<script type='text/javascript' src='/NotificatoinsJS/jquery.simplemodal.js'></script>
<script type='text/javascript' src='/NotificatoinsJS/osx.js'></script>--%>
<!-- ******************** notification ********************************* -->

