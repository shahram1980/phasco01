<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="UserNews.aspx.cs" Inherits="BiztBiz.UserNews" %>

<%@ Register Src="UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<%--<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>--%>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <%-- <table cellpadding="0" cellspacing="0" style="width: 1000px; height: 45px; margin: 10px">
        <tr>
            <td style="width: 12px; background: transparent url('images/pi-pro-fram-2-right.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
            <td style="background: transparent url('images/pi-pro-fram-2-mid.jpg') repeat-x scroll center top;
                text-align: right">
                <img alt="" height="26" src="<%= ImgSiteFolder %>br-ico-map.jpg" width="26" style="vertical-align: middle;" />
                <span style="color: #006699">شما اینجا هستید:</span> <span style="font-weight: normal;
                    color: #0099cc"><a style="color: #0099cc;" href="Default.aspx">ایران پروبیز </a>
                </span>
                <img alt="" height="16" src="<%= ImgSiteFolder %>br-ico-bul.jpg" width="11" style="vertical-align: middle;" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:LinkButton ID="lnkMainCat" ForeColor="#0099cc" runat="server"></asp:LinkButton></span>
                <img id="imglblSubCat" runat="server" alt="" height="16" src="~/images/site/br-ico-bul.jpg"
                    width="11" style="vertical-align: middle;" visible="false" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:LinkButton ID="lnkSubCat" ForeColor="#0099cc" runat="server" Visible="false"></asp:LinkButton></span>
                <img id="imglblSub2Cat" runat="server" alt="" height="16" src="~/images/site/br-ico-bul.jpg"
                    width="11" style="vertical-align: middle;" visible="false" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:LinkButton ID="lnkSub2Cat" ForeColor="#0099cc" runat="server" Visible="false"></asp:LinkButton></span>
            </td>
            <td style="width: 12px; background: transparent url('images/pi-pro-fram-2-left.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
        </tr>
    </table>--%>
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
                                    <td colspan="2">
                                        <span style="font: 22px tahoma; color: #007a9b; font-weight: bold">
                                            <asp:Label ID="Label_NewsTitle" runat="server"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top">
                                        <div style="padding: 5px; float: right; text-align: justify;color:#007a9b;">
                                            <asp:Literal ID="ltrNewsDescDesc" runat="server"></asp:Literal>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 225px;" valign="top" rowspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">اطلاعات فروشنده </span>
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
                                    <td id="tdUserInfo" runat="server" visible="false" style="background: #f9f9f9; color: #01799b;
                                        text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <b>
                                            <asp:HyperLink ID="lnkRequestProfile" ForeColor="#000" runat="server"></asp:HyperLink>
                                        </b>
                                        <br />
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
                                    <td id="tdNotUserInfo" runat="server" visible="false" style="background: #f9f9f9;
                                        color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        برای نمایش اطلاعات فروشنده ابتدا باید <a href="register.aspx">عضو سایت</a> شوید.
                                        <%--  <br />
                                        <a href="register.aspx">عضویت در سایت</a>--%>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">اطلاعات تماس </span>
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
                                    <td id="tdCompanyInfo" runat="server" visible="false" style="background: #f9f9f9;
                                        color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <span style="color: #000">آدرس : </span>
                                        <br />
                                        <asp:Label ID="lblCompanyAdress" runat="server"></asp:Label>
                                        <br />
                                        <span style="color: #000">شماره تماس : </span>
                                        <br />
                                        <asp:Label ID="lblCompanyTel" runat="server"></asp:Label>
                                        <br />
                                        <span style="color: #000">وب سایت :</span>
                                        <br />
                                        <asp:Label ID="lblCompanySite" runat="server"></asp:Label>
                                        <br />
                                        <span style="color: #000">پست الکترونیک :</span><br />
                                        <asp:Label ID="lblCompanyEmail" runat="server"></asp:Label>
                                        <br />
                                        <div style="height: 24px; width: 123px; font-weight: bold; background: transparent url('images/pi-pro-b-bg.jpg') no-repeat scroll center top;
                                            text-align: center; padding: 5px; color: #fff; margin: 5px; float: left">
                                            <a class="contacts" runat="server" id="lnkContents">تماس بگیرید </a>
                                        </div>
                                    </td>
                                    <td id="tdNotCompanyInfo" runat="server" visible="false" style="background: #f9f9f9;
                                        color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        برای نمایش اطلاعات تماس ابتدا باید <a href="register.aspx">عضو سایت</a> شوید.
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">سایر شعبات شرکت </span>
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
                                    <td style="background: #f9f9f9; color: #000; text-align: right; padding-bottom: 5px;
                                        border-bottom: 2px #ccc solid">
                                        <asp:Repeater ID="repCompanyBranch" runat="server">
                                            <ItemTemplate>
                                                <div style="float: right; width: 170px; border-bottom: 1px solid #e3e3e3; padding: 5px 0;
                                                    line-height: 18px;">
                                                    <b>
                                                        <%#Eval("BranchName")%></b>
                                                    <br />
                                                    آدرس :
                                                    <br />
                                                    <span style="color: #007a9b;">
                                                        <%#Eval("BranchAdress")%>
                                                    </span>
                                                    <br />
                                                    شماره تماس :
                                                    <br />
                                                    <span style="color: #007a9b;">
                                                        <%#Eval("BranchTel")%>
                                                    </span>
                                                    <br />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
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
                            <table cellpadding="0" cellspacing="0" style="width: 100%; float: left;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">محصولات </span>
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
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; border-bottom: 2px #ccc solid">
                                        <asp:Repeater ID="repProduct" runat="server">
                                            <ItemTemplate>
                                                <div style="float: right; width: 230px; height: 70px; margin: 3px;">
                                                    <div style="float: right; width: 80px; height: 60px; border: 1px solid #b1d3dd; padding: 2px 0;">
                                                        <asp:Image ID="imgProduct" runat="server" Height="60px" Width="80px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />
                                                    </div>
                                                    <div style="float: right; height: 60px; width: 85px; padding-right: 2px; padding-top: 5px;">
                                                        <a style="color: #007b94;" href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                                            title='<%# Eval("Produc_Name")%>'>
                                                            <%# Eval("Produc_Name")%>
                                                        </a>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="width: 100%; float: left; margin-top: 10px;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        اخبار
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
                                        <ul>
                                            <asp:Repeater ID="repCompanyNews" runat="server">
                                                <ItemTemplate>
                                                    <li><a style="color: #007b94;" href='UserNews.aspx?NewsID=<%#Eval("id")%>&UserID=<%#Eval("Uid")%>'>
                                                        <%#Eval("Title")%>
                                                        <span style="color: Red;">
                                                            <%#GetStatus(Eval("Status").ToString())%>
                                                        </span></a></li>
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
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
