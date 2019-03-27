<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master"
    AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="BiztBiz.Request" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 1000px; height: 45px; margin: 10px">
        <tr>
            <td style="width: 10px; background: transparent url('images/new-frame-site-map-right.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
            <td style="background: transparent url('images/new-frame-site-map-mid.jpg') repeat-x scroll center top;
                text-align: right">
                <img alt="" height="26" src="<%= ImgSiteFolder %>br-ico-map.jpg" width="26" style="vertical-align: middle;" />
                <span style="color: #006699">شما اینجا هستید:</span> <span style="font-weight: normal;
                    color: #0099cc"><a style="color: #0099cc;" href="Category.aspx?CategoryID=0&SearchSection=2&Level=-1&ValuePath=0">
                        درخواست ها </a></span>
                <img alt="" height="16" src="<%= ImgSiteFolder %>br-ico-bul.jpg" width="11" style="vertical-align: middle;" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:HyperLink ID="lnkMainCat" ForeColor="#0099cc" runat="server"></asp:HyperLink></span>
                <img id="imglblSubCat" runat="server" alt="" height="16" src="~/images/site/br-ico-bul.jpg"
                    width="11" style="vertical-align: middle;" visible="false" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:HyperLink ID="lnkSubCat" ForeColor="#0099cc" runat="server" Visible="false"></asp:HyperLink></span>
                <img id="imglblSub2Cat" runat="server" alt="" height="16" src="~/images/site/br-ico-bul.jpg"
                    width="11" style="vertical-align: middle;" visible="false" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:HyperLink ID="lnkSub2Cat" ForeColor="#0099cc" runat="server" Visible="false"></asp:HyperLink></span>
            </td>
            <td style="width: 10px; background: transparent url('images/new-frame-site-map-left.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" style="width: 1000px">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <table cellpadding="2" cellspacing="0" style="width: 100%">
                    <tr>
                        <td style="text-align: right; vertical-align: top">
                            <table style="width: 100%; line-height: 24px;">
                                <tr>
                                    <td>
                                        <span style="font: 18px tahoma; color: #000; font-weight: bold">
                                            <asp:Label ID="lblRequestTitle" runat="server"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td style="width: 300px">
                                        <span style="font: 18px tahoma; color: #000; font-weight: bold">متن تستی</span>
                                        <div>
                                            <div style="font: 11px tahoma; float: right; background: transparent url('images/pi-pro-def-pic-zoom.jpg') no-repeat scroll right top;
                                                width: 291px; height: 20px; padding-right: 10px; margin-top: 10px">
                                                جهت مشاهده تصویر بزرگتر بر روی تصویر زیر کلیک کنید</div>
                                            <div style="border: 1px silver solid; padding: 1px; margin: 2px; float: right">
                                                <img alt="" height="212" src="images/pi-pro-def-pic.jpg" width="284" />
                                            </div>
                                            <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                            </div>
                                            <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                            </div>
                                            <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                            </div>
                                        </div>
                                    </td>--%>
                                    <td style="vertical-align: top">
                                        <div style="padding: 5px; float: right; text-align: justify; width: 740px; line-height: 19px;">
                                            <asp:Repeater ID="repRequestsDetail" runat="server">
                                                <ItemTemplate>
                                                    <div style="float: right; width: 500px;">
                                                        نام کالای درخواستی : <span style="font: 18px tahoma; color: #02799b; font-weight: bold">
                                                            <%#Eval("ProductName")%>
                                                        </span>
                                                        <br />
                                                        مدل : <span style="color: #02799b;">
                                                            <%#Eval("Model")%>
                                                        </span>
                                                        <br />
                                                        جزئیات و مشخصات : <span style="color: #02799b;">
                                                            <%#Eval("DetailsAndFeatures")%>
                                                        </span>
                                                        <br />
                                                        تعداد : <span style="color: #02799b;">
                                                            <%#Eval("Count")%>
                                                        </span>
                                                        <br />
                                                        شهر : <span style="color: #02799b;">
                                                            <%#GetStateAndCity(Eval("CityID").ToString())%>
                                                        </span>
                                                        <br />
                                                        حدود قیمت : <span style="color: #02799b;">
                                                    <%--        <%# BusinessAccessLayer.PHASCOUtility.ConverToCurrencyFormat(Eval("Price").ToString())%>--%>
                                                            <%# Eval("Price")%>
                                                        </span>
                                                        <br />
                                                    </div>
                                                    <div style="float: left; width: 240px;">
                                                        <div style="float: right; padding: 2px; font-weight: normal; color: #000">
                                                            <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal2.jpg" width="10" style="vertical-align: middle;
                                                                margin-left: 2px" />تاریخ ارسال : <span style="color: #02799b">
                                                                    <%# GetShamsiDate(Eval("StartDate").ToString())%></span></div>
                                                        <div style="float: right; padding: 2px; font-weight: normal; color: #000; clear: both;
                                                            text-align: right;">
                                                            <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal1.jpg" width="10" style="vertical-align: middle;
                                                                margin-left: 2px" />تاریخ انقضاء : <span style="color: #02799b">
                                                                    <%# GetShamsiDate(Eval("EndDate").ToString())%></span></div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:Literal ID="ltrRequestDescription" runat="server"></asp:Literal>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; padding-left: 20px;">
                                        <div style="height: 24px; width: 123px; font-weight: bold; background: transparent url('images/pi-pro-b-bg.jpg') no-repeat scroll center top;
                                            text-align: center; padding: 5px; color: #fff; margin: 5px; float: left;">
                                            <a class="contacts" runat="server" id="lnkContents">تماس بگیرید </a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 225px;" valign="top" rowspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">اطلاعات درخواست کننده </span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td id="tdUserInfo" runat="server" visible="false" style="background: #f9f9f9; color: #007b9b;
                                        text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <b>
                                            <asp:HyperLink ForeColor="#000" ID="lnkRequestProfilesec" runat="server"></asp:HyperLink>
                                        </b>
                                        <br />
                                        کاربر :
                                        <br />
                                        <asp:Label ID="lblRequestUserFullName" runat="server"></asp:Label>
                                        <br />
                                        پست الکترونیکی :
                                        <asp:Label ID="lblRequestEmail" runat="server"></asp:Label>
                                        <br />
                                        تلفن :
                                          <div style="direction:ltr;">
                                        <asp:Label ID="lblRequestTel" runat="server"></asp:Label>
                                        </div>
                                    
                                        استان/شهر :
                                           <div style="direction:rtl;">
                                        <asp:Label ID="lblRequestCity" runat="server"></asp:Label>
                                        </div>
                                        <br />
                                    </td>
                                    <td id="tdNotUserInfo" runat="server" visible="false" style="background: #f9f9f9;
                                        color: #007b9b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <b>
                                            <asp:HyperLink ForeColor="#000" ID="lnkRequestProfile" runat="server"></asp:HyperLink>
                                        </b>
                                        <br />
                                        برای نمایش اطلاعات درخواست کننده ابتدا باید <a href="http://www.phasco.com/Register.aspx" style="color:red;" title="فرم ثبت نام در فاسکو">عضو سایت</a> شوید.
                                        <%--  <br />
                                        <a href="register.aspx">عضویت در سایت</a>--%>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; margin-top: 20px;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">درخواست های دیگر </span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding: 0 5px 5px 0;
                                        line-height: 18px; border-bottom: 2px #ccc solid">
                                        <ul style="margin: 0; padding: 0;">
                                            <asp:Repeater ID="repOtherRequest" runat="server">
                                                <ItemTemplate>
                                                    <li style="margin: 5px;"><a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                        <%#Eval("ProductName")%>
                                                    </a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 100%; float: left">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">درخواست های مرتبط </span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="images/pi-pro-fram-3-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding-right: 5px;
                                        border-bottom: 2px #ccc solid">
                                        <ul style="margin: 5px; padding: 2px;padding-bottom:10px;">
                                            <asp:Repeater ID="repRelationRequest" runat="server">
                                                <ItemTemplate>
                                                    <li style="margin: 5px; width: 30%;float:right;"><a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                        <%#Eval("ProductName")%>
                                                    </a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <%--  <td style="width: 225px;">
                          <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        اطلاعات فروشنده
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="images/pi-pro-fram-3-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding-right: 5px;
                                        border-bottom: 2px #ccc solid">
                                        fdgffd df gdfgdfg dfgdfg dfgdfgdfgdfg
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                        --%>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
