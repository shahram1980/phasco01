<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Search.aspx.cs" Inherits="BiztBiz.Search" %>
 
<%--<%@ Register Src="UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc2" %>--%>
<%@ Register Src="UC/uscTopProduct.ascx" TagName="uscTopProduct" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <uc3:uscTopProduct ID="uscTopProduct1" runat="server" />
    <center>
        <table style="width: 1000px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 10px; height: 41px">
                    <img alt="" height="41" src="images/new-frame-serach-right.jpg" width="10" />
                </td>
                <td style="height: 41px; background: transparent url('images/new-frame-serach-mid.jpg') repeat-x scroll center top">
                    <table cellpadding="0" cellspacing="0" style="width: 100%; color: #0098b4; font-weight: bold;">
                        <tr>
                            <td style="width: 300px; text-align: right">
                                <img alt="" height="16" src="images/new-icon-top-search.jpg" width="16" style="vertical-align: middle;" />
                                جستجوی عبارت : <span style="color: #000">
                                    <%=SearchWord %>
                                </span>
                            </td>
                            <td style="width: 200px; text-align: right">
                                &nbsp;<img alt="" height="16" src="images/new-icon-res.jpg" width="16" style="vertical-align: middle;" />
                                نتایج : <span style="color: #000">
                                    <%=SearchResultCount%>
                                    مورد </span>
                            </td>
                            <td style="width: 260px; text-align: right">
                                <div style="width: 90px; float: right; padding-top: 6px;">
                                    <img alt="" class="style1" height="16" src="images/new-icon-filter.jpg" width="17"
                                        style="vertical-align: middle;" />
                                    فیلتر نتایج :
                                </div>
                                <div class="ddl-bg-normal" style="margin-top: 5px;">
                                    <asp:DropDownList ID="ddlSearchSection" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchSection_SelectedIndexChanged"
                                        CssClass="log-login-ddl-item">
                                        <asp:ListItem Text="همه ی بخشها" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="محصولات" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="درخواست ها" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="شرکت ها" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 10px; height: 41px">
                    <img alt="" height="41" src="images/new-frame-serach-left.jpg" width="10" />
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
                                padding: 5px 10px;">
                                <table id="tblProduct" runat="server" style="width: 650px;" visible="false">
                                    <tr>
                                        <td>
                                            <%--<table style="width: 820px; margin: 2px auto; background: #f2f9ff">
                                                <tr>
                                                    <td style="width: 150px">
                                                        <div style="border: 1px silver solid; padding: 1px; height: 120px; width: 120px;
                                                            margin: 10px">
                                                        </div>
                                                    </td>
                                                    <td style="vertical-align: top; width: 500px">
                                                        <div style="padding: 1px; height: 19px; width: 92px; float: right; margin: 10px 0">
                                                            <img alt="" height="19" src="<%= ImgSiteFolder %>br-pro-type.jpg" width="92" /></div>
                                                        <span style="color: #0066cc; font-weight: bold; float: right; clear: both">
                                                            <img alt="" height="10" src="<%= ImgSiteFolder %>br-pro-type-bulet.jpg" width="10" />
                                                        </span>
                                                        <div style="width: 400px; float: right; clear: both">
                                                            <span style="color: #000; float: right; clear: both">مدل : </span><span style="color: #666;
                                                                float: right; padding-right: 10px"></span>
                                                        </div>
                                                        <div style="width: 300px; float: right; clear: both">
                                                            <span style="color: #000; float: right; clear: both">قیمت : </span><span style="color: #666;
                                                                float: right; padding-right: 10px">
                                                                <%# Eval("Price")%></span></div>
                                                        <div style="width: 300px; float: right; clear: both">
                                                            <span style="color: #000; float: right; clear: both">ارسال کننده : </span><span style="color: #666;
                                                                float: right; padding-right: 10px">
                                                                <%# GetUserName(Eval("Uid_id").ToString())%></span></div>
                                                    </td>
                                                    <td style="vertical-align: top; text-align: center">
                                                        <div style="float: right; padding: 5PX; font-weight: normal; color: #000">
                                                            <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal2.jpg" width="10" style="margin: 2px" />تاریخ
                                                            ارسال :
                                                        </div>
                                                        <div style="float: right; padding: 5PX; font-weight: normal; color: #000; clear: both;
                                                            text-align: right; width: 150px;">
                                                            <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal1.jpg" width="10" style="margin: 2px" />تاریخ
                                                            اعتبار :
                                                        </div>
                                                        <div style="margin: 10px">
                                                        </div>
                                                        <div style="margin: 10px">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>--%>
                                            <asp:DataList ID="dtlProduct" runat="server" Width="650px">
                                                <ItemTemplate>
                                                    <table style="width: 750px; background: #f2f9ff;">
                                                        <tr>
                                                            <td style="width: 150px">
                                                                <div style="border: 1px silver solid; padding: 1px; height: 120px; width: 120px;
                                                                    margin: 10px">
                                                                    <asp:Image ID="imgProduct" runat="server" Height="120px" Width="120px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' /></div>
                                                            </td>
                                                            <td style="vertical-align: top; width: 370px">
                                                                <div style="padding: 1px; height: 19px; width: 92px; float: right; margin: 10px 0">
                                                                    <img alt="" height="16" src="images/new-2-icon-pro.jpg" width="140" />
                                                                       
                                                                    
                                                                    </div>
                                                                <span style="color: #009EE0; font: bold 15px tahoma; float: right;
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
                                </table>
                                <table id="tblRequest" runat="server" style="width: 650px" visible="false">
                                    <tr>
                                        <td>
                                            <asp:DataList ID="dtlRequest" runat="server" Width="650px">
                                                <ItemTemplate>
                                                    <%--<table style="width: 650px; margin: 2px auto; background: #fff2fc">
                                                        <tr>
                                                            <td style="width: 150px">
                                                                <div style="border: 1px silver solid; padding: 1px; height: 120px; width: 120px;
                                                                    margin: 10px">
                                                                    <img alt="" height="120" src="<%= ImgSiteFolder %>product.jpg" width="120" /></div>
                                                            </td>
                                                            <td style="vertical-align: top; width: 300px">
                                                                <div style="padding: 1px; height: 19px; width: 92px; float: right; margin: 10px 0">
                                                                    <img alt="" height="35" src="<%= ImgSiteFolder %>br-pro-type2.jpg" width="153" /></div>
                                                                <span style="color: #990066; font-weight: bold; float: right; clear: both">
                                                                    <img alt="" height="10" src="<%= ImgSiteFolder %>br-pro-type-bulet.jpg" width="10" />
                                                                    <a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                                        <%# Eval("ProductName")%>
                                                                    </a></span>
                                                                <div style="width: 400px; float: right; clear: both">
                                                                    <span style="color: #000; float: right; clear: both">قیمت : </span><span style="color: #666;
                                                                        float: right; padding-right: 10px">
                                                                        <%# Eval("Price")%></span></div>
                                                                <div style="width: 300px; float: right; clear: both">
                                                                    <span style="color: #000; float: right; clear: both">ارسال کننده : </span><span style="color: #666;
                                                                        float: right; padding-right: 10px">
                                                                        <%# GetUserName(Eval("Uid_id").ToString())%></span></div>
                                                            </td>
                                                            <td style="vertical-align: top; text-align: center">
                                                                <div style="float: right; padding: 5PX; font-weight: normal; color: #000">
                                                                    <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal2.jpg" width="10" style="margin: 2px" />تاریخ
                                                                    ارسال :
                                                                    <%# GetShamsiDate(Eval("StartDate").ToString())%>
                                                                </div>
                                                                <div style="float: right; padding: 5PX; font-weight: normal; color: #000; clear: both;
                                                                    text-align: right; width: 150px;">
                                                                    <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal1.jpg" width="10" style="margin: 2px" />تاریخ
                                                                    اعتبار :
                                                                    <%# GetShamsiDate(Eval("EndDate").ToString())%></div>
                                                                <div style="margin: 10px">
                                                                    <a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                                        <img alt="" height="25" src="<%= ImgSiteFolder %>br-b-pro-detail1.jpg" width="123" /></a></div>
                                                                <div style="margin: 10px">
                                                                    <a class="contacts" href='<%= SiteFolder %>Contact.aspx?TypeID=2&RequestID=<%#Eval("RequestID")%>&ReciverID=<%#Eval("Uid_id")%>'>
                                                                        <img alt="" height="34" src="<%= ImgSiteFolder %>br-b-send-reaquest1.jpg" width="123" /></a></div>
                                                            </td>
                                                        </tr>
                                                    </table>--%>
                                                    <table style="width: 750px; margin: 10px; background: #fdf7df; margin: 5px 0">
                                                        <tr>
                                                            <td style="width: 150px">
                                                                <div style="border: 0px silver solid; padding: 1px; height: 120px; width: 120px;
                                                                    margin: 10px">
                                                                    <img alt="" height="120" src="\images\requestic.jpg" width="120" /></div>
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
                                </table>
                                <table id="tblCompany" runat="server" style="width: 650px" visible="false">
                                    <tr>
                                        <td>
                                            <asp:DataList ID="dtlCompany" runat="server" Width="650px">
                                                <ItemTemplate>
                                                    <%--    <table style="width: 650px; margin: 2px auto; background: #f2ffdb">
                                                        <tr>
                                                            <td style="width: 150px">
                                                                <div style="border: 1px silver solid; padding: 1px; height: 120px; width: 120px;
                                                                    margin: 10px">
                                                                    <asp:Image ID="imgProduct" runat="server" Height="120px" Width="120px" ImageUrl='<%# GetCompanyImage(Eval("image").ToString()) %>' /></div>
                                                            </td>
                                                            <td style="vertical-align: top; width: 300px">
                                                                <div style="padding: 1px; height: 19px; width: 92px; float: right; margin: 10px 0">
                                                                    <img alt="" height="35" src="<%= ImgSiteFolder %>br-pro-type3.jpg" width="153" /></div>
                                                                <span style="color: #009933; font-weight: bold; float: right; clear: both">
                                                                    <img alt="" height="10" src="<%= ImgSiteFolder %>br-pro-type-bulet.jpg" width="10" />
                                                                    <a href='Home.aspx?CompanyID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=3'>
                                                                        <%# Eval("Company_Name")%>
                                                                    </a></span>
                                                                <div style="width: 400px; float: right; clear: both">
                                                                    <span style="color: #000; float: right; clear: both">محصولات : </span><span style="color: #666;
                                                                        float: right; padding-right: 10px">
                                                                        <%# Eval("Company_Name")%></span></div>
                                                                <div style="width: 300px; float: right; clear: both">
                                                                    <span style="color: #000; float: right; clear: both">برندها : </span><span style="color: #666;
                                                                        float: right; padding-right: 10px">
                                                                        <%# Eval("BrandNameOne")%>
                                                                        ,
                                                                        <%# Eval("BrandNameTwo")%>
                                                                        ,
                                                                        <%# Eval("BrandNameThree")%></span></div>
                                                                <div style="width: 300px; float: right; clear: both">
                                                                    <span style="color: #000; float: right; clear: both">ارسال کننده : </span><span style="color: #666;
                                                                        float: right; padding-right: 10px">
                                                                        <%# Eval("Company_Name")%></span></div>
                                                            </td>
                                                            <td style="vertical-align: top; text-align: center">
                                                                <div style="float: right; padding: 5PX; font-weight: normal; color: #000">
                                                                    <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal2.jpg" width="10" style="margin: 2px" />تاریخ
                                                                    ارسال :
                                                                    <%# GetShamsiDate(Eval("date_Update").ToString())%>
                                                                </div>
                                                                <div style="float: right; padding: 5PX; font-weight: normal; color: #000; clear: both;
                                                                    text-align: right; width: 150px; height: 20px;">
                                                                     <img alt="" height="10" src="<%= ImgSiteFolder %>br-ico-cal1.jpg" width="10" style="margin: 2px" />تاریخ
                                                                        اعتبار</div>
                                                                <div style="margin: 10px">
                                                                    <a href='Home.aspx?CompanyID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=3'>
                                                                        <img alt="" height="25" src="<%= ImgSiteFolder %>br-b-pro-detail2.jpg" width="123" /></a></div>
                                                                <div style="margin: 10px">
                                                                    <a class="contacts" href='<%= SiteFolder %>Contact.aspx?TypeID=3&CompanyID=<%#Eval("id")%>&ReciverID=<%#Eval("Uid")%>'>
                                                                        <img alt="" height="34" src="<%= ImgSiteFolder %>br-b-send-reaquest2.jpg" width="123" /></a></div>
                                                            </td>
                                                        </tr>
                                                    </table>--%>
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
                                <span class="frame-title">تبلیغات </span>
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
                     








                     <table id="pnlZone" runat="server" style="height:137px;">
    <tr>
        <td>
            <asp:Repeater ID="repAdvertisementImage" runat="server">
                <ItemTemplate>
                    <div style='width: <%# Eval("BannerWidth") %>px; height: <%# Eval("BannerHeight") %>px;
                        border: 1px solid #efefef;'>
                        <a target="_blank" href='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'>
                      <%--  <asp:ImageButton  runat="server"
                            PostBackUrl='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'
                            AlternateText='<%# Eval("AltText") %>' />--%>
                            <asp:Image ID="imgBanner" runat="server"  ImageUrl='<%#GetBannerURL(Eval("ImageURL").ToString()) %>'  AlternateText='<%# Eval("AltText") %>' />
                            </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="repAdvertisementText" runat="server">
                <ItemTemplate>
                    <a href='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'>
                        <div style='width: <%# Eval("BannerWidth") %>px; height: <%# Eval("BannerHeight") %>px;
                            border: 1px solid #efefef;'>
                            <%# Eval("HeadlineText")%>
                            <br />
                            <%# Eval("LinkText")%>
                            <br />
                            <%# Eval("DisplayURL")%>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="repAdvertisementFlash" runat="server">
                <ItemTemplate>
                    <div style='width: <%# Eval("BannerWidth") %>px; height: <%# Eval("BannerHeight") %>px;
                        border: 1px solid #efefef;'>
                        <object width='<%# Eval("BannerWidth") %>' height='<%# Eval("BannerHeight") %>'>
                            <param name="movie" value='<%# GetBannerURL(Eval("FlashURL").ToString()) %>'>
                            <embed src='<%# GetBannerURL(Eval("FlashURL").ToString()) %>' width='<%# Eval("BannerWidth") %>'
                                height='<%# Eval("BannerHeight") %>' href='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'></embed>
                        </object>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </td>
    </tr>
