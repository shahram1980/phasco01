<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title runat="server" id="pagetile"></title>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">

<div id="companyProfileComplate" runat="server" style="width: 520px; height: auto;
background: #F7D9DD; margin: 15px; float: right; font: bold 11px tahoma; color: #DC1733;
padding: 10px;direction:rtl;">
    کاربر گرامی اطلاعات تکمیلی شما با موفقیت ثبت شد .<br />
&nbsp;به پنل کاربری ایران پروبیز خوش آمدید .</div> 



    <div style="clear: both; float: right; margin: 15px 0 5px 0">
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-top.jpg" width="575" /></div>
        <div style="background: transparent url('../images/cp-saller-frame-mid.jpg') repeat-y scroll center top;
            padding: 10px; line-height: 20px; color: #000;">
            <div style="clear: both">
                <a style="color:#000" href="inquiry_List.aspx?TypeID=3">تعداد پیام های جدید: </a>
                <asp:HyperLink NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=3" ID="lnkMessageInquiry"
                    runat="server" ForeColor="#006699"></asp:HyperLink>
            </div>
            <div style="clear: both">
                <a style="color:#000" href="inquiry_List.aspx?TypeID=1">تعداد درخواست برای محصولات ارسال شده شما: </a>
                <asp:HyperLink ID="lnkProductInquiry" NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=1"
                    runat="server" ForeColor="#006699"></asp:HyperLink>
            </div>
            <div style="clear: both">
                <a style="color:#000" href="inquiry_List.aspx?TypeID=2">پاسخ به درخواست ارسال شده شما در سایت: </a>
                <asp:HyperLink ID="lnkRequestInquiry" NavigateUrl="~/MyBiztBiz/inquiry_List.aspx?TypeID=2"
                    runat="server" ForeColor="#006699"></asp:HyperLink>
            </div>
        </div>
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-down.jpg" width="575" /></div>
    </div>
    <div style="clear: both; float: right; margin: 5px 0">
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-top.jpg" width="575" /></div>
        <div style="background: transparent url('../images/cp-saller-frame-mid.jpg') repeat-y scroll center top;
            padding: 10px">
            <span style="color: #000;">
                <img alt="" height="32" src="../images/cp-saller-ico-box.jpg" width="34" style="vertical-align: middle;" />
                تعداد محصولات ارسال شده:
                <asp:Label ID="lblCountSendProduct" ForeColor="#006699" runat="server"></asp:Label>
            </span>
            <div style="clear: both">
                <a href="Products.aspx?5061676556696577=30&537461747573=30"><span style="color: #ff9900;
                    padding: 2px 20px">
                    <img alt="" height="21" src="../images/cp-saller-ico-search.jpg" width="21" style="vertical-align: middle;" />در
                    حال بررسی :
                    <asp:Label ID="lblCountWaitProduct" runat="server"></asp:Label></span> </a><a href="Products.aspx?5061676556696577=30&537461747573=31">
                        <span style="color: #00cc00; padding: 2px 20px">
                            <img alt="" height="19" src="../images/cp-saller-ico-accept.jpg" width="21" style="vertical-align: middle;" />تایید
                            شده :
                            <asp:Label ID="lblConfirmProduct" runat="server"></asp:Label></span>
                </a><a href="Products.aspx?5061676556696577=30&537461747573=32"><span style="color: #990000;
                    padding: 2px 20px">
                    <img alt="" height="19" src="../images/cp-saller-ico-rege.jpg" width="21" style="vertical-align: middle;" />رد
                    شده :
                    <asp:Label ID="lblNotConfirmProduct" runat="server"></asp:Label></span></a>
            </div>
            <div id="ProductRemind" runat="server" visible="false" style="background: #F7D9DD;
                font: 11px tahoma; color: #DC1733; padding: 5px; clear: both; margin: 10px 0;">
                <asp:Label ID="lblProductRemind" runat="server"></asp:Label>
            </div>
        </div>
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-down.jpg" width="575" /></div>
    </div>
    <div style="clear: both; float: right; margin: 5px 0">
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-top.jpg" width="575" /></div>
        <div style="background: transparent url('../images/cp-saller-frame-mid.jpg') repeat-y scroll center top;
            padding: 10px">
            <span style="color: #000;">
                <img alt="" height="32" src="../images/cp-saller-ico-basket.jpg" width="34" style="vertical-align: middle;" />
                تعداد درخواست های خرید ارسال شده:
                <asp:Label ID="lblCountSendRequest" ForeColor="#006699" runat="server"></asp:Label></span>
            <div style="clear: both">
                <a href="Requests.aspx?5061676556696577=30&537461747573=30"><span style="color: #ff9900;
                    padding: 2px 20px">
                    <img alt="" height="21" src="../images/cp-saller-ico-search.jpg" width="21" style="vertical-align: middle;" />در
                    حال بررسی :
                    <asp:Label ID="lblCountWaitRequest" runat="server"></asp:Label></span> </a><a href="Requests.aspx?5061676556696577=30&537461747573=31">
                        <span style="color: #00cc00; padding: 2px 20px">
                            <img alt="" height="19" src="../images/cp-saller-ico-accept.jpg" width="21" style="vertical-align: middle;" />تایید
                            شده :
                            <asp:Label ID="lblConfirmRequest" runat="server"></asp:Label></span></a>
                <a href="Requests.aspx?5061676556696577=30&537461747573=32"><span style="color: #990000;
                    padding: 2px 20px">
                    <img alt="" height="19" src="../images/cp-saller-ico-rege.jpg" width="21" style="vertical-align: middle;" />رد
                    شده :
                    <asp:Label ID="lblNotConfirmRequest" runat="server"></asp:Label></span></a>
            </div>
            <div id="RequestRemind" runat="server" visible="false" style="background: #F7D9DD;
                font: 11px tahoma; color: #DC1733; padding: 5px; clear: both; margin: 10px 0;">
                <asp:Label ID="lblRequestRemind" runat="server"></asp:Label>
            </div>
        </div>
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-down.jpg" width="575" /></div>
    </div>
    <div style="clear: both; float: right; margin: 5px 0">
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-top.jpg" width="575" /></div>
        <div style="background: transparent url('../images/cp-saller-frame-mid.jpg') repeat-y scroll center top;
            padding: 10px">
            <span style="color: #000;"><a style="color: #000;" href="company_profile.aspx">
                <img alt="" height="24" src="../images/cp-saller-ico-res.jpg" width="28" style="vertical-align: middle;" />تکمیل
                اطلاعات شرکت: </a>
                <asp:Label ID="lblCompanyProfile" ForeColor="#006699" runat="server"></asp:Label></span>
            <div style="clear: both">
                <div style="color: #000; line-height: 18px; margin: 10px 5px;">
                    دسته بندی ها :
                    <table>
                        <asp:Repeater ID="repCompanyGroup" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="color: #006699;">
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
        <div>
            <img alt="" height="5" src="../images/cp-saller-frame-down.jpg" width="575" /></div>
    </div>
</asp:Content>
