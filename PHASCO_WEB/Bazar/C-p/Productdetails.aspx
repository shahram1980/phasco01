<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/CompanyDeteil.Master" AutoEventWireup="true"
    CodeBehind="Productdetails.aspx.cs" Inherits="BiztBiz.C_p.Productdetails" %>

<%@ Register Src="../UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style2
        {
            border-collapse: collapse;
            border-left-style: solid;
            border-left-width: 1px;
            border-right: 1px solid #C0C0C0;
            border-top-style: solid;
            border-top-width: 1px;
            border-bottom: 1px solid #C0C0C0;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
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
                                    <td colspan="2">
                                        <span style="font: 18px arial; color: #000; font-weight: bold">
                                            <asp:Label ID="lblProductTitle" runat="server"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 300px">
                                        <div>
                                            <div style="font: 11px tahoma; float: right; background: transparent url('../images/pi-pro-def-pic-zoom.jpg') no-repeat scroll right top;
                                                width: 291px; height: 20px; padding-right: 10px; margin-top: 10px">
                                                جهت مشاهده تصویر بزرگتر بر روی تصویر زیر کلیک کنید</div>
                                            <div style="border: 1px silver solid; padding: 1px; margin: 2px; float: right">
                                                <asp:Image EnableViewState="false" ID="Image_Product" runat="server"  Width="284" Height="212" />
                                                <%--  <img alt="" height="212" src="../images/pi-pro-def-pic.jpg" width="284" />--%>
                                            </div>
                                            <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                            </div>
                                            <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                            </div>
                                            <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                            </div>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top">
                                        <div style="padding: 5px; float: right; text-align: justify">
                                            <table class="style1">
                                                <tr>
                                                    <td class="td_register">
                                                    </td>
                                                    <td class="td_register_de">
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal14" Text="<%$ Resources:Resource, Specialty_of_Product %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Specialty_of_Product" runat="server"></asp:Label>
                                                        &nbsp;<br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal1" Text="<%$ Resources:Resource, Description %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Description" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal2" Text="<%$ Resources:Resource, Model_Number %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Model_Number" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal3" Text="<%$ Resources:Resource, Product_Brand %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Product_Brand" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal4" Text="<%$ Resources:Resource, Place_of_Origin %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Place_of_Origin" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal5" Text="<%$ Resources:Resource, Supply_Ability %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Supply_Ability" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal6" Text="<%$ Resources:Resource, Minimum_Order %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Minimum_Order" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal7" Text="<%$ Resources:Resource, Delivery_Time %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Delivery_Time" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal8" Text="<%$ Resources:Resource, Terms_of_Payment %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Terms_of_Payment" runat="server"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>
                                                            <asp:Literal EnableViewState="false" ID="Literal9" Text="<%$ Resources:Resource, Packaging %>"
                                                                runat="server" /></b>
                                                        <br />
                                                        <asp:Label EnableViewState="false" ID="Label_Packaging" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Literal ID="ltrProductDescripiton" runat="server"></asp:Literal>
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
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding: 5px;
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
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; margin: 10px 0;">
                                <tr>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="34" src="../images/pi-pro-fram-3-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('../images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        محصولات دیگر شرکت
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
                                            <asp:Repeater ID="repOtherProduct" runat="server">
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
                                        <asp:Repeater ID="Repeater_Other_Product" EnableViewState="false" runat="server">
                                            <ItemTemplate>
                                                <img src="../images/other-product-b.jpg" alt="" />
                                                <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1' title='<%# Eval("Produc_Name")%>'>
                                                    <%# Eval("Produc_Name")%>
                                                </a>&nbsp;&nbsp;
                                            </ItemTemplate>
                                        </asp:Repeater>
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