</table>















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
        <table style="width: 1000px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 10px; height: 41px">
                    <img alt="" height="41" src="images/new-frame-serach-right.jpg" width="10" />
                </td>
                <td style="height: 41px; background: transparent url('images/new-frame-serach-mid.jpg') repeat-x scroll center top">
                    <table cellpadding="0" cellspacing="0" style="width: 100%; color: #0098b4; font-weight: bold;">
                        <tr>
                            <td style="width: 300px; text-align: right">
                                <img alt="" height="16" src="images/new-icon-top-search.jpg" width="16" style="vertical-align: middle;" />
                                جستجوی عبارت : <span style="color: #000">
                                    <%=SearchWord %>
                                </span>
                            </td>
                            <td style="width: 200px; text-align: right">
                                &nbsp;<img alt="" height="16" src="images/new-icon-res.jpg" width="16" style="vertical-align: middle;" />
                                نتایج : <span style="color: #000">
                                    <%=SearchResultCount%>
                                    مورد </span>
                            </td>
                            <td style="width: 260px; text-align: right">
                                <div style="width: 90px; float: right; padding-top: 6px;">
                                    <img alt="" class="style1" height="16" src="images/new-icon-filter.jpg" width="17"
                                        style="vertical-align: middle;" />
                                    فیلتر نتایج :
                                </div>
                                <div class="ddl-bg-normal" style="margin-top: 5px;">
                                    <asp:DropDownList ID="ddlSearchSection1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchSection_SelectedIndexChanged"
                                        CssClass="log-login-ddl-item">
                                        <asp:ListItem Text="همه ی بخشها" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="محصولات" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="درخواست ها" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="شرکت ها" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 10px; height: 41px">
                    <img alt="" height="41" src="images/new-frame-serach-left.jpg" width="10" />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
