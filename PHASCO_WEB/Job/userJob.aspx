<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true"
    CodeBehind="userJob.aspx.cs" Inherits="Rahbina.Template.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
    <style type="text/css">
        .Menu_Emp
        {
            padding: 5px 15px;
            background: transparent url(  '../images/B-L.gif' ) no-repeat scroll right center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" EnableViewState="false" ContentPlaceHolderID="Plc" runat="server">
<div style="direction:rtl;">
    <fieldset>
        <legend>
            <asp:Label EnableViewState="false" ID="Label1" runat="server" Text="كارجو"></asp:Label>
        </legend>
        <div class="Menu_Emp">
            <asp:HyperLink EnableViewState="false" ID="HyperLink_insert" runat="server" NavigateUrl="~/Job/InsertResume.aspx">درج رزومه جديد</asp:HyperLink>
        </div>
        <div class="Menu_Emp">
            <asp:HyperLink EnableViewState="false" ID="HyperLink_enabled" runat="server" NavigateUrl="~/Job/EnabledResumes.aspx">ليست رزومه هاي فعال</asp:HyperLink>
        </div>
        <div class="Menu_Emp">
            <asp:HyperLink EnableViewState="false" ID="HyperLink_expired" runat="server" NavigateUrl="~/Job/DisabledResumes.aspx">ليست رزومه هاي منقضي شده و غير فعال</asp:HyperLink>
        </div>
        <div class="Menu_Emp">
            <asp:HyperLink EnableViewState="false" ID="HyperLink_waiting" runat="server" NavigateUrl="~/Job/Waiting_Resumes.aspx">ليست رزومه هاي در انتظار</asp:HyperLink>
        </div>
        <div class="Menu_Emp">
            <asp:HyperLink EnableViewState="false" ID="HyperLink_search_AD" runat="server" NavigateUrl="~/Job/SearchEmploymentAD.aspx?from=search">جستجوي فرصت هاي شغلي</asp:HyperLink>
        </div>
    </fieldset>
    </div>
</asp:Content>
