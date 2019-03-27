<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="inquiry_List.aspx.cs" Inherits="BiztBiz.MyBiztBiz.inquiry_List" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

             var getUrlParameter = function getUrlParameter(sParam) {
                var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                    sURLVariables = sPageURL.split('&'),
                    sParameterName,
                    i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return sParameterName[1] === undefined ? true : sParameterName[1];
                    }
                }
            };
            if (getUrlParameter("TypeID") == "1") {
                $('#divProducts').addClass("cp-tab-bg-active");
            }

            if (getUrlParameter("TypeID") == "2") {
                $('#divRequest').addClass("cp-tab-bg-active");
            }

            if (getUrlParameter("TypeID") == "3" || getUrlParameter("TypeID") == "5") {
                $('#divMessage').addClass("cp-tab-bg-active");
            }

        });
    </script>


    <div class="col-md-12 bhoechie-tab-container">
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 bhoechie-tab-menu pull-right">
            <div class="list-group">
                <a href="default.aspx" class="list-group-item idp-group-item text-center">
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

                <asp:HyperLink ID="lnkProfileView" runat="server" CssClass="list-group-item idp-group-item text-center" Text="<strong>مشاهده پروفایل </strong>"><strong>مشاهده پروفایل </strong></asp:HyperLink>

                <a href="News.aspx?statue=edit" class="list-group-item idp-group-item text-center">
                    <strong>اخبار</strong></a>
                <a href="ProfileSetting.aspx" class="list-group-item idp-group-item text-center">
                    <strong>ویرایش مشخصات فردی</strong></a>

                <a href="inquiry_List.aspx" class="list-group-item idp-group-item text-center active">
                    <strong>درخواست ها / پیام ها</strong></a>

                <asp:HyperLink ID="lnkLogout" class="list-group-item idp-group-item text-center" runat="server" OnClick="lnkLogout_Click" Text="خروج"><strong>خروج </strong></asp:HyperLink>

            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 bhoechie-tab pull-right">
            <!-- flight section -->

            <div class="bhoechie-tab-content active text-center rtl-text">
                <div>
                    <div class="margin-bottom-15">
                        <asp:HyperLink ID="lnkProducts" runat="server" CssClass="btn btn-success margin-top-5" Text="درخواست محصولات" NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=1"></asp:HyperLink>
                        <asp:HyperLink ID="lnkRequest" runat="server" CssClass="btn btn-success margin-top-5" Text="پاسخ درخواست ها" NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=2"></asp:HyperLink>
                        <asp:HyperLink ID="lnkMessage" runat="server" CssClass="btn btn-success margin-top-5" Text="پیام ها" NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=3"></asp:HyperLink>
                    </div>
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered table-striped">
                                    <tr>
                                        <th>ردیف</th>
                                        <th>موضوع</th>
                                        <th>فرستنده </th>
                                        <th>تاریخ ارسال</th>
                                        <th>وضعیت</th>
                                        <th>عملیات</th>
                                    </tr>

                                    <asp:Repeater ID="repinquire" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></td>
                                                <td>
                                                    <%#Eval("topic")%></td>
                                                <td>
                                                    <%#Eval("SenderName")%>
                                                </td>
                                                <td>
                                                    <%# Set_Date(Eval("Send_date").ToString())%></td>
                                                <td>
                                                    <%#getStatus(Eval("Visit").ToString())%>
                                                </td>
                                                <td>
                                                    <a class="btn btn-sm-custom btn-success" href='inquiry_List.aspx?reid=<%# Eval("Id") %>'
                                                        title="پاسخ">
                                                        <i class="fa fa-reply"></i>
                                                    </a>
                                                    <a class="btn btn-sm-custom btn-info" href='inquiry_List.aspx?detid=<%# Eval("Id") %>' title="جزئیات">
                                                        <i class="fa fa-envelope"></i>
                                                    </a>
                                                    <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="حذف کردن" CssClass="btn btn-sm-custom btn-danger" CommandArgument='<%#Eval("Id") %>'
                                                        OnCommand="lnkDelete_Command"><i class="fa fa-times"></i></asp:LinkButton>

                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </table>



                            </div>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div class="table-responsive">
                                <table class="table no-border">
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Subject %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Label ID="Label_Topic" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, Date_send %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Label ID="Label_Send_Date" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, Message %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Label ID="Label_Message" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, Company_Name %>" />
                            </td>
                            <td class="td_register_de">
                                <asp:Label ID="Label_Company_Name" runat="server"></asp:Label>
                            </td>
                        </tr>--%>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource, Name %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Label ID="Label_Name" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <%--  <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource, Country_Territory %>" />
                            </td>
                            <td class="td_register_de">
                                <asp:Label ID="Label_Country" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>" />
                            </td>
                            <td class="td_register_de">
                                <asp:Label ID="Label_Company_address" runat="server"></asp:Label>
                            </td>
                        </tr>--%>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Email %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Label ID="Label_Email" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource, Tel %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Label ID="Label_Tel" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">
                                            <a class="btn btn-default" id="lnkreplyInquiry" runat="server">ارسال پاسخ
                                            </a>
                                            <asp:Button class="btn btn-danger" ID="btnDeleteInq" runat="server" Text="حذف پیام" SkinID="btnNormal" OnClick="btnDeleteInq_Click" />
                                        </td>
                                    </tr>
                                    <%-- <tr>
                            <td class="td_register" colspan="2">
                                <asp:HyperLink NavigateUrl="inquiry_List.aspx?TypeID=<%=TypeID %>" ID="HyperLink11"
                                    Text="<%$ Resources:Resource, Back_List %>" runat="server"></asp:HyperLink>
                                &nbsp;
                            </td>
                        </tr>--%>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <div class="table-responsive">
                                <table class="table no-border">
                                    <tr>
                                        <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                            <div id="divMessageResult" runat="server" visible="false" style="width: 400px; height: 20px; padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                                <asp:Label ID="lblMessageResult" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register" style="padding-bottom: 3px;">
                                            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource, topic %>" />
                                            <div style="color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="TextBox_Subject" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                                ControlToValidate="TextBox_Subject" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register" style="padding: 5px;">
                                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Resource, email %>" />
                                        </td>
                                        <td class="td_register_de" style="padding: 5px;">
                                            <asp:Label ID="Label_Email_send" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:Resource, message %>" />
                                            <div style="color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                        </td>
                                        <td class="td_register_de">

                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="TextBox_BodyMail" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                                ControlToValidate="TextBox_BodyMail" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="ImageButton_Insert" CssClass="btn btn-default pull-left" runat="server" Text="ارسال" OnClick="ImageButton_Insert_Click"
                                                SkinID="btnNormal" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="vwStatus" runat="server">



                            <div class="rtl-text text-right info-box">
                                <div style="clear: both">
                                    <a style="color: #000" href="inquiry_List.aspx?TypeID=3">تعداد پیام های جدید: </a>
                                    <asp:HyperLink NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=3" ID="lnkMessageInquiry"
                                        runat="server" ForeColor="#006699"></asp:HyperLink>
                                </div>
                                <div style="clear: both">
                                    <a style="color: #000" href="inquiry_List.aspx?TypeID=1">تعداد درخواست برای محصولات
                                    ارسال شده شما: </a>
                                    <asp:HyperLink ID="lnkProductInquiry" NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=1"
                                        runat="server" ForeColor="#006699"></asp:HyperLink>
                                </div>
                                <div style="clear: both">
                                    <a style="color: #000" href="inquiry_List.aspx?TypeID=2">پاسخ به درخواست ارسال شده شما
                                    در سایت: </a>
                                    <asp:HyperLink ID="lnkRequestInquiry" NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=2"
                                        runat="server" ForeColor="#006699"></asp:HyperLink>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
