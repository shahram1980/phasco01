<%@ Page Language="C#" MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="BiztBiz.C_p.News" %>

<%@ Register Src="../UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
   <%-- <table cellpadding="0" cellspacing="0" style="width: 1000px; height: 45px; margin: 10px">
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
            <td style="width: 12px; background: transparent url('../images/pi-pro-fram-2-left.jpg') no-repeat scroll center top;">
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
                                        <span style="font: 18px arial; color: #000; font-weight: bold">
                                            <asp:Label ID="Label_NewsTitle" runat="server"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top">
                                        <div style="padding: 5px; float: right; text-align: justify">
                                            <asp:Literal ID="ltrNewsDescDesc" runat="server"></asp:Literal>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 225px;" valign="top" rowspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <%-- اطلاعات فروشنده--%>
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
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding-right: 10px 0;
                                        line-height: 18px; border-bottom: 2px #ccc solid">
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
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; margin: 10px 0;
                                padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        محصولات
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
                                        <ul>
                                            <asp:Repeater ID="repProduct" runat="server">
                                                <ItemTemplate>
                                                    <li><a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'>
                                                        <%#Eval("Produc_Name")%>
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
                                        اخبار
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
                                        <ul>
                                            <asp:Repeater ID="repCompanyNews" runat="server">
                                                <ItemTemplate>
                                                    <li><a href='News.aspx?NewsID=<%#Eval("id")%>&UserID=<%#Eval("Uid")%>'>
                                                        <%#Eval("Title")%>
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
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
