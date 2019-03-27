<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscPanelMenu.ascx.cs"
    Inherits="BiztBiz.UC.uscPanelMenu" %>
<div style="width: 180px; float: right; text-align: right; padding: 10px">
    <h2 style="color: #99cccc; font-family: Arial, Helvetica, sans-serif">
        منوی کاربری</h2>
    <div id="defaultpannel" class="cp-menu-bg">
        <a href="default.aspx">پنل کاربری </a>
    </div>
    <div id="productmanage" class="cp-menu-bg">
        <a href="Products.aspx?5061676556696577=30&537461747573=31">مدیریت محصولات </a>
    </div>
    <div id="requestmanage" class="cp-menu-bg">
        <a href="Requests.aspx?5061676556696577=30&537461747573=31">مدیریت درخواست های خرید
        </a>
    </div>
    <div id="companymanage" class="cp-menu-bg">
        <a href="company_profile.aspx">پروفایل شرکت </a>
    </div>
    <div id="ProfileView" class="cp-menu-bg">
        <asp:HyperLink ID="lnkProfileView" runat="server" Text="مشاهده پروفایل "></asp:HyperLink>
    </div>
    <div id="newsmanage" class="cp-menu-bg">
        <a href="News.aspx?statue=edit">اخبار </a>
    </div>
    <div id="profilemanage" class="cp-menu-bg">
        <a href="ProfileSetting.aspx">ویرایش مشخصات فردی </a>
    </div>
 
    <div id="inquirymanage" class="cp-menu-bg">
        <a href="inquiry_List.aspx">درخواست ها / پیام ها </a>
    </div>
    <div id="Logoutmanage" class="cp-menu-bg">
        <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" Text="خروج"></asp:LinkButton>
    </div>
</div>
<div style="width: 10px; float: right; text-align: right; margin: 100px 0 0 0">
    <img alt="" height="186" src="../images/cp-saller-liner.jpg" width="13" /></div>
<script src="../js/jquery.url.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {

        if (jQuery.url.attr("file") == "default.aspx" || jQuery.url.attr("file") == "Default.aspx") {
            $('#defaultpannel').removeClass('cp-menu-bg');
            $('#defaultpannel').addClass('cp-menu-over-bg');
        }
        else {
            $('#defaultpannel').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }

        if (jQuery.url.attr("file") == "Products.aspx" || jQuery.url.attr("file") == "ProductPicture.aspx") {
            $('#productmanage').removeClass('cp-menu-bg');
            $('#productmanage').addClass('cp-menu-over-bg');
        }
        else {
            $('#productmanage').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }

        if (jQuery.url.attr("file") == "Requests.aspx") {
            $('#requestmanage').removeClass('cp-menu-bg');
            $('#requestmanage').addClass('cp-menu-over-bg');
        }
        else {
            $('#requestmanage').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }

        if (jQuery.url.attr("file") == "company_profile.aspx" || jQuery.url.attr("file") == "Company_Branch.aspx") {
            $('#companymanage').removeClass('cp-menu-bg');
            $('#companymanage').addClass('cp-menu-over-bg');
        }
        else {
            $('#companymanage').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }

        if (jQuery.url.attr("file") == "News.aspx") {
            $('#newsmanage').removeClass('cp-menu-bg');
            $('#newsmanage').addClass('cp-menu-over-bg');
        }
        else {
            $('#newsmanage').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }


        if (jQuery.url.attr("file") == "ProfileSetting.aspx") {
            $('#profilemanage').removeClass('cp-menu-bg');
            $('#profilemanage').addClass('cp-menu-over-bg');
        }
        else {
            $('#profilemanage').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }

        if (jQuery.url.attr("file") == "ChangePassword.aspx") {
            $('#changepassmanage').removeClass('cp-menu-bg');
            $('#changepassmanage').addClass('cp-menu-over-bg');
        }
        else {
            $('#changepassmanage').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }

        if (jQuery.url.attr("file") == "inquiry_List.aspx") {
            $('#inquirymanage').removeClass('cp-menu-bg');
            $('#inquirymanage').addClass('cp-menu-over-bg');
        }
        else {
            $('#inquirymanage').mouseover(function () {
                $(this).toggleClass("cp-menu-over-bg");
            }).mouseout(function () {
                $(this).toggleClass("cp-menu-over-bg");
            });

        }

        $('#ProfileView').mouseover(function () {
            $(this).toggleClass("cp-menu-over-bg");
        }).mouseout(function () {
            $(this).toggleClass("cp-menu-over-bg");
        });


        $('#Logoutmanage').mouseover(function () {
            $(this).toggleClass("cp-menu-over-bg");
        }).mouseout(function () {
            $(this).toggleClass("cp-menu-over-bg");
        });


    });
</script>
