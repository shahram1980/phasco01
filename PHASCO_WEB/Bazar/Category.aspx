<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Category.aspx.cs" Inherits="BiztBiz.Category" %>

<%--<%@ Register Src="~/Bazar/UC/uscTopProduct.ascx" TagName="uscTopProduct" TagPrefix="uc3" %>--%>
<%--<%@ Register Src="UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc2" %>--%>
<%@ Register Src="~/Bazar/UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">



    <uc3:uscAdvanceSearch ID="uscAdvanceSearch1" runat="server" />


    <div class="shop-widget margin-top-5 overflow-hidden">

        <h4>دسته های موجود در
            <asp:Label ID="lblCategory" runat="server"></asp:Label>
        </h4>
        <ul runat="server" id="pnlCategories" style="margin: 5px; padding: 0;">
            <asp:Repeater ID="repCategoryList" runat="server">
                <ItemTemplate>
                    <li style="float: right; margin: 8px 5px; color: #999; width: 23%; text-align: right; direction: rtl;">

                        <asp:LinkButton ID="lnkCategory" ForeColor="#0099cc" runat="server" Text='<%#SelectCounInCat(Eval("catName").ToString(),Eval("id").ToString()) %>'
                            PostBackUrl='<%# GetCategoryLink(Eval("id").ToString(),Eval("LevelID").ToString()) %>'></asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>

    <div class="page-banner">
        <div class="container">
            <div style="float: left">
                <span class="inline-span">تعداد
                        آیتم در صفحه : </span>
                <div class="ddl-bg-normal">
                    <asp:DropDownList ID="ddlItemCount" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlItemCount_SelectedIndexChanged"
                        CssClass="log-login-ddl-item inline-select">
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <ul class="page-tree" style="direction: rtl">

                <li id="page_link_wrapper"><a id="page_link" href="Default.aspx">بازار</a></li>
                <li>
                    <asp:HyperLink ID="lnkSearchSection" runat="server"></asp:HyperLink></li>
                <li id="imglblMainCat" runat="server">
                    <asp:HyperLink ID="lnkMainCat" runat="server"></asp:HyperLink></li>
                <li id="imglblSubCat" runat="server">
                    <asp:HyperLink ID="lnkSubCat" runat="server" Visible="false"></asp:HyperLink></li>
                <li id="imglblSub2Cat" runat="server">
                    <asp:HyperLink ID="lnkSub2Cat" runat="server" Visible="false"></asp:HyperLink></li>


            </ul>
        </div>
    </div>
    <div id="tblProduct" runat="server" class="shop-widget" visible="false">
        <h4>محصولات</h4>

        <div id="products" class="blog-box with-one-col">
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
                                <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ ارسال: <%# GetShamsi_Date(Eval("StartDate").ToString())%></p>
                                <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ انقضاء  :   <%# GetShamsi_Date(Eval("EndDate").ToString())%></p>
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

        <table class="table table-responsive no-border  rtl-text">
            <tr>
                <td style="width: 80%; padding: 4px 0; padding-right: 12px;">
                    <Pager:PagerV2_8 ID="pagerProduct" runat="server" OnCommand="pagerProduct_Command"
                        GenerateGoToSection="true" NextClause="images/Back-icon.jpg" PreviousClause="images/next-icon.jpg"
                        PreviousVisibleClause="images/next-visible-icon.jpg" NextVisibleClause="images/Back-visible-icon.jpg" />
                </td>
                <td style="width: 20%; text-align: right; padding: 4px 0; padding-left: 5px;"></td>
            </tr>
        </table>
    </div>


    <div id="tblRequest" runat="server" visible="false">

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
                                <h5><a style="color: #ea9d00;" href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                    <%# Eval("ProductName")%>
                                </a></h5>
                                <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ ارسال: <%# GetShamsi_Date(Eval("StartDate").ToString())%></p>
                                <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ انقضا:  <%# GetShamsi_Date(Eval("EndDate").ToString())%></p>
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

        <table class="table table-responsive no-border rtl-text">
            <tr>
                <td style="width: 80%; padding: 4px 0; padding-right: 12px;">
                    <Pager:PagerV2_8 ID="pagerRequest" runat="server" OnCommand="pagerRequest_Command"
                        GenerateGoToSection="true" NextClause="images/Back-icon.jpg" PreviousClause="images/next-icon.jpg"
                        PreviousVisibleClause="images/next-visible-icon.jpg" NextVisibleClause="images/Back-visible-icon.jpg" />
                </td>
                <td style="width: 20%; text-align: right; padding: 4px 0; padding-left: 5px; font-family: Tahoma;"></td>
            </tr>
        </table>
    </div>
    <div id="tblCompany" runat="server">

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
                                <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i>تاریخ ارسال: <%# GetShamsi_Date(Eval("date_Update").ToString())%></p>
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
    <style>
        .news-item {
            padding: 5px;
            border: 1px solid silver;
            margin-bottom: 20px !important;
            margin-top: 20px !important;
        }
    </style>
</asp:Content>
