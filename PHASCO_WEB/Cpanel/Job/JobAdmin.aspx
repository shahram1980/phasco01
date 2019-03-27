<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="JobAdmin.aspx.cs" Inherits="Rahbina.Job.admin" %>
  

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="HyperLink_add_JobGroups" runat="server" NavigateUrl="add_JobGroups.aspx">گروه هاي مشاغل</asp:HyperLink>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" 
        Text="تعيين رزومه ها و آگهي هاي منقضي شده" onclick="Button1_Click" />
        <br />
        <br />
    <asp:Button ID="Button2" runat="server" 
    Text="حذف رزومه ها و آگهي هاي منتظر پس از يك ماه انتظار" 
    onclick="Button2_Click" />
    <br />
    <br />
    <asp:Button ID="Button_delete_NewsPaperAds" runat="server" 
        Text="حذف آگهي جرايد پس از يك هفته " 
        onclick="Button_delete_NewsPaperAds_Click" />
</asp:Content>

