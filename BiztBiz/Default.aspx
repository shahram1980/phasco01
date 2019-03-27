<%@ Page Language="C#" MasterPageFile="~/Template/HomeBiztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Default.aspx.cs" Inherits="BiztBiz._Default" %>

<%@ Register Src="UC/uscLastProduct.ascx" TagName="uscLastProduct" TagPrefix="uc1" %>
<%--<%@ Register Src="UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc2" %>--%>
<%@ Register Src="UC/uscLastNews.ascx" TagName="uscLastNews" TagPrefix="uc3" %>
<%@ Register Src="UC/uscHomeCategory.ascx" TagName="uscHomeCategory" TagPrefix="uc4" %>
<%@ Register Src="UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>
<%@ Register Src="UC/uscRightCatHome.ascx" TagName="uscRightCatHome" TagPrefix="uc3" %>
<%@ Register Src="UC/uscRegisterHome.ascx" TagName="uscRegisterHome" TagPrefix="uc3" %>
<%@ Register Src="UC/uscInviteHome.ascx" TagName="uscInviteHome" TagPrefix="uc3" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <table style="width: 1070px;" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 200px; vertical-align: top;">
                <table style="width: 195px">
                    <tr>
                        <td style="padding:0 0 0 0;">
                        <a href="http://www.phasco.com/register.aspx" title="عضویت رایگان در سایت فاسکو"> 
                            <img alt="" height="140" src="images/new-reg-fr.jpg" width="195" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:0 0 5px 0;">
                            <uc3:uscRightCatHome ID="uscRightCatHome1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 0; padding-right: 3px;">
                            <uc3:uscRegisterHome ID="uscRegisterHome1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 0; padding-left: 5px;">
                            <uc3:uscInviteHome ID="uscInviteHome1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 0; padding-left: 5px;">
                            <table cellpadding="0" cellspacing="0" style="width: 190px; float: left">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right;">
                                        <span class="frame-title2">مزایای ثبت نام در فاسکو</span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid;">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #0196b4; text-align: right; line-height: 17px;
                                        border-bottom: 2px #ccc solid; padding-bottom: 10px;">
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;">
                                            عضو یکی از تخصصی ترین وب سایتهای صنعت پزشکی و آزمایشگاهی می شوید.
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;">
                                            کلیه محصولات خود را به همراه توضیحات و جزئیات به راحتی آگهی نمایید.
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;">
                                            صفحه مربوط به خود را در اینترنت داشته باشید .
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;">
                                            به سادگی وارد تجارت الکترونیک شده و طیف گسترده تر و وسیعتری از مشتریان را جذب نمایید
                                            .
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;">
                                            شرکت یا فروشگاه خود را در موتورهای جستجو نظیر گوگل و یاهو ببینید و به همگان معرفی
                                            نمایید.
                                        </div>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align: top;padding-top:0px;">
                <uc3:uscAdvanceSearch ID="uscAdvanceSearch1" runat="server" />
                <uc1:uscLastProduct ID="uscLastProduct1" runat="server" />
                <%-- <uc2:uscAdvertisement ID="uscAdvertisement1" runat="server" />--%>
                <uc3:uscLastNews ID="uscLastNews1" runat="server" />
                <uc4:uscHomeCategory ID="uscHomeCategory1" runat="server" />
                <%--<uc2:uscAdvertisement ID="uscAdvertisement2" runat="server" />--%>
            </td>
        </tr>
    </table>
</asp:Content>
