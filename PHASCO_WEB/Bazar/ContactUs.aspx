<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/HomeBiztbiz.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="PHASCO_WEB.Bazar.ContactUs" %>
<%@ Register Src="~/Bazar/UC/uscLastProduct.ascx" TagName="uscLastProduct" TagPrefix="uc1" %>
<%@ Register src="UC/uscInvite.ascx" tagname="uscInvite" tagprefix="uc2" %>
<%@ Register src="UC/uscInviteHome.ascx" tagname="uscInviteHome" tagprefix="uc5" %>
<%--<%@ Register src="../UI/uscAdvertisement.ascx" tagname="uscAdvertisement" tagprefix="uc6" %>--%>
<%--<%@ Register Src="UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc2" %>--%>
<%@ Register Src="~/Bazar/UC/uscLastNews.ascx" TagName="uscLastNews" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscHomeCategory.ascx" TagName="uscHomeCategory" TagPrefix="uc4" %>
<%@ Register Src="~/Bazar/UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscRightCatHome.ascx" TagName="uscRightCatHome" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscRegisterHome.ascx" TagName="uscRegisterHome" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<table style="width: 1070px;" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 200px; vertical-align: top;">
                <table style="width: 195px">
               
                    <tr>
                        <td style="padding:0 0 5px 0;">
                            <uc3:uscRightCatHome ID="uscRightCatHome1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 0; padding-right: 3px;">
                            <uc3:uscRegisterHome ID="uscRegisterHome1" runat="server" />
                        </td>
                    </tr>
               

                
                    <tr>
                        <td style="padding: 5px 0; padding-left: 5px;">
                    
                            <uc5:uscInviteHome ID="uscInviteHome1" runat="server" />
                        </td>
                    </tr>
                    
                </table>
            </td>
            <td style="vertical-align: top;padding-top:0px;">
                <uc3:uscAdvanceSearch ID="uscAdvanceSearch1" runat="server" />
           <img src="images/Contact-Us-Bazar.jpg" />
            </td>
        </tr>
    </table>
</asp:Content>
