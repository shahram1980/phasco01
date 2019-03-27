<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/CompanyDeteil.Master"
    AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="BiztBiz.C_p.Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 1000px; height: 45px; margin: 10px">
        <tr>
            <td style="width: 12px; background: transparent url('../images/pi-pro-fram-2-right.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
            <td style="background: transparent url('../images/pi-pro-fram-2-mid.jpg') repeat-x scroll center top;
                text-align: right">
                <img alt="" height="26" src="<%= ImgSiteFolder %>br-ico-map.jpg" width="26" style="vertical-align: middle;" />
                <span style="color: #006699">شما اینجا هستید:</span> <span style="font-weight: normal;
                    color: #0099cc"><a style="color: #0099cc;" href="../Default.aspx">ایران پروبیز </a>
                </span>
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
            <td style="width: 12px; background: transparent url('../images/pi-pro-fram-2-left.jpg') no-repeat scroll center top;">
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
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <span style="font: 18px arial; color: #000; font-weight: bold">
                                            <asp:Label ID="lblRequestTitle" runat="server"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td style="width: 300px">
                                        <span style="font: 18px arial; color: #000; font-weight: bold">متن تستی</span>
                                        <div>
                                            <div style="font: 11px tahoma; float: right; background: transparent url('../images/pi-pro-def-pic-zoom.jpg') no-repeat scroll right top;
                                                width: 291px; height: 20px; padding-right: 10px; margin-top: 10px">
                                                جهت مشاهده تصویر بزرگتر بر روی تصویر زیر کلیک کنید</div>
                                            <div style="border: 1px silver solid; padding: 1px; margin: 2px; float: right">
                                                <img alt="" height="212" src="../images/pi-pro-def-pic.jpg" width="284" />
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
                                        <div style="padding: 5px; float: right; text-align: justify">
                                            <asp:Repeater ID="repRequestsDetail" runat="server">
                                                <ItemTemplate>
                                                    نام کالای درخواستی :
                                                    <%#Eval("ProductName")%>
                                                    <br />
                                                    تاریخ درخواست :
                                                    <%#Eval("RequestDate")%>
                                                    <br />
                                                    مدل :
                                                    <%#Eval("Model")%>
                                                    <br />
                                                    جزئیات و مشخصات :
                                                    <%#Eval("DetailsAndFeatures")%>
                                                    <br />
                                                    دسته بندی :
                                                    <%# GetCategories(Eval("Group_id").ToString())%>
                                                    <br />
                                                    تعداد :
                                                    <%#Eval("Count")%>
                                                    <br />
                                                    استان / شهر :
                                                    <%#GetStateAndCity(Eval("CityID").ToString())%>
                                                    <br />
                                                    حدود قیمت :
                                                    <%#Eval("Price")%>
                                                    <br />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:Literal ID="ltrRequestDescription" runat="server"></asp:Literal>
                                        </div>
                                        <div style="height: 24px; width: 123px; font-weight: bold; background: transparent url('../images/pi-pro-b-bg.jpg') no-repeat scroll center top;
                                            text-align: center; padding: 5px; color: #fff; margin: 5px; float: right">
                                            <a class="contacts" runat="server" id="lnkContents">تماس بگیرید </a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 225px;" valign="top" rowspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        اطلاعات درخواست دهنده
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding: 0 5px 5px 0;
                                        line-height: 18px; border-bottom: 2px #ccc solid">
                                        درخواست دهنده :
                                        <asp:Label ID="lblRequestUserFullName" runat="server"></asp:Label>
                                        <br />
                                        پست الکترونیکی :
                                        <asp:Label ID="lblRequestEmail" runat="server"></asp:Label>
                                        <br />
                                        شماره تماس :
                                        <asp:Label ID="lblRequestTel" runat="server"></asp:Label>
                                        <br />
                                        استان/شهر :
                                        <asp:Label ID="lblRequestCity" runat="server"></asp:Label>
                                        <br />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; margin-top: 20px;">
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        درخواست دیگر
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding: 0 5px 5px 0;
                                        line-height: 18px; border-bottom: 2px #ccc solid">
                                        <ul>
                                            <asp:Repeater ID="repOtherRequest" runat="server">
                                                <ItemTemplate>
                                                    <li><a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                        <%#Eval("ProductName")%>
                                                    </a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
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
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        محصولات مرتبط
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding-right: 5px;
                                        border-bottom: 2px #ccc solid">
                                        درخواست های مرتبط
                                        <br />
                                        <table>
                                            <tr>
                                                <td>
                                                    نام کالای درخواستی
                                                </td>
                                                <td>
                                                    مدل
                                                </td>
                                                <td>
                                                    تعداد
                                                </td>
                                                <td>
                                                    استان / شهر
                                                </td>
                                                <td>
                                                    حدود قیمت
                                                </td>
                                            </tr>
                                            <asp:Repeater ID="repRelationRequest" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                                <%#Eval("ProductName")%>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Model")%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Count")%>
                                                        </td>
                                                        <td>
                                                            <%#GetStateAndCity(Eval("CityID").ToString())%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Price")%>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <%--  <td style="width: 225px;">
                          <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        اطلاعات فروشنده
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding-right: 5px;
                                        border-bottom: 2px #ccc solid">
                                        fdgffd df gdfgdfg dfgdfg dfgdfgdfgdfg
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
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
