<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Category.aspx.cs" Inherits="BiztBiz.Category" %>

<%@ Register Src="~/UC/uscTopProduct.ascx" TagName="uscTopProduct" TagPrefix="uc3" %>
<%--<%@ Register Src="UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc2" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <uc3:uscTopProduct ID="uscTopProduct1" runat="server" />
    <table runat="server" id="pnlCategories" cellpadding="0" cellspacing="0" style="width: 1000px;
        margin: 20px 10px;">
        <tr>
            <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                width: 25px; height: 34px">
                <img alt="" height="34" src="images/pi-pro-fram-3-top-right.jpg" width="25" />
            </td>
            <td style="background: transparent url('images/pi-pro-fram-3-top-mid.jpg') repeat-x scroll center top;
                color: #669900; text-align: right; padding-right: 5px; font-weight: bold">
                دسته های موجود در
                <asp:Label ID="lblCategory" runat="server"></asp:Label>
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
                <ul style="margin: 5px; padding: 0;">
                    <asp:Repeater ID="repCategoryList" runat="server">
                        <ItemTemplate>
                            <li style="float: right; margin: 8px 5px; color: #999; width: 23%; text-align: right;">
                                <asp:LinkButton ID="lnkCategory" ForeColor="#0099cc" runat="server" Text='<%#SelectCounInCat(Eval("catName").ToString(),Eval("id").ToString()) %>'
                                    PostBackUrl='<%# GetCategoryLink(Eval("id").ToString(),Eval("LevelID").ToString()) %>'></asp:LinkButton>
                            </li>
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
    <table style="width: 1000px; height: 45px; margin: 10px" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 10px; background: transparent url('images/new-frame-site-map-right.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
            <td style="background: transparent url('images/new-frame-site-map-mid.jpg') repeat-x scroll center top;
                text-align: right">
                <img alt="" height="26" src="<%= ImgSiteFolder %>br-ico-map.jpg" width="26" style="vertical-align: middle;" />
                <span style="color: #006699">شما اینجا هستید:</span> <span style="font-weight: normal;
                    color: #0099cc">
                    <asp:HyperLink ID="lnkSearchSection" ForeColor="#0099cc" runat="server"></asp:HyperLink>
                </span>
                <img id="imglblMainCat" runat="server" alt="" height="16" src="~/images/site/br-ico-bul.jpg"
                    width="11" style="vertical-align: middle;" visible="false" />
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
            <td style="background: transparent url('images/new-frame-site-map-mid.jpg') repeat-x scroll center top;">
                <div style="float: left">
                    <span style="color: #006699; font-weight: bold; float: right; padding: 2px 5px">تعداد
                        آیتم در صفحه : </span>
                    <div class="ddl-bg-normal">
                        <asp:DropDownList ID="ddlItemCount" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlItemCount_SelectedIndexChanged"
                            CssClass="log-login-ddl-item">
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </td>
            <td style="width: 10px; background: transparent url('images/new-frame-site-map-left.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
        </tr>
    </table>
    <table style="width: 1000px; margin: 10px 0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 766px; vertical-align: top">
                <table style="width: 100%; float: right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="background: transparent url('images/new-frame-3-top.jpg') repeat-y scroll center top;
                            width: 766px; height: 20px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="background: transparent url('images/new-frame-3-mid.jpg') repeat-y scroll center top;
                            padding: 5px; width: 766px;">
                            <table id="tblProduct" runat="server" style="width: 750px;" visible="false">
                                <tr>
                                    <td>
                                        <asp:DataList ID="dtlProduct" runat="server" Width="750px">
                                            <ItemTemplate>
                                                <table style="width: 750px; background: #f2f9ff;">
                                                    <tr>
                                                        <td style="width: 150px">
                                                            <div style="border: 1px silver solid; padding: 1px; height: 120px; width: 120px;
                                                                margin: 10px">
                                                                <asp:Image ID="imgProduct" runat="server" Height="120px" Width="120px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' /></div>
                                                        </td>
                                                        <td style="vertical-align: top; width: 370px">
                                                            <div style="padding: 1px; height: 19px; width: 192px; float: right; margin: 10px 0">
      <img alt="" height="16" src="images/new-2-icon-pro.jpg" width="140" /> 
                                                                
                                                                
                                                                    
                                                                </div>
                                                            <span style="color: #009EE0; font: bold 20px 'b koodak',tahoma,arial; float: right;
                                                                clear: both">
                                                                <img alt="" height="10" src="images/br-pro-type-bulet.jpg" width="10" />
                                                                <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'>
                                                                    <%# Eval("Produc_Name")%>
                                                                </a></span>
                                                            <div style="width: 360px; float: right; clear: both">
                                                                <span style="color: #000; float: right; clear: both; font-weight: bold;">برند/مدل:
                                                                </span><span style="color: #57AABF; float: right; padding-right: 10px">
                                                                    <%# Eval("Model_Number")%></span></div>
                                                            <div style="width: 360px; float: right; clear: both">
                                                                <span style="color: #000; float: right; clear: both; font-weight: bold;">مشخصات :
                                                                </span><span style="color: #57AABF; float: right; padding-right: 10px">
                                                                    <%# Eval("Specialty_Product")%></span></div>
                                                        </td>
                                                        <td style="vertical-align: top; text-align: center; width: 250px; font: 11px tahoma;">
                                                            <div style="float: right; padding: 5px; color: #000">
                                                                <img alt="" height="10" src="images/br-ico-cal2.jpg" width="10" style="margin: 2px;
                                                                    vertical-align: middle;" />تاریخ ارسال: <span style="color: #57AABF;">
                                                                        <%# GetShamsiDate(Eval("StartDate").ToString())%>
                                                                    </span>
                                                            </div>
                                                            <div style="float: right; padding: 5px; color: #000; clear: both">
                                                                <img alt="" height="10" src="images/br-ico-cal1.jpg" width="10" style="margin: 2px;
                                                                    vertical-align: middle;" />تاریخ انقضاء: <span style="color: #57AABF;">
                                                                        <%# GetShamsiDate(Eval("EndDate").ToString())%></span></div>
                                                                            
                                                                        <%# GetUserRole(Eval("UsersRoleID").ToString(),1)%>
                                                                 
                                                            <div style="margin: 4px; float: left; margin-left: 30px;">
                                                                <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'>
                                                                    <img alt="" height="25" src="<%= ImgSiteFolder %>br-b-pro-detail.jpg" width="123" />
                                                                </a>
                                                            </div>
                                                            <div style="margin: 4px; float: left; margin-left: 30px;">
                                                                <a class="contacts" href='<%= SiteFolder %>Contact.aspx?TypeID=1&ProductID=<%#Eval("id")%>&ReciverID=<%#Eval("Uid_id")%>'>
                                                                    <img alt="" height="34" src="<%= ImgSiteFolder %>br-b-send-reaquest.jpg" width="123" />
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" style="padding-top: 5px; background-color: #f9f9f9;">
                                            <tr>
                                                <td style="width: 80%; padding: 4px 0; padding-right: 12px;">
                                               6666666666666     <Pager:PagerV2_8 ID="pagerProduct" runat="server" OnCommand="pagerProduct_Command"
                                                        GenerateGoToSection="true" NextClause="images/Back-icon.jpg" PreviousClause="images/next-icon.jpg"
                                                        PreviousVisibleClause="images/next-visible-icon.jpg" NextVisibleClause="images/Back-visible-icon.jpg" />
                                                </td>
                                                <td style="width: 20%; text-align: right; padding: 4px 0; padding-left: 5px; font-family: Tahoma;">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table id="tblRequest" runat="server" style="width: 650px" visible="false">
                                <tr>
                                    <td>
                                        <asp:DataList ID="dtlRequest" runat="server" Width="650px">
                                            <ItemTemplate>
                                                <table style="width: 750px; margin: 10px; background: #fdf7df; margin: 5px 0">
                                                    <tr>
                                                        <td style="width: 150px">
                                                            <div style="border: 1px silver solid; padding: 1px; height: 120px; width: 120px;
                                                                margin: 10px">
                                                                <img alt="" height="120" src="<%= ImgSiteFolder %>product.jpg" width="120" /></div>
                                                        </td>
                                                        <td style="vertical-align: top; width: 370px; line-height: 18px;">
                                                            <div style="padding: 1px; height: 19px; width: 92px; float: right; margin: 10px 0">
                                                                <img alt="" height="17" src="images/new-2-icon-req.jpg" width="140" />
                                                                
                                                                
                                                                </div>
                                                            <span style="color: #ea9d00; font: bold 20px 'b koodak',tahoma,arial; float: right;
                                                                clear: both">
                                                                <img alt="" height="10" src="images/b1-1.jpg" width="10" />
                                                                <a style="color: #ea9d00;" href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                                    <%# Eval("ProductName")%>
                                                                </a></span>
                                                            <div style="width: 360px; float: right; clear: both">
                                                                <span style="color: #000; float: right; clear: both">قیمت : </span><span style="color: #af7700;
                                                                    float: right; padding-right: 10px">
                                                                    <%# Eval("Price")%></span></span></div>
                                                            <div style="width: 360px; float: right; clear: both">
                                                                <span style="color: #000; float: right; clear: both">توضیحات : </span><span style="color: #af7700;
                                                                    float: right; padding-right: 10px">
                                                                    <%# Eval("Description")%></span></span></div>
                                                        </td>
                                                        <td style="vertical-align: top; text-align: center">
                                                            <div style="float: right; padding: 5px; font: 11px tahoma; color: #000">
                                                                <img alt="" height="10" src="images/br-ico-cal2.jpg" width="10" style="margin: 2px;
                                                                    vertical-align: middle;" />تاریخ ارسال: <span style="color: #57AABF;">
                                                                        <%# GetShamsiDate(Eval("StartDate").ToString())%></span>
                                                            </div>
                                                            <div style="float: right; padding: 5px; font: 11px tahoma; color: #000; clear: both">
                                                                <img alt="" height="10" src="images/br-ico-cal1.jpg" width="10" style="margin: 2px;
                                                                    vertical-align: middle;" />تاریخ انقضاء: <span style="color: #57AABF;">
                                                                        <%# GetShamsiDate(Eval("EndDate").ToString())%></span>
                                                            </div>
                                                              <%# GetUserRole(Eval("UsersRoleID").ToString(),2)%>
                                                            <div style="margin: 4px; float: left; margin-left: 30px;">
                                                                <a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                                    <img alt="" height="25" src="<%= ImgSiteFolder %>br-b-pro-detail1.jpg" width="123" /></a>
                                                            </div>
                                                            <div style="margin: 4px; float: left; margin-left: 30px;">
                                                                <a class="contacts" href='<%= SiteFolder %>Contact.aspx?TypeID=2&RequestID=<%#Eval("RequestID")%>&ReciverID=<%#Eval("Uid_id")%>'>
                                                                    <img alt="" height="34" src="<%= ImgSiteFolder %>br-b-send-reaquest1.jpg" width="123" /></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" style="padding-top: 5px; background-color: #f9f9f9;">
                                            <tr>
                                                <td style="width: 80%; padding: 4px 0; padding-right: 12px;">
                                                    <Pager:PagerV2_8 ID="pagerRequest" runat="server" OnCommand="pagerRequest_Command"
                                                        GenerateGoToSection="true" NextClause="images/Back-icon.jpg" PreviousClause="images/next-icon.jpg"
                                                        PreviousVisibleClause="images/next-visible-icon.jpg" NextVisibleClause="images/Back-visible-icon.jpg" />
                                                </td>
                                                <td style="width: 20%; text-align: right; padding: 4px 0; padding-left: 5px; font-family: Tahoma;">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table id="tblCompany" runat="server" style="width: 650px" visible="false">
                                <tr>
                                    <td>
                                        <asp:DataList ID="dtlCompany" runat="server" Width="650px">
                                            <ItemTemplate>
                                                <table style="width: 750px; margin: 10px; background: #f1ffdb; margin: 5px 0">
                                                    <tr>
                                                        <td style="width: 150px">
                                                            <div style="border: 1px silver solid; padding: 1px; height: 120px; width: 120px;
                                                                margin: 10px">
                                                                <asp:Image ID="imgCompanyLogo" runat="server" Height="120px" Width="120px" ImageUrl='<%# GetCompanyImage(Eval("image").ToString()) %>' /></div>
                                                        </td>
                                                        <td style="vertical-align: top; width: 370px; line-height: 19px;">
                                                            <div style="padding: 1px; height: 19px; width: 92px; float: right; margin: 10px 0">
                                                                <img alt="" height="19" src="images/new-2-icon-7.jpg" width="140" />
                                                                        
                                                                </div>
                                                            <span style="color: #57b63e; font: bold 20px 'b koodak',tahoma,arial; float: right;
                                                                clear: both">
                                                                <img alt="" height="10" src="images/br-pro-type-bulet.jpg" width="10" />
                                                                <a style="color: #56b63b" href='Home.aspx?CompanyID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=3'>
                                                                    <%# Eval("Company_Name")%>
                                                                </a></span>
                                                            <div style="width: 360px; float: right; clear: both">
                                                                <span style="color: #000; float: right; clear: both">خدمات :</span><span style="color: #56b63b;
                                                                    float: right; padding-right: 10px">
                                                                    <%# Eval("Services")%></span></div>
                                                            <div style="width: 360px; float: right; clear: both">
                                                                <span style="color: #000; float: right; clear: both">توضیحات :</span><span style="color: #56b63b;
                                                                    float: right; padding-right: 10px">
                                                                    <%# Eval("Company_Introduction")%></span></div>
                                                        </td>
                                                        <td style="vertical-align: top; text-align: center">
                                                            <div style="float: right; padding: 5px; font: 11px tahoma; color: #000">
                                                                <img alt="" height="10" src="images/br-ico-cal2.jpg" width="10" style="margin: 2px" />
                                                                تاریخ ارسال: <span style="color: #57AABF;">
                                                                    <%# GetShamsiDate(Eval("date_Update").ToString())%></span></div>
                                                                      <%# GetUserRole(Eval("UsersRoleID").ToString(),3)%>
                                                            <div style="margin: 7px; padding-right: 60px; padding-top: 50px;">
                                                                <a href='Home.aspx?CompanyID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=3'>
                                                                    <img alt="" height="25" src="<%= ImgSiteFolder %>br-b-pro-detail2.jpg" width="123" /></a>
                                                            </div>
                                                            <div style="margin: 7px; padding-right: 60px;">
                                                                <a class="contacts" href='<%= SiteFolder %>Contact.aspx?TypeID=3&CompanyID=<%#Eval("id")%>&ReciverID=<%#Eval("Uid")%>'>
                                                                    <img alt="" height="34" src="<%= ImgSiteFolder %>br-b-send-reaquest2.jpg" width="123" /></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="background: transparent url('images/new-frame-3-down.jpg') repeat-y scroll center top;
                            width: 766px; height: 20px;">
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align: top">
                <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                    <tr>
                        <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                            width: 25px; height: 34px">
                            <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                        </td>
                        <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                            color: #3333ff; text-align: right; padding-right: 5px">
                            <span class="frame-title">تبلیغات</span>
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
                       <%--     <uc2:uscadvertisement ID="uscAdvertisement_left_up_Pro" runat="server" 
                                ZoneID="9" />--%>
                           
                            </td>
                        <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                            width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" style="width: 220px; float: left">
                    <tr><td>
                    <center>
               <%-- <uc2:uscadvertisement ID="uscAdvertisement_left_down_Pro" runat="server" ZoneID="10" />--%>
                 </center>
                </td></tr></table>
                </td>
        </tr>
    </table>
</asp:Content>
