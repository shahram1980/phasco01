<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Default.aspx.cs" Inherits="BiztBiz._Default" %>

<%@ Register Src="~/Bazar/UC/uscLastProduct.ascx" TagName="uscLastProduct" TagPrefix="uc1" %>
<%@ Register Src="UC/uscInvite.ascx" TagName="uscInvite" TagPrefix="uc2" %>
<%@ Register Src="UC/uscInviteHome.ascx" TagName="uscInviteHome" TagPrefix="uc5" %>
<%--<%@ Register src="../UI/uscAdvertisement.ascx" tagname="uscAdvertisement" tagprefix="uc6" %>--%>
<%--<%@ Register Src="UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc2" %>--%>
<%@ Register Src="~/Bazar/UC/uscLastNews.ascx" TagName="uscLastNews" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscHomeCategory.ascx" TagName="uscHomeCategory" TagPrefix="uc4" %>
<%@ Register Src="~/Bazar/UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscRightCatHome.ascx" TagName="uscRightCatHome" TagPrefix="uc3" %>
<%@ Register Src="../UI/Membership.ascx" TagName="Membership" TagPrefix="uc1" %>

<%@ Register Src="~/Bazar/UC/uscRegisterHome.ascx" TagName="uscRegisterHome" TagPrefix="uc3" %>



<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">

    <div class="col-md-9 blog-side">

        <uc3:uscAdvanceSearch ID="uscAdvanceSearch1" runat="server" />
        <uc1:uscLastProduct ID="uscLastProduct1" runat="server" />
        <%-- <uc2:uscA  dvertisement ID="uscAdvertisement1" runat="server" />--%>
        <%--<uc3:uscLastNews ID="uscLastNews1" runat="server" />--%>
        <%--<uc6:uscAdvertisement ID="uscAdvertisement1" runat="server" ZoneID="1" />--%>
        <uc4:uscHomeCategory ID="uscHomeCategory1" runat="server" />
        <%--<uc2:uscAdvertisement ID="uscAdvertisement2" runat="server" />--%>
    </div>

    <div class="col-md-3 sidebar">
        <div class="sidebar-widgets">
            <uc3:uscRightCatHome ID="uscRightCatHome1" runat="server" />
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
</asp:Content>