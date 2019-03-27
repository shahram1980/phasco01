<%@ Page Language="C#" MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true"
    CodeBehind="Productdetails.aspx.cs" Inherits="BiztBiz.Productdetails" %>

<%@ Register Src="~/UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<%@ Register Src="~/UC/uscInvite.ascx" TagName="uscInvite" TagPrefix="uc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
        </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 1000px; height: 45px; margin: 10px">
        <tr>
            <td style="width: 10px; background: transparent url('images/new-frame-site-map-right.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
            <td style="background: transparent url('images/new-frame-site-map-mid.jpg') repeat-x scroll center top;
                text-align: right">
                <img alt="" height="26" src="<%= ImgSiteFolder %>br-ico-map.jpg" width="26" style="vertical-align: middle;" />
                <span style="color: #006699">شما اینجا هستید:</span> <span style="font-weight: normal;
                    color: #0099cc"><a style="color: #0099cc;" href="Category.aspx?CategoryID=0&SearchSection=1&Level=-1&ValuePath=0">
                        محصولات </a></span>
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
                            <table style="width: 100%">
                                <tr>
                                    <td colspan="2">
                                        <div style="float: right">
                                        
                                          <img src="images/GoldenUserproduct.jpg" runat="server" id="img_golden" />
                                          <br />
                                            <span style="font: 24px 'b koodak',arial; color: #000; font-weight: bold">
                                                <asp:Label ForeColor="#02799b" ID="lblProductTitle" runat="server"></asp:Label>
                                            </span>
                                            <br />
                                            مدل :
                                            <asp:Label EnableViewState="false" ID="Label_Model_Number" ForeColor="#02799b" runat="server"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 240px;">
                                            <div style="float: right; padding: 2px; font-weight: normal; color: #000">
                                                <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal2.jpg" width="10" style="vertical-align: middle;
                                                    margin-left: 2px;" />تاریخ ارسال :
                                                <asp:Label ForeColor="#02799b" ID="lblStartDate" runat="server"></asp:Label>
                                            </div>
                                            <div style="float: right; padding: 2px; font-weight: normal; color: #000; clear: both;
                                                text-align: right;">
                                                <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal1.jpg" width="10" style="vertical-align: middle;
                                                    margin-left: 2px;" />تاریخ اعتبار :
                                                <asp:Label ForeColor="#02799b" ID="lblEndDate" runat="server"></asp:Label></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 300px">
                                        <div>
                                            <div style="font: 11px tahoma; float: right; background: transparent url('images/pi-pro-def-pic-zoom.jpg') no-repeat scroll right top;
                                                width: 291px; height: 20px; padding-right: 10px; margin-top: 10px">
                                                جهت مشاهده تصویر بزرگتر بر روی تصویر کلیک کنید</div>
                                            <div style="border: 1px silver solid; padding: 1px; margin: 2px; float: right">
                                                <a id="lnkProductImage" runat="server" rel="productGallery">
                                                    <img id="Image_Product" runat="server" alt="" height="212" width="284" />
                                                </a>
                                                <%--  <img alt="" height="212" src="images/pi-pro-def-pic.jpg" width="284" />--%>
                                            </div>
                                            <asp:Repeater ID="repProductgallery" runat="server">
                                                <ItemTemplate>
                                                    <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                                        <a href='<%#Eval("image_Address","images/Product/large/{0}") %>' rel="productGallery">
                                                            <img src='<%#Eval("image_Address","images/Product/medium/{0}") %>' width="90px" height="69px"
                                                                alt="" />
                                                        </a>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top">
                                        <div style="padding: 5px; float: right; text-align: justify; line-height: 18px;">
                                            <table class="style1">
                                                <tr>
                                                    <td class="td_register_de">
                                                        <div style="float: right;">
                                                            <br />
                                                            <asp:Label ForeColor="#02799b" EnableViewState="false" ID="Label_Specialty_of_Product"
                                                                runat="server"></asp:Label>
                                                            <br />
                                                            <asp:Label ForeColor="#02799b" EnableViewState="false" ID="Label_Description" runat="server"></asp:Label>
                                                            <br />
                                                            <ul style="margin: 10px; padding: 0px;">
                                                                <li>شرایط پرداخت :
                                                                    <asp:Label ForeColor="#02799b" ID="lblTerms_of_Payment" runat="server" EnableViewState="false"></asp:Label></li>
                                                                <li>نحوه ارسال :
                                                                    <asp:Label ForeColor="#02799b" ID="lblSendMode" runat="server" EnableViewState="false"></asp:Label></li>
                                                                <asp:Literal EnableViewState="false" ID="lbl_Minimum_Order" runat="server"></asp:Literal>
                                                                <asp:Literal EnableViewState="false" ID="lblPrice" runat="server"></asp:Literal>
                                                                <asp:Literal EnableViewState="false" ID="lblPakaging" runat="server"></asp:Literal>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-right: 300px; vertical-align: bottom;">
                                                        <div style="height: 24px; width: 123px; font-weight: bold; background: transparent url('images/pi-pro-b-bg.jpg') no-repeat scroll center top;
                                                            text-align: center; padding: 5px; color: #fff; margin: 5px; float: right">
                                                            <a class="contacts" runat="server" id="lnkContents">تماس بگیرید </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 225px;" valign="top" rowspan="3">
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
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
                                    <td id="tdUserInfo" runat="server" visible="false" style="background: #f9f9f9; color: #007b9b;
                                        text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <b>
                                            <asp:HyperLink ForeColor="#000" ID="lnkRequestProfilesec" runat="server"></asp:HyperLink>
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
                                        color: #007b9b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <b>
                                            <asp:HyperLink ForeColor="#000" ID="lnkRequestProfile" runat="server"></asp:HyperLink>
                                        </b>
                                        <br />
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
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; margin: 10px 0;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">محصولات دیگر شرکت </span>
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
                                    <td style="background: #f9f9f9; color: #007b9b; text-align: right; border-bottom: 2px #ccc solid">
                                        <asp:Repeater ID="repOtherProduct" runat="server">
                                            <ItemTemplate>
                                                <div style="float: right; width: 170px; height: 70px; margin: 3px 0;">
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
                                        <asp:HyperLink ID="HyperLink_Allproducts" runat="server">سایر محصولات ...</asp:HyperLink>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <uc1:uscInvite ID="uscInvite1" runat="server"></uc1:uscInvite>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top">
                            <asp:Panel ID="Panel_Otherproduct" runat="server">
                                <table cellpadding="0" cellspacing="0" 
    style="width: 100%; float: left">
                                    <tr>
                                        <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                            <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                        </td>
                                        <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                            <span class="frame-title">سایر محصولات&nbsp; </span>
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
                                        <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding-right: 2px;
                                        border-bottom: 2px #ccc solid">
                                            <asp:Repeater ID="Repeater_Other_Product_list" EnableViewState="false" 
                                            runat="server">
                                                <ItemTemplate>
                                                    <div style="float: right; width: 128px; height: 120px; margin: 7px;">
                                                        <div style="float: right; width: 110px; height: 90px; border: 1px solid #b1d3dd;
                                                        padding: 2px 0;">
                                                            <asp:Image ID="imgProduct0" runat="server" Height="90px" Width="110px" 
                                                            
                                                                ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />
                                                        </div>
                                                        <div style="float: right; height: 30px; width: 180px; padding-right: 5px; padding-top: 5px;">
                                                            <a style="color: #007b94;" href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                                            title='<%# Eval("Produc_Name")%>'><%# Eval("Produc_Name")%></a>
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
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 100%; float: left">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">محصولات مرتبط </span>
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
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; padding-right: 5px;
                                        border-bottom: 2px #ccc solid">
                                        <asp:Repeater ID="Repeater_Other_Product" EnableViewState="false" runat="server">
                                            <ItemTemplate>
                                                <div style="float: right; width: 128px; height: 120px; margin: 7px;">
                                                    <div style="float: right; width: 110px; height: 90px; border: 1px solid #b1d3dd;
                                                        padding: 2px 0;">
                                                        <asp:Image ID="imgProduct" runat="server" Height="90px" Width="110px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />
                                                    </div>
                                                    <div style="float: right; height: 30px; width: 180px; padding-right: 5px; padding-top: 5px;">
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
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
