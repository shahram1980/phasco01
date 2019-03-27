<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="inquiry_List.aspx.cs" Inherits="BiztBiz.MyBiztBiz.inquiry_List" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            if (jQuery.url.param("TypeID") == "1") {
                $('#divProducts').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("TypeID") == "2") {
                $('#divRequest').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("TypeID") == "3" || jQuery.url.param("TypeID") == "5") {
                $('#divMessage').addClass("cp-tab-bg-active");
            }

        });
    </script>
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
            <div id="divProducts" class="cp-tab-bg">
                <asp:HyperLink ID="lnkProducts" runat="server" Text="درخواست محصولات" NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=1"></asp:HyperLink>
            </div>
            <div id="divRequest" class="cp-tab-bg">
                <asp:HyperLink ID="lnkRequest" runat="server" Text="پاسخ درخواست ها" NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=2"></asp:HyperLink>
            </div>
            <div id="divMessage" class="cp-tab-bg">
                <asp:HyperLink ID="lnkMessage" runat="server" Text="پیام ها" NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=3"></asp:HyperLink>
            </div>
        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <div style="height: 41px; background: transparent url('../images/cp-bg-title-news.jpg') repeat-x scroll center top;
                        border: 1px #9999ff solid; clear: both; margin: 10px 10px 0 10px; color: #666699;">
                        <span style="margin: 10px 10px 10px 0; float: right; width: 40px">ردیف</span> <span
                            style="margin: 10px; float: right; width: 155px">موضوع</span> <span style="margin: 10px;
                                float: right; width: 100px">فرستنده </span><span style="margin: 10px; float: right;
                                    width: 70px">تاریخ ارسال</span> <span style="margin: 10px; float: right; width: 50px">
                                        وضعیت</span> <span style="margin: 10px; float: right; width: 60px">عملیات</span>
                    </div>
                    <div style="float: right; background: #fff; margin-right: 10px;">
                        <asp:Repeater ID="repinquire" runat="server">
                            <ItemTemplate>
                                <div style='height: 50px; clear: both; font-weight: <%#GetVisite(Eval("Visit").ToString()) %>'
                                    class="newsList">
                                    <span style="margin: 10px 10px 10px 0; float: right; width: 40px">
                                        <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></span> <span style="margin: 12px;
                                            float: right; width: 155px">
                                            <%#Eval("topic")%></span> <span style="margin: 10px; float: right; width: 100px">
                                                <%#Eval("SenderName")%>
                                            </span><span style="margin: 10px; float: right; width: 70px">
                                                <%# Set_Date(Eval("Send_date").ToString())%></span><span style="margin: 10px; float: right;
                                                    width: 50px">
                                                    <%#getStatus(Eval("Visit").ToString())%>
                                                </span><span style="margin: 10px; float: right; width: 60px"><a href='inquiry_List.aspx?reid=<%# Eval("Id") %>'
                                                    title="پاسخ">
                                                    <img alt="پاسخ" src="../images/MailReplay.png" />
                                                </a><a href='inquiry_List.aspx?detid=<%# Eval("Id") %>' title="جزئیات">
                                                    <img alt="جزئیات" src="../images/MailOpen.png" />
                                                </a>
                                                    <asp:ImageButton ID="lnkDelete" runat="server" SkinID="btnDelete" CommandArgument='<%#Eval("Id") %>'
                                                        OnCommand="lnkDelete_Command"></asp:ImageButton></span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('.newsList').mouseover(function () {
                                $(this).toggleClass("repeaterover");
                            }).mouseout(function () {
                                $(this).toggleClass("repeaterover");
                            });

                        });
                    
                    </script>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <table class="inquirydetail" style="padding: 15px;">
                        <tr>
                            <td class="td_register">
                                &nbsp;
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
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de">
                                <a id="lnkreplyInquiry" runat="server">
                                    <div class="pi-pro-b-bg" style="padding-top: 8px;">
                                        ارسال پاسخ
                                    </div>
                                </a>
                                <asp:Button ID="btnDeleteInq" runat="server" Text="حذف پیام" SkinID="btnNormal" OnClick="btnDeleteInq_Click" />
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
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <table style="padding: 10px;">
                        <tr>
                            <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                <div id="divMessageResult" runat="server" visible="false" style="width: 400px; height: 20px;
                                    padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                    <asp:Label ID="lblMessageResult" runat="server"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register" style="padding-bottom: 3px;">
                                <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource, topic %>" />
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="TextBox_Subject" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
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
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="TextBox_BodyMail" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                    ControlToValidate="TextBox_BodyMail" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de" style="padding-right: 50px;">
                                <asp:Button ID="ImageButton_Insert" runat="server" Text="ارسال" OnClick="ImageButton_Insert_Click"
                                    SkinID="btnNormal" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="vwStatus" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <div style="clear: both; float: right; margin: 15px 15px 5px 0">
                        <div>
                            <img alt="" height="5" src="../images/cp-saller-frame-top.jpg" width="575" /></div>
                        <div style="background: transparent url('../images/cp-saller-frame-mid.jpg') repeat-y scroll center top;
                            padding: 10px; line-height: 20px; color: #000;">
                            <div style="clear: both">
                                <a style="color: #000" href="inquiry_List.aspx?TypeID=3">تعداد پیام های جدید: </a>
                                <asp:HyperLink NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=3" ID="lnkMessageInquiry"
                                    runat="server" ForeColor="#006699"></asp:HyperLink>
                            </div>
                            <div style="clear: both">
                                <a style="color: #000" href="inquiry_List.aspx?TypeID=1">تعداد درخواست برای محصولات
                                    ارسال شده شما: </a>
                                <asp:HyperLink ID="lnkProductInquiry" NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=1"
                                    runat="server" ForeColor="#006699"></asp:HyperLink>
                            </div>
                            <div style="clear: both">
                                <a style="color: #000" href="inquiry_List.aspx?TypeID=2">پاسخ به درخواست ارسال شده شما
                                    در سایت: </a>
                                <asp:HyperLink ID="lnkRequestInquiry" NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=2"
                                    runat="server" ForeColor="#006699"></asp:HyperLink>
                            </div>
                        </div>
                        <div>
                            <img alt="" height="5" src="../images/cp-saller-frame-down.jpg" width="575" /></div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        <div style="float: right">
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" />
        </div>
    </div>
</asp:Content>
