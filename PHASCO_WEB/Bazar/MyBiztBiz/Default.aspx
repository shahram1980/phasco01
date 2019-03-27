<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Default" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">

    <div id="companyProfileComplate" runat="server" style="width: 520px; height: auto; background: #F7D9DD; margin: 15px; float: right; font: bold 11px tahoma; color: #DC1733; padding: 10px; direction: rtl;">
        کاربر گرامی اطلاعات تکمیلی شما با موفقیت ثبت شد .<br />
        &nbsp;به پنل کاربری ایران پروبیز خوش آمدید .
    </div>

    <section>
        <div class="col-md-12 bhoechie-tab-container">
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 bhoechie-tab-menu pull-right">
                <div class="list-group">
                    <a href="default.aspx" class="list-group-item idp-group-item active text-center">
                        <strong>پنل کاربری</strong>
                    </a>
                    <a href="Products.aspx?5061676556696577=30&537461747573=31" class="list-group-item idp-group-item text-center">
                        <strong>مدیریت محصولات</strong>
                    </a>
                    <a href="Requests.aspx?5061676556696577=30&537461747573=31" class="list-group-item idp-group-item text-center">
                        <strong>مدیریت درخواست های خرید</strong>
                    </a>

                    <a href="company_profile.aspx" class="list-group-item idp-group-item text-center">
                        <strong>پروفایل شرکت</strong>
                    </a>
                    <%--<a href="lnkProfileView" class="list-group-item idp-group-item text-center" runat="server" >
                        <strong>مشاهده پروفایل</strong>

                    </a>--%>
                    <asp:HyperLink ID="lnkProfileView" runat="server" CssClass="list-group-item idp-group-item text-center" Text="<strong>مشاهده پروفایل </strong>"><strong>مشاهده پروفایل </strong></asp:HyperLink>

                    <a href="News.aspx?statue=edit" class="list-group-item idp-group-item text-center">
                        <strong>اخبار</strong></a>
                    <a href="ProfileSetting.aspx" class="list-group-item idp-group-item text-center">
                        <strong>ویرایش مشخصات فردی</strong></a>

                    <a href="inquiry_List.aspx" class="list-group-item idp-group-item text-center">
                        <strong>درخواست ها / پیام ها</strong></a>

                    <%--<asp:HyperLink ID="lnkLogout"  runat="server" OnClick="lnkLogout_Click" Text="خروج"><strong>خروج </strong></asp:HyperLink>--%>
                                                        <asp:LinkButton ID="LinkButton_Logout" CssClass="list-group-item idp-group-item text-center" runat="server" OnClick="lnkLogout_Click"><strong>خروج </strong></asp:LinkButton>

                    <%--<asp:Button runat="server"  CssClass="list-group-item idp-group-item text-center" Text="خروج" OnClick="lnkLogout_Click" />--%>

                </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 bhoechie-tab pull-right">
                <!-- flight section -->
                <div class="active text-center rtl-text">

                    <div class="rtl-text text-right info-box">

                        <div>
                            <div style="clear: both">
                                <a style="color: #000" href="inquiry_List.aspx?TypeID=3">تعداد پیام های جدید: </a>
                                <asp:HyperLink NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=3" ID="lnkMessageInquiry"
                                    runat="server" ForeColor="#006699"></asp:HyperLink>
                            </div>
                            <div style="clear: both">
                                <a style="color: #000" href="inquiry_List.aspx?TypeID=1">تعداد درخواست برای محصولات ارسال شده شما: </a>
                                <asp:HyperLink ID="lnkProductInquiry" NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=1"
                                    runat="server" ForeColor="#006699"></asp:HyperLink>
                            </div>
                            <div style="clear: both">
                                <a style="color: #000" href="inquiry_List.aspx?TypeID=2">پاسخ به درخواست ارسال شده شما در سایت: </a>
                                <asp:HyperLink ID="lnkRequestInquiry" NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=2"
                                    runat="server" ForeColor="#006699"></asp:HyperLink>
                            </div>
                        </div>

                    </div>
                    <div class="rtl-text text-right info-box">

                        <div>
                            <span style="color: #000;">
                                <i class="fa fa-archive" style="color: #ddc51a; font-size: 20px;"></i>
                                تعداد محصولات ارسال شده:
                <asp:Label ID="lblCountSendProduct" runat="server"></asp:Label>
                            </span>
                            <div style="clear: both">
                                <a href="Products.aspx?5061676556696577=30&537461747573=30"><span style="color: #ff9900; padding: 2px 20px">
                                    <i class="fa fa-search" style="color: #ff9900; font-size: 16px; margin-left: 5px;"></i>در
                    حال بررسی :
                    <asp:Label ID="lblCountWaitProduct" runat="server"></asp:Label></span> </a><a href="Products.aspx?5061676556696577=30&537461747573=31">
                        <span style="color: #00cc00; padding: 2px 20px">
                            <i class="fa fa-check" style="font-size: 16px; margin-left: 5px;"></i>تایید
                            شده :
                            <asp:Label ID="lblConfirmProduct" runat="server"></asp:Label></span>
                    </a><a href="Products.aspx?5061676556696577=30&537461747573=32"><span style="color: #990000; padding: 2px 20px">
                        <i class="fa fa-times" style="font-size: 16px; margin-left: 5px;"></i>تایید 
                                                        رد
                                                                            شده :
                    <asp:Label ID="lblNotConfirmProduct" runat="server"></asp:Label></span></a>
                            </div>
                            <div id="ProductRemind" runat="server" class="alert alert-danger" visible="false">

                                <asp:Literal ID="lblProductRemind" runat="server"></asp:Literal>

                            </div>
                            <div id="ProductRemindList" class="table-responsive" runat="server" visible="false">
                                <table class="table table-striped table-hover rtl-text ">

                                    <asp:Repeater ID="DataList_Remind" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="width: 40%; vertical-align: top;"><%# image_view(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%><br />
                                                    <%# Eval("Produc_Name")%> </td>
                                                <td style="width: 30%; vertical-align: top;">تاریخ انقضاء <%# Set_Date(Eval("EndDate").ToString())%></td>
                                                <td style="width: 30%; vertical-align: top;">
                                                    <%--  <asp:Button ID="lnkEdit" runat="server" Text="ویرایش" SkinID="btnEdit" CommandArgument='<%#Eval("id") %>'
                                                        OnCommand="lnkEdit_Command"></asp:Button>--%>

                                                    <asp:LinkButton ID="lnkEdit"
                                                        CommandArgument='<%#Eval("id") %>'
                                                         OnCommand="lnkEdit_Command" CssClass="margin-left-5"
                                                        runat="server"><fa class="fa fa-pencil"></fa> ویرایش</asp:LinkButton>

                                                    <asp:LinkButton ID="lnkDelete"
                                                        CommandArgument='<%#Eval("id") %>' runat="server"
                                                        OnCommand="lnkDelete_Command"><fa class="fa fa-times"></fa> حذف</asp:LinkButton>


                                                </td>
                                            </tr>


                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>

                        </div>

                    </div>
                    <div class="rtl-text text-right info-box">

                        <div>
                            <span>
                                <i class="fa fa-shopping-basket" style="color: #00cc00; font-size: 20px;"></i>
                                تعداد درخواست های خرید ارسال شده:
                <asp:Label ID="lblCountSendRequest"   runat="server"></asp:Label></span>
                            <div style="clear: both">
                                <a href="Requests.aspx?5061676556696577=30&537461747573=30"><span style="color: #ff9900; padding: 2px 20px">
                                     <i class="fa fa-search" style="color: #ff9900; font-size: 16px; margin-left: 5px;"></i>در
                    حال بررسی :
                                    <asp:Label ID="lblCountWaitRequest" runat="server"></asp:Label></span> </a><a href="Requests.aspx?5061676556696577=30&537461747573=31">
                                        <span style="color: #00cc00; padding: 2px 20px">
                                            <i class="fa fa-check" style="font-size: 16px; margin-left: 5px;"></i>تایید
                            شده :
                            <asp:Label ID="lblConfirmRequest" runat="server"></asp:Label></span></a>
                                <a href="Requests.aspx?5061676556696577=30&537461747573=32"><span style="color: #990000; padding: 2px 20px">
                                     <i class="fa fa-check" style="font-size: 16px; margin-left: 5px;"></i>رد
                    شده :
                    <asp:Label ID="lblNotConfirmRequest" runat="server"></asp:Label></span></a>
                            </div>
                            <div id="RequestRemind" runat="server" visible="false" style="background: #F7D9DD; font: 11px tahoma; color: #DC1733; padding: 5px; clear: both; margin: 10px 0;">
                                <asp:Label ID="lblRequestRemind" runat="server"></asp:Label>
                            </div>
                        </div>

                    </div>
                    <div class="rtl-text text-right info-box">

                        <div>
                            <span style="color: #000;"><a style="color: #000;" href="company_profile.aspx">
                                <i class="fa fa-check"></i>تکمیل
                اطلاعات شرکت: </a>
                                <asp:Label ID="lblCompanyProfile" ForeColor="#006699" runat="server"></asp:Label></span>
                            <div style="clear: both">
                                <div style="color: #000; line-height: 18px; margin: 10px 5px;">
                                    دسته بندی ها :
                    <table class="table table-striped table-hover">
                        <asp:Repeater ID="repCompanyGroup" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("RowNum")%>
                                        -
                                    </td>
                                    <td>
                                        <a href='../Category.aspx?CategoryID=<%#Eval("MainID").ToString()%>&Level=0&ValuePath=<%#Eval("MainID").ToString()%>&SearchSection=3'>
                                            <%#Eval("MainName")%></a> &nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <img alt="" height="10" src="../images/cp-saller-bul-arrow.jpg" width="6" />&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <a href='../Category.aspx?CategoryID=<%#Eval("SubID").ToString()%>&Level=0&ValuePath=<%#Eval("MainID").ToString()%>/<%#Eval("SubID").ToString()%>&SearchSection=3'>
                                            <%#Eval("SubName")%></a> &nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <img alt="" height="10" src="../images/cp-saller-bul-arrow.jpg" width="6" />&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <a href='../Category.aspx?CategoryID=<%#Eval("Sub2ID").ToString()%>&Level=0&ValuePath=<%#Eval("MainID").ToString()%>/<%#Eval("SubID").ToString()%>/<%#Eval("Sub2ID").ToString()%>&SearchSection=3'>
                                            <%#Eval("Sub2Name")%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
