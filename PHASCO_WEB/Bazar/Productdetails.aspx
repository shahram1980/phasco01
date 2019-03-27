<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Productdetails.aspx.cs" Inherits="BiztBiz.Productdetails" %>

<%@ Register Src="~/bazar/UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<%@ Register Src="~/bazar/UC/uscInvite.ascx" TagName="uscInvite" TagPrefix="uc1" %>
<%@ Register Src="~/Bazar/UC/uscLastNews.ascx" TagName="uscLastNews" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscHomeCategory.ascx" TagName="uscHomeCategory" TagPrefix="uc4" %>
<%@ Register Src="~/Bazar/UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscRightCatHome.ascx" TagName="uscRightCatHome" TagPrefix="uc3" %>
<%@ Register Src="../UI/Membership.ascx" TagName="Membership" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">

    <div class="page-banner">
        <div class="container">
            <%--<h2><span id="article_heading">مقالات</span></h2>--%>
            <ul class="page-tree rtl-text">
                 <li id="page_link_wrapper"><a id="page_link" href="Default.aspx">بازار</a></li>
                <li>

                    <a href="Category.aspx?CategoryID=0&SearchSection=1&Level=-1&ValuePath=0">محصولات </a>
                </li>
               

                <li>
                    <asp:HyperLink ID="lnkMainCat" runat="server"></asp:HyperLink>
                </li>

                <li>
                    <asp:HyperLink ID="lnkSubCat" runat="server" Visible="false"></asp:HyperLink>
                </li>

                <li>
                    <asp:HyperLink ID="lnkSub2Cat" runat="server" Visible="false"></asp:HyperLink>
                </li>

            </ul>
        </div>
    </div>



    <div class="col-md-9 blog-side rtl-text">

        <%--<uc3:uscAdvanceSearch ID="uscAdvanceSearch1" runat="server" />--%>

        <div class="row">


            <div class="col-md-6">

                <table class="table no-border">
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
                        <td style="vertical-align: bottom;">
                            <div class="contact-form">
                                <a class="contacts" runat="server" target="_blank" id="lnkContents">تماس بگیرید </a>
                            </div>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="Panel_Otherproduct" runat="server">



                    <table class="table no-border">

                        <tr>
                            <td>
                                <asp:Repeater ID="Repeater_Other_Product_list" EnableViewState="false"
                                    runat="server">
                                    <ItemTemplate>
                                        <div style="float: right; width: 160px; height: 120px; margin: 7px;">
                                            <div style="float: right; width: 110px; height: 90px; border: 1px solid #b1d3dd; padding: 2px 0;">
                                                <a style="color: #007b94;" href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'>

                                                    <img src="<%# GetProductHtmlImage(Eval("image").ToString(),Eval("image_name").ToString()) %>" style="height: 90px; width: 110px" />

                                                </a>


                                            </div>
                                            <div style="float: right; height: 30px; width: 180px; padding-right: 5px; padding-top: 5px;">
                                                <a style="color: #007b94;" href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                                    title='<%# Eval("Produc_Name")%>'><%# Eval("Produc_Name")%></a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>

            <div class="col-md-6 table-responsive">
                <table class="table no-border">
                    <tr>
                        <td>
                            <img src="/bazar/images/GoldenUserproduct.jpg" runat="server" id="img_golden" />
                            <br />
                            <span style="font: 24px tahoma; color: #000; font-weight: bold">
                                <asp:Label ForeColor="#02799b" ID="lblProductTitle" runat="server"></asp:Label>
                            </span>
                            <br />
                            مدل :
                                            <asp:Label EnableViewState="false" ID="Label_Model_Number" ForeColor="#02799b" runat="server"></asp:Label>


                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <div style="font: 11px tahoma; float: right; background: transparent url('/bazar/images/pi-pro-def-pic-zoom.jpg') no-repeat scroll right top; width: 291px; height: 20px; padding-right: 10px; margin-top: 10px">
                                    جهت مشاهده تصویر بزرگتر بر روی تصویر کلیک کنید
                                </div>
                                <div style="border: 1px silver solid; padding: 1px; margin: 2px; float: right">
                                    <a id="lnkProductImage" runat="server" rel="productGallery">
                                        <img id="Image_Product" runat="server" alt="" height="212" width="284" />
                                    </a>
                                    <%--  <img alt="" height="212" src="images/pi-pro-def-pic.jpg" width="284" />--%>
                                </div>
                                <asp:Repeater ID="repProductgallery" runat="server">
                                    <ItemTemplate>
                                        <div style="width: 90px; height: 69px; float: right; margin: 3px 1px 0 5px; border: 1px silver solid">
                                            <a href='<%#Eval("image_Address","images/Product/original/{0}") %>' rel="productGallery">
                                                <img src='<%#Eval("image_Address","images/Product/medium/{0}") %>' width="90px" height="69px"
                                                    alt="" />
                                                <br />
                                                <%#Eval("image_name" )%>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </td>

                    </tr>

                    <tr>
                        <td>

                            <div style="float: right; padding: 2px; font-weight: normal; color: #000">
                                <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal2.jpg" width="10" style="vertical-align: middle; margin-left: 2px;" />تاریخ ارسال :
                                                <asp:Label ForeColor="#02799b" ID="lblStartDate" runat="server"></asp:Label>
                            </div>
                            <div style="float: right; padding: 2px; font-weight: normal; color: #000; clear: both; text-align: right;">
                                <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal1.jpg" width="10" style="vertical-align: middle; margin-left: 2px;" />تاریخ اعتبار :
                                                <asp:Label ForeColor="#02799b" ID="lblEndDate" runat="server"></asp:Label>
                            </div>

                        </td>
                    </tr>
                </table>


            </div>
        </div>
        <table class="table no-border">
            <tr>

                <td>
                    <span class="frame-title">محصولات مرتبط </span>
                </td>

            </tr>
            <tr>

                <td>
                    <asp:Repeater ID="Repeater_Other_Product" EnableViewState="false" runat="server">
                        <ItemTemplate>
                            <div style="float: right; width: 160px; height: 120px; margin: 7px;">
                                <div style="float: right; width: 110px; height: 90px; padding: 2px 0;">
                                    <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1' title='<%# Eval("Produc_Name")%>'>
                                        <asp:Image ID="imgProduct" runat="server" Height="90px" Width="110px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />
                                    </a>
                                </div>
                                <div style="float: right; height: 30px; width: 180px; padding-right: 5px; padding-top: 5px; word-wrap: break-word;">
                                    <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                        title='<%# Eval("Produc_Name")%>'>
                                        <%# Eval("Produc_Name")%> 
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>

            </tr>
        </table>
    </div>
    <div class="col-md-3 sidebar">
        <div class="sidebar-widgets">
            <div class="shop-widget">
                <h4>اطلاعات فروشنده
                </h4>
                <table class="table table-stripped table-responsive">
                    <tr>
                        <td id="tdUserInfo" runat="server" visible="false">
                            <b>
                                <asp:HyperLink ID="lnkRequestProfilesec" runat="server"></asp:HyperLink>
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
                                          <div style="direction: ltr;">
                                              <asp:Label ID="lblRequestTel" runat="server"></asp:Label>
                                          </div>

                            استان/شهر :
                                           <div style="direction: rtl;">
                                               <asp:Label ID="lblRequestCity" runat="server"></asp:Label>
                                           </div>
                            <br />
                        </td>
                        <td id="tdNotUserInfo" runat="server" visible="false">
                            <b>
                                <asp:HyperLink ID="lnkRequestProfile" runat="server"></asp:HyperLink>
                            </b>
                            <br />
                            برای نمایش اطلاعات فروشنده ابتدا باید <a href="/Register.aspx" style="color: red;" title="فرم ثبت نام در فاسکو">عضو سایت</a> شوید.
                            <%--  <br />
                            <a href="register.aspx">عضویت در سایت</a>--%>
                        </td>
                    </tr>
                </table>


            </div>


            <div class="shop-widget">
                <h4>سایر محصولات این شرکت 
                </h4>

                <table class="table table-stripped table-responsive">
                    <tr>

                        <td>
                            <asp:Repeater ID="repOtherProduct" runat="server">
                                <ItemTemplate>
                                    <div style="float: right; width: 170px; height: 70px; margin: 3px 0;">
                                        <div style="float: right; width: 80px; height: 60px; padding: 2px 0;">
                                            <a style="color: #007b94;" href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                                title='<%# Eval("Produc_Name")%>'>
                                                <asp:Image ID="imgProduct" runat="server" Height="60px" Width="80px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />
                                            </a>
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


                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink_Allproducts" runat="server">
                                      مشاهده سایر محصولات ...</asp:HyperLink>
                        </td>

                    </tr>

                </table>
            </div>

            <uc3:uscRightCatHome ID="uscRightCatHome1" runat="server" />

            <uc1:uscInvite ID="uscInvite1" runat="server"></uc1:uscInvite>

        </div>

    </div>



</asp:Content>
