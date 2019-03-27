<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Search.aspx.cs" Inherits="BiztBiz.Search" %>

<%@ Register Src="UC/uscTopProduct.ascx" TagName="uscTopProduct" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscRightCatHome.ascx" TagName="uscRightCatHome" TagPrefix="uc4" %>
<%@ Register Src="UC/uscInviteHome.ascx" TagName="uscInviteHome" TagPrefix="uc5" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">




    <div class="col-md-9 blog-side">

        <uc3:uscTopProduct ID="uscTopProduct1" runat="server" />

        <div class="page-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-xs-12 pull-right text-right">
                        <span style="color: #fff">جستجوی عبارت :
                        <%=SearchWord %> </span>
                    </div>
                    <div class="col-md-4 col-xs-12 pull-right text-right">
                        <span style="color: #fff">نتایج : 
                        <%=SearchResultCount%>
                                    مورد </span>
                    </div>
                    <div class="col-md-4 col-xs-12 pull-right text-right rtl-text">
                        <span style="color: #fff">فیلتر نتایج :
                        </span>
                        <asp:DropDownList ID="ddlSearchSection" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchSection_SelectedIndexChanged"
                            CssClass="log-login-ddl-item">
                            <asp:ListItem Text="تمام بخش ها" Value="0"></asp:ListItem>
                            <asp:ListItem Text="محصولات" Value="1"></asp:ListItem>
                            <asp:ListItem Text="درخواست ها" Value="2"></asp:ListItem>
                            <asp:ListItem Text="شرکت ها" Value="3"></asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
            </div>
        </div>


        <div id="tblProduct" class="shop-widget" runat="server">
            <h4>محصولات</h4>
            <div class="blog-box with-one-col">
                <asp:Repeater ID="dtlProduct" runat="server">
                    <ItemTemplate>

                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8 item news-item">

                                <div class="">
                                    <div class="inner-item">
                                        <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'>
                                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />

                                        </a>
                                    </div>
                                    <h5><%# Eval("Produc_Name")%></h5>
                                    <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ ارسال: <%# GetShamsiDate(Eval("StartDate").ToString())%></p>
                                    <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ انقضاء  :   <%# GetShamsiDate(Eval("EndDate").ToString())%></p>
                                    <p>برند/مدل: <%# Eval("Model_Number")%></p>
                                    <p>مشخصات : <%# Eval("Specialty_Product")%></p>
                                    <%# GetUserRole(Eval("UsersRoleID").ToString(),1)%>

                                    <a class="read-more" href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'>جزئیات محصول
                                    </a>

                                    <a class="read-more" href='/bazar/Contact.aspx?TypeID=1&ProductID=<%#Eval("id")%>&ReciverID=<%#Eval("Uid_id")%>'>ارسال درخواست
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-2"></div>


                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>


        </div>



        <div id="tblRequest" runat="server" class="shop-widget" visible="false">
            <h4>درخواست ها</h4>
            <div class="blog-box with-one-col">
                <asp:Repeater ID="dtlRequest" runat="server">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8 item news-item">

                                <div class="">
                                    <div class="inner-item">
                                        <a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                            <img alt="" height="120" src="<%= ImgSiteFolder %>product.jpg" width="120" />
                                        </a>
                                    </div>
                                    <h5><a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                        <%# Eval("ProductName")%>
                                    </a></h5>
                                    <p class="date-wrapper text-justify"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ ارسال: <%# GetShamsiDate(Eval("StartDate").ToString())%></p>
                                    <p class="date-wrapper text-justify"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ انقضا:  <%# GetShamsiDate(Eval("EndDate").ToString())%></p>
                                    <p>قیمت: <%# Eval("Price")%></p>
                                    <p>خدمات: <%# Eval("Services")%></p>
                                    <p>توضیحات : <%# Eval("Company_Introduction")%></p>
                                    <%# GetUserRole(Eval("UsersRoleID").ToString(),2)%>

                                    <a class="read-more" href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>جزئیات تقاضا
                                    </a>

                                    <a class="read-more" href='/bazar/Contact.aspx?TypeID=2&RequestID=<%#Eval("RequestID")%>&ReciverID=<%#Eval("Uid_id")%>'>ارسال درخواست
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-2"></div>


                        </div>


                    </ItemTemplate>
                </asp:Repeater>
            </div>


        </div>
        <div id="tblCompany" class="shop-widget" runat="server">
            <h4>شرکت ها</h4>

            <div class="blog-box with-one-col">
                <asp:Repeater ID="dtlCompany" runat="server">
                    <ItemTemplate>

                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8 item news-item">

                                <div class="">
                                    <div class="inner-item">
                                        <asp:Image ID="imgCompanyLogo" runat="server" ImageUrl='<%# GetCompanyImage(Eval("image").ToString()) %>' />
                                    </div>
                                    <h5><a href='Home.aspx?CompanyID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=3'>
                                        <%# Eval("Company_Name")%>
                                    </a></h5>
                                    <p class="date-wrapper  text-justify"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ ارسال: <%# GetShamsiDate(Eval("date_Update").ToString())%></p>
                                    <p>خدمات: <%# Eval("Services")%></p>
                                    <p>توضیحات : <%# Eval("Company_Introduction")%></p>
                                    <%# GetUserRole(Eval("UsersRoleID").ToString(),1)%>

                                    <a class="read-more" href='Home.aspx?CompanyID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=3'>جزئیات شرکت
                                    </a>

                                    <a class="read-more" href='/bazar/Contact.aspx?TypeID=3&CompanyID=<%#Eval("id")%>&ReciverID=<%#Eval("Uid")%>'>ارسال درخواست
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-2"></div>


                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>


      
    </div>
    <style>
        .news-item {
            padding: 5px;
            border: 1px solid silver;
            margin-bottom: 20px !important;
            margin-top: 20px !important;
        }
    </style>
    <div class="col-md-3 sidebar">

        <div class="sidebar-widgets">
            <uc4:uscRightCatHome ID="uscRightCatHome1" runat="server" />
            <%-- <uc1:Membership ID="Membership1" runat="server" />--%>
            <uc5:uscInviteHome ID="uscInviteHome1" runat="server" />

            <div class="shop-widget">
                <h4>مزایای ثبت نام در فاسکو</h4>
                <table class="table table-responsive table-striped ">

                    <tr>
                        <td>عضو یکی از تخصصی ترین وب سایتهای صنعت پزشکی و آزمایشگاهی می شوید.
                        </td>
                    </tr>
                    <tr>
                        <td>کلیه محصولات خود را به همراه توضیحات و جزئیات به راحتی آگهی نمائید.
                        </td>
                        <tr>
                            <td>صفحه مربوط به خود را در اینترنت داشته باشید .
                            </td>
                        </tr>
                    <tr>
                        <td>به سادگی وارد تجارت الکترونیک شده و طیف گسترده تر و وسیع تری از مشتریان را جذب نمائید
                                            .
                        </td>
                    </tr>
                    <tr>
                        <td>شرکت یا فروشگاه خود را در موتورهای جستجو نظیر گوگل و یاهو ببینید و به همگان معرفی
                                            نمائید.
                        </td>
                    </tr>
                </table>
            </div>
            <%--<uc2:left ID="Left1" runat="server" />--%>
        </div>
    </div>

    <style>
        .page-banner {
            font-family: 'WYekan', sans-serif;
        }
    </style>



</asp:Content>
